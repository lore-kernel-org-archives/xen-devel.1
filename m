From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: Meltdown band-aid against malicious
 64-bit PV guests
Date: Tue, 16 Jan 2018 00:12:47 -0700
Message-ID: <5A5DB3FF020000780019EF15@prv-mh.provo.novell.com>
References: <5A5899CA020000780019E014@prv-mh.provo.novell.com>
 <9BA6D188-B18A-4782-A5D4-AADC38FA731C@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=n0uv=el=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ebLQT-0007nz-8C
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 07:12:53 +0000
In-Reply-To: <9BA6D188-B18A-4782-A5D4-AADC38FA731C@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Rich Persaud <persaur@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, security@xenproject.org, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAxLjE4IGF0IDE3OjU0LCA8cGVyc2F1ckBnbWFpbC5jb20+IHdyb3RlOgo+IE9u
IEphbiAxMiwgMjAxOCwgYXQgMDU6MTksIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4g
d3JvdGU6Cj4+IAo+PiBUaGlzIGlzIGEgdmVyeSBzaW1wbGlzdGljIGNoYW5nZSBsaW1pdGluZyB0
aGUgYW1vdW50IG9mIG1lbW9yeSBhIHJ1bm5pbmcKPj4gNjQtYml0IFBWIGd1ZXN0IGhhcyBtYXBw
ZWQgKGFuZCBoZW5jZSBhdmFpbGFibGUgZm9yIGF0dGFja2luZyk6IE9ubHkgdGhlCj4+IG1hcHBp
bmdzIG9mIHN0YWNrLCBJRFQsIGFuZCBUU1MgYXJlIGJlaW5nIGNsb25lZCBmcm9tIHRoZSBkaXJl
Y3QgbWFwCj4+IGludG8gcGVyLUNQVSBwYWdlIHRhYmxlcy4gR3Vlc3QgY29udHJvbGxlZCBwYXJ0
cyBvZiB0aGUgcGFnZSB0YWJsZXMgYXJlCj4+IGJlaW5nIGNvcGllZCBpbnRvIHRob3NlIHBlci1D
UFUgcGFnZSB0YWJsZXMgdXBvbiBlbnRyeSBpbnRvIHRoZSBndWVzdC4KPj4gQ3Jvc3MtdkNQVSBz
eW5jaHJvbml6YXRpb24gb2YgdG9wIGxldmVsIHBhZ2UgdGFibGUgZW50cnkgY2hhbmdlcyBpcwo+
PiBiZWluZyBlZmZlY3RlZCBieSBmb3JjaW5nIG90aGVyIGFjdGl2ZSB2Q1BVLXMgb2YgdGhlIGd1
ZXN0IGludG8gdGhlCj4+IGh5cGVydmlzb3IuCj4+IAo+PiBUaGUgY2hhbmdlIHRvIGNvbnRleHRf
c3dpdGNoKCkgaXNuJ3Qgc3RyaWN0bHkgbmVjZXNzYXJ5LCBidXQgdGhlcmUncyBubwo+PiByZWFz
b24gdG8ga2VlcCBzd2l0Y2hpbmcgcGFnZSB0YWJsZXMgb25jZSBhIFBWIGd1ZXN0IGlzIGJlaW5n
IHNjaGVkdWxlZAo+PiBvdXQuCj4+IAo+PiBUaGVyZSBpcyBjZXJ0YWlubHkgbXVjaCByb29tIGZv
ciBpbXByb3ZlbWVudCwgZXNwZWNpYWxseSBvZiBwZXJmb3JtYW5jZSwKPj4gaGVyZSAtIGZpcnN0
IGFuZCBmb3JlbW9zdCBzdXBwcmVzc2luZyBhbGwgdGhlIG5lZ2F0aXZlIGVmZmVjdHMgb24gQU1E
Cj4+IHN5c3RlbXMuIEJ1dCBpbiB0aGUgaW50ZXJlc3Qgb2YgYmFja3BvcnRhYmlsaXR5IChpbmNs
dWRpbmcgdG8gcmVhbGx5IG9sZAo+PiBoeXBlcnZpc29ycywgd2hpY2ggbWF5IG5vdCBldmVuIGhh
dmUgYWx0ZXJuYXRpdmUgcGF0Y2hpbmcpIGFueSBzdWNoIGlzCj4+IGJlaW5nIGxlZnQgb3V0IGhl
cmUuCj4gCj4gVGhhbmtzIGZvciByZWxlYXNpbmcgdGhpcyBwYXRjaCB0byBzdXBwb3J0IHVzZSBj
YXNlcyBub3QgY292ZXJlZCBieSB0aGUgCj4gcHJldmlvdXMgbWl0aWdhdGlvbnMuICBJcyB0aGVy
ZSBhIG5hbWUgb3IgYWNyb255bSB3ZSBjYW4gdXNlIHRvIHJlZmVyZW5jZSAKPiB0aGlzIHBhdGNo
IGluIHRoZSBGQVEsIFhTQSBhbmQgb3RoZXIgc3VwcG9ydCBkb2N1bWVudHM/CgpJJ20gYWdhaW5z
dCBhbnkgc3VjaCBuYW1pbmcsIGJ1dCBYUFRJLWxpZ2h0IHdvdWxkIGNvbWUgdG8gbWluZC4KCkph
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
