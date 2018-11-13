From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 3/3] x86/HVM: hvmemul_cmpxchg() should also use
 known_gla()
Date: Tue, 13 Nov 2018 03:14:39 -0700
Message-ID: <5BEAA40F02000078001FB5D3@prv1-mh.provo.novell.com>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k8x1=ny=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gMViV-0001iL-3r
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 10:14:43 +0000
In-Reply-To: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VG8gYmUgY29uc2lzdGVudCB3aXRoIHRoZSB3cml0ZSBhbmQgcm13IGNhc2VzIHRoZSBtYXBwaW5n
IGFwcHJvYWNoCnNob3VsZCBub3QgYmUgdXNlZCB3aGVuIHRoZSBndWVzdCBsaW5lYXIgYWRkcmVz
cyB0cmFuc2xhdGlvbiBpcyBrbm93bi4KVGhpcyBpbiBwYXJ0aWN1bGFyIGV4Y2x1ZGVzIHRoZSBk
aXNjYXJkLXdyaXRlIGNhc2UgZnJvbSBieXBhc3NpbmcgdGhlCmVtdWxhdGlvbiBwYXRoLiBUaGlz
IGFsc28gbWVhbnMgdGhhdCBub3cgRUZMQUdTIHNob3VsZCBhY3R1YWxseSBnZXQKcHJvcGVybHkg
dXBkYXRlZCwgZGVzcGl0ZSB0aGUgZGlzY2FyZGVkIHdyaXRlIHBvcnRpb24gb2YgdGhlIG1lbW9y
eQphY2Nlc3MuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Ci0tLQpXaXRob3V0ICJtYWtlIGh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKCkgaG9ub3IgcDJtX2lv
cmVxX3NlcnZlciIgdGhpcwphbHNvIGhlbHBzIHRoZSBwMm1faW9yZXFfc2VydmVyIGNhc2UuCgpU
QkQ6IFdoaWxlIGh2bWVtdWxfZG9faW8oKSB0YWtlcyBjYXJlIG9mIHAybV9pb3JlcV9zZXJ2ZXIs
IEkgZG9uJ3Qgc2VlCiAgICAgaXQgdGFraW5nIGNhcmUgb2YgcDJtX2lzX2Rpc2NhcmRfd3JpdGUo
KSB0eXBlcy4gQW0gSSBvdmVybG9va2luZwogICAgIHNvbWV0aGluZz8KCi0tLSBhL3hlbi9hcmNo
L3g4Ni9odm0vZW11bGF0ZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jCkBAIC0x
NDcyLDkgKzE0NzIsMTIgQEAgc3RhdGljIGludCBodm1lbXVsX2NtcHhjaGcoCiAgICAgZWxzZSBp
ZiAoIGh2bWVtdWxfY3R4dC0+c2VnX3JlZ1t4ODZfc2VnX3NzXS5kcGwgPT0gMyApCiAgICAgICAg
IHBmZWMgfD0gUEZFQ191c2VyX21vZGU7CiAKLSAgICBtYXBwaW5nID0gaHZtZW11bF9tYXBfbGlu
ZWFyX2FkZHIoYWRkciwgYnl0ZXMsIHBmZWMsIGh2bWVtdWxfY3R4dCk7Ci0gICAgaWYgKCBJU19F
UlIobWFwcGluZykgKQotICAgICAgICByZXR1cm4gflBUUl9FUlIobWFwcGluZyk7CisgICAgaWYg
KCAha25vd25fZ2xhKGFkZHIsIGJ5dGVzLCBwZmVjKSApCisgICAgeworICAgICAgICBtYXBwaW5n
ID0gaHZtZW11bF9tYXBfbGluZWFyX2FkZHIoYWRkciwgYnl0ZXMsIHBmZWMsIGh2bWVtdWxfY3R4
dCk7CisgICAgICAgIGlmICggSVNfRVJSKG1hcHBpbmcpICkKKyAgICAgICAgICAgIHJldHVybiB+
UFRSX0VSUihtYXBwaW5nKTsKKyAgICB9CiAKICAgICBpZiAoICFtYXBwaW5nICkKICAgICB7CgoK
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
