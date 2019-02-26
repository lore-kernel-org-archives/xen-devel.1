From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3] viridian: fix the
 HvFlushVirtualAddress/List hypercall implementation
Date: Tue, 26 Feb 2019 08:24:51 +0100
Message-ID: <cacaec3b-3093-9b7f-01a9-f3c3dba6c01b@suse.com>
References: <20190214124907.12011-1-paul.durrant@citrix.com>
 <5C656ADD0200007800216B52@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=edRR=RB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gyX6l-0008RI-2m
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 07:24:55 +0000
In-Reply-To: <5C656ADD0200007800216B52@prv1-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDIvMjAxOSAxNDoxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTQuMDIuMTkg
YXQgMTM6NDksIDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vaHZtLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+PiBAQCAt
Mzk2NCwyNiArMzk2NCwyOCBAQCBzdGF0aWMgdm9pZCBodm1fczNfcmVzdW1lKHN0cnVjdCBkb21h
aW4gKmQpCj4+ICAgICAgfQo+PiAgfQo+PiAgCj4+IC1zdGF0aWMgaW50IGh2bW9wX2ZsdXNoX3Rs
Yl9hbGwodm9pZCkKPj4gK2Jvb2wgaHZtX2ZsdXNoX3ZjcHVfdGxiKGJvb2wgKCpmbHVzaF92Y3B1
KSh2b2lkICpjdHh0LCBzdHJ1Y3QgdmNwdSAqdiksCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICB2b2lkICpjdHh0KQo+PiAgewo+PiArICAgIHN0YXRpYyBERUZJTkVfUEVSX0NQVShjcHVtYXNr
X3QsIGZsdXNoX2NwdW1hc2spOwo+PiArICAgIGNwdW1hc2tfdCAqbWFzayA9ICZ0aGlzX2NwdShm
bHVzaF9jcHVtYXNrKTsKPj4gICAgICBzdHJ1Y3QgZG9tYWluICpkID0gY3VycmVudC0+ZG9tYWlu
Owo+PiAgICAgIHN0cnVjdCB2Y3B1ICp2Owo+PiAgCj4+IC0gICAgaWYgKCAhaXNfaHZtX2RvbWFp
bihkKSApCj4+IC0gICAgICAgIHJldHVybiAtRUlOVkFMOwo+PiAtCj4+ICAgICAgLyogQXZvaWQg
ZGVhZGxvY2sgaWYgbW9yZSB0aGFuIG9uZSB2Y3B1IHRyaWVzIHRoaXMgYXQgdGhlIHNhbWUgdGlt
ZS4gKi8KPj4gICAgICBpZiAoICFzcGluX3RyeWxvY2soJmQtPmh5cGVyY2FsbF9kZWFkbG9ja19t
dXRleCkgKQo+PiAtICAgICAgICByZXR1cm4gLUVSRVNUQVJUOwo+PiArICAgICAgICByZXR1cm4g
ZmFsc2U7Cj4+ICAKPj4gICAgICAvKiBQYXVzZSBhbGwgb3RoZXIgdmNwdXMuICovCj4+ICAgICAg
Zm9yX2VhY2hfdmNwdSAoIGQsIHYgKQo+PiAtICAgICAgICBpZiAoIHYgIT0gY3VycmVudCApCj4+
ICsgICAgICAgIGlmICggdiAhPSBjdXJyZW50ICYmIGZsdXNoX3ZjcHUoY3R4dCwgdikgKQo+PiAg
ICAgICAgICAgICAgdmNwdV9wYXVzZV9ub3N5bmModik7Cj4+ICAKPj4gKyAgICBjcHVtYXNrX2Ns
ZWFyKG1hc2spOwo+IAo+IEknZCBwcmVmZXIgaWYgdGhpcyB3YXMgcHVsbGVkIGZ1cnRoZXIgZG93
biBhcyB3ZWxsLCBpbiBwYXJ0aWN1bGFyIG91dHNpZGUgdGhlCj4gbG9ja2VkIHJlZ2lvbi4gV2l0
aCB0aGlzLCB3aGljaCBpcyBlYXN5IGVub3VnaCB0byBkbyB3aGlsZSBjb21taXR0aW5nLAo+IFJl
dmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gQ2MtaW5nIErD
vHJnZW4gaW4gdGhlIGhvcGVzIGZvciBoaXMgUi1hLWIuCgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
