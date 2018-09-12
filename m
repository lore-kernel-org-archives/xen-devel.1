From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 08/14] vtd: add lookup_page method to
 iommu_ops
Date: Wed, 12 Sep 2018 03:21:13 -0600
Message-ID: <5B98DA8902000078001E7B4E@prv1-mh.provo.novell.com>
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
 <82baab81955d48ae9a2c50b964c2ca34@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mhj0=l2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g01Kp-000243-Hj
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 09:21:19 +0000
In-Reply-To: <82baab81955d48ae9a2c50b964c2ca34@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, george.dunlap@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjA5LjE4IGF0IDExOjE1LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMTIgU2VwdGVtYmVyIDIwMTggMTA6MTMK
Pj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4+IENjOiBHZW9y
Z2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBLZXZpbiBUaWFuCj4+IDxrZXZp
bi50aWFuQGludGVsLmNvbT47IHhlbi1kZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnPgo+PiBTdWJqZWN0OiBSRTogW1BBVENIIHY2IDA4LzE0XSB2dGQ6IGFkZCBsb29rdXBfcGFn
ZSBtZXRob2QgdG8gaW9tbXVfb3BzCj4+IAo+PiA+Pj4gT24gMTIuMDkuMTggYXQgMTE6MDUsIDxQ
YXVsLkR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4+IEZyb206IEphbiBCZXVsaWNoIFtt
YWlsdG86SkJldWxpY2hAc3VzZS5jb21dCj4+ID4+IFNlbnQ6IDEyIFNlcHRlbWJlciAyMDE4IDEw
OjAzCj4+ID4+Cj4+ID4+IEEgSFZNIGd1ZXN0IHVzaW5nIHRoZSBQViBJT01NVSBpcyBxdWl0ZSBm
aW5lLCBidXQgaXQgc2hvdWxkbid0IHRhbGsgdG8KPj4gPj4gaXQgaW4gdGVybXMgb2YgTUZOcy4K
Pj4gPj4KPj4gPgo+PiA+IFdlbGwsIGl0IGhhcyB0byB0YWxrIE1GTnMgYXQgc29tZSBsZXZlbCwg
c3VyZWx5PyBUaGUgb3V0cHV0IG9mIHRoZSBJT01NVSBpcwo+PiA+IG5vdCBzdWJqZWN0IHRvIEVQ
VC9OUFQsIHJpZ2h0Pwo+PiAKPj4gWWVzIHRvIHRoZSBzZWNvbmQgcXVlc3Rpb24sIGJ1dCBubyB0
byB0aGUgZmlyc3Q6IFRoZSBHRk4gLT4gTUZOIHRyYW5zbGF0aW9uCj4+IHNob3VsZCBzdGlsbCBi
ZSBkb25lIGluc2lkZSBYZW4gaW4gdGhlIEhWTSBjYXNlLCBpbW8gKGluIHRoZSBjb3Vyc2Ugb2YK
Pj4gbWFudWZhY3R1cmluZyB0aGUgUFRFKS4KPiAKPiBJbmRlZWQuIFRoaXMgZnVuY3Rpb24gaXMg
dmVyeSBtdWNoIGludGVybmFsIHRvIFhlbiAoaXQncyBzaW1wbHkgYW4gCj4gYWJzdHJhY3Rpb24g
b24gdG9wIG9mIGEgdmVuZG9yIGltcGxlbWVudGF0aW9uKSwgc28gd2h5IHNob3VsZCBpdCBub3Qg
d29yayBpbiAKPiB0ZXJtcyBvZiBNRk5zPwoKQmVjYXVzZSAiTUZOIiBpcyBhIGNvbmNlcHQgYSBI
Vk0gZ3Vlc3QgaXMgbm90IGtub3dpbmcgYWJvdXQsIG9yCnN1cHBvc2VkIHRvIGJlIGtub3dpbmcu
IFRoZSBvbmx5IHRpbWUgd2hlcmUgKHBhcnQgb2YpIGl0IG1pZ2h0CmxlZ2l0aW1hdGVseSAoaGF2
ZSB0bykga25vdyBpcyB3aGVuIGl0IGNvbWVzIHRvIG1hbmFnaW5nIHRoZSBob3N0CihpbmNsdWRp
bmcgYW55IGd1ZXN0cyksIGkuZS4gaW4gdGhlIHRvb2wgc3RhY2sgb2YgYSBQVkggRG9tMC4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
