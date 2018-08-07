From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 4/9] x86/hvm: provide stubs for HVM guest
 accessors
Date: Tue, 7 Aug 2018 11:00:47 +0100
Message-ID: <99029322a404f9ac7b14c5b310573b791e87560e.1533636027.git-series.wei.liu2@citrix.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xdgf=kw=citrix.com=prvs=7503460ff=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fmynR-00046O-4S
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 10:00:57 +0000
In-Reply-To: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vaW5j
bHVkZS9hc20teDg2L2h2bS9ndWVzdF9hY2Nlc3MuaCB8IDI0ICsrKysrKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9hc20teDg2L2h2bS9ndWVzdF9hY2Nlc3MuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
aHZtL2d1ZXN0X2FjY2Vzcy5oCmluZGV4IGI5MmRiZTkuLmM3ZTgzZGMgMTAwNjQ0Ci0tLSBhL3hl
bi9pbmNsdWRlL2FzbS14ODYvaHZtL2d1ZXN0X2FjY2Vzcy5oCisrKyBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvaHZtL2d1ZXN0X2FjY2Vzcy5oCkBAIC0xLDggKzEsMzIgQEAKICNpZm5kZWYgX19BU01f
WDg2X0hWTV9HVUVTVF9BQ0NFU1NfSF9fCiAjZGVmaW5lIF9fQVNNX1g4Nl9IVk1fR1VFU1RfQUND
RVNTX0hfXwogCisjaWYgQ09ORklHX0hWTQorCiB1bnNpZ25lZCBsb25nIGNvcHlfdG9fdXNlcl9o
dm0odm9pZCAqdG8sIGNvbnN0IHZvaWQgKmZyb20sIHVuc2lnbmVkIGxlbik7CiB1bnNpZ25lZCBs
b25nIGNsZWFyX3VzZXJfaHZtKHZvaWQgKnRvLCB1bnNpZ25lZCBpbnQgbGVuKTsKIHVuc2lnbmVk
IGxvbmcgY29weV9mcm9tX3VzZXJfaHZtKHZvaWQgKnRvLCBjb25zdCB2b2lkICpmcm9tLCB1bnNp
Z25lZCBsZW4pOwogCisjZWxzZQorCitzdGF0aWMgaW5saW5lCit1bnNpZ25lZCBsb25nIGNvcHlf
dG9fdXNlcl9odm0odm9pZCAqdG8sIGNvbnN0IHZvaWQgKmZyb20sIHVuc2lnbmVkIGxlbikKK3sK
KyAgICByZXR1cm4gbGVuOworfQorCitzdGF0aWMgaW5saW5lCit1bnNpZ25lZCBsb25nIGNsZWFy
X3VzZXJfaHZtKHZvaWQgKnRvLCB1bnNpZ25lZCBpbnQgbGVuKQoreworICAgIHJldHVybiBsZW47
Cit9CisKK3N0YXRpYyBpbmxpbmUKK3Vuc2lnbmVkIGxvbmcgY29weV9mcm9tX3VzZXJfaHZtKHZv
aWQgKnRvLCBjb25zdCB2b2lkICpmcm9tLCB1bnNpZ25lZCBsZW4pCit7CisgICAgcmV0dXJuIGxl
bjsKK30KKworI2VuZGlmCisKICNlbmRpZiAvKiBfX0FTTV9YODZfSFZNX0dVRVNUX0FDQ0VTU19I
X18gKi8KLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
