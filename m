From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH for-4.11] scripts/add_maintainers.pl: Don't call
 get_maintainers.pl with -f
Date: Tue,  5 Jun 2018 17:39:38 +0100
Message-ID: <20180605163938.28090-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, xen-devel@lists.xen.org
Cc: jgross@suse.com, lars.kurth@citrix.com, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIG9wdGlvbiAtZiBvZiBzY3JpcHRzL2dldF9tYWludGFpbmVycy5wbCB3aWxsIHJldHVybiB0
aGUgbWFpbnRhaW5lcnMKb2YgYSBnaXZlbiBmaWxlLCAqbm90KiB0aGUgbGlzdCBvZiBtYWludGFp
bmVycyBpZiB0aGUgZmlsZSB3YXMgYSBwYXRjaC4KClRoZSBvdXRwdXQgZXhwZWN0ZWQgb2YgYWRk
X21haW50YWluZXJzIGlzIHRoZSBsYXR0ZXIsIHNvIGRyb3AgdGhlIG9wdGlvbgotZi4KClNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgotLS0KICAgIFRo
aXMgcGF0Y2ggaXMgY2FuZGlkYXRlIGZvciBYZW4gNC4xMS4gV2l0aG91dCBpdCBhZGRfbWFpbnRh
aW5lcnMucGwKICAgIHdpbGwgbm90IHJldHVybiB0aGUgY29ycmVjdCBtYWludGFpbmVycy4gSUhN
TywgaXQgc2hvdWxkIGJlIGZpeGVkCiAgICBBU0FQIHRvIGF2b2lkIHByb21vdGluZyBhIGJyb2tl
biBzY3JpcHRzLgotLS0KIHNjcmlwdHMvYWRkX21haW50YWluZXJzLnBsIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc2Ny
aXB0cy9hZGRfbWFpbnRhaW5lcnMucGwgYi9zY3JpcHRzL2FkZF9tYWludGFpbmVycy5wbAppbmRl
eCA5OWU0NzI0MTEyLi4wOWU5ZjY2MDlmIDEwMDc1NQotLS0gYS9zY3JpcHRzL2FkZF9tYWludGFp
bmVycy5wbAorKysgYi9zY3JpcHRzL2FkZF9tYWludGFpbmVycy5wbApAQCAtNDIwLDcgKzQyMCw3
IEBAIHN1YiBpc21haWxpbmdsaXN0ICgkKSB7CiBzdWIgZ2V0bWFpbnRhaW5lcnMgKCQkJCkgewog
ICAgIG15ICgkZmlsZSwgJHJ0bywgJHJjYykgPSBAXzsKICAgICBteSAkZmg7Ci0gICAgb3Blbigk
ZmgsICItfCIsICRnZXRfbWFpbnRhaW5lciwgQGdldF9tYWludGFpbmVyX2FyZ3MsICctZicsICRm
aWxlKQorICAgIG9wZW4oJGZoLCAiLXwiLCAkZ2V0X21haW50YWluZXIsIEBnZXRfbWFpbnRhaW5l
cl9hcmdzLCAkZmlsZSkKICAgICAgICAgb3IgZGllICJGYWlsZWQgdG8gb3BlbiAnJGdldF9tYWlu
dGFpbmVyJ1xuIjsKICAgICB3aGlsZShteSAkbGluZSA9IDwkZmg+KSB7CiAgICAgICAgIGNob21w
ICRsaW5lOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
