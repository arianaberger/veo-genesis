require './config/environment'

use Rack::MethodOverride

use BeingsController
use UsersController

run AppController
