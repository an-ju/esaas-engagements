ProjectMetrics.configure do
  add_metric :project_metric_code_climate
  add_metric :project_metric_test_coverage
  add_metric :project_metric_travis_ci

  add_hierarchy dashboard: %I[travis_ci code_climate test_coverage]
end

METRIC_NAMES = {
    code_climate: 'Code Climate',
    test_coverage: 'Test Coverage',
    travis_ci: 'Build Status',
}