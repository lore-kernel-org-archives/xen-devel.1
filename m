From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 08/12] xenstore.h: Put ( ) around XS_* define
 shifts
Date: Fri, 12 Oct 2018 16:12:11 +0100
Message-ID: <20181012151215.32455-9-ian.jackson@eu.citrix.com>
References: <20181012151215.32455-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pszq=my=citrix.com=prvs=81651eb4b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gAz71-00018W-5g
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 15:12:23 +0000
In-Reply-To: <20181012151215.32455-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlc2UgZGVmaW5pdGlvbnMgd2VyZSBub3QgcHJvcGVybHkgcHJvdGVjdGVkIGZyb20gdW53YW50
ZWQgb3BlcmF0b3IKcHJlY2VkZW5jZSBpbnRlcmFjdGlvbnMuCgpFeGlzdGluZyB1c2Ugc2l0ZXMg
aW4tdHJlZSBhbGwgdXNlICYgb3IgfCwgc28gdGhpcyBkb2VzIG5vdCBjaGFuZ2UgYW55CmFjdHVh
bCBiZWhhdmlvdXIgaW4tdHJlZS4KClRoZSBzYW1lIHNlZW1zIGxpa2VseSB0byBiZSB0cnVlIGlu
IGV4dGVybmFsIGNhbGxlcnMuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KLS0tCnYyOiBOZXcgaW4gdGhpcyB2ZXJzaW9uIG9mIHRoZSBzZXJp
ZXMKLS0tCiB0b29scy94ZW5zdG9yZS9pbmNsdWRlL3hlbnN0b3JlLmggfCA2ICsrKy0tLQogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS90b29scy94ZW5zdG9yZS9pbmNsdWRlL3hlbnN0b3JlLmggYi90b29scy94ZW5zdG9yZS9pbmNs
dWRlL3hlbnN0b3JlLmgKaW5kZXggMGQ5NWJiMGU1Yy4uOTk2Yjc1YWIwZCAxMDA2NDQKLS0tIGEv
dG9vbHMveGVuc3RvcmUvaW5jbHVkZS94ZW5zdG9yZS5oCisrKyBiL3Rvb2xzL3hlbnN0b3JlL2lu
Y2x1ZGUveGVuc3RvcmUuaApAQCAtMjMsOCArMjMsOCBAQAogCiAjZGVmaW5lIFhCVF9OVUxMIDAK
IAotI2RlZmluZSBYU19PUEVOX1JFQURPTkxZCTFVTDw8MAotI2RlZmluZSBYU19PUEVOX1NPQ0tF
VE9OTFkgICAgICAxVUw8PDEKKyNkZWZpbmUgWFNfT1BFTl9SRUFET05MWQkoMVVMPDwwKQorI2Rl
ZmluZSBYU19PUEVOX1NPQ0tFVE9OTFkgICAgICAoMVVMPDwxKQogCiAvKgogICogU2V0dGluZyBY
U19VTldBVENIX0ZJTFRFUiBhcnJhbmdlcyB0aGF0IGFmdGVyIHhzX3Vud2F0Y2gsIG5vCkBAIC00
NSw3ICs0NSw3IEBACiAgKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB4c191bndh
dGNoIGZvciB0aGUgZmlyc3Qgd2F0Y2gKICAqICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGhhcyByZXR1cm5lZC4KICAqLwotI2RlZmluZSBYU19VTldBVENIX0ZJTFRFUiAgICAgMVVM
PDwyCisjZGVmaW5lIFhTX1VOV0FUQ0hfRklMVEVSICAgICAoMVVMPDwyKQogCiBzdHJ1Y3QgeHNf
aGFuZGxlOwogdHlwZWRlZiB1aW50MzJfdCB4c190cmFuc2FjdGlvbl90OwotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
