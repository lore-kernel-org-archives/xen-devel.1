From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 0/7] Fixes and improvements to pvshim
Date: Fri, 19 Jan 2018 15:34:51 +0000
Message-ID: <20180119153458.22535-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=pswu=eo=citrix.com=prvs=5505d9d7e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ecYh9-00020M-Nw
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 15:35:07 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSAoNyk6CiAgVXBkYXRlIHNoaW0uY29uZmlnCiAgbGlieGw6IHJlbW92ZSB3aGl0ZXNw
YWNlcyBpbnRyb2R1Y2VkIGluIDYyOTgyZGE5MjYKICB4ODYvZ3Vlc3Q6IGNsZWFuIHVwIGd1ZXN0
L3hlbi5oCiAgeDg2L3NoaW06IHVzZSBjcmVkaXQgc2NoZWR1bGVyCiAgeDg2OiByZWxvY2F0ZSBw
dmhfaW5mbwogIFJldmVydCAieDg2L2Jvb3Q6IE1hcCBtb3JlIHRoYW4gdGhlIGZpcnN0IDE2TUIi
CiAgbGlieGw6IGxvd2VyIHNoaW0gcmVsYXRlZCBtZXNzYWdlIHRvIGxldmVsIERFQlVHCgogZG9j
cy9tYW4veGwuY2ZnLnBvZC41LmluICAgICAgICAgICB8ICAyICstCiB0b29scy9maXJtd2FyZS94
ZW4tZGlyL3NoaW0uY29uZmlnIHwgIDggKystLS0tCiB0b29scy9saWJ4bC9saWJ4bF9kb20uYyAg
ICAgICAgICAgIHwgIDggKysrLS0tCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oICAgICAg
IHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9ib290L01ha2VmaWxlICAgICAgICAgfCAgNyArKysrLQog
eGVuL2FyY2gveDg2L2Jvb3QvYnVpbGQzMi5tayAgICAgICB8ICAzICsrCiB4ZW4vYXJjaC94ODYv
Ym9vdC9kZWZzLmggICAgICAgICAgIHwgIDMgKysKIHhlbi9hcmNoL3g4Ni9ib290L2hlYWQuUyAg
ICAgICAgICAgfCAyNSArKysrKysrKystLS0tLS0tCiB4ZW4vYXJjaC94ODYvYm9vdC9yZWxvYy5j
ICAgICAgICAgIHwgNTkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIHhl
bi9hcmNoL3g4Ni9ib290L3g4Nl82NC5TICAgICAgICAgfCAgMyArLQogeGVuL2luY2x1ZGUvYXNt
LXg4Ni9ndWVzdC94ZW4uaCAgICB8IDE1ICsrKy0tLS0tLS0KIDExIGZpbGVzIGNoYW5nZWQsIDkz
IGluc2VydGlvbnMoKyksIDQyIGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
