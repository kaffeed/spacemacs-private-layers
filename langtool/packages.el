;;; packages.el --- langtool layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Sebastian Schubert <sebastian@dahoam>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `langtool-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `langtool/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `langtool/pre-init-PACKAGE' and/or
;;   `langtool/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst langtool-packages
  '(langtool)
  "The list of Lisp packages required by the langtool layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

;; List of packages to exclude.
(setq langtool-excluded-packages '())
;; For each package, define a function langtool/init-<package-name>
;;
(defun langtool/init-langtool ()
  "Initialize my package"
  (use-package langtool
        ; Use :mode to set language modes to automatically activate on certain extensions
        ; :defer t activates lazy loading which makes startup faster
        :defer f
        ; The code in :init is always run, use it to set up config vars and key bindings
        :init
        (progn ; :init only takes one expression so use "progn" to combine multiple things
        ; You can configure package variables here
          (setq langtool-language-tool-jar "~/bin/LanguageTool-3.6/languagetool-commandline.jar")
            ;;(setq langtool-default-language "en-US -d EN_QUOTES[1]")
          (setq langtool-default-language "en-US")
          (setq langtool-disabled-rules '("EN_QUOTES"))

            ;;(setq langtool-disabled-rules "[EN_QUOTES[1]],[EN_QUOTES[2]]")

;;            (setq langtool-disabled-rules '("[EN_QUOTES[1]]" "[EN_QUOTES[2]]"))

          (global-set-key "\M-n" 'langtool-goto-next-error)
        ; Using evil-leader/set-key-for-mode adds bindings under SPC for a certain mode
        ; Use evil-leader/set-key to create global SPC bindings
        ;;(evil-leader/set-key-for-mode 'ledger-mode
            ;;"mhd"   'ledger-delete-current-transaction
            ;;"m RET" 'ledger-set-month))
          :config ; :config is called after the package is actually loaded with defer
        ; You can put stuff that relies on the package like function calls here
          (message "Langtool loaded!"))))



;;; packages.el ends here
