From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 04/14] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Tue, 15 Jan 2019 05:42:16 -0700
Message-ID: <5C3DD528020000780020DD3A@prv1-mh.provo.novell.com>
References: <1547544466-21135-1-git-send-email-christopher.w.clark@gmail.com>
 <1547544466-21135-5-git-send-email-christopher.w.clark@gmail.com>
 <20190115122947.gnhxdr3x7se6tiat@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gjO4p-0008V6-9A
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 12:44:19 +0000
In-Reply-To: <20190115122947.gnhxdr3x7se6tiat@mac>
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAxLjE5IGF0IDEzOjI5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgSmFuIDE1LCAyMDE5IGF0IDAxOjI3OjM2QU0gLTA4MDAsIENocmlzdG9waGVyIENs
YXJrIHdyb3RlOgo+PiAgbG9uZwo+PiAgZG9fYXJnb19vcCh1bnNpZ25lZCBpbnQgY21kLCBYRU5f
R1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZzEsCj4+ICAgICAgICAgICAgIFhFTl9HVUVTVF9I
QU5ETEVfUEFSQU0odm9pZCkgYXJnMiwgdW5zaWduZWQgbG9uZyBhcmczLAo+PiAgICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIGFyZzQpCj4+ICB7Cj4+IC0gICAgcmV0dXJuIC1FTk9TWVM7Cj4+ICsg
ICAgbG9uZyByYyA9IC1FRkFVTFQ7Cj4+ICsKPj4gKyAgICBhcmdvX2RwcmludGsoIi0+ZG9fYXJn
b19vcCgldSwlcCwlcCwlbHUsMHglbHgpXG4iLCBjbWQsCj4+ICsgICAgICAgICAgICAgICAgICh2
b2lkICopYXJnMS5wLCAodm9pZCAqKWFyZzIucCwgYXJnMywgYXJnNCk7Cj4+ICsKPj4gKyAgICBp
ZiAoIHVubGlrZWx5KCFvcHRfYXJnb19lbmFibGVkKSApCj4+ICsgICAgICAgIHJldHVybiAtRU9Q
Tk9UU1VQUDsKPiAKPiBJIHRoaW5rIHRoaXMgc2hvdWxkIHJldHVybiAtRU5PU1lTLCBhbiBoeXBl
cnZpc29yIGJ1aWx0IHdpdGgKPiBDT05GSUdfQVJHTyBidXQgd2l0aG91dCBhcmdvIGVuYWJsZWQg
b24gdGhlIGNvbW1hbmQgbGluZSBzaG91bGRuJ3QKPiBiZWhhdmUgZGlmZmVyZW50bHkgdGhhbiBh
biBoeXBlcnZpc29yIGJ1aWxkIHdpdGhvdXQgQ09ORklHX0FSR08uCgpXZSd2ZSBiZWVuIHRoZXJl
IGJlZm9yZSwgYW5kIHRoZXJlIGFwcGVhcnMgdG8gYmUgZGlzYWdyZWVtZW50LgpJIHN1cHBvcnQg
dGhlIHVzZSBvZiAtRU9QTk9UU1VQUCBoZXJlLgoKPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3Nj
aGVkLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKPj4gQEAgLTQ5MCw2ICs0OTAs
MTEgQEAgc3RydWN0IGRvbWFpbgo+PiAgICAgICAgICB1bnNpZ25lZCBpbnQgZ3Vlc3RfcmVxdWVz
dF9lbmFibGVkICAgICAgIDogMTsKPj4gICAgICAgICAgdW5zaWduZWQgaW50IGd1ZXN0X3JlcXVl
c3Rfc3luYyAgICAgICAgICA6IDE7Cj4+ICAgICAgfSBtb25pdG9yOwo+PiArCj4+ICsjaWZkZWYg
Q09ORklHX0FSR08KPj4gKyAgICAvKiBBcmdvIGludGVyZG9tYWluIGNvbW11bmljYXRpb24gc3Vw
cG9ydCAqLwo+PiArICAgIHN0cnVjdCBhcmdvX2RvbWFpbiAqYXJnbzsKPiAKPiBJJ20gbGlrZWx5
IG1pc3Npbmcgc29tZXRoaW5nLCBidXQgYXJnb19kb21haW4gaXMgZGVjbGFyZWQgaW4gYXJnby5j
LAo+IGRvbid0IHlvdSBuZWVkIGEgZm9yd2FyZCBkZWNsYXJhdGlvbiBoZXJlIGZvciB0aGlzIHRv
IGJ1aWxkPwoKVGhhdCB3b3VsZCBiZSBuZWVkZWQgaW4gQysrIChpaXJjKSwgYnV0IG5vdCBpbiBD
LCB3aGVyZSBzdWNoCmZvcndhcmQgZGVjbGFyYXRpb25zIGFyZSBuZWVkZWQgc29sZWx5IHdoZW4g
dGhlIHR5cGUgaXMgdXNlZAphcyBhIGZ1bmN0aW9uIHBhcmFtZXRlciwgYXMgb3RoZXJ3aXNlIHRo
YXQgcGFyYW1ldGVyJ3MgdHlwZQplbmRzIHVwIGhhdmluZyBzY29wZSBsb2NhbCB0byB0aGUgZGVj
bGFyZWQgZnVuY3Rpb24uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
