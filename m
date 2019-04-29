From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
Date: Mon, 29 Apr 2019 10:14:48 -0600
Message-ID: <5CC722F8020000780022A22C@prv1-mh.provo.novell.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <5CC711DC020000780022A111@prv1-mh.provo.novell.com>
 <CABfawhnxZA5+FXj5uRb59sJ9RGm71uC0MHv4=J5PGfejXiX2qg@mail.gmail.com>
 <4b3607ed-5596-496b-f6a6-19548703b773@citrix.com>
 <CABfawhk4AnVBMTssrqsDr7e9FB2GSiCn9iE13L5=sBKhQdiEeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL8vd-0004Pv-2I
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 16:14:53 +0000
In-Reply-To: <CABfawhk4AnVBMTssrqsDr7e9FB2GSiCn9iE13L5=sBKhQdiEeQ@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA0LjE5IGF0IDE4OjA1LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgOTo1MiBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBJIGhhdmVuJ3QgcmUtZ3Jva2tlZCB0aGUgY29kZSBo
ZXJlLCBidXQgYXNzdW1pbmcgSSB3YXMgY29ycmVjdCAyIHdlZWtzCj4+IGFnbywgaWYgeW91IGhh
dmUgdGhlIEJVR19PTigpIHRoZXJlLCB5b3UgY2FuIGdldCByaWQgb2YgdGhlIGV4dHJhCj4+IHJl
ZmVyZW5jZXMuCj4gCj4gU3VyZSwgYnV0IGFnYWluLCB0aGUgb3ZlcmhlYWQgb2YgaGF2aW5nIHRo
ZW0gaW4tcGxhY2UgaXMgbmVnbGlnaWJsZSBzbwo+IG1pZ2h0IGFzIHdlbGwganVzdCBrZWVwIGl0
LgoKVGhlIG92ZXJoZWFkIGlzIG9ubHkgb25lIGFzcGVjdCBoZXJlLiBQZW9wbGUgbG9va2luZyBh
dCB0aGUgY29kZQptYXkgYWxzbyBiZSBtaXNsZWFkIGludG8gdHJ5aW5nIHRvIGZpZ3VyZSBvdXQg
d2h5IHRoZSBoZWNrIHRoaXMKZXh0cmEgcmVmZXJlbmNlIGdldHMgb2J0YWluZWQuIFBsdXMgc3Vi
LW9wdGltYWwgY29kZSB0ZW5kcyB0byBnZXQKY2xvbmVkIC4uLgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
