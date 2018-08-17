From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 05/34] xen: is_hvm_domain should evaluate to 0
 when !CONFIG_HVM
Date: Fri, 17 Aug 2018 16:12:23 +0100
Message-ID: <32dc160e20e574c7ec736fad43157928de86962e.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqgQs-0007yu-TL
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:12:58 +0000
In-Reply-To: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2luY2UgaXQgaXMgZGVmaW5lZCBpbiBjb21tb24gaGVhZGVyIGZpbGUsIGludHJvZHVjZSBDT05G
SUdfSFZNIHRvCkFybSB0byBhdm9pZCBicmVha2FnZS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUg
PHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL0tjb25maWcgICAgfCAzICsr
KwogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggfCA2ICsrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vS2NvbmZpZyBiL3hlbi9h
cmNoL2FybS9LY29uZmlnCmluZGV4IDU4NmJjNjIuLmMwZTk2OWUgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL2FybS9LY29uZmlnCisrKyBiL3hlbi9hcmNoL2FybS9LY29uZmlnCkBAIC01Miw2ICs1Miw5
IEBAIGNvbmZpZyBIQVNfSVRTCiAgICAgICAgIHByb21wdCAiR0lDdjMgSVRTIE1TSSBjb250cm9s
bGVyIHN1cHBvcnQiIGlmIEVYUEVSVCA9ICJ5IgogICAgICAgICBkZXBlbmRzIG9uIEdJQ1YzICYm
ICFORVdfVkdJQwogCitjb25maWcgSFZNCisgICAgICAgIGRlZl9ib29sIHkKKwogY29uZmlnIE5F
V19WR0lDCiAJYm9vbAogCXByb21wdCAiVXNlIG5ldyBWR0lDIGltcGxlbWVudGF0aW9uIgpkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmggYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQu
aAppbmRleCA1MWNlZWJlLi44ZmMzNDIzIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2No
ZWQuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaApAQCAtODc5LDggKzg3OSwxNCBAQCB2
b2lkIHdhdGNoZG9nX2RvbWFpbl9kZXN0cm95KHN0cnVjdCBkb21haW4gKmQpOwogCiAjZGVmaW5l
IGlzX3B2X2RvbWFpbihkKSAoKGQpLT5ndWVzdF90eXBlID09IGd1ZXN0X3R5cGVfcHYpCiAjZGVm
aW5lIGlzX3B2X3ZjcHUodikgICAoaXNfcHZfZG9tYWluKCh2KS0+ZG9tYWluKSkKKworI2lmIENP
TkZJR19IVk0KICNkZWZpbmUgaXNfaHZtX2RvbWFpbihkKSAoKGQpLT5ndWVzdF90eXBlID09IGd1
ZXN0X3R5cGVfaHZtKQorI2Vsc2UKKyNkZWZpbmUgaXNfaHZtX2RvbWFpbihkKSAoMCkKKyNlbmRp
ZgogI2RlZmluZSBpc19odm1fdmNwdSh2KSAgIChpc19odm1fZG9tYWluKHYtPmRvbWFpbikpCisK
ICNkZWZpbmUgaXNfcGlubmVkX3ZjcHUodikgKCh2KS0+ZG9tYWluLT5pc19waW5uZWQgfHwgXAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY3B1bWFza193ZWlnaHQoKHYpLT5jcHVfaGFyZF9h
ZmZpbml0eSkgPT0gMSkKICNpZmRlZiBDT05GSUdfSEFTX1BBU1NUSFJPVUdICi0tIApnaXQtc2Vy
aWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
