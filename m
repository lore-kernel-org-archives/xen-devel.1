From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 23/74] x86/entry: Probe for Xen early
 during boot
Date: Thu, 11 Jan 2018 00:55:48 -0700
Message-ID: <5A572694020000780019D8E2@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-24-wei.liu2@citrix.com>
 <5A4F8E5D020000780019B627@prv-mh.provo.novell.com>
 <20180110174519.t2bzg5ce6d5ldd6j@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=phpx=eg=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eZXiP-0001U3-G7
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2018 07:55:57 +0000
In-Reply-To: <20180110174519.t2bzg5ce6d5ldd6j@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: wei.liu2@citrix.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjAxLjE4IGF0IDE4OjQ1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBKYW4gMDUsIDIwMTggYXQgMDY6NDA6MjlBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAwNC4wMS4xOCBhdCAxNDowNSwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QuaAo+PiA+ICsrKyBiL3hl
bi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QuaAo+PiA+IEBAIC0yMCw2ICsyMCw3IEBACj4+ID4gICNk
ZWZpbmUgX19YODZfR1VFU1RfSF9fCj4+ID4gIAo+PiA+ICAjaW5jbHVkZSA8YXNtL2d1ZXN0L3B2
aC1ib290Lmg+Cj4+ID4gKyNpbmNsdWRlIDxhc20vZ3Vlc3QveGVuLmg+Cj4+ID4gIAo+PiA+ICAj
ZW5kaWYgLyogX19YODZfR1VFU1RfSF9fICovCj4+IAo+PiBJJ20gaW5jcmVhc2luZ2x5IGN1cmlv
dXMgdG8gdW5kZXJzdGFuZCB3aGF0IHRoaXMgaGVhZGVyJ3MgcHVycG9zZQo+PiBpcyBtZWFudCB0
byBiZS4gSXQgbG9va3MgYXMgaWYgeW91IG1lYW4gc291cmNlIGZpbGVzIHRvIG9ubHkgZXZlcgo+
PiBpbmNsdWRlIHRoaXMgb25lLCBidXQgd2h5PyBSYXRoZXIgdGhhbiBleHBvc2luZyBldmVyeXRo
aW5nIGF0Cj4gCj4gWWVzIHRoZXJlIHdpbGwgYmUgZmlsZSB0aGF0IG9ubHkgaW5jbHVkZXMgdGhp
cyBoZWFkZXIgLS0gdGhlIFBWIGluIEhWTQo+IHdvcmsgZG9lc24ndCBuZWVkIHRoZSBQVkggYml0
cy4KCkVpdGhlciBJJ20gbm90IHVuZGVyc3RhbmRpbmcgeW91ciByZXBseSBvciB5b3UgZGlkbid0
IHVuZGVyc3RhbmQKbWluZTogSSB3YXMgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhlIHB1cnBvc2Ug
b2YgZ3Vlc3QuaCBpZiBpdApjb25zaXN0cyBvZiBvbmx5ICNpbmNsdWRlLXMuIEluIHN1Y2ggYSBj
YXNlLCB3aHkgY2FuJ3QgdGhlIHNvdXJjZXMKbmVlZGluZyBjZXJ0YWluIGJpdHMgc2ltcGx5IGlu
Y2x1ZGUgdGhlIGhlYWRlcnMgdGhleSBuZWVkLCBpbnN0ZWFkCm9mIHRoaXMgY29udGFpbmVyIG9u
ZT8KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
