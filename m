From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2] rombios: remove packed attribute for
 pushad_regs_t
Date: Tue, 28 Aug 2018 14:56:38 +0100
Message-ID: <20180828135638.6161-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ardv=ll=citrix.com=prvs=7715574d5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fueU6-0001zk-Lr
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 13:56:42 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHN0cnVjdHVyZSBhbHJlYWR5IGhhcyBleHBsaWNpdGx5IHBhZGRpbmcuCgpSZW1vdmluZyB0
aGUgYXR0cmlidXRlIHNpbGVuY2VzIGEgY2xhbmcgNiB3YXJuaW5nOgoKdGNnYmlvcy5jOjE1MTk6
MzQ6IGVycm9yOiB0YWtpbmcgYWRkcmVzcyBvZiBwYWNrZWQgbWVtYmVyICd1JyBvZiBjbGFzcyBv
ciBzdHJ1Y3R1cmUgJ3B1c2hhZF9yZWdzX3QnIG1heSByZXN1bHQgaW4gYW4gdW5hbGlnbmVkIHBv
aW50ZXIgdmFsdWUgWy1XZXJyb3IsLVdhZGRyZXNzLW9mLXBhY2tlZC1tZW1iZXJdCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgwq5zLT51LnIzMi5lZHgp
OwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
Ci0tLQogdG9vbHMvZmlybXdhcmUvcm9tYmlvcy8zMmJpdC9yb21iaW9zX2NvbXBhdC5oIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvZmlybXdhcmUvcm9tYmlvcy8zMmJpdC9yb21iaW9zX2NvbXBhdC5oIGIvdG9v
bHMvZmlybXdhcmUvcm9tYmlvcy8zMmJpdC9yb21iaW9zX2NvbXBhdC5oCmluZGV4IGMwYWU0MTUx
YjUuLjNmZTdkNjc3MjEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2Zpcm13YXJlL3JvbWJpb3MvMzJiaXQv
cm9tYmlvc19jb21wYXQuaAorKysgYi90b29scy9maXJtd2FyZS9yb21iaW9zLzMyYml0L3JvbWJp
b3NfY29tcGF0LmgKQEAgLTUyLDcgKzUyLDcgQEAgdHlwZWRlZiBzdHJ1Y3QgewogICAgIEJpdDE2
dSBmaWxsZXI0OwogICAgIH0gcjg7CiAgIH0gdTsKLX0gX19hdHRyaWJ1dGVfXygocGFja2VkKSkg
cHVzaGFkX3JlZ3NfdDsKK30gcHVzaGFkX3JlZ3NfdDsKIAogCiAKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
