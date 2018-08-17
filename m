From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 2/8] iommu: introduce dom0-iommu option
Date: Fri, 17 Aug 2018 03:52:28 -0600
Message-ID: <5B769ADC02000078001DF4D5@prv1-mh.provo.novell.com>
References: <20180814134336.75539-1-roger.pau@citrix.com>
 <20180814134336.75539-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ndfk=la=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fqbQj-0002Jg-Us
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 09:52:29 +0000
In-Reply-To: <20180814134336.75539-3-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjA4LjE4IGF0IDE1OjQzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLm1hcmtkb3duCj4gKysrIGIvZG9jcy9t
aXNjL3hlbi1jb21tYW5kLWxpbmUubWFya2Rvd24KPiBAQCAtNjgxLDYgKzY4MSwxOSBAQCBGbGFn
IHRoYXQgbWFrZXMgYSBkb20wIGJvb3QgaW4gUFZIdjIgbW9kZS4KPiAgRmxhZyB0aGF0IG1ha2Vz
IGEgZG9tMCB1c2Ugc2hhZG93IHBhZ2luZy4gT25seSB3b3JrcyB3aGVuICJwdmgiIGlzCj4gIGVu
YWJsZWQuCj4gIAo+ICsjIyMgZG9tMC1pb21tdQo+ICs+IGA9IExpc3Qgb2YgWyBwYXNzdGhyb3Vn
aCB8IHN0cmljdCBdYAo+ICsKPiArVGhpcyBsaXN0IG9mIGJvb2xlYW5zIGNvbnRyb2wgdGhlIGlv
bW11IHVzYWdlIGJ5IERvbTA6CgouLi4gY29udHJvbHMgLi4uCgo+ICsqIGBwYXNzdGhyb3VnaGA6
IGRpc2FibGVzIERNQSByZW1hcHBpbmcgZm9yIERvbTAuIERlZmF1bHQgaXMgYGZhbHNlYC4KCk1p
bmQgYWxzbyBzdGF0aW5nIHRoYXQgdGhpcyBtdXN0IG5vdCBiZSBlbmFibGVkIGZvciBQVkggRG9t
MD8gT3IKcGVyaGFwcyAuLi4KCj4gKyogYHN0cmljdGA6IHNldHMgdXAgRE1BIHJlbWFwcGluZyBv
bmx5IGZvciB0aGUgUkFNIERvbTAgYWN0dWFsbHkgZ290IGFzc2lnbmVkLgo+ICsgIERlZmF1bHQg
aXMgYGZhbHNlYCB3aGljaCBtZWFucyBEb20wIHdpbGwgZ2V0IG1hcHBpbmdzIGZvciBhbGwgdGhl
IGhvc3QKPiArICBSQU0gZXhjZXB0IHJlZ2lvbnMgaW4gdXNlIGJ5IFhlbi4gTm90ZSB0aGF0IHRo
aXMgb3B0aW9uIGlzIGhhcmQgY29kZWQgdG8KPiArICBgdHJ1ZWAgZm9yIGEgUFZIIERvbTAgYW5k
IGFueSBhdHRlbXB0IHRvIG92ZXJ3cml0ZSBpdCBmcm9tIHRoZSBjb21tYW5kIGxpbmUKPiArICBp
cyBpZ25vcmVkLgoKLi4uIGl0IGNvdWxkIGJlIG1hZGUgYWN0IGxpa2UgdGhpcywgaWdub3Jpbmcg
dGhlIHJlcXVlc3QgaW5zdGVhZCBvZgpwYW5pYygpaW5nPwoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
