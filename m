From: ira.weiny@intel.com
Subject: [RESEND PATCH 6/7] IB/qib: Use the new FOLL_LONGTERM
 flag to get_user_pages_fast()
Date: Tue, 19 Feb 2019 21:30:39 -0800
Message-ID: <20190220053040.10831-7-ira.weiny__10363.2108004362$1550640728$gmane$org@intel.com>
References: <20190220053040.10831-1-ira.weiny@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q/Qw=Q3=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1gwKT8-0008Eh-1F
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 05:30:54 +0000
In-Reply-To: <20190220053040.10831-1-ira.weiny@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org, linux-fpga@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, devel@driverdev.osuosl.org, linux-s390@vger.kernel.org, rds-devel@oss.oracle.com, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, xen-devel@lists.xenproject.org, devel@lists.orangefs.org, linux-media@vger.kernel.org, kvm-ppc@vger.kernel.org, ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgoKVXNlIHRoZSBuZXcgRk9MTF9M
T05HVEVSTSB0byBnZXRfdXNlcl9wYWdlc19mYXN0KCkgdG8gcHJvdGVjdCBhZ2FpbnN0CkZTIERB
WCBwYWdlcyBiZWluZyBtYXBwZWQuCgpTaWduZWQtb2ZmLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlu
eUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9pbmZpbmliYW5kL2h3L3FpYi9xaWJfdXNlcl9zZG1h
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2luZmluaWJhbmQvaHcvcWliL3FpYl91c2VyX3NkbWEuYyBi
L2RyaXZlcnMvaW5maW5pYmFuZC9ody9xaWIvcWliX3VzZXJfc2RtYS5jCmluZGV4IDMxYzUyM2Iy
YTlmNS4uYjUzY2MwMjQwZTAyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2luZmluaWJhbmQvaHcvcWli
L3FpYl91c2VyX3NkbWEuYworKysgYi9kcml2ZXJzL2luZmluaWJhbmQvaHcvcWliL3FpYl91c2Vy
X3NkbWEuYwpAQCAtNjczLDcgKzY3Myw3IEBAIHN0YXRpYyBpbnQgcWliX3VzZXJfc2RtYV9waW5f
cGFnZXMoY29uc3Qgc3RydWN0IHFpYl9kZXZkYXRhICpkZCwKIAkJZWxzZQogCQkJaiA9IG5wYWdl
czsKIAotCQlyZXQgPSBnZXRfdXNlcl9wYWdlc19mYXN0KGFkZHIsIGosIDAsIHBhZ2VzKTsKKwkJ
cmV0ID0gZ2V0X3VzZXJfcGFnZXNfZmFzdChhZGRyLCBqLCBGT0xMX0xPTkdURVJNLCBwYWdlcyk7
CiAJCWlmIChyZXQgIT0gaikgewogCQkJaSA9IDA7CiAJCQlqID0gcmV0OwotLSAKMi4yMC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
