package trash.yjs_xx.serviceImpl;

import trash.yjs_xx.tb_alter.tb_alter;
import com.lsure.server.entity.jlb_po;
import trash.yjs_xx.service.kzxxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.lsure.server.general.infinity.powerofNature.globals;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by lsure on 2017/4/2.
 */
@Service("kzxxService")
public class kzxxSericeImpl implements kzxxService {
    @Autowired
    private tb_alter tb_alterdao;

    /*
    *
    * 注意：ddl操作是自治事务，挂起当前事务，新开一个事务，独立于其父事务提交和回滚，所以无法通过父事务进行回滚
    * */
    /*扩展新的列*/
    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public int kzxx_add(String newColName, String type, String comment) {
    /*无法根据父事务回滚*/
        tb_alterdao.tb_columns_add(globals.TABLE_EXTENSIBLE_YJSXXB, newColName, type);/*添加列*/
     /*无法根据父事务回滚*/
        tb_alterdao.tb_columns_comment_alter(globals.TABLE_EXTENSIBLE_YJSXXB, newColName, type, comment);/*添加注解信息*/
        tb_alterdao.jlb_add(globals.TABLE_EXTENSIBLE_YJSXXB_RECORD, newColName, type, comment);
        return 0;
    }

    /*删除扩展列*/
    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public int kzxx_delete(String delColName) {
        /*无法根据父事务进行回滚*/
        tb_alterdao.tb_columns_delete(globals.TABLE_EXTENSIBLE_YJSXXB, delColName);/*删除列*/
        tb_alterdao.jlb_delete(globals.TABLE_EXTENSIBLE_YJSXXB_RECORD, globals.TABLE_EXTENSIBLE_YJSXXB_RECORD_KEY, delColName);
        return 0;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public List<jlb_po> fixed_query() {
        return tb_alterdao.jlb_query(globals.TABLE_FIXED_YJSXXB_RECORD);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public List<jlb_po> extensible_query() {
        return tb_alterdao.jlb_query(globals.TABLE_EXTENSIBLE_YJSXXB_RECORD);
    }

    /*全部解析为字符串格式*/
    /*为null的时候录入“null”*/
    /*是否添加数据校验？？*/
    public String List2String(List<String> origin) {
        String result = "(";
        Iterator iterator = origin.iterator();
        while (iterator.hasNext()) {
            result = result + "\"" + iterator.next() + "\"" + ",";
        }
        result = result.substring(0, result.length() - 1);/*去除最后一个，*/
        result = result + ")";
        return result;
    }

    @Override
    public int info_insert(List<List<String>> fixed, List<List<String>> extensive, String tb_fixed, String tb_extensive) {
        List<String> fixed_String = new LinkedList<>();
        List<String> extensive_String = new LinkedList<>();
        for (List<String> it : fixed) {
            fixed_String.add(List2String(it));
        }
        for (List<String> it : extensive) {
            extensive_String.add(List2String(it));
        }
        System.out.print(fixed_String + "||" + extensive_String);
        tb_alterdao.info_insert(fixed_String, tb_fixed);
        tb_alterdao.info_insert(extensive_String, tb_extensive);
        return 0;
    }
}
