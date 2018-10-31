From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 07/16] x86: put XEN_DOMCTL_{set,
 get}_address_size under CONFIG_PV
Date: Wed, 31 Oct 2018 03:47:25 -0600
Message-ID: <5BD97A2D02000078001F6A79@prv1-mh.provo.novell.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <d87454cedf90ee1bd7ff0e0d05f3b4a910b93ddd.1539959287.git-series.wei.liu2@citrix.com>
 <5BD718F702000078001F5D92@prv1-mh.provo.novell.com>
 <20181030205002.3m7x7ybp5ojaiph6@zion.uk.xensource.com>
 <5BD96F2102000078001F6A1F@prv1-mh.provo.novell.com>
 <20181031093325.se44yqhnijn3svfp@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nwhd=nl=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gHn61-0005ek-T3
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 09:47:29 +0000
In-Reply-To: <20181031093325.se44yqhnijn3svfp@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjEwLjE4IGF0IDEwOjMzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gV2VkLCBPY3QgMzEsIDIwMTggYXQgMDM6MDA6MTdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAzMC4xMC4xOCBhdCAyMTo1MCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IE9uIE1vbiwgT2N0IDI5LCAyMDE4IGF0IDA4OjI4OjA3QU0gLTA2MDAsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+PiA+PiA+Pj4gT24gMTkuMTAuMTggYXQgMTY6MjgsIDx3ZWkubGl1MkBj
aXRyaXguY29tPiB3cm90ZToKPj4gPj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tY3RsLmMKPj4g
Pj4gPiArKysgYi94ZW4vYXJjaC94ODYvZG9tY3RsLmMKPj4gPj4gPiBAQCAtNjA4LDYgKzYwOCw3
IEBAIGxvbmcgYXJjaF9kb19kb21jdGwoCj4+ID4+ID4gICAgICAgICAgICAgIGNvcHliYWNrID0g
dHJ1ZTsKPj4gPj4gPiAgICAgICAgICBicmVhazsKPj4gPj4gPiAgCj4+ID4+ID4gKyNpZmRlZiBD
T05GSUdfUFYKPj4gPj4gPiAgICAgIGNhc2UgWEVOX0RPTUNUTF9zZXRfYWRkcmVzc19zaXplOgo+
PiA+PiA+ICAgICAgICAgIGlmICggKChkb21jdGwtPnUuYWRkcmVzc19zaXplLnNpemUgPT0gNjQp
ICYmICFkLT5hcmNoLmlzXzMyYml0X3B2KSB8fAo+PiA+PiA+ICAgICAgICAgICAgICAgKChkb21j
dGwtPnUuYWRkcmVzc19zaXplLnNpemUgPT0gMzIpICYmIGQtPmFyY2guaXNfMzJiaXRfcHYpICkK
Pj4gPj4gPiBAQCAtNjIzLDYgKzYyNCw3IEBAIGxvbmcgYXJjaF9kb19kb21jdGwoCj4+ID4+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgCj4+ID4+ID4gQklUU19QRVJfTE9ORzsKPj4gPj4gPiAgICAgICAgICBjb3B5YmFjayA9
IHRydWU7Cj4+ID4+ID4gICAgICAgICAgYnJlYWs7Cj4+ID4+ID4gKyNlbmRpZgo+PiA+PiAKPj4g
Pj4gLi4uIGFkZCBzdWNoIGEgY2hlY2sgc28gdGhhdCBzaW1pbGFyIGJlaGF2aW9yIHdpbGwgcmVz
dWx0IHdpdGggUFYKPj4gPj4gZW5hYmxlZCBhbmQgZGlzYWJsZWQgKGVycm9yIGNvZGVzIG1heSBk
aWZmZXIsIGJ1dCBzdWNjZXNzIHZzCj4+ID4+IGVycm9yIG91Z2h0IHRvIG1hdGNoKS4KPj4gPiAK
Pj4gPiBJIGRvbid0IGZvbGxvdy4gRG8geW91IG1lYW4gYWRkaW5nIGlzX3B2X2RvbWFpbiBjaGVj
ayBzb21ld2hlcmU/Cj4+IAo+PiBZZXMuIE90aGVyd2lzZSBiZWhhdmlvciBkaWZmZXJzIGJldHdl
ZW4gYSBQViBhbmQgYSAhUFYgaHlwZXJ2aXNvci4KPiAKPiBJJ20gc3RpbGwgYXQgYSBsb3NzIHRv
IGZpZ3VyZSBvdXQgd2hhdCAic2ltaWxhciBiZWhhdmlvciIgeW91IHdhbnQuIFdoZW4KPiB5b3Ug
c2F5IGJlaGF2aW91ciBkaWZmZXJzLCBkbyB5b3UgbWVhbiB0aGUgbGFjayBvZiBjb3B5YmFjayBp
biBteSBwYXRjaD8KPiBXaHkgd291bGQgdGhhdCBiZSByZWxldmFudCB0byBhIEVOT1NZUyBoeXBl
cmNhbGw/CgpXaXRoICFQViB5b3UnZCBnZXQgLUVOT1NZUyAod2hpY2ggaXMgd3JvbmcgaW4gaXRz
IG93biByaWdodCwgYnV0CnRoYXQgYSBkaWZmZXJlbnQgdG9waWMpLiBXaXRoIFBWIHlvdSdkIG5v
dCBnZXQgYW55IGVycm9yIHVuZGVyIGF0CmxlYXN0IHNvbWUgY29uZGl0aW9ucyBldmVuIGZvciBh
IEhWTSBkb21haW4gKGlmIHlvdSBkb24ndCBtYWtlIGl0CmludG8gc3dpdGNoX2NvbXBhdCgpKSwg
YWZhaWN0LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
