From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2] x86emul: don't read mask register on
 AVX512F-incapable platforms
Date: Fri, 29 Mar 2019 01:42:02 -0600
Message-ID: <5C9DCC4A0200007800222AEA@prv1-mh.provo.novell.com>
References: <5C9CFE7102000078002229A1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9m9M-0002ST-AA
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 07:42:04 +0000
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm9yIHdoZW4gcmVnaXN0ZXIgc3RhdGUgaXNuJ3Qgc3VmZmljaWVudGx5IGVuYWJsZWQuCgpSZXBv
cnRlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgpTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQpUaGlzIGlzIHN1cmVs
eSBhIHN0YWJsZSB0cmVlIGNhbmRpZGF0ZSwgdW5sZXNzIGl0IGNvdWxkIHN0aWxsIG1ha2UgaXQK
aW50byA0LjEyIGJlZm9yZSB0aGUgcmVsZWFzZS4KLS0tCnYyOiBBZGQgWENSMCBjaGVjay4KCi0t
LSBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCisrKyBiL3hlbi9hcmNo
L3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCkBAIC0zNTExLDcgKzM1MTEsOCBAQCB4ODZf
ZW11bGF0ZSgKICAgICB9CiAKICAgICAvKiBXaXRoIGEgbWVtb3J5IG9wZXJhbmQsIGZldGNoIHRo
ZSBtYXNrIHJlZ2lzdGVyIGluIHVzZSAoaWYgYW55KS4gKi8KLSAgICBpZiAoIGVhLnR5cGUgPT0g
T1BfTUVNICYmIGV2ZXgub3Btc2sgKQorICAgIGlmICggZWEudHlwZSA9PSBPUF9NRU0gJiYgY3B1
X2hhc19hdng1MTJmICYmIGV2ZXgub3Btc2sgJiYKKyAgICAgICAgIF9nZXRfZnB1KGZwdV90eXBl
ID0gWDg2RU1VTF9GUFVfb3BtYXNrLCBjdHh0LCBvcHMpID09IFg4NkVNVUxfT0tBWSApCiAgICAg
ewogICAgICAgICB1aW50OF90ICpzdGIgPSBnZXRfc3R1YihzdHViKTsKIApAQCAtMzUzMiw2ICsz
NTMzLDE0IEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICBmYXVsdF9zdXBwcmVzc2lvbiA9IHRydWU7
CiAgICAgfQogCisgICAgaWYgKCBmcHVfdHlwZSA9PSBYODZFTVVMX0ZQVV9vcG1hc2sgKQorICAg
IHsKKyAgICAgICAgLyogU3F1YXNoIChzaWRlKSBlZmZlY3RzIG9mIHRoZSBfZ2V0X2ZwdSgpIGFi
b3ZlLiAqLworICAgICAgICB4ODZfZW11bF9yZXNldF9ldmVudChjdHh0KTsKKyAgICAgICAgcHV0
X2ZwdShYODZFTVVMX0ZQVV9vcG1hc2ssIGZhbHNlLCBzdGF0ZSwgY3R4dCwgb3BzKTsKKyAgICAg
ICAgZnB1X3R5cGUgPSBYODZFTVVMX0ZQVV9ub25lOworICAgIH0KKwogICAgIC8qIERlY29kZSAo
YnV0IGRvbid0IGZldGNoKSB0aGUgZGVzdGluYXRpb24gb3BlcmFuZDogcmVnaXN0ZXIgb3IgbWVt
b3J5LiAqLwogICAgIHN3aXRjaCAoIGQgJiBEc3RNYXNrICkKICAgICB7CgoKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
