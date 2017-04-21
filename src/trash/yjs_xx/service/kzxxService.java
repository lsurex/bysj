package trash.yjs_xx.service;

import com.lsure.server.entity.jlb_po;

import java.util.List;

/**
 * Created by lsure on 2017/4/2.
 */
/*扩展信息服务*/
public interface kzxxService {
    public int kzxx_add(String newColName, String type, String comment);

    public int kzxx_delete(String delColName);

    public List<jlb_po> fixed_query();

    public List<jlb_po> extensible_query();

    public int info_insert(List<List<String>> fixed, List<List<String>> extensive, String tb_fixed, String tb_extensive);
}
