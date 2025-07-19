<script setup>
import {faUser, faRightFromBracket} from "@fortawesome/free-solid-svg-icons";
import {faAddressCard} from "@fortawesome/free-regular-svg-icons";
</script>

<template>
  <ul class="navbar-nav mb-2 mb-lg-0">
    <li class="nav-item">
      <div class="dropdown">
        <a class="nav-link dropdown-toggle"
           href="#" role="button"
           data-bs-toggle="dropdown"
           aria-expanded="false">
          <font-awesome-icon :icon="faUser"></font-awesome-icon>
        </a>
        <ul class="dropdown-menu dropdown-menu-end">
          <li>
            <a class="dropdown-item" href="#">
              <font-awesome-icon :icon="faAddressCard"/>
              Profile
            </a>
          </li>
          <li>
            <a class="dropdown-item" href="#">
              <font-awesome-icon :icon="faRightFromBracket"/>
              Logout
            </a>
          </li>
        </ul>
      </div>
    </li>
  </ul>
</template>