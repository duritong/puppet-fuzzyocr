# manifests/init.pp - module to manage fuzzyocr
class fuzzyocr {
  case $operatingsystem {
    debian,ubuntu: { include fuzzyocr::debian }
    default: { fail("no such \$operatingsystem ($operatingsystem) supported yet!")  }
  }
}

