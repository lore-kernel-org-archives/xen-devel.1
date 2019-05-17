From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v3 12/15] x86/IRQ: add explicit tracing-enabled
 check to trace_irq_mask()
Date: Fri, 17 May 2019 04:51:50 -0600
Message-ID: <5CDE924602000078002300B7@prv1-mh.provo.novell.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRaSv-0006s4-0E
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 10:51:53 +0000
In-Reply-To: <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHNldHVwIGZvciBjYWxsaW5nIHRyYWNlX3ZhcigpICh3aGljaCBpdHNlbGYgY2hlY2tzIHRi
X2luaXRfZG9uZSkgaXMKbm9uLW5lZ2xpZ2libGUsIGFuZCBoZW5jZSBhIHNlcGFyYXRlIG91dGVy
LW1vc3QgY2hlY2sgaXMgd2FycmFudGVkLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgotLS0KdjM6IE5ldy4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYwor
KysgYi94ZW4vYXJjaC94ODYvaXJxLmMKQEAgLTEyMSw4ICsxMjEsOCBAQCBzdGF0aWMgdm9pZCBy
ZWxlYXNlX29sZF92ZWMoc3RydWN0IGlycV9kCiAgICAgfQogfQogCi1zdGF0aWMgdm9pZCB0cmFj
ZV9pcnFfbWFzayh1aW50MzJfdCBldmVudCwgaW50IGlycSwgaW50IHZlY3RvciwKLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IGNwdW1hc2tfdCAqbWFzaykKK3N0YXRpYyB2b2lkIF90
cmFjZV9pcnFfbWFzayh1aW50MzJfdCBldmVudCwgaW50IGlycSwgaW50IHZlY3RvciwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjcHVtYXNrX3QgKm1hc2spCiB7CiAgICAgc3Ry
dWN0IHsKICAgICAgICAgdW5zaWduZWQgaW50IGlycToxNiwgdmVjOjE2OwpAQCAtMTM3LDYgKzEz
NywxMyBAQCBzdGF0aWMgdm9pZCB0cmFjZV9pcnFfbWFzayh1aW50MzJfdCBldmVuCiAgICAgdHJh
Y2VfdmFyKGV2ZW50LCAxLCBzaXplb2YoZCksICZkKTsKIH0KIAorc3RhdGljIGlubGluZSB2b2lk
IHRyYWNlX2lycV9tYXNrKHVpbnQzMl90IGV2ZW50LCBpbnQgaXJxLCBpbnQgdmVjdG9yLAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNwdW1hc2tfdCAqbWFzaykKK3sK
KyAgICBpZiAoIHVubGlrZWx5KHRiX2luaXRfZG9uZSkgKQorICAgICAgICBfdHJhY2VfaXJxX21h
c2soZXZlbnQsIGlycSwgdmVjdG9yLCBtYXNrKTsKK30KKwogc3RhdGljIGludCBfX2luaXQgX2Jp
bmRfaXJxX3ZlY3RvcihzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MsIGludCB2ZWN0b3IsCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNwdW1hc2tfdCAqY3B1X21hc2spCiB7
CgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
