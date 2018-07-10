From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen/x86: fix linker script to work with lld
Date: Tue, 10 Jul 2018 15:49:54 +0200
Message-ID: <20180710134954.twd2cs6hhdfqumkq@mac.bytemobile.com>
References: <20180628153809.50172-1-roger.pau@citrix.com>
 <5B35C51C02000078001350BF@prv1-mh.provo.novell.com>
 <20180703160227.GF4670@olila.local.net-space.pl>
 <5B3C7E0602000078001D0DDC@prv1-mh.provo.novell.com>
 <20180704104900.GI4670@olila.local.net-space.pl>
 <20180705074757.s4ztvfm56crljopt@mac.bytemobile.com>
 <20180706134839.GJ26572@olila.local.net-space.pl>
 <20180709164516.3n5ht4qq5kjhp3mh@mac.bytemobile.com>
 <20180710110052.GY26572@olila.local.net-space.pl>
 <5B449CC702000078001D2A03@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vod0=j2=citrix.com=prvs=722e3bda8=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fct1o-0007Nm-4o
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 13:50:04 +0000
Content-Disposition: inline
In-Reply-To: <5B449CC702000078001D2A03@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMTAsIDIwMTggYXQgMDU6NDc6MTlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEwLjA3LjE4IGF0IDEzOjAwLCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+
IHdyb3RlOgo+ID4gT24gTW9uLCBKdWwgMDksIDIwMTggYXQgMDY6NDU6MTZQTSArMDIwMCwgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+PiBTb3JyeSBmb3IgYXNraW5nIHNvIG1hbnkgcXVlc3Rp
b25zLCBidXQgSSB3b3VsZCBsaWtlIHRvIHRyeSB0byBhdm9pZAo+ID4+IHRoZSBERUZJTkVEIGNv
bmRpdGlvbmFsIGluIHRoZSBsaW5rZXIgc2NyaXB0IGlmIHBvc3NpYmxlLgo+ID4gCj4gPiBJZiB5
b3Ugd2lzaCB0byBkbyB0aGF0IHRoZW4gcHV0IGR1bW15IGVmaSBzeW1ib2wgaW50byAKPiA+IHhl
bi9hcmNoL3g4Ni9lZmkvc3R1Yi5jLgo+IAo+IEkgdGhpbmsgSSd2ZSBjbGVhcmx5IG9iamVjdGVk
IHRvIHRoYXQgYmVmb3JlIC0gSSBzaW1wbHkgc2VlIG5vIG5lZWQgZm9yCj4gd2FzdGluZyB0aGUg
c3BhY2UgaW4gYW4gRUZJLWluY2FwYWJsZSBiaW5hcnkuCgpCdXQgc3VjaCB3YXN0ZSBpcyBhbHNv
IGFkZGVkIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciB5b3UgZGVmaW5lIHRoZQpzeW1ib2wgaXQgaW4g
dGhlIGxpbmtlciBzY3JpcHQgb3IgaW4gYSBDIGZpbGU/CgpUaGFuaywgUm9nZXIuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
