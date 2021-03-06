// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"

const application = Application.start()
const context = require.context("../controllers", true, /\.js$/)
application.load(definitionsFromContext(context))
window.Stimulus = application

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
require("jquery")
require("@nathanvda/cocoon")
require("selectize")

// Internal imports, e.g:
import { hide_client_add } from '../plugins/hide_client_form';
import { initFlatpickr } from "../plugins/flatpickr";

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initFlatpickr();
  // initSelect2();
});

// Import selectize method from components/selectize.js

import { selectize } from '../components/selectize';
selectize();
