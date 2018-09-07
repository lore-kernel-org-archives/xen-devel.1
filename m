From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 15/16] x86/pvshim: disable HVM for PV shim
Date: Fri, 7 Sep 2018 08:48:37 +0100
Message-ID: <20180907074837.mr5bxwjds3zy7rks@zion.uk.xensource.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
 <20180904161533.11575-16-wei.liu2@citrix.com>
 <5B92265C02000078001E62B1@prv1-mh.provo.novell.com>
 <20180907074634.qny2aazswjnrb4zy@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=c06c=lv=citrix.com=prvs=7819b22f9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fyBVf-0006s4-GQ
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 07:48:55 +0000
Content-Disposition: inline
In-Reply-To: <20180907074634.qny2aazswjnrb4zy@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMDcsIDIwMTggYXQgMDg6NDY6MzRBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBGcmksIFNlcCAwNywgMjAxOCBhdCAwMToxODo1MkFNIC0wNjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPiA+ID4+PiBPbiAwNC4wOS4xOCBhdCAxODoxNSwgPHdlaS5saXUyQGNpdHJpeC5jb20+
IHdyb3RlOgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
Pgo+ID4gPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Cj4gPiAKPiA+IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgbWVyZ2VkIGludG8gdGhlIHByZXZp
b3VzIHBhdGNoLCBubyBtYXR0ZXIgd2hhdAo+ID4gdGhlIGZpbmFsIHJlc29sdXRpb24gdGhlcmUg
aXMsIGFzIGV2ZW4gd2l0aCB0aGUgY2hhbmdlIG9mIGRlZmF1bHQgdGhlCj4gPiBhZGp1c3RtZW50
IGhlcmUgc2hvdWxkIGhhcHBlbi4gT3RvaCBSb2dlcidzICJwdnNoaW06IGludHJvZHVjZSBhIFBW
Cj4gPiBzaGltIGRlZmNvbmZpZyIgc2hvdWxkIGVsaW1pbmF0ZSB0aGUgbmVlZCBmb3IgdGhpcyBj
aGFuZ2UgYWx0b2dldGhlci4KPiAKPiBJIHRoaW5rIEkgd2lsbCBzdGlsbCBuZWVkIHRvIHBhdGNo
IHRoYXQgbmV3IGZpbGUgYXQgc29tZSBwb2ludCBiZWNhdXNlCj4gaXQgaGFzIENPTkZJR19QVj15
LCBidXQgdGhhdCBjYW4gYmUgZG9uZSBlYXNpbHkuICBJIHdpbGwgZm9sZCB0aGF0IGludG8KPiB0
aGUgcHJldmlvdXMgcGF0Y2ggaW4gbmV4dCBpdGVyYXRpb24uCgpNeSBiYWQuIElnbm9yZSB0aGlz
LiBOb3QgZW5vdWdoIGNhZmZlaW5lIGluIHRoZSBtb3JuaW5nLgoKVGhpcyBwYXRjaCBjYW4gYmUg
ZHJvcHBlZC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
