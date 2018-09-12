From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v6 08/14] vtd: add lookup_page method to
 iommu_ops
Date: Wed, 12 Sep 2018 09:15:56 +0000
Message-ID: <82baab81955d48ae9a2c50b964c2ca34@AMSPEX02CL03.citrite.net>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-9-paul.durrant@citrix.com>
 <5B925CC402000078001E6538@prv1-mh.provo.novell.com>
 <f341403b1c684f6a82ec85905599178e@AMSPEX02CL03.citrite.net>
 <5B98D1B702000078001E7A8F@prv1-mh.provo.novell.com>
 <77f7af1c0daf48c9ab66bbd77cc022ec@AMSPEX02CL03.citrite.net>
 <2c79d7d0775c4cbe8dc7577ab6b08e74@AMSPEX02CL03.citrite.net>
 <22882dd60fc847728f96b2d4b9c0a9d3@AMSPEX02CL03.citrite.net>
 <5B98D65E02000078001E7ACF@prv1-mh.provo.novell.com>
 <7ad76f0c35584cf08adcffaf1fe5bba4@AMSPEX02CL03.citrite.net>
 <5B98D89A02000078001E7B14@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ifft=l2=citrix.com=prvs=7869af71c=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1g01Ff-0000uG-RO
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 09:15:59 +0000
In-Reply-To: <5B98D89A02000078001E7B14@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, George Dunlap <George.Dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTIgU2VwdGVtYmVyIDIwMTggMTA6MTMKPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogR2VvcmdlIER1bmxh
cCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgS2V2aW4gVGlhbgo+IDxrZXZpbi50aWFuQGlu
dGVsLmNvbT47IHhlbi1kZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPgo+IFN1
YmplY3Q6IFJFOiBbUEFUQ0ggdjYgMDgvMTRdIHZ0ZDogYWRkIGxvb2t1cF9wYWdlIG1ldGhvZCB0
byBpb21tdV9vcHMKPiAKPiA+Pj4gT24gMTIuMDkuMTggYXQgMTE6MDUsIDxQYXVsLkR1cnJhbnRA
Y2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4gRnJvbTogSmFuIEJldWxpY2ggW21haWx0bzpKQmV1bGlj
aEBzdXNlLmNvbV0KPiA+PiBTZW50OiAxMiBTZXB0ZW1iZXIgMjAxOCAxMDowMwo+ID4+Cj4gPj4g
QSBIVk0gZ3Vlc3QgdXNpbmcgdGhlIFBWIElPTU1VIGlzIHF1aXRlIGZpbmUsIGJ1dCBpdCBzaG91
bGRuJ3QgdGFsayB0bwo+ID4+IGl0IGluIHRlcm1zIG9mIE1GTnMuCj4gPj4KPiA+Cj4gPiBXZWxs
LCBpdCBoYXMgdG8gdGFsayBNRk5zIGF0IHNvbWUgbGV2ZWwsIHN1cmVseT8gVGhlIG91dHB1dCBv
ZiB0aGUgSU9NTVUgaXMKPiA+IG5vdCBzdWJqZWN0IHRvIEVQVC9OUFQsIHJpZ2h0Pwo+IAo+IFll
cyB0byB0aGUgc2Vjb25kIHF1ZXN0aW9uLCBidXQgbm8gdG8gdGhlIGZpcnN0OiBUaGUgR0ZOIC0+
IE1GTiB0cmFuc2xhdGlvbgo+IHNob3VsZCBzdGlsbCBiZSBkb25lIGluc2lkZSBYZW4gaW4gdGhl
IEhWTSBjYXNlLCBpbW8gKGluIHRoZSBjb3Vyc2Ugb2YKPiBtYW51ZmFjdHVyaW5nIHRoZSBQVEUp
LgoKSW5kZWVkLiBUaGlzIGZ1bmN0aW9uIGlzIHZlcnkgbXVjaCBpbnRlcm5hbCB0byBYZW4gKGl0
J3Mgc2ltcGx5IGFuIGFic3RyYWN0aW9uIG9uIHRvcCBvZiBhIHZlbmRvciBpbXBsZW1lbnRhdGlv
biksIHNvIHdoeSBzaG91bGQgaXQgbm90IHdvcmsgaW4gdGVybXMgb2YgTUZOcz8gVGhlcmUncyBu
byBoeXBlcmNhbGwgdGhhdCBhbGxvd3MgdGhpcyB0byBiZSBibGluZGx5IGNhbGxlZCBieSBhbiBI
Vk0gZ3Vlc3QuCgogIFBhdWwKCj4gCj4gSmFuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
