(function() {
  angular.module('builder.components', ['builder', 'validator.rules']).config([
    '$builderProvider', function($builderProvider) {
      $builderProvider.registerComponent('textInput', {
        group: '基础控件',
        label: '单行文本',
        description: '描述信息',
        placeholder: '占位符',
        required: false,
        validationOptions: [
          {
            label: 'none',
            rule: '/.*/'
          }, {
            label: 'number',
            rule: '[number]'
          }, {
            label: 'email',
            rule: '[email]'
          }, {
            label: 'url',
            rule: '[url]'
          }
        ],
        handleTemplate: "<label class='fb-outline'>{{label}}</label>",
        template: "<div class=\"form-group\">\n    <label for=\"{{formName+index}}\" ng-class=\"{'fb-required':required}\">{{label}}</label>\n    <input type=\"text\" ng-model=\"inputText\" validator-required=\"{{required}}\" validator-group=\"{{formName}}\" id=\"{{formName+index}}\" class=\"form-control\" placeholder=\"{{placeholder}}\"/>\n    <p class='help-block'>{{description}}</p>\n</div>",
        popoverTemplate: "<form>\n    <div class=\"form-group\">\n        <label class='control-label'>控件标题</label>\n        <input type='text' ng-model=\"label\" validator=\"[required]\" class='form-control'/>\n    </div>\n    <div class=\"form-group\">\n        <label class='control-label'>描述信息</label>\n        <input type='text' ng-model=\"description\" class='form-control'/>\n    </div>\n    <div class=\"form-group\">\n        <label class='control-label'>占位符</label>\n        <input type='text' ng-model=\"placeholder\" class='form-control'/>\n    </div>\n    <div class=\"checkbox\">\n        <label>\n            <input type='checkbox' ng-model=\"required\" />\n            必填项</label>\n    </div>\n    <div class=\"form-group\" ng-if=\"validationOptions.length > 0\">\n        <label class='control-label'>验证策略</label>\n        <select ng-model=\"$parent.validation\" class='form-control' ng-options=\"option.rule as option.label for option in validationOptions\"></select>\n    </div>\n\n    <hr/>\n    <div class='form-group'>\n        <div class=\"btn-group btn-group-justified\">\n          <div class=\"btn-group\">\n              <input type='submit' ng-click=\"popover.save($event)\" class='btn btn-success' value='保存'/>\n          </div>\n          <div class=\"btn-group\">\n              <input type='button' ng-click=\"popover.remove($event)\" class='btn btn-danger' value='删除'/>\n          </div>\n          <div class=\"btn-group\">\n              <input type='button' ng-click=\"popover.cancel($event)\" class='btn btn-primary' value='取消'/>\n          </div>\n        </div>\n    </div>\n</form>"
      });
      $builderProvider.registerComponent('textArea', {
        group: '基础控件',
        label: '多行文本',
        description: '描述信息',
        placeholder: '占位符',
        required: false,
        handleTemplate: "<label class='fb-outline'>{{label}}</label>",
        template: "<div class=\"form-group\">\n    <label for=\"{{formName+index}}\" ng-class=\"{'fb-required':required}\">{{label}}</label>\n    <textarea type=\"text\" ng-model=\"inputText\" validator-required=\"{{required}}\" validator-group=\"{{formName}}\" id=\"{{formName+index}}\" class=\"form-control\" rows='6' placeholder=\"{{placeholder}}\"/>\n    <p class='help-block'>{{description}}</p>\n</div>",
        popoverTemplate: "<form>\n    <div class=\"form-group\">\n        <label class='control-label'>控件标题</label>\n        <input type='text' ng-model=\"label\" validator=\"[required]\" class='form-control'/>\n    </div>\n    <div class=\"form-group\">\n        <label class='control-label'>描述信息</label>\n        <input type='text' ng-model=\"description\" class='form-control'/>\n    </div>\n    <div class=\"form-group\">\n        <label class='control-label'>占位符</label>\n        <input type='text' ng-model=\"placeholder\" class='form-control'/>\n    </div>\n    <div class=\"checkbox\">\n        <label>\n            <input type='checkbox' ng-model=\"required\" />\n            必填项</label>\n    </div>\n\n    <hr/>\n    <div class='form-group'>\n        <div class=\"btn-group btn-group-justified\">\n          <div class=\"btn-group\">\n              <input type='submit' ng-click=\"popover.save($event)\" class='btn btn-success' value='保存'/>\n          </div>\n          <div class=\"btn-group\">\n              <input type='button' ng-click=\"popover.remove($event)\" class='btn btn-danger' value='删除'/>\n          </div>\n          <div class=\"btn-group\">\n              <input type='button' ng-click=\"popover.cancel($event)\" class='btn btn-primary' value='取消'/>\n          </div>\n        </div>\n    </div>\n</form>"
      });
      $builderProvider.registerComponent('checkbox', {
        group: '基础控件',
        label: '多项选择',
        description: '描述信息',
        placeholder: '占位符',
        required: false,
        options: ['value one', 'value two'],
        arrayToText: true,
        handleTemplate: "<label class='fb-outline'>{{label}}</label>",
        template: "<div class=\"form-group\">\n    <label for=\"{{formName+index}}\" ng-class=\"{'fb-required':required}\">{{label}}</label>\n    <input type='hidden' ng-model=\"inputText\" validator-required=\"{{required}}\" validator-group=\"{{formName}}\"/>\n    <div class='checkbox' ng-repeat=\"item in options track by $index\">\n        <label><input type='checkbox' ng-model=\"$parent.inputArray[$index]\" value='item'/>\n            {{item}}\n        </label>\n    </div>\n    <p class='help-block'>{{description}}</p>\n</div>",
        popoverTemplate: "<form>\n    <div class=\"form-group\">\n        <label class='control-label'>控件标题</label>\n        <input type='text' ng-model=\"label\" validator=\"[required]\" class='form-control'/>\n    </div>\n    <div class=\"form-group\">\n        <label class='control-label'>描述信息</label>\n        <input type='text' ng-model=\"description\" class='form-control'/>\n    </div>\n    <div class=\"form-group\">\n        <label class='control-label'>可选项</label>\n        <textarea class=\"form-control\" rows=\"3\" ng-model=\"optionsText\"/>\n    </div>\n    <div class=\"checkbox\">\n        <label>\n            <input type='checkbox' ng-model=\"required\" />\n            必填项\n        </label>\n    </div>\n\n    <hr/>\n    <div class='form-group'>\n        <div class=\"btn-group btn-group-justified\">\n          <div class=\"btn-group\">\n              <input type='submit' ng-click=\"popover.save($event)\" class='btn btn-success' value='保存'/>\n          </div>\n          <div class=\"btn-group\">\n              <input type='button' ng-click=\"popover.remove($event)\" class='btn btn-danger' value='删除'/>\n          </div>\n          <div class=\"btn-group\">\n              <input type='button' ng-click=\"popover.cancel($event)\" class='btn btn-primary' value='取消'/>\n          </div>\n        </div>\n    </div>\n</form>"
      });
      $builderProvider.registerComponent('radio', {
        group: '基础控件',
        label: '单项选择',
        description: '描述信息',
        placeholder: '占位符',
        required: false,
        options: ['value one', 'value two'],
        handleTemplate: "<label class='fb-outline'>{{label}}</label>",
        template: "<div class=\"form-group\">\n    <label for=\"{{formName+index}}\" ng-class=\"{'fb-required':required}\">{{label}}</label>\n    <div class='radio' ng-repeat=\"item in options track by $index\">\n        <label><input name='{{formName+index}}' ng-model=\"$parent.inputText\" validator-group=\"{{formName}}\" value='{{item}}' type='radio'/>\n            {{item}}\n        </label>\n    </div>\n    <p class='help-block'>{{description}}</p>\n</div>",
        popoverTemplate: "<form>\n    <div class=\"form-group\">\n        <label class='control-label'>控件标题</label>\n        <input type='text' ng-model=\"label\" validator=\"[required]\" class='form-control'/>\n    </div>\n    <div class=\"form-group\">\n        <label class='control-label'>描述信息</label>\n        <input type='text' ng-model=\"description\" class='form-control'/>\n    </div>\n    <div class=\"form-group\">\n        <label class='control-label'>可选项</label>\n        <textarea class=\"form-control\" rows=\"3\" ng-model=\"optionsText\"/>\n    </div>\n\n    <hr/>\n    <div class='form-group'>\n        <div class=\"btn-group btn-group-justified\">\n          <div class=\"btn-group\">\n              <input type='submit' ng-click=\"popover.save($event)\" class='btn btn-success' value='保存'/>\n          </div>\n          <div class=\"btn-group\">\n              <input type='button' ng-click=\"popover.remove($event)\" class='btn btn-danger' value='删除'/>\n          </div>\n          <div class=\"btn-group\">\n              <input type='button' ng-click=\"popover.cancel($event)\" class='btn btn-primary' value='取消'/>\n          </div>\n        </div>\n    </div>\n</form>"
      });
      $builderProvider.registerComponent('select', {
        group: '基础控件',
        label: '下拉选择',
        description: '描述信息',
        placeholder: '占位符',
        required: false,
        options: ['value one', 'value two'],
        handleTemplate: "<label class='fb-outline'>{{label}}</label>",
        template: "<div class=\"form-group\">\n    <label for=\"{{formName+index}}\">{{label}}</label>\n    <select ng-options=\"value for value in options\" id=\"{{formName+index}}\" class=\"form-control\"\n        ng-model=\"inputText\" ng-init=\"inputText = options[0]\"/>\n    <p class='help-block'>{{description}}</p>\n</div>",
        popoverTemplate: "<form>\n    <div class=\"form-group\">\n        <label class='control-label'>控件标题</label>\n        <input type='text' ng-model=\"label\" validator=\"[required]\" class='form-control'/>\n    </div>\n    <div class=\"form-group\">\n        <label class='control-label'>描述信息</label>\n        <input type='text' ng-model=\"description\" class='form-control'/>\n    </div>\n    <div class=\"form-group\">\n        <label class='control-label'>可选项</label>\n        <textarea class=\"form-control\" rows=\"3\" ng-model=\"optionsText\"/>\n    </div>\n\n    <hr/>\n    <div class='form-group'>\n        <div class=\"btn-group btn-group-justified\">\n          <div class=\"btn-group\">\n              <input type='submit' ng-click=\"popover.save($event)\" class='btn btn-success' value='保存'/>\n          </div>\n          <div class=\"btn-group\">\n              <input type='button' ng-click=\"popover.remove($event)\" class='btn btn-danger' value='删除'/>\n          </div>\n          <div class=\"btn-group\">\n              <input type='button' ng-click=\"popover.cancel($event)\" class='btn btn-primary' value='取消'/>\n          </div>\n        </div>\n    </div>\n</form>"
      });
      return $builderProvider.registerComponent('legend', {
        group: '基础控件',
        label: '分隔符',
        description: '描述信息',
        handleTemplate: "<label class='fb-outline'>{{label}}</label>",
        template: "<div class=\"form-group\">\n    <legend><label for=\"{{formName+index}}\">{{label}}</label></legend>\n    <p class='help-block'>{{description}}</p>\n</div>",
        popoverTemplate: "<form>\n    <div class=\"form-group\">\n        <label class='control-label'>控件标题</label>\n        <input type='text' ng-model=\"label\" validator=\"[required]\" class='form-control'/>\n    </div>\n    <div class=\"form-group\">\n        <label class='control-label'>描述信息</label>\n        <input type='text' ng-model=\"description\" class='form-control'/>\n    </div>\n\n    <hr/>\n    <div class='form-group'>\n        <div class=\"btn-group btn-group-justified\">\n          <div class=\"btn-group\">\n              <input type='submit' ng-click=\"popover.save($event)\" class='btn btn-success' value='保存'/>\n          </div>\n          <div class=\"btn-group\">\n              <input type='button' ng-click=\"popover.remove($event)\" class='btn btn-danger' value='删除'/>\n          </div>\n          <div class=\"btn-group\">\n              <input type='button' ng-click=\"popover.cancel($event)\" class='btn btn-primary' value='取消'/>\n          </div>\n        </div>\n    </div>\n</form>"
      });
    }
  ]);

}).call(this);
