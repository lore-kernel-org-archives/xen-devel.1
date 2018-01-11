From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RFC v1 23/74] x86/entry: Probe for Xen early
 during boot
Date: Thu, 11 Jan 2018 09:43:45 +0000
Message-ID: <20180111094345.cuqnmwpfwwdextc3@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-24-wei.liu2@citrix.com>
 <5A4F8E5D020000780019B627@prv-mh.provo.novell.com>
 <20180110174519.t2bzg5ce6d5ldd6j@citrix.com>
 <5A572694020000780019D8E2@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=nmlq=eg=citrix.com=prvs=542eaf17c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eZZPM-0003Ip-LU
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2018 09:44:24 +0000
Content-Disposition: inline
In-Reply-To: <5A572694020000780019D8E2@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, wei.liu2@citrix.com, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMTEsIDIwMTggYXQgMTI6NTU6NDhBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEwLjAxLjE4IGF0IDE4OjQ1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBGcmksIEphbiAwNSwgMjAxOCBhdCAwNjo0MDoyOUFNIC0wNzAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMDQuMDEuMTggYXQgMTQ6MDUsIDx3ZWkubGl1MkBjaXRy
aXguY29tPiB3cm90ZToKPiA+PiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QuaAo+
ID4+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC5oCj4gPj4gPiBAQCAtMjAsNiAr
MjAsNyBAQAo+ID4+ID4gICNkZWZpbmUgX19YODZfR1VFU1RfSF9fCj4gPj4gPiAgCj4gPj4gPiAg
I2luY2x1ZGUgPGFzbS9ndWVzdC9wdmgtYm9vdC5oPgo+ID4+ID4gKyNpbmNsdWRlIDxhc20vZ3Vl
c3QveGVuLmg+Cj4gPj4gPiAgCj4gPj4gPiAgI2VuZGlmIC8qIF9fWDg2X0dVRVNUX0hfXyAqLwo+
ID4+IAo+ID4+IEknbSBpbmNyZWFzaW5nbHkgY3VyaW91cyB0byB1bmRlcnN0YW5kIHdoYXQgdGhp
cyBoZWFkZXIncyBwdXJwb3NlCj4gPj4gaXMgbWVhbnQgdG8gYmUuIEl0IGxvb2tzIGFzIGlmIHlv
dSBtZWFuIHNvdXJjZSBmaWxlcyB0byBvbmx5IGV2ZXIKPiA+PiBpbmNsdWRlIHRoaXMgb25lLCBi
dXQgd2h5PyBSYXRoZXIgdGhhbiBleHBvc2luZyBldmVyeXRoaW5nIGF0Cj4gPiAKPiA+IFllcyB0
aGVyZSB3aWxsIGJlIGZpbGUgdGhhdCBvbmx5IGluY2x1ZGVzIHRoaXMgaGVhZGVyIC0tIHRoZSBQ
ViBpbiBIVk0KPiA+IHdvcmsgZG9lc24ndCBuZWVkIHRoZSBQVkggYml0cy4KPiAKPiBFaXRoZXIg
SSdtIG5vdCB1bmRlcnN0YW5kaW5nIHlvdXIgcmVwbHkgb3IgeW91IGRpZG4ndCB1bmRlcnN0YW5k
Cj4gbWluZTogSSB3YXMgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhlIHB1cnBvc2Ugb2YgZ3Vlc3Qu
aCBpZiBpdAo+IGNvbnNpc3RzIG9mIG9ubHkgI2luY2x1ZGUtcy4gSW4gc3VjaCBhIGNhc2UsIHdo
eSBjYW4ndCB0aGUgc291cmNlcwo+IG5lZWRpbmcgY2VydGFpbiBiaXRzIHNpbXBseSBpbmNsdWRl
IHRoZSBoZWFkZXJzIHRoZXkgbmVlZCwgaW5zdGVhZAo+IG9mIHRoaXMgY29udGFpbmVyIG9uZT8K
Ckkgc2VlLiBZZXMgdGhpcyBoZWFkZXIgY2FuIGdvIGF3YXkuIFRoaXMgaXMgZ29pbmcgdG8gYmUg
YSBuaWNlLXRvLWhhdmUKaW4gbXkgYm9vaywgaS5lLiBJIHdpbGwgZG8gaXQgbGF0ZXIuCgpXZWku
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
