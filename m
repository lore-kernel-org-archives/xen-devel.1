From: Yue Haibing <yuehaibing@huawei.com>
Subject: [PATCH -next] xen-swiotlb: Make two functions static
Date: Tue, 16 Apr 2019 22:49:50 +0800
Message-ID: <20190416144950.37952-1-yuehaibing__33262.237445318$1555426270$gmane$org@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Jry=SS=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1hGPPW-0006eP-9q
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 14:50:10 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgoKRml4IHNwYXJzZSB3YXJu
aW5nczoKCmRyaXZlcnMveGVuL3N3aW90bGIteGVuLmM6NDg5OjE6IHdhcm5pbmc6CiBzeW1ib2wg
J3hlbl9zd2lvdGxiX3N5bmNfc2luZ2xlX2Zvcl9jcHUnIHdhcyBub3QgZGVjbGFyZWQuIFNob3Vs
ZCBpdCBiZSBzdGF0aWM/CmRyaXZlcnMveGVuL3N3aW90bGIteGVuLmM6NDk2OjE6IHdhcm5pbmc6
CiBzeW1ib2wgJ3hlbl9zd2lvdGxiX3N5bmNfc2luZ2xlX2Zvcl9kZXZpY2UnIHdhcyBub3QgZGVj
bGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVs
a2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVh
d2VpLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIHwgNCArKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMveGVuL3N3aW90bGIteGVuLmMgYi9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCmluZGV4
IDg3N2JhZjIuLmU3NDFkZjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMK
KysrIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYwpAQCAtNDg1LDE0ICs0ODUsMTQgQEAgeGVu
X3N3aW90bGJfc3luY19zaW5nbGUoc3RydWN0IGRldmljZSAqaHdkZXYsIGRtYV9hZGRyX3QgZGV2
X2FkZHIsCiAJCXhlbl9kbWFfc3luY19zaW5nbGVfZm9yX2RldmljZShod2RldiwgZGV2X2FkZHIs
IHNpemUsIGRpcik7CiB9CiAKLXZvaWQKK3N0YXRpYyB2b2lkCiB4ZW5fc3dpb3RsYl9zeW5jX3Np
bmdsZV9mb3JfY3B1KHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBkbWFfYWRkcl90IGRldl9hZGRyLAog
CQkJCXNpemVfdCBzaXplLCBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIpCiB7CiAJeGVuX3N3
aW90bGJfc3luY19zaW5nbGUoaHdkZXYsIGRldl9hZGRyLCBzaXplLCBkaXIsIFNZTkNfRk9SX0NQ
VSk7CiB9CiAKLXZvaWQKK3N0YXRpYyB2b2lkCiB4ZW5fc3dpb3RsYl9zeW5jX3NpbmdsZV9mb3Jf
ZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBkbWFfYWRkcl90IGRldl9hZGRyLAogCQkJCSAg
IHNpemVfdCBzaXplLCBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIpCiB7Ci0tIAoyLjcuNAoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
