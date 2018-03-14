From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 3/3] x86: reduce "visibility" of spec_ctrl_asm.h
Date: Wed, 14 Mar 2018 02:30:00 -0600
Message-ID: <5AA8EB9802000078001B15C4@prv-mh.provo.novell.com>
References: <5AA8E9BE02000078001B15B0@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=0lyu=ge=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ew1nV-00024T-NI
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 08:30:09 +0000
In-Reply-To: <5AA8E9BE02000078001B15B0@prv-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T3RoZXIgdGhhbiBpbmRpcmVjdF90aHVua19hc20uaCwgc3BlY19jdHJsX2FzbS5oIGlzIGEgaGVh
ZGVyIG5lZWRlZCBieQphc3NlbWJseSBzb3VyY2UgZmlsZXMgb25seS4gQXZvaWQgaGF2aW5nIGFs
bCBDIHNvdXJjZXMgaGF2ZSBhIGRlcGVuZGVuY3kKb24gdGhhdCBoZWFkZXIuCgpTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vaW5jbHVkZS9h
c20teDg2L2FzbV9kZWZucy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvYXNtX2RlZm5zLmgK
QEAgLTMyOCw2ICszMjgsOCBAQCBzdGF0aWMgYWx3YXlzX2lubGluZSB2b2lkIHN0YWModm9pZCkK
ICAgICAgICAgImNhbGwgY3I0X3B2MzJfcmVzdG9yZSIsIFg4Nl9GRUFUVVJFX1hFTl9TTUVQLCBc
CiAgICAgICAgICJjYWxsIGNyNF9wdjMyX3Jlc3RvcmUiLCBYODZfRkVBVFVSRV9YRU5fU01BUAog
CisjaW5jbHVkZSA8YXNtL3NwZWNfY3RybF9hc20uaD4KKwogI2VuZGlmCiAKICNpZmRlZiBDT05G
SUdfUEVSRl9DT1VOVEVSUwpAQCAtMzcwLDYgKzM3Miw0IEBAIHN0YXRpYyBhbHdheXNfaW5saW5l
IHZvaWQgc3RhYyh2b2lkKQogNDogIC5wMmFsaWduIDIgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgOyBcCiAgICAgLnBvcHNlY3Rpb24KIAotI2luY2x1ZGUgPGFzbS9zcGVjX2N0cmxfYXNtLmg+
Ci0KICNlbmRpZiAvKiBfX1g4Nl9BU01fREVGTlNfSF9fICovCgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
