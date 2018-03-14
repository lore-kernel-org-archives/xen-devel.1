From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] libxc/arm: remove useless conditional in meminit
Date: Wed, 14 Mar 2018 10:58:11 +0000
Message-ID: <20180314105811.23809-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yxl5=ge=citrix.com=prvs=60440319b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ew46u-0007MA-20
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 10:58:20 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHZhcmlhYmxlIG5hbWVkIHJhbXNpemUgaXMgYWx3YXlzIG5vbi16ZXJvIGF0IHRoYXQgcG9p
bnQgYmVjYXVzZQp0aGVyZSBpcyBhIGNoZWNrIGZvciB6ZXJvIGEgZmV3IGxpbmVzIGJlZm9yZS4K
ClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMv
bGlieGMveGNfZG9tX2FybS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfZG9tX2FybS5jIGIv
dG9vbHMvbGlieGMveGNfZG9tX2FybS5jCmluZGV4IDViOWVjYTYwODcuLjVhY2IzMjE0OGUgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hjX2RvbV9hcm0uYworKysgYi90b29scy9saWJ4Yy94Y19k
b21fYXJtLmMKQEAgLTQyNSw3ICs0MjUsNyBAQCBzdGF0aWMgaW50IG1lbWluaXQoc3RydWN0IHhj
X2RvbV9pbWFnZSAqZG9tKQogICAgIGlmICggcmMgKQogICAgICAgICByZXR1cm4gcmM7CiAKLSAg
ICBmb3IgKCBpID0gMDsgcmFtc2l6ZSAmJiBpIDwgR1VFU1RfUkFNX0JBTktTOyBpKysgKQorICAg
IGZvciAoIGkgPSAwOyBpIDwgR1VFU1RfUkFNX0JBTktTOyBpKysgKQogICAgIHsKICAgICAgICAg
dWludDY0X3QgYmFua3NpemUgPSByYW1zaXplID4gYmFua21heFtpXSA/IGJhbmttYXhbaV0gOiBy
YW1zaXplOwogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
