From: ira.weiny@intel.com
Subject: [PATCH V2 7/7] IB/mthca: Use the new FOLL_LONGTERM flag
 to get_user_pages_fast()
Date: Wed, 13 Feb 2019 15:04:55 -0800
Message-ID: <20190213230455.5605-8-ira.weiny__33598.08471739$1550123321$gmane$org@intel.com>
References: <20190211201643.7599-1-ira.weiny@intel.com>
 <20190213230455.5605-1-ira.weiny@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U1ZV=QU=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1gu3az-0005bI-AX
 for xen-devel@lists.xenproject.org; Wed, 13 Feb 2019 23:05:37 +0000
In-Reply-To: <20190213230455.5605-1-ira.weiny@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, kvm@vger.kernel.org, linux-fpga@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, linux-scsi@vger.kernel.org, devel@driverdev.osuosl.org, virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, linux-fbdev@vger.kernel.org, xen-devel@lists.xenproject.org, devel@lists.orangefs.org, linux-mm@kvack.org, ceph-devel@vger.kernel.org, rds-devel@oss.oracle.com
Cc: Martin Brandenburg <martin@omnibond.com>, Rich Felker <dalias@libc.org>, David Hildenbrand <david@redhat.com>, David Airlie <airlied@linux.ie>, Jason Wang <jasowang@redhat.com>, =?UTF-8?q?Kai=20M=C3=A4kisara?= <Kai.Makisara@kolumbus.fi>, Michal Hocko <mhocko@suse.com>, Ira Weiny <ira.weiny@intel.com>, Ben Chan <benchan@chromium.org>, Rob Springer <rspringer@google.com>, Todd Poynor <toddpoynor@google.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Joerg Roedel <joro@8bytes.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Matt Porter <mporter@kernel.crashing.org>, Wu Hao <hao.wu@intel.com>, Alan Tull <atull@kernel.org>, John Hubbard <jhubbard@nvidia.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Borislav Petkov <bp@>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgoKVXNlIHRoZSBuZXcgRk9MTF9M
T05HVEVSTSB0byBnZXRfdXNlcl9wYWdlc19mYXN0KCkgdG8gcHJvdGVjdCBhZ2FpbnN0CkZTIERB
WCBwYWdlcyBiZWluZyBtYXBwZWQuCgpTaWduZWQtb2ZmLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlu
eUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9pbmZpbmliYW5kL2h3L210aGNhL210aGNhX21lbWZy
ZWUuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbmZpbmliYW5kL2h3L210aGNhL210aGNhX21lbWZy
ZWUuYyBiL2RyaXZlcnMvaW5maW5pYmFuZC9ody9tdGhjYS9tdGhjYV9tZW1mcmVlLmMKaW5kZXgg
MTEyZDJmMzhlMGRlLi44ZmYwZTkwZDc1NjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW5maW5pYmFu
ZC9ody9tdGhjYS9tdGhjYV9tZW1mcmVlLmMKKysrIGIvZHJpdmVycy9pbmZpbmliYW5kL2h3L210
aGNhL210aGNhX21lbWZyZWUuYwpAQCAtNDcyLDcgKzQ3Miw4IEBAIGludCBtdGhjYV9tYXBfdXNl
cl9kYihzdHJ1Y3QgbXRoY2FfZGV2ICpkZXYsIHN0cnVjdCBtdGhjYV91YXIgKnVhciwKIAkJZ290
byBvdXQ7CiAJfQogCi0JcmV0ID0gZ2V0X3VzZXJfcGFnZXNfZmFzdCh1YWRkciAmIFBBR0VfTUFT
SywgMSwgRk9MTF9XUklURSwgcGFnZXMpOworCXJldCA9IGdldF91c2VyX3BhZ2VzX2Zhc3QodWFk
ZHIgJiBQQUdFX01BU0ssIDEsCisJCQkJICBGT0xMX1dSSVRFIHwgRk9MTF9MT05HVEVSTSwgcGFn
ZXMpOwogCWlmIChyZXQgPCAwKQogCQlnb3RvIG91dDsKIAotLSAKMi4yMC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
