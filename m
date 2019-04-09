From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: [PATCH v3 3/3] x86/mm: Fix p2m_set_suppress_ve
Date: Tue, 9 Apr 2019 12:04:00 +0000
Message-ID: <20190409120324.13940-3-aisaila@bitdefender.com>
References: <20190409120324.13940-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xtw0=SL=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hDpTu-0005qF-B5
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:04:02 +0000
In-Reply-To: <20190409120324.13940-1-aisaila@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, Alexandru Stefan ISAILA <aisaila@bitdefender.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gYSBuZXcgYWx0cDJtIHZpZXcgdGhlIHAybV9zZXRfc3VwcHJlc3NfdmUoKSBmdW5jIHdpbGwg
ZmFpbCB3aXRoIGludmFsaWQgbWZuDQpmcm9tIHAybS0+Z2V0X2VudHJ5KCkgaWYgcDJtLT5zZXRf
ZW50cnkoKSB3YXMgbm90IGNhbGxlZCBiZWZvcmUuDQoNClRoaXMgcGF0Y2ggc29sdmVzIHRoZSBw
cm9ibGVtIGJ5IGdldHRpbmcgdGhlIG1mbiBmcm9tIGhvc3RwMm0uDQoNClNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPg0KLS0tDQogeGVuL2Fy
Y2gveDg2L21tL3AybS5jIHwgMyArKy0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94
ZW4vYXJjaC94ODYvbW0vcDJtLmMNCmluZGV4IGQzOGQ3YzI5Y2EuLmFlZTgyZjgxNGQgMTAwNjQ0
DQotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0u
Yw0KQEAgLTI5ODIsNiArMjk4Miw3IEBAIGludCBwMm1fc2V0X3N1cHByZXNzX3ZlKHN0cnVjdCBk
b21haW4gKmQsIGdmbl90IGdmbiwgYm9vbCBzdXBwcmVzc192ZSwNCiAgICAgcDJtX2FjY2Vzc190
IGE7DQogICAgIHAybV90eXBlX3QgdDsNCiAgICAgaW50IHJjOw0KKyAgICBib29sIGZvdW5kX2lu
X2hvc3RwMm07DQogDQogICAgIGlmICggYWx0cDJtX2lkeCA+IDAgKQ0KICAgICB7DQpAQCAtMjk5
OSw3ICszMDAwLDcgQEAgaW50IHAybV9zZXRfc3VwcHJlc3NfdmUoc3RydWN0IGRvbWFpbiAqZCwg
Z2ZuX3QgZ2ZuLCBib29sIHN1cHByZXNzX3ZlLA0KICAgICBpZiAoIGFwMm0gKQ0KICAgICAgICAg
cDJtX2xvY2soYXAybSk7DQogDQotICAgIG1mbiA9IHAybS0+Z2V0X2VudHJ5KHAybSwgZ2ZuLCAm
dCwgJmEsIDAsIE5VTEwsIE5VTEwpOw0KKyAgICBtZm4gPSBhbHRwMm1fZ2V0X2dmbl90eXBlX2Fj
Y2VzcyhwMm0sIGdmbiwgJnQsICZhLCBOVUxMLCAmZm91bmRfaW5faG9zdHAybSk7DQogICAgIGlm
ICggIW1mbl92YWxpZChtZm4pICkNCiAgICAgew0KICAgICAgICAgcmMgPSAtRVNSQ0g7DQotLSAN
CjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
