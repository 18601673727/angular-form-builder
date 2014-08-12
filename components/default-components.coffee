angular.module 'builder.components', ['builder', 'validator.rules']

.config ['$builderProvider', ($builderProvider) ->
    # ----------------------------------------
    # text input
    # ----------------------------------------
    $builderProvider.registerComponent 'textInput',
        group: '基础控件'
        label: '单行文本'
        description: '描述信息'
        placeholder: '占位符'
        required: no
        validationOptions: [
            {label: 'none', rule: '/.*/'}
            {label: 'number', rule: '[number]'}
            {label: 'email', rule: '[email]'}
            {label: 'url', rule: '[url]'}
        ]
        handleTemplate:
          """
          <label class='fb-outline'>{{label}}</label>
          """
        template:
            """
            <div class="form-group">
                <label for="{{formName+index}}" ng-class="{'fb-required':required}">{{label}}</label>
                <input type="text" ng-model="inputText" validator-required="{{required}}" validator-group="{{formName}}" id="{{formName+index}}" class="form-control" placeholder="{{placeholder}}"/>
                <p class='help-block'>{{description}}</p>
            </div>
            """
        popoverTemplate:
            """
            <form>
                <div class="form-group">
                    <label class='control-label'>控件标题</label>
                    <input type='text' ng-model="label" validator="[required]" class='form-control'/>
                </div>
                <div class="form-group">
                    <label class='control-label'>描述信息</label>
                    <input type='text' ng-model="description" class='form-control'/>
                </div>
                <div class="form-group">
                    <label class='control-label'>占位符</label>
                    <input type='text' ng-model="placeholder" class='form-control'/>
                </div>
                <div class="checkbox">
                    <label>
                        <input type='checkbox' ng-model="required" />
                        必填项</label>
                </div>
                <div class="form-group" ng-if="validationOptions.length > 0">
                    <label class='control-label'>验证策略</label>
                    <select ng-model="$parent.validation" class='form-control' ng-options="option.rule as option.label for option in validationOptions"></select>
                </div>

                <hr/>
                <div class='form-group'>
                    <div class="btn-group btn-group-justified">
                      <div class="btn-group">
                          <input type='submit' ng-click="popover.save($event)" class='btn btn-success' value='保存'/>
                      </div>
                      <div class="btn-group">
                          <input type='button' ng-click="popover.remove($event)" class='btn btn-danger' value='删除'/>
                      </div>
                      <div class="btn-group">
                          <input type='button' ng-click="popover.cancel($event)" class='btn btn-primary' value='取消'/>
                      </div>
                    </div>
                </div>
            </form>
            """

    # ----------------------------------------
    # Text area
    # ----------------------------------------
    $builderProvider.registerComponent 'textArea',
        group: '基础控件'
        label: '多行文本'
        description: '描述信息'
        placeholder: '占位符'
        required: no
        handleTemplate:
          """
          <label class='fb-outline'>{{label}}</label>
          """
        template:
            """
            <div class="form-group">
                <label for="{{formName+index}}" ng-class="{'fb-required':required}">{{label}}</label>
                <textarea type="text" ng-model="inputText" validator-required="{{required}}" validator-group="{{formName}}" id="{{formName+index}}" class="form-control" rows='6' placeholder="{{placeholder}}"/>
                <p class='help-block'>{{description}}</p>
            </div>
            """
        popoverTemplate:
            """
            <form>
                <div class="form-group">
                    <label class='control-label'>控件标题</label>
                    <input type='text' ng-model="label" validator="[required]" class='form-control'/>
                </div>
                <div class="form-group">
                    <label class='control-label'>描述信息</label>
                    <input type='text' ng-model="description" class='form-control'/>
                </div>
                <div class="form-group">
                    <label class='control-label'>占位符</label>
                    <input type='text' ng-model="placeholder" class='form-control'/>
                </div>
                <div class="checkbox">
                    <label>
                        <input type='checkbox' ng-model="required" />
                        必填项</label>
                </div>

                <hr/>
                <div class='form-group'>
                    <div class="btn-group btn-group-justified">
                      <div class="btn-group">
                          <input type='submit' ng-click="popover.save($event)" class='btn btn-success' value='保存'/>
                      </div>
                      <div class="btn-group">
                          <input type='button' ng-click="popover.remove($event)" class='btn btn-danger' value='删除'/>
                      </div>
                      <div class="btn-group">
                          <input type='button' ng-click="popover.cancel($event)" class='btn btn-primary' value='取消'/>
                      </div>
                    </div>
                </div>
            </form>
            """

    # ----------------------------------------
    # checkbox
    # ----------------------------------------
    $builderProvider.registerComponent 'checkbox',
        group: '基础控件'
        label: '多项选择'
        description: '描述信息'
        placeholder: '占位符'
        required: no
        options: ['value one', 'value two']
        arrayToText: yes
        handleTemplate:
          """
          <label class='fb-outline'>{{label}}</label>
          """
        template:
            """
            <div class="form-group">
                <label for="{{formName+index}}" ng-class="{'fb-required':required}">{{label}}</label>
                <input type='hidden' ng-model="inputText" validator-required="{{required}}" validator-group="{{formName}}"/>
                <div class='checkbox' ng-repeat="item in options track by $index">
                    <label><input type='checkbox' ng-model="$parent.inputArray[$index]" value='item'/>
                        {{item}}
                    </label>
                </div>
                <p class='help-block'>{{description}}</p>
            </div>
            """
        popoverTemplate:
            """
            <form>
                <div class="form-group">
                    <label class='control-label'>控件标题</label>
                    <input type='text' ng-model="label" validator="[required]" class='form-control'/>
                </div>
                <div class="form-group">
                    <label class='control-label'>描述信息</label>
                    <input type='text' ng-model="description" class='form-control'/>
                </div>
                <div class="form-group">
                    <label class='control-label'>可选项</label>
                    <textarea class="form-control" rows="3" ng-model="optionsText"/>
                </div>
                <div class="checkbox">
                    <label>
                        <input type='checkbox' ng-model="required" />
                        必填项
                    </label>
                </div>

                <hr/>
                <div class='form-group'>
                    <div class="btn-group btn-group-justified">
                      <div class="btn-group">
                          <input type='submit' ng-click="popover.save($event)" class='btn btn-success' value='保存'/>
                      </div>
                      <div class="btn-group">
                          <input type='button' ng-click="popover.remove($event)" class='btn btn-danger' value='删除'/>
                      </div>
                      <div class="btn-group">
                          <input type='button' ng-click="popover.cancel($event)" class='btn btn-primary' value='取消'/>
                      </div>
                    </div>
                </div>
            </form>
            """

    # ----------------------------------------
    # radio
    # ----------------------------------------
    $builderProvider.registerComponent 'radio',
        group: '基础控件'
        label: '单项选择'
        description: '描述信息'
        placeholder: '占位符'
        required: no
        options: ['value one', 'value two']
        handleTemplate:
          """
          <label class='fb-outline'>{{label}}</label>
          """
        template:
            """
            <div class="form-group">
                <label for="{{formName+index}}" ng-class="{'fb-required':required}">{{label}}</label>
                <div class='radio' ng-repeat="item in options track by $index">
                    <label><input name='{{formName+index}}' ng-model="$parent.inputText" validator-group="{{formName}}" value='{{item}}' type='radio'/>
                        {{item}}
                    </label>
                </div>
                <p class='help-block'>{{description}}</p>
            </div>
            """
        popoverTemplate:
            """
            <form>
                <div class="form-group">
                    <label class='control-label'>控件标题</label>
                    <input type='text' ng-model="label" validator="[required]" class='form-control'/>
                </div>
                <div class="form-group">
                    <label class='control-label'>描述信息</label>
                    <input type='text' ng-model="description" class='form-control'/>
                </div>
                <div class="form-group">
                    <label class='control-label'>可选项</label>
                    <textarea class="form-control" rows="3" ng-model="optionsText"/>
                </div>

                <hr/>
                <div class='form-group'>
                    <div class="btn-group btn-group-justified">
                      <div class="btn-group">
                          <input type='submit' ng-click="popover.save($event)" class='btn btn-success' value='保存'/>
                      </div>
                      <div class="btn-group">
                          <input type='button' ng-click="popover.remove($event)" class='btn btn-danger' value='删除'/>
                      </div>
                      <div class="btn-group">
                          <input type='button' ng-click="popover.cancel($event)" class='btn btn-primary' value='取消'/>
                      </div>
                    </div>
                </div>
            </form>
            """

    # ----------------------------------------
    # select
    # ----------------------------------------
    $builderProvider.registerComponent 'select',
        group: '基础控件'
        label: '下拉选择'
        description: '描述信息'
        placeholder: '占位符'
        required: no
        options: ['value one', 'value two']
        handleTemplate:
          """
          <label class='fb-outline'>{{label}}</label>
          """
        template:
            """
            <div class="form-group">
                <label for="{{formName+index}}">{{label}}</label>
                <select ng-options="value for value in options" id="{{formName+index}}" class="form-control"
                    ng-model="inputText" ng-init="inputText = options[0]"/>
                <p class='help-block'>{{description}}</p>
            </div>
            """
        popoverTemplate:
            """
            <form>
                <div class="form-group">
                    <label class='control-label'>控件标题</label>
                    <input type='text' ng-model="label" validator="[required]" class='form-control'/>
                </div>
                <div class="form-group">
                    <label class='control-label'>描述信息</label>
                    <input type='text' ng-model="description" class='form-control'/>
                </div>
                <div class="form-group">
                    <label class='control-label'>可选项</label>
                    <textarea class="form-control" rows="3" ng-model="optionsText"/>
                </div>

                <hr/>
                <div class='form-group'>
                    <div class="btn-group btn-group-justified">
                      <div class="btn-group">
                          <input type='submit' ng-click="popover.save($event)" class='btn btn-success' value='保存'/>
                      </div>
                      <div class="btn-group">
                          <input type='button' ng-click="popover.remove($event)" class='btn btn-danger' value='删除'/>
                      </div>
                      <div class="btn-group">
                          <input type='button' ng-click="popover.cancel($event)" class='btn btn-primary' value='取消'/>
                      </div>
                    </div>
                </div>
            </form>
            """

    # ----------------------------------------
    # legend
    # ----------------------------------------
    $builderProvider.registerComponent 'legend',
        group: '基础控件'
        label: '分隔符'
        description: '描述信息'
        handleTemplate:
          """
          <label class='fb-outline'>{{label}}</label>
          """
        template:
            """
            <div class="form-group">
                <legend><label for="{{formName+index}}">{{label}}</label></legend>
                <p class='help-block'>{{description}}</p>
            </div>
            """
        popoverTemplate:
            """
            <form>
                <div class="form-group">
                    <label class='control-label'>控件标题</label>
                    <input type='text' ng-model="label" validator="[required]" class='form-control'/>
                </div>
                <div class="form-group">
                    <label class='control-label'>描述信息</label>
                    <input type='text' ng-model="description" class='form-control'/>
                </div>

                <hr/>
                <div class='form-group'>
                    <div class="btn-group btn-group-justified">
                      <div class="btn-group">
                          <input type='submit' ng-click="popover.save($event)" class='btn btn-success' value='保存'/>
                      </div>
                      <div class="btn-group">
                          <input type='button' ng-click="popover.remove($event)" class='btn btn-danger' value='删除'/>
                      </div>
                      <div class="btn-group">
                          <input type='button' ng-click="popover.cancel($event)" class='btn btn-primary' value='取消'/>
                      </div>
                    </div>
                </div>
            </form>
            """
]
