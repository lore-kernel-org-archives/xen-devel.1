From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-next RFC 0/4] tools: Python 3
 compatibility
Date: Wed, 6 Mar 2019 14:25:28 +0000
Message-ID: <20190306142528.jyux4a4zwonc6qk2@zion.uk.xensource.com>
References: <20190305164206.6793-1-wei.liu2@citrix.com>
 <350c989b-dcec-906f-9364-20b0a8e409e0@citrix.com>
 <bbe5c5b7-f82b-e011-cb30-3d66fb13093c@citrix.com>
 <20190306135755.pmvr456e3di6s377@zion.uk.xensource.com>
 <20190306141731.GC2300@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ECHp=RJ=citrix.com=prvs=9619a384d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h1XUH-0000qn-2K
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 14:25:37 +0000
Content-Disposition: inline
In-Reply-To: <20190306141731.GC2300@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMDYsIDIwMTkgYXQgMDI6MTc6MzFQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gV2VkLCBNYXIgMDYsIDIwMTkgYXQgMDE6NTc6NTVQTSArMDAwMCwgV2VpIExp
dSB3cm90ZToKPiA+IE9uIFdlZCwgTWFyIDA2LCAyMDE5IGF0IDAxOjUzOjAxUE0gKzAwMDAsIEdl
b3JnZSBEdW5sYXAgd3JvdGU6Cj4gPiA+IE9uIDMvNi8xOSAxOjQ5IFBNLCBHZW9yZ2UgRHVubGFw
IHdyb3RlOgo+ID4gPiA+IE9uIDMvNS8xOSA0OjQyIFBNLCBXZWkgTGl1IHdyb3RlOgo+ID4gPiA+
PiBUaGlzIHNlcmllcyBtYWtlcyB0b29scyBidWlsZCB3aXRoIFB5dGhvbiAzLgo+ID4gPiA+Pgo+
ID4gPiA+PiBDb21waWxlIHRlc3Qgb25seSB3aXRoIDIuNyBhbmQgMy41IHRodXMgZmFyLCBoZW5j
ZSB0aGUgUkZDLiBUaGlzIHNob3VsZCBiZSBhYmxlCj4gPiA+ID4+IHRvIGdpdmUgcGVvcGxlIHNv
bWUgaWRlYSB3aGF0IHNvcnQgb2Ygd29yayBpcyBpbnZvbHZlZC4KPiA+ID4gPj4KPiA+ID4gPj4g
WW91IHdpbGwgYWxzbyBuZWVkIEFuZHJldydzICJ0b29scy94ZW4tZm9yZWlnbjogVXBkYXRlIHB5
dGhvbiBzY3JpcHRzIHRvIGJlCj4gPiA+ID4+IFB5MyBjb21wYXRpYmxlIi4KPiA+ID4gPiAKPiA+
ID4gPiBUb3NzaW5nIHRoaXMgb3V0IHRoZXJlOiBHaXZlbiB0aGF0IHB5dGhvbjIgaXMgKHRoZW9y
ZXRpY2FsbHkpIEVPTCBpbgo+ID4gPiA+IGxlc3MgdGhhbiBhIHllYXIsIGlzIGl0IHdvcnRoIG1h
aW50YWluaW5nIGNvbXBhdGliaWxpdHkgd2l0aCBweXRob24yLCBvcgo+ID4gPiA+IHdvdWxkIGl0
IGJlIGJldHRlciB0byBqdXN0IGdvIHdob2xlLWhvZyBpbnRvIHB5dGhvbjM/Cj4gPiA+IAo+ID4g
PiBJIG1lYW4gLS0gbG9va2luZyBhdCBzb21lIG9mIHRoZSBkaXNjdXNzaW9ucyBhYm91dCBob3cg
ZGlmZmVyZW50bHkKPiA+ID4gY2VydGFpbiBraW5kcyBvZiB0aGluZ3MgYXJlIGludGVycHJldGVk
IGJldHdlZW4gcHl0aG9uMiBhbmQgcHl0aG9uMywgaXQKPiA+ID4gc2VlbXMgYSBiaXQgbWFkIHRv
IHRyeSB0byB3cml0ZSBjb2RlIHRoYXQgd29ya3MgaW4gYm90aDogd2UncmUganVzdAo+ID4gPiBh
c2tpbmcgZm9yIHRyb3VibGUuCj4gPiAKPiA+IEkgdGhpbmsgUHl0aG9uIGlzIG5vdCB2ZXJ5IGNv
bnNpc3RlbnQgZXZlbiB3aXRoaW4gYSBtYWpvciB2ZXJzaW9uLiBOZXcKPiA+IHN5bnRheCBhbmQg
Y29uc3RydWN0cyBnZXQgYWRkZWQgdG8gcG9pbnQgcmVsZWFzZXMuIFNvbWUgb2YgdGhlCj4gPiBk
aXNjdXNzaW9ucyByZSBjb2RlIGlzbid0IGFib3V0IHRoZSBkaWZmZXJlbmNlcyBiZXR3ZWVuIDIg
YW5kIDMuICBUaGVyZQo+ID4gaXMgYXQgbGVhc3Qgb25lIGFib3V0IDIuNCB2cyAyLjcuCj4gCj4g
SSB0aGluayBpdCdzIGJlY2F1c2UgdGhleSBiYWNrcG9ydCBzeW50YXggY2hhbmdlcyBmcm9tIDMu
WCB0byAyLjYgYW5kCj4gMi43LiBBbHNvIGFsbCB0aGUgX2Z1dHVyZV9YIGltcG9ydHMuIEFsbCBv
ZiB0aGF0IG1ha2VzIGl0IGVhc2llciB0byBoYXZlCj4gc2NyaXB0cyBjb21wYXRpYmxlIHdpdGgg
Ym90aCAyLjcgYW5kIDMuWC4KPiAKPiA+IEkgYW0gYWxsIGZvciBtb3ZpbmcgYXdheSBmcm9tIDIu
NC4KPiAKPiBNb3ZpbmcgdG8gYSBtaW4gb2YgMi42IHdvdWxkIGJlIG5pY2UuIENlbnRPUyA2IGNv
bWVzIGl0LgoKTXkgbmV4dCB2ZXJzaW9uIHdpbGwgaGF2ZSBhIHBhdGNoIHRvIGRvIHRoYXQuIEFu
eSBvYmplY3Rpb24/CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
