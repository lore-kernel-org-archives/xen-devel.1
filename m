From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v4 03/11] config: introduce
 L1TF_LFENCE option
Date: Thu, 24 Jan 2019 13:21:03 +0100
Message-ID: <ba10bfc1-81ed-7944-9b02-0f05b990676a@amazon.de>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244285-30813-4-git-send-email-nmanthey@amazon.de>
 <2e60f86f-8bf4-43dc-4343-8074667b6f6d@arm.com>
 <5C486E780200007800210705@prv1-mh.provo.novell.com>
 <38cbf2d4-63fb-cafa-7007-cba7fee03786@arm.com>
 <5C487E1B020000780021078C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jkVq=QA=amazon.de=prvs=920ead099=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gme0a-00023N-B6
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 12:21:24 +0000
In-Reply-To: <5C487E1B020000780021078C@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDEvMjMvMTkgMTU6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIzLjAxLjE5IGF0
IDE0OjQ0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiBPbiAyMy8wMS8yMDE5IDEz
OjM5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDIzLjAxLjE5IGF0IDE0OjI0LCA8anVs
aWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+IE9uIDIzLzAxLzIwMTkgMTE6NTEsIE5vcmJl
cnQgTWFudGhleSB3cm90ZToKPj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL25vc3BlYy5oCj4+
Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9ub3NwZWMuaAo+Pj4+PiBAQCAtNjgsMTAgKzY4LDE4
IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBsZmVuY2VfdHJ1ZSh2b2lkKSB7IHJldHVybiB0cnVlOyB9
Cj4+Pj4+ICAgICNlbmRpZgo+Pj4+PiAgICAKPj4+Pj4gICAgLyoKPj4+Pj4gLSAqIHByb3RlY3Qg
ZXZhbHVhdGlvbiBvZiBjb25kaXRpb25hbCB3aXRoIHJlc3BlY3QgdG8gc3BlY3VsYXRpb24KPj4+
Pj4gKyAqIGFsbG93IHRvIHByb3RlY3QgZXZhbHVhdGlvbiBvZiBjb25kaXRpb25hbCB3aXRoIHJl
c3BlY3QgdG8gc3BlY3VsYXRpb24gb24geDg2Cj4+Pj4+ICAgICAqLwo+Pj4+PiAtI2RlZmluZSBl
dmFsdWF0ZV9ub3NwZWMoY29uZGl0aW9uKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+Pj4+PiArI2lmIGRlZmluZWQoQ09ORklHX0wxVEZfTEZFTkNFX05PTkUpIHx8ICFk
ZWZpbmVkKENPTkZJR19YODYpCj4+Pj4+ICsjZGVmaW5lIGV2YWx1YXRlX25vc3BlYyhjb25kaXRp
b24pIChjb25kaXRpb24pCj4+Pj4+ICsjZWxpZiBkZWZpbmVkKENPTkZJR19MMVRGX0xGRU5DRV9C
T1RIKQo+Pj4+PiArI2RlZmluZSBldmFsdWF0ZV9ub3NwZWMoY29uZGl0aW9uKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Pj4+PiAgICAgICAgKCgoY29uZGl0aW9u
KSAmJiBsZmVuY2VfdHJ1ZSgpKSB8fCAhbGZlbmNlX3RydWUoKSkKPj4+Pj4gKyNlbGlmIGRlZmlu
ZWQoQ09ORklHX0wxVEZfTEZFTkNFX1RSVUUpCj4+Pj4+ICsjZGVmaW5lIGV2YWx1YXRlX25vc3Bl
Yyhjb25kaXRpb24pICgoY29uZGl0aW9uKSAmJiBsZmVuY2VfdHJ1ZSgpKQo+Pj4+PiArI2VsaWYg
ZGVmaW5lZChDT05GSUdfTDFURl9MRkVOQ0VfSU5URVJNRURJQVRFKQo+Pj4+PiArI2RlZmluZSBl
dmFsdWF0ZV9ub3NwZWMoY29uZGl0aW9uKSAoeyBib29sIHJlcyA9IChjb25kaXRpb24pOyBybWIo
KTsgcmVzOyB9KQo+Pj4+ICsjZW5kaWYKPj4+Pgo+Pj4+IE5vbmUgb2YgdGhlIGNvbmZpZ3MgYXJl
IGRlZmluZWQgb24gQXJtLCBzbyBjYW4gdGhpcyBiZSBtb3ZlZCBpbiBhcmNoLXg4Nj8KPj4+IFRv
IGJlIGhvbmVzdCBJJ2QgbGlrZSB0byBhdm9pZCBpbnRyb2R1Y2luZyBhc20vbm9zcGVjLmggZm9y
IHRoZSB0aW1lCj4+PiBiZWluZy4KPj4gSG93IGFib3V0IGFkZGluZyB0aGVtIGluIHN5c3RlbS5o
IGFzIHdlIGRpZCBmb3IgYXJyYXlfaW5kZXhfbWFza19ub3NwZWM/Cj4gVG8gdGVsbCB5b3UgdGhl
IHRydXRoLCB0aGF0J3Mgd2hlcmUgTm9yYmVydCBoYWQgaXQgb3JpZ2luYWxseS4KPiBJIHRoaW5r
IHRoYXQncyBub3QgdGhlIHJpZ2h0IHBsYWNlIHRob3VnaCAoYWxzbyBmb3IKPiBhcnJheV9pbmRl
eF9tYXNrX25vc3BlYygpKS4gQnV0IEknbGwgbGlzdGVuIHRvIGEgbWFqb3JpdHkKPiB0aGlua2lu
ZyBkaWZmZXJlbnRseSwgYXQgbGVhc3QgYXMgZmFyIGFzIHdoYXQgaXMgY3VycmVudGx5Cj4gbGZl
bmNlX3RydWUoKSBnb2VzLiBldmFsdWF0ZV9ub3NwZWMoKSwgb3RvaCwgYmVsb25ncyB3aGVyZQo+
IGl0IGlzIG5vdywgSSB0aGluay4KCkkgd2lsbCByZW5hbWUgdGhlIGxmZW5jZV90cnVlIG1hY3Jv
IGludG8gImFyY2hfYmFycmllcl9ub3NwZWNfdHJ1ZSIuCkZ1cnRoZXJtb3JlLCBJIHdpbGwgbWVy
Z2UgdGhlIGludHJvZHVjdGlvbiBvZiB0aGUgbWFjcm9zIHdpdGggdGhlCmludHJvZHVjdGlvbiBv
ZiB0aGUgY29uZmlndXJhdGlvbiBhbmQgdGhlIGFsdGVybmF0aXZlIHBhdGNoaW5nLiBGaW5hbGx5
LApJJ2xsIHJldXNlIHRoZSBhcmNoX2JhcnJpZXJfbm9zcGVjX3RydWUgaW1wbGVtZW50YXRpb24g
aW4gdGhlCmV2YWx1YXRlX25vc3BlYyBtYWNyby4KCkJlc3QsCk5vcmJlcnQKCj4KPiBKYW4KPgo+
CgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4
CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFs
ZiBIZXJicmljaApVc3QtSUQ6IERFIDI4OSAyMzcgODc5CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJp
Y2h0IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
