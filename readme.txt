<div class="form-item cf">
                            <label class="item-label">语言选择<span class="check-tips"></span></label>
                            <div class="form-item">
                                <?php
                                $language = getlang();
                                ?>
                                <select name="lang">
                                    <volist name="language" id="vo">
                                        <option value="{$vo['id']}">{$vo['lang_name']}</option>
                                    </volist>
                                </select>
                            </div>
                        </div>