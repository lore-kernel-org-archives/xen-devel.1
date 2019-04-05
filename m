From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: [PATCH v2 3/3] x86/mm: Fix p2m_set_suppress_ve
Date: Fri, 5 Apr 2019 13:25:42 +0000
Message-ID: <20190405132521.6630-3-aisaila@bitdefender.com>
References: <20190405132521.6630-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xMyJ=SH=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hCOqp-0001h3-2l
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 13:25:47 +0000
In-Reply-To: <20190405132521.6630-1-aisaila@bitdefender.com>
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
ZmFpbCB3aXRoIGludmFsaWQgbWZuCmZyb20gcDJtLT5nZXRfZW50cnkoKSBpZiBwMm0tPnNldF9l
bnRyeSgpIHdhcyBub3QgY2FsbGVkIGJlZm9yZS4KClRoaXMgcGF0Y2ggc29sdmVzIHRoZSBwcm9i
bGVtIGJ5IGdldHRpbmcgdGhlIG1mbiBmcm9tIGhvc3RwMm0uCgpTaWduZWQtb2ZmLWJ5OiBBbGV4
YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYv
bW0vcDJtLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9hcmNoL3g4
Ni9tbS9wMm0uYwppbmRleCAxZjg1MjY5NGZmLi42ZGVlMDA1MmY4IDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvbW0vcDJtLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBAIC0yOTc0LDYg
KzI5NzQsNyBAQCBpbnQgcDJtX3NldF9zdXBwcmVzc192ZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5f
dCBnZm4sIGJvb2wgc3VwcHJlc3NfdmUsCiAgICAgcDJtX2FjY2Vzc190IGE7CiAgICAgcDJtX3R5
cGVfdCB0OwogICAgIGludCByYzsKKyAgICBib29sIGZvdW5kX2luX2hvc3RwMm07CiAKICAgICBp
ZiAoIGFsdHAybV9pZHggPiAwICkKICAgICB7CkBAIC0yOTkxLDcgKzI5OTIsNyBAQCBpbnQgcDJt
X3NldF9zdXBwcmVzc192ZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIGJvb2wgc3VwcHJl
c3NfdmUsCiAgICAgaWYgKCBhcDJtICkKICAgICAgICAgcDJtX2xvY2soYXAybSk7CiAKLSAgICBt
Zm4gPSBwMm0tPmdldF9lbnRyeShwMm0sIGdmbiwgJnQsICZhLCAwLCBOVUxMLCBOVUxMKTsKKyAg
ICBtZm4gPSBhbHRwMm1fZ2V0X2dmbl90eXBlX2FjY2VzcyhwMm0sIGdmbiwgJnQsICZhLCBOVUxM
LCAmZm91bmRfaW5faG9zdHAybSk7CiAgICAgaWYgKCAhbWZuX3ZhbGlkKG1mbikgKQogICAgIHsK
ICAgICAgICAgcmMgPSAtRVNSQ0g7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
