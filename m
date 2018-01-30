From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/4] x86: remove CR reads from exit-to-guest
	path
Date: Tue, 30 Jan 2018 11:01:50 +0000
Message-ID: <5921d505-c6dd-afdf-5ca8-cf4731033c22@citrix.com>
References: <5A671D6D02000078001A17B7@prv-mh.provo.novell.com>
 <5A671E4D02000078001A17C1@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=chuq=ez=citrix.com=prvs=5612829e9=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1egTgn-0008Pa-BS
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2018 11:02:57 +0000
In-Reply-To: <5A671E4D02000078001A17C1@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDEvMTggMTA6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IC0tLSBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvYXNtX2RlZm5zLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2FzbV9kZWZu
cy5oCj4gQEAgLTIwNiwxMyArMjA2LDEyIEBAIHZvaWQgcmV0X2Zyb21faW50cih2b2lkKTsKPiAg
I2RlZmluZSBBU01fU1RBQyBBU01fQUMoU1RBQykKPiAgI2RlZmluZSBBU01fQ0xBQyBBU01fQUMo
Q0xBQykKPiAgCj4gLS5tYWNybyB3cml0ZV9jcjMgdmFsOnJlcSwgdG1wMTpyZXEsIHRtcDI6cmVx
Cj4gLSAgICAgICAgbW92ICAgJWNyNCwgJVx0bXAxCj4gLSAgICAgICAgbW92ICAgJVx0bXAxLCAl
XHRtcDIKPiAtICAgICAgICBhbmQgICAkflg4Nl9DUjRfUEdFLCAlXHRtcDEKPiAtICAgICAgICBt
b3YgICAlXHRtcDEsICVjcjQKPiArLm1hY3JvIHdyaXRlX2NyMyB2YWw6cmVxLCBjcjQ6cmVxLCB0
bXA6cmVxCj4gKyAgICAgICAgbW92ICAgJVxjcjQsICVcdG1wCj4gKyAgICAgICAgYW5kICAgJH5Y
ODZfQ1I0X1BHRSwgJVxjcjQKPiArICAgICAgICBtb3YgICAlXGNyNCwgJWNyNAoKVGhpcyBpcyBj
b25mdXNpbmcgdG8gcmVhZDsgSXQgdG9vayBtZSBhIHdoaWxlIHRvIHdvcmsgb3V0IHdoeSBpdAph
c3NlbWJsZWQgaW4gdGhlIGZpcnN0IHBsYWNlLsKgIEdpdmVuIHRoYXQgdGhlcmUgYXJlIG9ubHkg
dHdvIGluc3RhbmNlcwpvZiB3cml0ZV9jcjMgbm93LCBJJ2Qgc3VnZ2VzdCBleHBhbmRpbmcgdGhp
cyBpbiB0aGUgdHdvIHNpdGVzLsKgIEl0IHdpbGwKYWxzbyBtYWtlIGl0IGNsZWFyIHdoaWNoIHJl
Z2lzdGVycyBoYXZlIHJlYWwgdmFsdWVzIGFuZCB3aGljaCBhcmUKdGVtcG9yYXJ5LCB3aGljaCBp
c24ndCBjbGVhciBmcm9tIHRoZSBjdXJyZW50IGNhbGxzaXRlcy4KCk90aGVyd2lzZSwgUmV2aWV3
ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
