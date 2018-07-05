From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 3/6] libxc: allow HVM guest to have
 modules
Date: Thu, 5 Jul 2018 11:51:06 +0100
Message-ID: <20180705105106.w5u3ejwyphmfp6f4@citrix.com>
References: <20180626111334.9251-1-wei.liu2@citrix.com>
 <20180626111334.9251-4-wei.liu2@citrix.com>
 <23357.62229.523334.147604@mariner.uk.xensource.com>
 <20180705103427.hhulatb3ndr42yid@citrix.com>
 <23357.63002.633261.79972@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rzas=jv=citrix.com=prvs=717a9f9c1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fb1qw-0006gL-Fd
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 10:51:10 +0000
Content-Disposition: inline
In-Reply-To: <23357.63002.633261.79972@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdWwgMDUsIDIwMTggYXQgMTE6NDI6MzRBTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIIHYzIDMvNl0gbGlieGM6IGFsbG93IEhW
TSBndWVzdCB0byBoYXZlIG1vZHVsZXMiKToKPiA+IE9uIFRodSwgSnVsIDA1LCAyMDE4IGF0IDEx
OjI5OjQxQU0gKzAxMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gPiBBSVVJIHlvdSBtZWFuIHNv
bWV0aGluZyBtb3JlIGxpa2UKPiA+ID4gCj4gPiA+ICAgTm93IHRoZSBjb2RlIG5lZWRzIHRvIGhh
bmRsZSB2aXJ0X2Jhc2UgYmVpbmcgVU5TRVRfQUREUiwgd2hpY2ggaXQgaXMKPiA+ID4gICBmb3Ig
SFZNIGd1ZXN0cy4gIEluIHRoYXQgY2FzZSBzZWcudnN0YXJ0IGlzIGludGVycHJldGVkIGJ5ID8/
Pwo+ID4gPiAgIGFzIGFuID8/PyBvZmZzZXQgZnJvbSB6ZXJvID8/Pwo+ID4gCj4gPiBOb3cgdGhl
IGNvZGUgbmVlZHMgdG8gaGFuZGxlIHZpcnRfYmFzZSBiZWluZyBVTlNFVF9BRERSLCB3aGljaCBp
dCBpcyBmb3IKPiA+IEhWTSBndWVzdC4gSW4gY2FzZSBQVkggYW5kIFBWLCB2aXJ0X2Jhc2UgaXMg
c2V0IGJ5IHRoZSByZXNwZWN0aXZlIGxvYWRlcgo+ID4gYnkgcGFyc2luZyB0aGUgYmluYXJ5Lgo+
IAo+IFRoYXQgZG9lc24ndCBleHBsYWluIGhvdyB0aGUgbmVjZXNzYXJ5IHZhbHVlIG9mIHNlZy52
c3RhcnQgY2FuIGJlCj4gY2FsY3VsYXRlZCB3aXRob3V0IG5lZWRpbmcgdG8ga25vdyB0aGUgbm90
LXlldC1jYWxjdWxhdGVkIHZhbHVlIG9mCj4gdmlydF9iYXNlLgoKdmlydF9iYXNlIHNob3VsZCBh
bHJlYWR5IGJlIGNhbGN1bGF0ZWQgYXQgdGhpcyBwb2ludC4gSXQgaXMgZWl0aGVyIHNldApvciBu
b3QuIFRoZXJlIGlzIHBvc3NpYmlsaXR5IGZvciBzZXR0aW5nIDAgYXQgc29tZSBwb2ludCBidXQg
aXQgZG9lc24ndApjaGFuZ2UgaG93IHdlIGludGVycHJldCBVTlNFVF9BRERSLgoKV2VpLgoKPiAK
PiBUaGFua3MsCj4gSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
