class fuzzyocr::debian {
  # FuzzyOCR currently only tested on debian

  # currently there is no fuzzyocr package for lenny, but the squeeze package 
  # works as well. You need to add it to your local repository
  # http://packages.debian.org/squeeze/fuzzyocr
  include spamassassin

  package { [ # required by fuzzyocr
    "giflib-tools", "gifsicle", "libstring-approx-perl", "libmldbm-sync-perl",
    "libtie-cache-perl", "libgif4", "libmldbm-perl", "fuzzyocr", "gocr",
    # additional ocr prgs
    "tesseract-ocr", "tesseract-ocr-deu", "tesseract-ocr-eng",
    "ocrad" ]:
    ensure => installed;
  }
  file {"/etc/spamassassin/FuzzyOcr.cf":
    source => "puppet:///spamassassin/debian/FuzzyOcr.cf",
    require => Package[spamassassin],
    notify => Service[spamassassin],
    owner => root, group => 0, mode => 0644;
  }

}
