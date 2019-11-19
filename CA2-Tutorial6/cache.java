import java.util.HashMap;
import java.util.LinkedList;
import java.util.Queue;
import java.util.ArrayList;
import java.math.BigInteger;

public class cache {

	public static void main(String[] args) {
		cache test = new cache(16, 1, 8);
		System.out.println("L "+test.L+" N " +test.N+" K "+test.K+" : Hits :" + test.hits);
		test = new cache(16, 2, 4);
		System.out.println("L "+test.L+" N " +test.N+" K "+test.K+" : Hits :" + test.hits);
		test = new cache(16, 4, 2);
		System.out.println("L "+test.L+" N " +test.N+" K "+test.K+" : Hits :" + test.hits);
		test = new cache(16, 8, 1);
		System.out.println("L "+test.L+" N " +test.N+" K "+test.K+" : Hits :" + test.hits);
	}

	int L;
	int K;
	int N;
	int hits;
	int mask;
	//Deque<String> tags;
	ArrayList<Queue<String>> table;

	public cache(int L, int N, int K) {
	    this.hits=0;
		this.L = L;
		this.K = K;
		this.N = N;
		this.mask=N-1;
		//System.out.println(this.mask);
		this.table = new ArrayList<Queue<String>>();
		for (int i = 0; i < N; i++) {
			this.table.add(new LinkedList<String>());
		}
		this.refer("0000");
		this.refer("0004");
		this.refer("000C");
		this.refer("2200");
		this.refer("00d0");
		this.refer("00e0");
		this.refer("1130");
		this.refer("0028");
		this.refer("113c");
		this.refer("2204");
		this.refer("0010");
		this.refer("0020");
		this.refer("0004");
		this.refer("0040");
		this.refer("2208");
		this.refer("0008");
		this.refer("00a0");
		this.refer("0004");
		this.refer("1104");
		this.refer("0028");
		this.refer("000c");
		this.refer("0084");
		this.refer("000c");
		this.refer("3390");
		this.refer("00b0");
		this.refer("1100");
		this.refer("0028");
		this.refer("0064");
		this.refer("0070");
		this.refer("00d0");
		this.refer("0008");
		this.refer("3394");
	}
	private int log2(int N) {
		int count=0;
		while(N!=1) {
			N=N/2;
			count++;
		}
		return count;
	}
	private int mask(int log2) {
		int result=0;
		while(log2>0) {
			result+=(int) Math.pow(2, log2);
			log2--;
		}
		
		return result;
	}
	private void refer(String hex) {
		//System.out.println("The address is " + hex);
		String getOffset = hex.substring(3);
		// System.out.println("The offset of this address is " + getOffset);
		String tmp = hex.substring(2, 3);
		// System.out.println(tmp);
		int getSetNumber = Integer.parseInt(tmp, 16);
		getSetNumber = (int) (getSetNumber & this.mask);
		//System.out.println("The set Number of this address is " + getSetNumber);
		String getTag = hex.substring(0, 3);
		// System.out.println("The tag of this address is " + getTag);

		if (this.table.get(getSetNumber).size() < this.K && !this.table.get(getSetNumber).contains(getTag)) {
			this.table.get(getSetNumber).add(getTag);
			//System.out.println("M : " + getTag);
			//System.out.println("1");
		} else if (this.table.get(getSetNumber).size() < this.K && this.table.get(getSetNumber).contains(getTag)) {
			this.table.get(getSetNumber).remove(getTag);
			this.table.get(getSetNumber).add(getTag);
			this.hits++;
			//System.out.println("H : " + getTag);
			//System.out.println("2");
		}else {
			if (this.table.get(getSetNumber).contains(getTag)) {
				this.table.get(getSetNumber).remove(getTag);
				this.table.get(getSetNumber).add(getTag);
				this.hits++;
				//System.out.println("H : " + getTag);
				//System.out.println("3");
			}else if (!this.table.get(getSetNumber).contains(getTag)){
				this.table.get(getSetNumber).remove();
				this.table.get(getSetNumber).add(getTag);
				//System.out.println("M : " + getTag);
				//System.out.println("4");
			}
		}
		//System.out.println("So far, the number of hits is " +this.hits);
		//System.out.println(this.table.toString());
		//System.out.println("---------------------");
	}
}