From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 01/17] x86/shadow: put PV L1TF functions under
 CONFIG_PV
Date: Thu, 4 Oct 2018 16:43:20 +0100
Message-ID: <fe5bc0f8e7ab462b8c63698de5f9919671af8542.1538667753.git-series.wei.liu2@citrix.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a7fh=mq=citrix.com=prvs=808c92aaa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g85mt-0004zX-Ud
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 15:43:39 +0000
In-Reply-To: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
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
bHVkZS9hc20teDg2L3NoYWRvdy5oIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9zaGFkb3cuaCBiL3hlbi9p
bmNsdWRlL2FzbS14ODYvc2hhZG93LmgKaW5kZXggYjNlYmU1Ni4uN2Q4ODYzNyAxMDA2NDQKLS0t
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9zaGFkb3cuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2
L3NoYWRvdy5oCkBAIC0xNjMsNiArMTYzLDggQEAgc3RhdGljIGlubGluZSBib29sIGlzX2wxdGZf
c2FmZV9tYWRkcihpbnRwdGVfdCBwdGUpCiAgICAgcmV0dXJuIG1hZGRyID09IDAgfHwgbWFkZHIg
Pj0gbDF0Zl9zYWZlX21hZGRyOwogfQogCisjaWZkZWYgQ09ORklHX1BWCisKIHN0YXRpYyBpbmxp
bmUgYm9vbCBwdl9sMXRmX2NoZWNrX3B0ZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQg
bGV2ZWwsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50cHRlX3QgcHRl
KQogewpAQCAtMjQxLDYgKzI0Myw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwdl9sMXRmX2RvbWFp
bl9kZXN0cm95KHN0cnVjdCBkb21haW4gKmQpCiAjZW5kaWYKIH0KIAorI2VuZGlmIC8qIENPTkZJ
R19QViAqLworCiAvKiBSZW1vdmUgYWxsIHNoYWRvd3Mgb2YgdGhlIGd1ZXN0IG1mbi4gKi8KIHN0
YXRpYyBpbmxpbmUgdm9pZCBzaGFkb3dfcmVtb3ZlX2FsbF9zaGFkb3dzKHN0cnVjdCBkb21haW4g
KmQsIG1mbl90IGdtZm4pCiB7Ci0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
