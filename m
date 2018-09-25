From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] arm: fix Dom build after cd8015b634
Date: Tue, 25 Sep 2018 06:56:58 -0600
Message-ID: <5BAA309A02000078001EB990@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=u73d=mh=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g4mtk-0001pS-GA
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 12:57:04 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

VGhlIHJlbW92YWwgb2YgdGhlIFZMQSB0aGVyZSBoYXMgY2hhbmdlZCBzaXplb2YoKSBmb3IgdGhl
IGFycmF5LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgot
LS0KVW50ZXN0ZWQ7IHB1cmVseSBiYXNlZCBvbiBsb29raW5nIGF0IHRoZSBjb2RlLgoKLS0tIGEv
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCisrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYwpAQCAtNTY4LDcgKzU2OCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IG1ha2VfbWVtb3J5X25v
ZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwKICAgICAgICAgZHRfY2hpbGRfc2V0X3JhbmdlKCZj
ZWxscywgYWRkcmNlbGxzLCBzaXplY2VsbHMsIHN0YXJ0LCBzaXplKTsKICAgICB9CiAKLSAgICBy
ZXMgPSBmZHRfcHJvcGVydHkoZmR0LCAicmVnIiwgcmVnLCBzaXplb2YocmVnKSk7CisgICAgcmVz
ID0gZmR0X3Byb3BlcnR5KGZkdCwgInJlZyIsIHJlZywgbnJfY2VsbHMgKiBzaXplb2YoKnJlZykp
OwogICAgIGlmICggcmVzICkKICAgICAgICAgcmV0dXJuIHJlczsKIAoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
