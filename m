From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 3/4] x86/vPIC: avoid speculative out of bounds
 accesses
Date: Thu, 31 Jan 2019 07:26:34 -0700
Message-ID: <5C53059A0200007800212CB6@prv1-mh.provo.novell.com>
References: <5C5301290200007800212C6B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gpDIa-0008GN-Ru
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 14:26:36 +0000
In-Reply-To: <5C5301290200007800212C6B@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, nmanthey@amazon.de, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXJyYXkgaW5kZXhlcyB1c2VkIGluIHRoZSBJL08gcG9ydCByZWFkL3dyaXRlIGVtdWxhdGlvbiBm
dW5jdGlvbnMgYXJlCmRlcml2ZWQgZnJvbSBndWVzdCBjb250cm9sbGVkIHZhbHVlcy4gV2hlcmUg
dGhpcyBpcyBub3QgYWxyZWFkeSBkb25lLApyZXN0cmljdCB0aGVpciByYW5nZXMgdG8gbGltaXQg
dGhlIHNpZGUgZWZmZWN0cyBvZiBzcGVjdWxhdGl2ZSBleGVjdXRpb24uCgpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvaHZt
L3ZwaWMuYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZwaWMuYwpAQCAtMzM1LDcgKzMzNSw3IEBA
IHN0YXRpYyBpbnQgdnBpY19pbnRlcmNlcHRfcGljX2lvKAogICAgICAgICByZXR1cm4gWDg2RU1V
TF9PS0FZOwogICAgIH0KIAotICAgIHZwaWMgPSAmY3VycmVudC0+ZG9tYWluLT5hcmNoLmh2bS52
cGljW3BvcnQgPj4gN107CisgICAgdnBpYyA9ICZjdXJyZW50LT5kb21haW4tPmFyY2guaHZtLnZw
aWNbISEocG9ydCAmIDB4ODApXTsKIAogICAgIGlmICggZGlyID09IElPUkVRX1dSSVRFICkKICAg
ICAgICAgdnBpY19pb3BvcnRfd3JpdGUodnBpYywgcG9ydCwgKHVpbnQ4X3QpKnZhbCk7CkBAIC00
NDgsNyArNDQ4LDcgQEAgdm9pZCB2cGljX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKIAogdm9pZCB2
cGljX2lycV9wb3NpdGl2ZV9lZGdlKHN0cnVjdCBkb21haW4gKmQsIGludCBpcnEpCiB7Ci0gICAg
c3RydWN0IGh2bV9od192cGljICp2cGljID0gJmQtPmFyY2guaHZtLnZwaWNbaXJxID4+IDNdOwor
ICAgIHN0cnVjdCBodm1faHdfdnBpYyAqdnBpYyA9ICZkLT5hcmNoLmh2bS52cGljWyEhKGlycSAm
IDgpXTsKICAgICB1aW50OF90IG1hc2sgPSAxIDw8IChpcnEgJiA3KTsKIAogICAgIEFTU0VSVCho
YXNfdnBpYyhkKSk7CkBAIC00NjYsNyArNDY2LDcgQEAgdm9pZCB2cGljX2lycV9wb3NpdGl2ZV9l
ZGdlKHN0cnVjdCBkb21haQogCiB2b2lkIHZwaWNfaXJxX25lZ2F0aXZlX2VkZ2Uoc3RydWN0IGRv
bWFpbiAqZCwgaW50IGlycSkKIHsKLSAgICBzdHJ1Y3QgaHZtX2h3X3ZwaWMgKnZwaWMgPSAmZC0+
YXJjaC5odm0udnBpY1tpcnEgPj4gM107CisgICAgc3RydWN0IGh2bV9od192cGljICp2cGljID0g
JmQtPmFyY2guaHZtLnZwaWNbISEoaXJxICYgOCldOwogICAgIHVpbnQ4X3QgbWFzayA9IDEgPDwg
KGlycSAmIDcpOwogCiAgICAgQVNTRVJUKGhhc192cGljKGQpKTsKCgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
