package trash.yjs_xx.tb_alter;

import com.lsure.server.entity.jlb_po;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by lsure on 2017/4/2.
 */
public interface tb_alter {
    public int tb_columns_add(@Param("tb") String tb, @Param("newcol") String newcolumn, @Param("type") String type);/*扩展表中添加列*/

    public int tb_columns_comment_alter(@Param("tb") String tb, @Param("newcol") String columns, @Param("type") String type, @Param("comment") String comment);/*扩展行添加备注*/

    public int tb_columns_delete(@Param("tb") String tb, @Param("column") String newcolumn);/*删除扩展表行*/

    public int jlb_add(@Param("tb") String tb, @Param("col_name") String col_name, @Param("type") String type, @Param("comment") String comment);/*添加新纪录到扩展记录表*/

    public int jlb_delete(@Param("tb") String tb, @Param("column") String column, @Param("variable") String variable);/*删除扩展记录表记录*/

    public List<jlb_po> jlb_query(@Param("tb") String tb);/*信息表记录表获取表结构*/

    public int info_insert(@Param("info") List<String> info, @Param("tb") String tb);/*批量导入学生信息*/

}
