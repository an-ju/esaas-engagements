
def seed_orgs!
  Org.delete_all
  get_orgs.each do |org|
    u = User.find_by(:email => org[0]) || User.create!(:name => org[1], :email => org[0])
    url = org[4] || ( u.email !~ /gmail|berkeley.edu/ && u.email =~ /@(.*)$/ ? "http://#{$1}" : nil)
    Org.create!(:name => org[2], :contact => u, :description => org[3], :url => url)
  end
  puts "#{Org.all.size} orgs, #{User.all.size} users"
end

def get_orgs
  [
    ["skylareconomy@gmail.com","Skylar Economy","Photogenie Films, LLC","FITE Film (From Incarceration to Education), a documentary film"],
    ["akkhazan@berkeley.edu","Anish Khazane","Project RISHI - Berkeley Chapter","NGO doing rural work all over India","http://www.projectrishi.org"],
    ["campaign@evolve-ca.org","Evolve CA","Evolve, a Community Organization"],
    ["ellen@activevoice.net","Ellen Schneider","Active Voice"],
    ["afxdance@gmail.com","Ryan Barroga","AFX Dance"],
    ["alexanderchen@berkeley.edu","Alexander Chen","Alexander Chen"],
    ["ncuano@hotmail.com ","Norman Cuano","Alz About Me"],
    ["contact@amassmedia.org","Amass Media","Amass Media"],
    ["victoria.herrmann@thearcticinstitute.org","Victoria Herrmann","Arctic Institute"],
    ["bamru.info@gmail.com","BAMRU","Bay Area Mountain Rescue Unit (BAMRU)"],
    ["closoft@bsc.coop","Matthew Waliman","Berkeley Student Cooperative"],
    ["rebora@bhnc.org","Rachel Ebora","Bernal Heights Neighborhood Center"],
    ["g.wang@berkeley.edu","Yiwei Wang","BirdGo"],
    ["charlene.simonian@bizworld.org","Charlene Simonian","BizWorld"],
    ["rrubey@bhgh.org","Rebecca Rubey","Boys Hope Girls Hope"],
    ["susannah.dunlap@bcef.org","Susannah Dunlap","Breast Cancer Emergency Fund"],
    ["illyasha@lungsrus.org","Illy Asha","Breathe California"],
    ["ranitdubey@gmail.com","Ranit Dubey","Cal Dining"],
    ["hiftekhar@berkeley.edu","Huda Iftekar","Cal Red Cross"],
    ["tina@cpits.org","Tina Areja-Pasquinzo","California Poets in the Schools"],
    ["jhaeber@californiapreservation.org","Jonathan Haeber","California Preservation Foundation"],
    ["mlucky@berkeley.edu","M. Lucky","CalTeach"],
    ["hepbproject@gmail.com","Cheng Li","Cheng Li"],
    ["mirriam@cfhi.org","Mirriam Rafiq Braden","Child Family Health International"],
    ["gavinsong93@berkeley.edu","Hong Lin","China US Cultural Exchange Center"],
    ["csq@chinesenewcomers.org","Carlos Serrano-Quan","Chinese Newcomers"],
    ["erichusk@gmail.com","Eric Husk","City Dog Share"],
    ["miguel@codeandomexico.org","Miguel Salazar","CodeandoMexico"],
    ["descobedo@collegetrack.org","Dayana Escobedo","College Track"],
    ["kelly@communitygrows.org","Kelly ErnstFriedman","CommunityGrows"],
    ["office@bnaiemunahsf.org","Seth St. Martin","Congregation B'nah Emunah"],
    ["shuoyao@berkeley.edu","Shuo (Sophia) Yao","Da-Tong Society of China Studies"],
    ["skudtarkar@berkeley.edu","Soham Kudtarkar","Debate Society of Berkeley"],
    ["eaofberkeley@gmail.com","Rohin Shah","Effective Altruists of Berkeley"],
    ["mutgoff@eff.org","Maggie Utgoff","Electronic Frontier Foundation"],
    ["jelawren@gmail.com ","Jennifer Lawrence","Engineers Without Borders"],
    ["HConnell@esassoc.com","Hunter Connell","Environmental Science Associates"],
    ["chasesmith@berkeley.edu","Chase Smith","Esential"],
    ["aram.barra@espolea.org","Aram Barra","Espolea"],
    ["faludi@berkeley.edu","Jeremy Faludi","Faludi Design LCA"],
    ["faith@norcalfamilydogrescue.org","Faith","Family Dog Rescue"],
    ["","Finals Club Foundation","FInalsClub Foundation"],
    ["contact@forwardtutoring.org","contact@forwardtutoring.org","Forward Tutoring"],
    ["webmaster@fruitfulminds.org","Fruitful Minds","Fruitful Minds"],
    ["webmaster@fueledschools.com","Fueled Schools","Fueled Schools"],
    ["webmaster@g0v.tw","webmaster@g0v.tw","g0v (Taiwanese NGO)"],
    ["","","Gracepoint Church"],
    ["mars.rao@harmony-plus.com","Bill Zhao","Harmony Plus"],
    ["plarlson@gmail.com","Madelaine Plauche","ICSI"],
    ["toni@itph.org","Toni Taigen","In the Potter's Hands"],
    ["ipsr@berkeley.edu","Elizabeth Peele","Institute of Personality and Social Research"],
    ["","","Khan Academy"],
    ["info@khanacademyburmese.org","Khan Academy Burmese","Khan Academy Burmese"],
    ["mbmiller@berkeley.edu","M. Miller","Koinonia"],
    ["kgstew@gmail.com","kgstew@gmail.com","Learning Shelter"],
    ["lujeri@lujeri.com","Lujeri","Lujeri"],
    ["scanavan@maitrisf.org","Susan Canavan","Maitri Compassionate Care"],
    ["mnie@berkeley.edu ","Michelle Nie","Mak"],
    ["allysonecote@maternova.net","Allyson E. Cote","MaterNova"],
    ["fenley@berkeley.edu","Erin Fenley","MyPower"],
    ["berkeleyscc@gmail.com","Myra Haqqi","Myra Haqqi"],
    ["nzhang32@berkeley.edu","Nathan Zhang","Nathan Zhang"],
    ["amber@natureinthecity.org","Amber Hasselbring","Nature in the City"],
    ["","neptus","Neptus"],
    ["","NACLA","North American Congress on Latin America"],
    ["giovanna@onecirclefoundation.org","Giovanna Taormina","One Circle Foundation"],
    ["tony.kim925@berkeley.edu","Tony Lee","One Eighty Degrees Consulting"],
    ["grungrasn@oraminternational.org","Neil Grungras","Organization for Refuge, Asylum, and Migration (ORAM)"],
    ["toniareinys@yahoo.com","Tonia Reinys","Palo Alto Veterans Administration Healthcare System"],
    ["adoptkings@gmail.com","Elizabeth Young","Pigeon Palomacy"],
    ["ctochief@asuc.org ","ASUC Office of the CTO","Project Hermione"],
    ["lhsdvm@aol.com","Linda Sanders","RateMyPup"],
    ["aelliott@richmondmainstreet.org","Amanda Elliott","Richmond Main Street Initiative"],
    ["monica-casanova@berkeley.edu","Monica Casanova","SafeSpace"],
    ["tnomanbh@gmail.com","tnomanbh@gmail.com","Saffron Strand"],
    ["deepesh.chourey@gmail.com","Deepesh Chourey","Sankara Eye Foundation"],
    ["bgriffin@sfai.edu","Bruce Griffin","SF Art Institute"],
    ["gpeter@sfcess.org","Gregory Peters","SFCESS"],
    ["pedro@smileygo.org","Pedro Espinoza","SmileyGo"],
    ["clay@theatrebayarea.org","Clayton Lord","Theatre Bay Area"],
    ["anderstruong@berkeley.edu","Anders Truong","Thera"],
    ["sara.alexander@therewithcare.org","Sara Alexander","There With care"],
    [" samlau95@gmail.com","Sam Lau","UC Berkeley BluePrint"],
    ["cmwoo@berkeley.edu","Christina Woo","UC Berkeley Chemistry"],
    ["decalprogram@gmail.com","Decal Board","UC Berkeley DeCal"],
    ["fox@cs.berkeley.edu","Armando Fox","UC Berkeley EECS"],
    ["oheyer@berkeley.edu","Oliver Heyer","UC Berkeley ETS"],
    ["ucberkeleyfoodpantry@gmail.com","ucberkeleyfoodpantry@gmail.com","UC Berkeley Food Pantry"],
    ["mulhern@berkeley.edu","Prof. Dan Mulhern","UC Berkeley Haas"],
    ["elissa.sato@berkeley.edu","Elissa Sato","UC Berkeley Housing"],
    ["ucbim@berkeley.edu","ucbim@berkeley.edu","UC Berkeley Intramural Sports"],
    ["fraser@eecs.berkeley.edu","Eric Fraser","UC Berkeley IS&T"],
    ["emilyrice@berkeley.edu","Emily Rice","UC Berkeley Jacobs Institute"],
    ["globalhealthproducer@gmail.com","UCSF - Trinity Health","UCSF - Trinity Health"],
    ["webmaster@imagineware.org","webmaster@imagineware.org","Universidad Carlos III Madrid"],
    ["paul@visionarianetwork.org","Paul Spurzem","Visionaria Network"],
    ["info@wisdomsun.org","info@wisdomsun.org","WisdomSun"],
    ["volunteercoordinator@ijdh.org","volunteercoordinator@ijdh.org","Collective Against Impunity in Haiti"],
    ["greg@sfvs.org","Greg Rohrbach","San Francisco Veg Society"],
    ["lar@berkeley.edu","Professor Larry Rosenthal","UC Berkeley Goldman School of Public Policy"],
    ["laura.montagna@gmail.com","Laura Montagna","Youth Zone Del Norte"],
    [" kvn@berkeley.edu","Khuyen Nguyen","Berkeley Language Exchange Program"],
    ["nbrummel@jpl.nasa.gov","Nathan Brummel","Staffolution"],
    ["mnagel@cityoforinda.org","Mark Nagel","City of Orinda Police Department"],
  ]
end

seed_orgs!
