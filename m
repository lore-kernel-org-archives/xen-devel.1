From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.11] x86/dom0: add extra RAM regions as
 RESERVED for PVH memory map
Date: Thu, 3 May 2018 13:59:01 +0100
Message-ID: <20180503125901.kncgdpgbrqwaxnf7@MacBook-Pro-de-Roger.local>
References: <20180503095640.58090-1-roger.pau@citrix.com>
 <5AEAF69302000078001C06D0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=61fa=hw=citrix.com=prvs=654947d1e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fEDpI-0003ip-Cu
 for xen-devel@lists.xenproject.org; Thu, 03 May 2018 12:59:12 +0000
Content-Disposition: inline
In-Reply-To: <5AEAF69302000078001C06D0@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMDMsIDIwMTggYXQgMDU6NDY6MjdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDAzLjA1LjE4IGF0IDExOjU2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gV2hlbiBydW5uaW5nIGFzIFBWSCBEb20wIHRoZSBuYXRpdmUgbWVtb3J5IG1hcCBp
cyB1c2VkIGluIG9yZGVyIHRvCj4gPiBjcmFmdCBhIHRhaWxvcmVkIG1lbW9yeSBtYXAgZm9yIERv
bTAgdGFraW5nIGludG8gYWNjb3VudCBpdCdzIG1lbW9yeQo+ID4gbGltaXQuCj4gPiAKPiA+IERv
bTAgbWVtb3J5IGlzIGFsd2F5cyBnb2luZyB0byBiZSBzbWFsbGVyIHRoYW4gdGhlIHRvdGFsIGFt
b3VudAo+ID4gb2YgbWVtb3J5IHByZXNlbnQgb24gdGhlIGhvc3QsIHNvIGluIG9yZGVyIHRvIHBy
ZXZlbnQgRG9tMCBmcm9tCj4gPiByZWxvY2F0aW5nIFBDSSBCQVJzIG92ZXIgUkFNIHJlZ2lvbnMg
bWFyayBhbGwgdGhlIFJBTSByZWdpb25zIG5vdAo+ID4gYXZhaWxhYmxlIHRvIERvbTAgYXMgUkVT
RVJWRUQgaW4gdGhlIG1lbW9yeSBtYXAuCj4gCj4gSSdtIGJhc2ljYWxseSBmaW5lIHdpdGggdGhp
cyBjaGFuZ2UsIGJ1dCBJIHRoaW5rIEknZCBwcmVmZXIgVU5VU0FCTEUgb3Zlcgo+IFJFU0VSVkVE
LgoKT0ssIEkndmUgbG9va2VkIGF0IHRoZSBkZWZpbml0aW9ucyBmcm9tIHRoZSBBQ1BJIHNwZWMg
YW5kIEkgdGhpbmsgYm90aAphcmUgc3VpdGFibGUgaW4gb3JkZXIgdG8gYWNjb21wbGlzaCB0aGUg
Z29hbC4gU28gSSdtIGZpbmUgd2l0aCBzZW5kaW5nCmEgdjIgd2l0aCBVTlVTQUJMRSBpbnN0ZWFk
IG9mIFJFU0VSVkVELgoKPiA+IEkgYWxzbyB0aGluayB0aGlzIHNob3VsZCBiZSBpbmNsdWRlZCBp
biB0aGUgNC4xMSByZWxlYXNlIGJlY2F1c2UgaXQKPiA+IG9ubHkgbW9kaWZpZXMgUFZIIERvbTAg
YnVpbGRlciBjb2RlLCBhbmQgdGhhdCdzIHN0aWxsIGV4cGVyaW1lbnRhbCwgc28KPiA+IHRoZXJl
J3Mgbm8gY2hhbmNlIG9mIGJyZWFraW5nIGEgc3VwcG9ydGVkIGZlYXR1cmUuCj4gCj4gVGhpcyBj
YW4gZXF1YWxseSBiZSB0YWtlbiBhcyBhIHJlYXNvbiB3aHkgdGhlcmUncyBubyBwb2ludCBpbiBp
dCBiZWluZwo+IHB1dCBpbiBmb3IgNC4xMS4gQnV0IHRoYXQncyBub3QgdG8gc2F5IEknbSBvcHBv
c2VkIHRvIGRvaW5nIHNvLCBpdCdzIGp1c3QKPiB0aGF0IEkgY29uc2lkZXIgdGhlIGFyZ3VtZW50
IHF1ZXN0aW9uYWJsZS4KCldlbGwsIGl0ICptaWdodCogbWFrZSBhIERvbTAgUFZIIHdvcmsgaW4g
Y2FzZXMgaXQgd291bGRuJ3QsIGJ1dCBzaW5jZQppdCdzIGV4cGVyaW1lbnRhbCBhbnlvbmUgcGxh
eWluZyB3aXRoIFBWSCBEb20wIHNob3VsZCBwcm9iYWJseSBiZQp1c2luZyBzdGFnaW5nIGFscmVh
ZHkuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
