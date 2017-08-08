class App < ActiveRecord::Base
  belongs_to :org
  has_many :engagements
  has_many :iterations, :through => :engagements
  has_many :metric_samples
  
  validates_presence_of :name, :description, :org_id, :status, :repository_url
  

  default_scope { order(:name => :asc) }
  enum :status => { :dead => 0, :development => 1, :in_use => 2, :in_use_and_wants_improvement => 3, :inactive_but_wants_improvement => 4 }

  def as_json(options={})
    options[:only] = [:id,:name,:description,:deployment_url,:repository_url]
    options[:include] = {:org => { :only => [:name,:url] }}
    super(options)
  end

  def metric_code_cliamte
    metric = metric_samples.where(metric_name: 'code_climate').last
    (metric.nil? or metric.score.eql? -1.0) ? nil : metric.score
  end

  def metric_test_coverage
    metric = metric_samples.where(metric_name: 'test_coverage').last
    (metric.nil? or metric.score.eql? -1.0) ? nil : metric.score
  end

  def metric_travis_ci
    metric = metric_samples.where(metric_name: 'travis_ci').last
    metric.nil? ? nil : JSON.parse(metric.image)['data']['current_state']
  end

  def resample_all_metrics
    ProjectMetrics.metric_names.each { |metric_name| resample_metric metric_name }
  end

  def resample_metric(metric_name)
    metric = ProjectMetrics.class_for(metric_name).new(github_project: repository_url, github_main_branch: 'master')
    begin
      metric.refresh
      image = metric.image
      score = metric.score
    rescue Exception => e
      logger.fatal "Metric #{metric_name} for project #{name} exception: #{e.message}"
      puts "Metric #{metric_name} for project #{name} exception: #{e.message}"
      return
    rescue Error => err
      logger.fatal "Metric #{metric_name} for project #{name} error: #{err.message}"
      puts "Metric #{metric_name} for project #{name} error: #{err.message}"
      return
    end
    self.metric_samples.create!( metric_name: metric_name,
                                 score: score,
                                 image: image )
  end

end
