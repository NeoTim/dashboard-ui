'use strict';

angular.module('app', [
    # Angular modules
    # 'ngRoute'
    'ngAnimate'
    'ui.router'

    # 3rd Party Modules
    'ui.bootstrap'
    'easypiechart'
    'mgo-angular-wizard'
    'textAngular'
    'ui.tree'
    'ngMap'
    'ngTagsInput'
    # 'ngCookies'
    # 'ngResource'
    # 'ngSanitize'
    'btford.socket-io'

    # Custom modules
    'app.ui.ctrls'
    'app.ui.directives'
    'app.ui.services'
    'app.controllers'
    'app.directives'
    'app.form.validation'
    'app.ui.form.ctrls'
    'app.ui.form.directives'
    'app.tables'
    'app.map'
    'app.task'
    'app.localization'
    'app.chart.ctrls'
    'app.chart.directives'
    'app.page.ctrls'
])

.config ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider) ->
  $urlRouterProvider
    .otherwise '/'

  # $locationProvider.html5Mode true
  # $httpProvider.interceptors.push 'authInterceptor'

.factory 'authInterceptor', ($rootScope, $q, $cookieStore, $location) ->
  # Add authorization token to headers
  request: (config) ->
    config.headers = config.headers or {}
    config.headers.Authorization = 'Bearer ' + $cookieStore.get 'token' if $cookieStore.get 'token'
    config

  # Intercept 401s and redirect you to login
  responseError: (response) ->
    if response.status is 401
      $location.path '/login'
      # remove any stale tokens
      $cookieStore.remove 'token'

    $q.reject response

# .run ($rootScope, $location, Auth) ->
#   # Redirect to login if route requires auth and you're not logged in
#   $rootScope.$on '$stateChangeStart', (event, next) ->
#     Auth.isLoggedInAsync (loggedIn) ->
#       $location.path "/login" if next.authenticate and not loggedIn


.config([
    '$stateProvider'
    ($stateProvider) ->
        $stateProvider
            # dashboard

            .state('home', {
                url: '/'
                templateUrl: 'views/dashboard.html'
            })
            .state('dashboard', {
                url: '/dashboard'
                templateUrl: 'views/dashboard.html'
            });

            # UI Kit
            # .state(
            #     '/ui/typography'
            #     templateUrl: 'views/ui/typography.html'
            # )
            # .state(
            #     '/ui/buttons'
            #     templateUrl: 'views/ui/buttons.html'
            # )
            # .state(
            #     '/ui/icons'
            #     templateUrl: 'views/ui/icons.html'
            # )
            # .state(
            #     '/ui/grids'
            #     templateUrl: 'views/ui/grids.html'
            # )
            # .state(
            #     '/ui/widgets'
            #     templateUrl: 'views/ui/widgets.html'
            # )
            # .state(
            #     '/ui/components'
            #     templateUrl: 'views/ui/components.html'
            # )
            # .state(
            #     '/ui/timeline'
            #     templateUrl: 'views/ui/timeline.html'
            # )
            # .state(
            #     '/ui/nested-lists'
            #     templateUrl: 'views/ui/nested-lists.html'
            # )
            # .state(
            #     '/ui/pricing-tables'
            #     templateUrl: 'views/ui/pricing-tables.html'
            # )

            # # Forms
            # .state(
            #     '/forms/elements'
            #     templateUrl: 'views/forms/elements.html'
            # )
            # .state(
            #     '/forms/layouts'
            #     templateUrl: 'views/forms/layouts.html'
            # )
            # .state(
            #     '/forms/validation'
            #     templateUrl: 'views/forms/validation.html'
            # )
            # .state(
            #     '/forms/wizard'
            #     templateUrl: 'views/forms/wizard.html'
            # )

            # # Maps
            # .state(
            #     '/maps/gmap'
            #     templateUrl: 'views/maps/gmap.html'
            # )
            # .state(
            #     '/maps/jqvmap'
            #     templateUrl: 'views/maps/jqvmap.html'
            # )

            # # Tables
            # .state(
            #     '/tables/static'
            #     templateUrl: 'views/tables/static.html'
            # )
            # .state(
            #     '/tables/responsive'
            #     templateUrl: 'views/tables/responsive.html'
            # )
            # .state(
            #     '/tables/dynamic'
            #     templateUrl: 'views/tables/dynamic.html'
            # )

            # # Charts
            # .state(
            #     '/charts/others'
            #     templateUrl: 'views/charts/charts.html'
            # )
            # .state(
            #     '/charts/morris'
            #     templateUrl: 'views/charts/morris.html'
            # )
            # .state(
            #     '/charts/flot'
            #     templateUrl: 'views/charts/flot.html'
            # )

            # # Mail
            #  .state(
            #     '/mail/inbox'
            #     templateUrl: 'views/mail/inbox.html'
            # )
            #  .state(
            #     '/mail/compose'
            #     templateUrl: 'views/mail/compose.html'
            # )
            #  .state(
            #     '/mail/single'
            #     templateUrl: 'views/mail/single.html'
            # )

            # # Pages
            # .state(
            #     '/pages/features'
            #     templateUrl: 'views/pages/features.html'
            # )
            # .state(
            #     '/pages/signin'
            #     templateUrl: 'views/pages/signin.html'
            # )
            # .state(
            #     '/pages/signup'
            #     templateUrl: 'views/pages/signup.html'
            # )
            # .state(
            #     '/pages/forgot'
            #     templateUrl: 'views/pages/forgot-password.html'
            # )
            # .state(
            #     '/pages/lock-screen'
            #     templateUrl: 'views/pages/lock-screen.html'
            # )
            # .state(
            #     '/pages/profile'
            #     templateUrl: 'views/pages/profile.html'
            # )
            # .state(
            #     '/404'
            #     templateUrl: 'views/pages/404.html'
            # )
            # .state(
            #     '/pages/500'
            #     templateUrl: 'views/pages/500.html'
            # )
            # .state(
            #     '/pages/blank'
            #     templateUrl: 'views/pages/blank.html'
            # )
            # .state(
            #     '/pages/invoice'
            #     templateUrl: 'views/pages/invoice.html'
            # )
            # .state(
            #     '/pages/services'
            #     templateUrl: 'views/pages/services.html'
            # )
            # .state(
            #     '/pages/about'
            #     templateUrl: 'views/pages/about.html'
            # )
            # .state(
            #     '/pages/contact'
            #     templateUrl: 'views/pages/contact.html'
            # )

            # # Tasks
            # .state(
            #     '/tasks'
            #     templateUrl: 'views/tasks/tasks.html'
            # )

            # .otherwise(
            #     redirectTo: '/404'
            # )
])
# .run([
#     '$rootScope'
#     ($rootScope) ->

#         $rootScope.$on('$routeChangeStart', (event, next, current) ->
#             console.log 'routeChangeStart'
#         )

#         $rootScope.$on('$routeChangeSuccess', (event, current, previous, rejection) ->
#             console.log 'routeChangeSuccess'
#         )
# ])
