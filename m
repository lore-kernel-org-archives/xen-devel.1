From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v19 13/13] x86/domctl: Don't pause the whole
 domain if only getting vcpu state
Date: Mon, 10 Sep 2018 07:35:01 -0600
Message-ID: <5B96730502000078001E6C9D@prv1-mh.provo.novell.com>
References: <20180910123640.496-1-aisaila@bitdefender.com>
 <20180910123640.496-14-aisaila@bitdefender.com>
 <5B9670CF02000078001E6C56@prv1-mh.provo.novell.com>
 <5bba404a350b88914ad27d5da0c3fe8464955928.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5bba404a350b88914ad27d5da0c3fe8464955928.camel@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA5LjE4IGF0IDE1OjI5LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IE9uIE1vbiwgMjAxOC0wOS0xMCBhdCAwNzoyNSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4+ID4gPiA+IE9uIDEwLjA5LjE4IGF0IDE0OjM2LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+
IHdyb3RlOgo+PiA+IAo+PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc2F2ZS5jCj4+ID4gKysr
IGIveGVuL2FyY2gveDg2L2h2bS9zYXZlLmMKPj4gPiBAQCAtMTU1LDYgKzE1NSwxMSBAQCBpbnQg
aHZtX3NhdmVfb25lKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkCj4+ID4gaW50IHR5cGVjb2Rl
LCB1bnNpZ25lZCBpbnQgaW5zdGFuY2UsCj4+ID4gICAgICBpZiAoICFjdHh0LmRhdGEgKQo+PiA+
ICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+PiA+ICAKPj4gPiArICAgIGlmICggaHZtX3NyX2hh
bmRsZXJzW3R5cGVjb2RlXS5raW5kID09IEhWTVNSX1BFUl9WQ1BVICkKPj4gPiArICAgICAgICB2
Y3B1X3BhdXNlKGQtPnZjcHVbaW5zdGFuY2VdKTsKPj4gCj4+IElzIHRoZXJlIGFueSByZWFzb24g
d2h5IHlvdSBkb24ndCB1c2UgdiBoZXJlIGFuZCAuLi4KPiAKPiBUaGVyZSBpcyBub3QgcmVhc29u
IGJ1dCBJIGRpZCBub3Qgd2FudCB0byBtb2RpZnkgdGhlIHJldmlld2VkIHBhdGNoCj4gZnVydGhl
cgoKQnV0IHlvdSBzaG91bGQgKGFuZCBpZiBpbiBkb3VidCBkcm9wIHRoZSBwcmV2aW91c2x5IHN1
cHBsaWVkIHRhZ3MpLApzbyB0aGF0IHRoZSBjb3JyZWxhdGlvbiBvZiB0aGUgYWJvdmUgd2l0aCAu
Li4KCj4+ID4gKyAgICBlbHNlCj4+ID4gKyAgICAgICAgZG9tYWluX3BhdXNlKGQpOwo+PiA+ICsK
Pj4gPiAgICAgIGlmICggKHJ2ID0gaHZtX3NyX2hhbmRsZXJzW3R5cGVjb2RlXS5zYXZlKHYsICZj
dHh0KSkgIT0gMCApCgouLi4gdGhlIGFjdHVhbCBjYWxsIGJlY29tZXMgYXMgY2xlYXIgYXMgcG9z
c2libGUuIE15IFItYiBkb2VzIG5vdCBzdGFuZAp3aXRob3V0IHRoaXMgYWRqdXN0bWVudCwgYnV0
IGl0IGRvZXMgd2l0aCBpdCBpbiBwbGFjZS4gX1Byb3ZpZGVkXyBpdCBpcwpjb3JyZWN0LCBhbmQg
cHJvdmlkZWQgdGhlIG9uZSByZW1haW5pbmcgcGF0Y2ggaXMgbm93IGFsc28gY29ycmVjdCwgSSdk
CmJlIGhhcHB5IHRvIG1ha2UgdGhlIGNoYW5nZSB3aGlsZSBjb21taXR0aW5nLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
