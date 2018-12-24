package com.sise.OnlineBookStore;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Vector;
import java.util.jar.Attributes.Name;

import javax.enterprise.inject.New;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.sise.bean.CartProduct;
import com.sise.bean.OrderInfo;
import com.sise.bean.Orderitem;
import com.sise.bean.Orders;
import com.sise.bean.ReceiverInfo;
import com.sise.bean.notice;
public class JDBCUtils {
	private static QueryRunner runner=null;
	 private static DataSource dataSource=null;
	 static {
		 dataSource=new ComboPooledDataSource("mysql");
	 }
	 
	 //获取连接
	 public static Connection getConnection() {
		 Connection coon=null;
		 try {
			coon=dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return coon;
		 
	 }
	 
	 //关闭连接
	 public static void close(Connection coon) {
		 try {
			 if (coon!=null && !coon.isClosed()) {
				coon.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	 }
	 public static DataSource getDataSource() {
		 return dataSource;
	 }
	 public static QueryRunner getRunner() {
		 return new QueryRunner();
	 }
	
	//获取商品库存
	public static int getPnum(int id) {
		Connection coon1=getConnection();
		System.out.println("得到一个连接："+coon1);
		try {
			Integer count=getRunner().query(coon1,"select pnum from products where id=?",new ScalarHandler<Integer>(),id );
			System.out.println("查询到的库存为："+count);
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(coon1);
			System.out.println("连接已关闭");
		}
		return 0;
		
	}
	//检测用户名是否可用
	public static boolean UsernameVail(String username) {
		Connection coon1=getConnection();
		System.out.println("得到一个连接："+coon1);
		try {
			UserBean u=getRunner().query(coon1,"select * from user where username=? ",new BeanHandler<UserBean>(UserBean.class),username);
			if (u==null) {
				return true;
			}
			else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(coon1);
			System.out.println("连接已关闭");
		}
		return true;
		
	}
	public static int setPnum(int id) {
		Connection coon1=getConnection();
		System.out.println("得到一个连接："+coon1);
		try {
			Integer count=getRunner().update(coon1,"update products set pnum=pnum+1 where id=?",id );
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(coon1);
			System.out.println("连接已关闭");
		}
		return 0;
		
	}
	//按类别查询商品
	public static List<products> selectByType(Object[] value){
		Connection coon1=getConnection();
		System.out.println("得到一个连接："+coon1);
		try {
			
			return getRunner().query(coon1,"select * from products where category=? and insale=1", new BeanListHandler<products>(products.class),value);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(coon1);
			System.out.println("连接已关闭");
		}
		return null;
	}
	//查询所有商品
	public static List<products> selectAllproducts(){
		Connection coon1=getConnection();
		System.out.println("得到一个连接："+coon1);
		try {
			
			return getRunner().query(coon1,"select * from products where insale=1", new BeanListHandler<products>(products.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(coon1);
			System.out.println("连接已关闭");
		}
		return null;
	}
	//商品模糊查询
	public static List<products> selectProductBylike(String name){
		Connection coon1=getConnection();
		System.out.println("得到一个连接："+coon1);
		try {
			System.out.println();
			return getRunner().query(coon1,"select * from products where name like ?", new BeanListHandler<products>(products.class),"%"+name+"%");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(coon1);
			System.out.println("连接已关闭");
		}
		return null;
	}
	//查询所有公告
	public static List<notice> selectAllnotices(){
		Connection coon1=getConnection();
		System.out.println("得到一个连接："+coon1);
		try {
			
			return getRunner().query(coon1,"select * from notice", new BeanListHandler<notice>(notice.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(coon1);
			System.out.println("连接已关闭");
		}
		return null;
	}
	//添加商品
	public static Boolean insertProduct(products p) {
		Connection coon1=getConnection();
		Object[] val= {p.getName(),p.getPrice(),p.getCategory(),p.getPnum(),p.getImgurl(),p.getDescription(),1};
		try {
			getRunner().update(coon1, "insert into products(name,price,category,pnum,imgurl,description,insale) values(?,?,?,?,?,?,?)",val);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(coon1);
			System.out.println("连接已关闭");
		}
		return null;
		
	}
	//编辑商品信息
public static Boolean EditProduct(products p) {
	Connection coon1=getConnection();
	System.out.println("url为"+p.getImgurl());
	System.out.println(p.getImgurl().equals(""));
	if(p.getImgurl().equals(""))
		p.setImgurl(selectById(p.getId()).getImgurl());
		
		System.out.println(selectById(p.getId()).getImgurl());
		
	Object[] val= {p.getName(),p.getPrice(),p.getCategory(),p.getPnum(),p.getImgurl(),p.getDescription(),p.getId()};
	try {
		getRunner().update(coon1, "update products set name=?,price=?,category=?,pnum=?,imgurl=?,description=? where id=?",val);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		try {
			coon1.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	return null;
		
	}
	//查询出所有商品类别
		public static List<Object[]> selectAllCategory(){
			Connection coon1=getConnection();
			System.out.println("得到一个连接："+coon1);
			try {
				
				return getRunner().query(coon1,"select distinct category from products where insale=1",new ArrayListHandler());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(coon1);
				System.out.println("连接已关闭");
			}
			return null;
		}
		
		//编辑公告
		public static boolean editNotice(int nid,String title,String details){
			Connection coon1=getConnection();
			System.out.println("得到一个连接："+coon1);
			Object[] val= {title,details,nid};
			try {
				
				int row= getRunner().update(coon1,"update notice set title=?,details=? where n_id=?",val);
				if (row>0) {
					return true;
				}
				else {
					return false;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(coon1);
				System.out.println("连接已关闭");
			}
			return true;
		}
		//按条件查询商品
		public static List<products> selectByCondition(String sql){
			Connection coon1=getConnection();
			System.out.println("得到一个连接："+coon1);
			try {
				
				return getRunner().query(coon1,sql, new BeanListHandler<products>(products.class));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(coon1);
				System.out.println("连接已关闭");
			}
			return null;
		}
	//按id查询商品
		public static products selectById(int id){
			Connection coon1=getConnection();
			System.out.println("得到一个连接："+coon1);
			try {
				System.out.println(id+":::");
				return getRunner().query(coon1,"select * from products where id=? ", new BeanHandler<products>(products.class),new Object[] {id});
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(coon1);
				System.out.println("连接已关闭");
			}
			return null;
		}
		//查询热销商品
		public static List<products> selectHotSale(int sum){
			Connection coon1=getConnection();
			System.out.println("得到一个连接："+coon1);
			try {
				return getRunner().query(coon1,"select * from products order by pnum asc limit ?", new BeanListHandler<products>(products.class),new Object[] {sum});
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(coon1);
				System.out.println("连接已关闭");
			}
			return null;
		}
		//按id删除商品
				public static int delProductById(int id){
					Connection coon1=getConnection();
					System.out.println("得到一个连接："+coon1);
					try {
						
						return getRunner().update(coon1,"update products set insale=0 where id=?",new Object[] {id});
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						close(coon1);
						System.out.println("连接已关闭");
					}
					return 0;
				}
				//按公告id删除公告
				public static int delNoticeById(int id){
					Connection coon1=getConnection();
					System.out.println("得到一个连接："+coon1);
					try {
						
						return getRunner().update(coon1,"delete from notice where n_id=?",new Object[] {id});
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						close(coon1);
						System.out.println("连接已关闭");
					}
					return 0;
				}
				//添加公告
				public static boolean addNotice(String title,String details){
					
					Connection coon1=getConnection();
					Timestamp time=new Timestamp(new Date().getTime());
					Object[] val= {title,details,time};
					System.out.println("得到一个连接："+coon1);
					try {
						
						if (getRunner().update(coon1,"insert into notice (title,details,n_time) values(?,?,?)",val)==1) {
							return true;
						}
						else {
							return false;
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						close(coon1);
						System.out.println("连接已关闭");
					}
					return true;
				}
				//按订单id删除订单
				public static int delOrderById(String oid){
					Connection coon1=getConnection();
					
					System.out.println("得到一个连接："+coon1);
					try {
						coon1.setAutoCommit(false);
						//根据订单id得到订单信息
						Orders orders=selectOrdersByoid(oid);
						
						//如果订单未支付，则取消后将商品对应库存还原
						if(orders.getOrderInfo().getPaystate().equals("待支付")) {
							System.out.println("订单未支付，正在取消");
					    Vector<CartProduct>  o=orders.getOrderitem();
					    for(CartProduct c:o) {
					    	System.out.println(c.getProduct().getId());
					    	System.out.println(c.getCount());
					    	getRunner().update(coon1,"update products set pnum=pnum+? where id=?",new Object[] {c.getCount(),c.getProduct().getId()});
					    	
					    }
					    
						}
						
						//将订单标记为取消
						getRunner().update(coon1, "update orders set orderstate ='0' where id=?",oid);
						
						coon1.commit();
						
					}catch (Exception e) {
						// TODO: handle exception
					}finally {
						close(coon1);
						System.out.println("连接已关闭");
					}
					return 0;
				}
		//按用户名查看订单信息
		public static Vector<Orders> selectOrdersByUsername(String username) {
			Connection coon1=getConnection();
			Connection coon2=getConnection();
			Object[] val= {username};
			
			try {
				Vector<Orders> v=new Vector<Orders>();
				UserBean ub=getRunner().query(coon1, "select * from user where username=?",new BeanHandler<UserBean>(UserBean.class),val);
				if (ub==null) {
					return null;
				}
				int id=ub.getId();
				List<OrderInfo> oidList = getRunner().query(coon1, "select * from orders where user_id=?",new BeanListHandler<OrderInfo>(OrderInfo.class),new Object[] {id});
				
				for(OrderInfo o:oidList) {
					System.out.println(o.getMoney());
				}
				
				for(OrderInfo oinfo:oidList) {
					System.out.println(oinfo.getId());
					Vector<CartProduct> vtr=new Vector<CartProduct>();
					//获取
					String sql="select * from orderitem where order_id=?";
					PreparedStatement pstm=coon2.prepareStatement(sql);
					pstm.setString(1, ""+oinfo.getId()+"");
					ResultSet rst=pstm.executeQuery();
					
					
					//得到订单的商品item
					while (rst.next()) {
						
						
						String  pid=rst.getString("product_id");
						int sum=Integer.parseInt(rst.getString("buynum"));
						
						products pros=getRunner().query(coon1, "select * from products where id=?",new BeanHandler<products>(products.class),new Object[] {pid});
						vtr.add(new CartProduct(pros, sum));
						
						
						
					}
					
					Orders o=new Orders(oinfo,vtr);
					v.add(o);
				}
				return v;
			} catch (SQLException e) {
				
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					coon1.close();
					coon2.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				;
			}
			
			
			
			return null;
			
		}
		//按订单号查看订单信息
				public static Orders selectOrdersByoid(String oid) {
					Connection coon1=getConnection();
					Connection coon2=getConnection();
					Object[] val= {oid};
					System.out.println(oid);
					try {
						//得到order表中对应的那条记录
						OrderInfo orderInfo = getRunner().query(coon1, "select * from orders where id=?",new BeanHandler<OrderInfo>(OrderInfo.class),new Object[] {oid});
						if(orderInfo==null ) return null;
						System.out.println(orderInfo+"ddddd");
							Vector<CartProduct> vtr=new Vector<CartProduct>();
							//获取订单中所包含的商品
							String sql="select * from orderitem where order_id=?";
							PreparedStatement pstm=coon2.prepareStatement(sql);
							pstm.setString(1, oid);
							ResultSet rst=pstm.executeQuery();
							System.out.println(rst);
							
							//得到订单的商品item
							while (rst.next()) {
								
								
								String  pid=rst.getString("product_id");
								System.out.println(pid);
								int sum=Integer.parseInt(rst.getString("buynum"));
								System.out.println(sum);
								products pros=getRunner().query(coon1, "select * from products where id=?",new BeanHandler<products>(products.class),new Object[] {pid});
								vtr.add(new CartProduct(pros, sum));
								
								
								
							}
							System.out.println(orderInfo);
							Orders o=new Orders(orderInfo,vtr);

						return o;
					} catch (SQLException e) {
						
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						try {
							coon1.close();
							coon2.close();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						;
					}
					
					
					
					return null;
					
				}
		//查看所有订单信息
		public static Vector<Orders> selectAllOrders() {
			Connection coon1=getConnection();
			Connection coon2=getConnection();
			
			try {
				Vector<Orders> v=new Vector<Orders>();
				List<OrderInfo> oidList = getRunner().query(coon1, "select * from orders ",new BeanListHandler<OrderInfo>(OrderInfo.class));
				
				for(OrderInfo o:oidList) {
					System.out.println(o.getMoney());
				}
				
				for(OrderInfo oinfo:oidList) {
					System.out.println(oinfo.getId());
					Vector<CartProduct> vtr=new Vector<CartProduct>();
					//获取
					String sql="select * from orderitem where order_id=?";
					PreparedStatement pstm=coon2.prepareStatement(sql);
					pstm.setString(1, ""+oinfo.getId()+"");
					ResultSet rst=pstm.executeQuery();
					
					
					//得到订单的商品item
					while (rst.next()) {
						
						
						String  pid=rst.getString("product_id");
						int sum=Integer.parseInt(rst.getString("buynum"));
						
						products pros=getRunner().query(coon1, "select * from products where id=?",new BeanHandler<products>(products.class),new Object[] {pid});
						vtr.add(new CartProduct(pros, sum));
						
						
						
					}
					
					Orders o=new Orders(oinfo,vtr);
					v.add(o);
				}
				return v;
			} catch (SQLException e) {
				
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					coon1.close();
					coon2.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				;
			}
			
			
			
			return null;
			
		}
		//生成订单信息
		@SuppressWarnings("unchecked")
		public static Boolean GenerateOrder(UserBean userinfo,ReceiverInfo rcvInfo,HashMap<String, Object> preInfo ) {
			
			//userinfo为购买用户
			//rcvInfo为订单收货信息
			//preInfo为订单所包含的商品信息
			String oid=RandomUtil.getRandomFileName();
			Object[] param= {
					oid,
					preInfo.get("price"),
					rcvInfo.getReceiverAddress(),
					rcvInfo.getReceiverName(),
					rcvInfo.getReceiverPhone(),
					"待支付",
					new Timestamp(new Date().getTime()),
					userinfo.getId(),
					"正常"
			};
			
			
			Connection coon1=getConnection();
			try {
				coon1.setAutoCommit(false);
				QueryRunner runner=getRunner();
				
				
				
				
				//生成订单号等信息
				runner.execute(coon1,"insert into orders values(?,?,?,?,?,?,?,?,?)",param);
				//插入orderitem 并 减少对应商品库存
				for(CartProduct cpt:(Vector<CartProduct>)preInfo.get("products")) {
					runner.update(coon1, "update products set pnum=pnum-? where id=?",new Object[] {cpt.getCount(),cpt.getProduct().getId()});
					runner.update(coon1,"insert into orderitem values(?,?,?)",new Object[] {oid,cpt.getProduct().getId(),cpt.getCount()});
				}
				coon1.commit();
				coon1.setAutoCommit(true);
				return true;
			} catch (SQLException e) {
				//出现异常，回滚
				try {
					coon1.rollback();
					return false;
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				e.printStackTrace();
			}finally {
				close(coon1);
			}
			
			return false;
			
			
			
		}
	
}
