From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/4] x86/passthrough: put the x86 folder
 under x86 maintainership
Date: Mon, 07 Jan 2019 05:46:52 -0700
Message-ID: <5C334A3C020000780020ADB5@prv1-mh.provo.novell.com>
References: <20190104103329.35741-1-roger.pau@citrix.com>
 <20190104103329.35741-4-roger.pau@citrix.com>
 <5C33213A020000780020AB9C@prv1-mh.provo.novell.com>
 <20190107121418.z3d6sl4btioayas4@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yoBP=PP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ggUJ3-0000S6-Sf
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 12:47:01 +0000
In-Reply-To: <20190107121418.z3d6sl4btioayas4@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAxLjE5IGF0IDEzOjE0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgSmFuIDA3LCAyMDE5IGF0IDAyOjUxOjU0QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDQuMDEuMTkgYXQgMTE6MzMsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gcGFzc3Rocm91Z2gveDg2IGlzIHRpZWQgdG8gdGhlIHg4NiBjb2RlLCBhbmQg
YXMgc3VjaCBwdXQgaXQgdW5kZXIgeDg2Cj4+ID4gbWFpbnRhaW5lcnNoaXAuCj4+IAo+PiBJdCBp
cyB0aWVkIHRvIGJvdGgsIHNvIGF0IHRoZSB2ZXJ5IGxlYXN0IEkgb2JqZWN0IHRvIC4uLgo+PiAK
Pj4gPiAtLS0gYS9NQUlOVEFJTkVSUwo+PiA+ICsrKyBiL01BSU5UQUlORVJTCj4+ID4gQEAgLTI1
Nyw2ICsyNTcsNyBAQCBGOgl4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC8KPj4gPiAgWDoJeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kLwo+PiA+ICBYOgl4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
cm0vCj4+ID4gIFg6CXhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC8KPj4gPiArWDoJeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gveDg2Lwo+PiAKPj4gLi4uIHRoaXM7IHRoZSBBcm0gZW50cnkgaGVy
ZSBpcyBxdWVzdGlvbmFibGUgdG9vLCBpbW8uCj4+IAo+PiA+IEBAIC00NDUsNiArNDQ2LDcgQEAg
UjoJUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+ID4gIFM6CVN1cHBv
cnRlZAo+PiA+ICBMOgl4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcgCj4+ID4gIEY6CXhl
bi9hcmNoL3g4Ni8KPj4gPiArRjoJeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2Lwo+PiAKPj4g
VGhpcyBvbmUncyBkZWJhdGFibGUuCj4gCj4gU28geW91IHdvdWxkIGFncmVlIHRvIGFkZGluZyB4
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvIHVuZGVyIHg4Ngo+IG1haW50YWluZXJzaGlwIGFz
IGxvbmcgYXMgaXQncyBhbHNvIGxlZnQgdW5kZXIgdGhlIGdlbmVyaWMgSU9NTVUKPiBzdXBwb3J0
IGVudHJ5PwoKIkFncmVlIiBnb2VzIHRvIGZhcjsgSSB0aGluayB0aGlzIGlzIHdvcnRoIGNvbnNp
ZGVyaW5nLiBJJ20gYWxzbyBub3QKb3Bwb3NlZCB0byBsZWF2aW5nIHRoaW5ncyBhcyB0aGV5IGFy
ZS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
