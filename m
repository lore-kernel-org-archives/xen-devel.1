From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 2/5] vpci: fix deferral of long operations
Date: Mon, 19 Nov 2018 01:27:15 -0700
Message-ID: <5BF273E302000078001FD2C0@prv1-mh.provo.novell.com>
References: <20181114115740.1050-1-roger.pau@citrix.com>
 <20181114115740.1050-3-roger.pau@citrix.com>
 <5BEEB3FB02000078001FCBBB@prv1-mh.provo.novell.com>
 <20181116145742.5zy5dwo2elogzq6q@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nnqu=n6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gOett-0004ni-B3
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 08:27:21 +0000
In-Reply-To: <20181116145742.5zy5dwo2elogzq6q@mac>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjExLjE4IGF0IDE1OjU3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgTm92IDE2LCAyMDE4IGF0IDA1OjExOjM5QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTQuMTEuMTggYXQgMTI6NTcsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gQEAgLTE4Miw2ICsxODUsNyBAQCBzdGF0aWMgdm9pZCBkZWZlcl9tYXAoc3Ry
dWN0IGRvbWFpbiAqZCwgc3RydWN0IHBjaV9kZXYgKnBkZXYsCj4+ID4gICAgICBjdXJyLT52cGNp
Lm1lbSA9IG1lbTsKPj4gPiAgICAgIGN1cnItPnZwY2kuY21kID0gY21kOwo+PiA+ICAgICAgY3Vy
ci0+dnBjaS5yb21fb25seSA9IHJvbV9vbmx5Owo+PiA+ICsgICAgcmFpc2Vfc29mdGlycShTQ0hF
RFVMRV9TT0ZUSVJRKTsKPj4gPiAgfQo+PiAKPj4gV2h5IGlzIHRoaXMgbmVlZGVkPyBUaGUgZGVz
Y3JpcHRpb24gZG9lc24ndCBtZW50aW9uIGl0Lgo+IAo+IHZQQ0kgbmVlZHMgdG8gcmFpc2UgYSBz
aGNlZHVsZXIgc29mdGlycSBpbiBvcmRlciB0byBwcmV2ZW50IHRoZSBndWVzdAo+IGZyb20gcmVz
dW1pbmcgZXhlY3V0aW9uIGFmdGVyIGRlZmVycmluZyBhIG1hcC91bm1hcCBvcGVyYXRpb24uIFdp
dGhvdXQKPiB0aGlzIHRoZSBndWVzdCBtaWdodCBqdXN0IHJlc3VtZSBleGVjdXRpb24gd2hpbGUg
aGF2aW5nIHBlbmRpbmcgd29yawo+IGlmIHRoZXJlJ3Mgbm8gc2NoZWR1bGVyIHNvZnRpcnEgYWxy
ZWFkeSBwZW5kaW5nLgoKQWggeWVzLCBidXQgcGxlYXNlIGFnYWluIGF0dGFjaCBhIGJyaWVmIGNv
bW1lbnQgdG8gY2xhcmlmeSB0aGlzLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
