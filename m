From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: [PATCH for-4.12 V5 2/2] x86/altp2m: fix
 HVMOP_altp2m_set_domain_state race
Date: Fri, 15 Feb 2019 17:41:24 +0200
Message-ID: <1550245284-9321-2-git-send-email-rcojocaru@bitdefender.com>
References: <1550245284-9321-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9h2z=QW=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gufcL-000225-6m
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 15:41:33 +0000
In-Reply-To: <1550245284-9321-1-git-send-email-rcojocaru@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SFZNT1BfYWx0cDJtX3NldF9kb21haW5fc3RhdGUgZG9lcyBub3QgZG9tYWluX3BhdXNlKCksIHBy
ZXN1bWFibHkKb24gcHVycG9zZSAoYXMgaXQgd2FzIG9yaWdpbmFsbHkgc3VwcG9zZWQgdG8gY2F0
ZXIgdG8gYSBpbi1ndWVzdAphZ2VudCwgYW5kIGEgZG9tYWluIHBhdXNpbmcgaXRzZWxmIGlzIG5v
dCBhIGdvb2QgaWRlYSkuCgpUaGlzIGNhbiBsZWFkIHRvIGRvbWFpbiBjcmFzaGVzIGluIHRoZSB2
bXhfdm1leGl0X2hhbmRsZXIoKSBjb2RlCnRoYXQgY2hlY2tzIGlmIHRoZSBndWVzdCBoYXMgdGhl
IGFiaWxpdHkgdG8gc3dpdGNoIEVQVFAgd2l0aG91dCBhbgpleGl0LiBUaGF0IGNvZGUgY2FuIF9f
dm1yZWFkKCkgdGhlIGhvc3QgcDJtJ3MgRVBUX1BPSU5URVIKKGJlZm9yZSBIVk1PUF9hbHRwMm1f
c2V0X2RvbWFpbl9zdGF0ZSAiZm9yX2VhY2hfdmNwdSgpIiBoYXMgYQpjaGFuY2UgdG8gcnVuIGFs
dHAybV92Y3B1X2luaXRpYWxpc2UoKSwgYnV0IGFmdGVyCmQtPmFyY2guYWx0cDJtX2FjdGl2ZSBp
cyBzZXQpLgoKU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVm
ZW5kZXIuY29tPgoKLS0tCkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNDOiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDQzogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KQ0M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyB8IDYgKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9odm0u
YyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKaW5kZXggNDEwNjIzZC4uNzljN2Q4MSAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5j
CkBAIC00NTM4LDYgKzQ1MzgsMTAgQEAgc3RhdGljIGludCBkb19hbHRwMm1fb3AoCiAgICAgICAg
ICAgICBicmVhazsKICAgICAgICAgfQogCisgICAgICAgIHJjID0gZG9tYWluX3BhdXNlX2V4Y2Vw
dF9zZWxmKGQpOworICAgICAgICBpZiAoIHJjICkKKyAgICAgICAgICAgIGJyZWFrOworCiAgICAg
ICAgIG9zdGF0ZSA9IGQtPmFyY2guYWx0cDJtX2FjdGl2ZTsKICAgICAgICAgZC0+YXJjaC5hbHRw
Mm1fYWN0aXZlID0gISFhLnUuZG9tYWluX3N0YXRlLnN0YXRlOwogCkBAIC00NTU2LDYgKzQ1NjAs
OCBAQCBzdGF0aWMgaW50IGRvX2FsdHAybV9vcCgKICAgICAgICAgICAgIGlmICggb3N0YXRlICkK
ICAgICAgICAgICAgICAgICBwMm1fZmx1c2hfYWx0cDJtKGQpOwogICAgICAgICB9CisKKyAgICAg
ICAgZG9tYWluX3VucGF1c2VfZXhjZXB0X3NlbGYoZCk7CiAgICAgICAgIGJyZWFrOwogICAgIH0K
IAotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
