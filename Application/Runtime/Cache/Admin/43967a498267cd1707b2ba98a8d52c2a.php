<?php if (!defined('THINK_PATH')) exit();?><section class="content-header">
    <h1>
        系统首页
        <small></small>
    </h1>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <!-- /.col -->
        <div class="col-md-12">
            <div class="box box-default">
                <div class="box-header with-border">
                    <h3 class="box-title">商品SKU分析</h3>
                    <!-- /.box-tools -->
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                    <div class="table-responsive" style="overflow-x: visible;">
                        <table class="table table-bordered table-hover">
                            <tbody>
                            <tr>
                                <th>
                                    商品名称
                                </th>
                                <th>
                                    浏览量
                                </th>
                                <th>
                                    购买量
                                </th>
                                <th>
                                    销售额
                                </th>
                                <th>
                                    购买率
                                </th>
                            </tr>
                            <?php if(is_array($skuList)): $i = 0; $__LIST__ = $skuList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$list): $mod = ($i % 2 );++$i;?><tr>
                                    <td><?php echo ($list["product"]["name"]); ?>【<?php echo ($list["name"]); ?>】</td>
                                    <td><?php echo ($list["product"]["visiter"]); ?></td>
                                    <td><?php echo ($list["sales"]); ?></td>
                                    <td><?php echo ($list['sales'] * $list['price']); ?></td>
                                    <td><?php echo (round($list['sales'] / $list['product']['visiter'] * 100,2)); ?>%</td>
                                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.mail-box-messages -->
                </div>
            </div>
            <!-- /. box -->
        </div>
        <!-- /.col -->
    </div>
</section>