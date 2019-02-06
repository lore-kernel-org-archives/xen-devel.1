From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v5 9/9] common/memory: block
 speculative out-of-bound accesses
Date: Wed, 06 Feb 2019 09:08:01 -0700
Message-ID: <5C5B06610200007800214637@prv1-mh.provo.novell.com>
References: <c755dfdd-3c1e-5ccd-983f-11d0b35bb342@suse.com>
 <1548772997-32742-1-git-send-email-nmanthey@amazon.de>
 <1548772997-32742-10-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <20F3469E02000096B1E090C7@prv1-mh.provo.novell.com>
 <5C5AFC6F020000780021459B@prv1-mh.provo.novell.com>
 <64a6119e-b4c8-ce97-9a0d-de5ba98534b5@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1grPk5-0000Rx-Ji
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 16:08:05 +0000
In-Reply-To: <64a6119e-b4c8-ce97-9a0d-de5ba98534b5@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjAyLjE5IGF0IDE2OjM5LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBP
biAyLzYvMTkgMTY6MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyOS4wMS4xOSBhdCAx
NTo0MywgPG5tYW50aGV5QGFtYXpvbi5kZT4gd3JvdGU6Cj4+PiBAQCAtMzMsMTAgKzM0LDEwIEBA
IHVuc2lnbmVkIGxvbmcgX19yZWFkX21vc3RseSBwZHhfZ3JvdXBfdmFsaWRbQklUU19UT19MT05H
UygKPj4+ICAKPj4+ICBib29sIF9fbWZuX3ZhbGlkKHVuc2lnbmVkIGxvbmcgbWZuKQo+Pj4gIHsK
Pj4+IC0gICAgcmV0dXJuIGxpa2VseShtZm4gPCBtYXhfcGFnZSkgJiYKPj4+IC0gICAgICAgICAg
IGxpa2VseSghKG1mbiAmIHBmbl9ob2xlX21hc2spKSAmJgo+Pj4gLSAgICAgICAgICAgbGlrZWx5
KHRlc3RfYml0KHBmbl90b19wZHgobWZuKSAvIFBEWF9HUk9VUF9DT1VOVCwKPj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICBwZHhfZ3JvdXBfdmFsaWQpKTsKPj4+ICsgICAgcmV0dXJuIGV2
YWx1YXRlX25vc3BlYyhsaWtlbHkobWZuIDwgbWF4X3BhZ2UpICYmCj4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbGlrZWx5KCEobWZuICYgcGZuX2hvbGVfbWFzaykpICYmCj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbGlrZWx5KHRlc3RfYml0KHBmbl90b19wZHgobWZuKSAv
IFBEWF9HUk9VUF9DT1VOVCwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGR4X2dyb3VwX3ZhbGlkKSkpOwo+PiBPdGhlciB0aGFuIGluIHRoZSBxdWVzdGlv
bmFibGUgZ3JhbnQgdGFibGUgY2FzZSwgaGVyZSBJIGFncmVlIHRoYXQKPj4geW91IHdhbnQgdG8g
d3JhcCB0aGUgZW50aXJlIGNvbnN0cnVjdC4gVGhpcyBoYXMgYW4gdW53YW50ZWQgZWZmZWN0Cj4+
IHRob3VnaDogVGhlIHRlc3RfYml0KCkgbWF5IHN0aWxsIGJlIHNwZWN1bGF0ZWQgaW50byB3aXRo
IGFuIG91dC1vZi0KPj4gYm91bmRzIG1mbi4gKEFzIG1lbnRpb25lZCBlbHNld2hlcmUsIG9wZXJh
dGlvbnMgb24gYml0IGFycmF5cyBhcmUKPj4gYW4gb3BlbiBpc3N1ZSBhbHRvZ2V0aGVyLikgSSB0
aGVyZWZvcmUgdGhpbmsgeW91IHdhbnQgdG8gc3BsaXQgdGhpcyBpbnRvCj4+IHR3bzoKPj4KPj4g
Ym9vbCBfX21mbl92YWxpZCh1bnNpZ25lZCBsb25nIG1mbikKPj4gewo+PiAgICAgcmV0dXJuIGxp
a2VseShldmFsdWF0ZV9ub3NwZWMobWZuIDwgbWF4X3BhZ2UpKSAmJgo+PiAgICAgICAgICAgIGV2
YWx1YXRlX25vc3BlYyhsaWtlbHkoIShtZm4gJiBwZm5faG9sZV9tYXNrKSkgJiYKPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbGlrZWx5KHRlc3RfYml0KHBmbl90b19wZHgobWZuKSAvIFBE
WF9HUk9VUF9DT1VOVCwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBkeF9ncm91cF92YWxpZCkpKTsKPj4gfQo+IAo+IEkgY2FuIHNwbGl0IHRoZSBjb2RlLiBI
b3dldmVyLCBJIHdvbmRlciB3aGV0aGVyIHRoZSB0ZXN0X2JpdCBhY2Nlc3Nlcwo+IHNob3VsZCBi
ZSBwcm90ZWN0ZWQgc2VwYXJhdGVseSwgb3IgYWN0dWFsbHkgYXMgcGFydCBvZiB0aGUgdGVzdF9i
aXQKPiBtZXRob2QgdGhlbXNlbHZlcy4gRG8geW91IGhhdmUgYW55IHBsYW5zIHRvIGRvIHRoYXQg
YWxyZWFkeSwgYmVjYXVzZSBpbgo+IHRoYXQgY2FzZSBJIHdvdWxkIG5vdCBoYXZlIHRvIG1vZGlm
eSB0aGUgY29kZS4KCkkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0byBkbyB0aGF0IGluIHRlc3RfYml0
KCkgYW5kIGZyaWVuZHMKdGhlbXNlbHZlcywgYXMgdGhhdCB3b3VsZCBsaWtlbHkgcHJvZHVjZSBt
b3JlIHVubmVjZXNzYXJ5CmNoYW5nZXMgdGhhbiBuZWNlc3Nhcnkgb25lcy4gRXZlbiB0aGUgY2hh
bmdlIGhlcmUKYWxyZWFkeSBsb29rcyB0byBoYXZlIG11Y2ggYmlnZ2VyIGltcGFjdCB0aGFuIHdv
dWxkIGJlCndhbnRlZCwgYXMgaW4gdGhlIGNvbW1vbiBjYXNlIE1GTnMgYXJlbid0IGd1ZXN0IGNv
bnRyb2xsZWQuCklTVFIgdGhhdCBvcmlnaW5hbGx5IHlvdSBoYWQgbW9kaWZpZWQganVzdCBhIHNp
bmdsZSBjYWxsIHNpdGUsCmJ1dCBJIGNhbid0IHNlZW0gdG8gZmluZCB0aGF0IGluIG15IGluYm94
IGFueW1vcmUuIElmIHRoYXQKd2FzIHRoZSBjYXNlLCB3aGF0IGV4YWN0bHkgd2VyZSB0aGUgY3Jp
dGVyaWEgdXBvbiB3aGljaAp5b3UgaGFkIGNob3NlbiB0aGlzIHNvbGUgY2FsbGVyPwoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
