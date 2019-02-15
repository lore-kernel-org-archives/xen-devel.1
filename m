From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v6 3/9] x86/hvm: block
 speculative out-of-bound accesses
Date: Fri, 15 Feb 2019 09:05:13 +0100
Message-ID: <b31ae117-9a5f-3260-bb9f-b7208da40bc7@amazon.de>
References: <1c2b8322-1b66-ccc6-9ba9-e86eafb0227a@amazon.de>
 <1549633489-12724-1-git-send-email-nmanthey@amazon.de>
 <1549633489-12724-4-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0101E7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C532AC00200007800212EA2@prv1-mh.provo.novell.com>
 <A18FF6C80200006BB1E090C7@prv1-mh.provo.novell.com>
 <01CCAAAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <01CE6AAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <5C62C9600200007800215EA7@prv1-mh.provo.novell.com>
 <64fdf4b6-69be-d262-b4e4-1dd0d424a777@amazon.de>
 <5C62D4CC0200007800215F79@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/T2h=QW=amazon.de=prvs=942e4f81c=nmanthey@srs-us1.protection.inumbo.net>)
 id 1guYV6-0000NN-GW
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 08:05:36 +0000
In-Reply-To: <5C62D4CC0200007800215F79@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xMi8xOSAxNToxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTIuMDIuMTkgYXQg
MTU6MDUsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+PiBPbiAyLzEyLzE5IDE0OjI1LCBK
YW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDA4LjAyLjE5IGF0IDE0OjQ0LCA8bm1hbnRoZXlA
YW1hem9uLmRlPiB3cm90ZToKPj4+PiBAQCAtNDEwNCw2ICs0MTA4LDEyIEBAIHN0YXRpYyBpbnQg
aHZtb3Bfc2V0X3BhcmFtKAo+Pj4+ICAgICAgaWYgKCBhLmluZGV4ID49IEhWTV9OUl9QQVJBTVMg
KQo+Pj4+ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4+ICAKPj4+PiArICAgIC8qCj4+Pj4g
KyAgICAgKiBNYWtlIHN1cmUgdGhlIGd1ZXN0IGNvbnRyb2xsZWQgdmFsdWUgYS5pbmRleCBpcyBi
b3VuZGVkIGV2ZW4gZHVyaW5nCj4+Pj4gKyAgICAgKiBzcGVjdWxhdGl2ZSBleGVjdXRpb24uCj4+
Pj4gKyAgICAgKi8KPj4+PiArICAgIGEuaW5kZXggPSBhcnJheV9pbmRleF9ub3NwZWMoYS5pbmRl
eCwgSFZNX05SX1BBUkFNUyk7Cj4+Pj4gKwo+Pj4+ICAgICAgZCA9IHJjdV9sb2NrX2RvbWFpbl9i
eV9hbnlfaWQoYS5kb21pZCk7Cj4+Pj4gICAgICBpZiAoIGQgPT0gTlVMTCApCj4+Pj4gICAgICAg
ICAgcmV0dXJuIC1FU1JDSDsKPj4+PiBAQCAtNDM3MCw2ICs0MzgwLDEyIEBAIHN0YXRpYyBpbnQg
aHZtb3BfZ2V0X3BhcmFtKAo+Pj4+ICAgICAgaWYgKCBhLmluZGV4ID49IEhWTV9OUl9QQVJBTVMg
KQo+Pj4+ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4+ICAKPj4+PiArICAgIC8qCj4+Pj4g
KyAgICAgKiBNYWtlIHN1cmUgdGhlIGd1ZXN0IGNvbnRyb2xsZWQgdmFsdWUgYS5pbmRleCBpcyBi
b3VuZGVkIGV2ZW4gZHVyaW5nCj4+Pj4gKyAgICAgKiBzcGVjdWxhdGl2ZSBleGVjdXRpb24uCj4+
Pj4gKyAgICAgKi8KPj4+PiArICAgIGEuaW5kZXggPSBhcnJheV9pbmRleF9ub3NwZWMoYS5pbmRl
eCwgSFZNX05SX1BBUkFNUyk7Cj4+PiAuLi4gdGhlIHVzZWZ1bG5lc3Mgb2YgdGhlc2UgdHdvLiBU
byBtYWtlIGZvcndhcmQgcHJvZ3Jlc3MgaXQgbWF5Cj4+PiBiZSB3b3J0aHdoaWxlIHRvIHNwbGl0
IG9mZiB0aGVzZSB0d28gY2hhbmdlcyBpbnRvIGEgc2VwYXJhdGUgcGF0Y2guCj4+PiBJZiB5b3Un
cmUgZmluZSB3aXRoIHRoaXMsIEkgY291bGQgc3RyaXAgdGhlc2UgdHdvIGJlZm9yZSBjb21taXR0
aW5nLAo+Pj4gaW4gd2hpY2ggY2FzZSB0aGUgcmVtYWluaW5nIGNoYW5nZSBpcwo+Pj4gUmV2aWV3
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gVGFraW5nIGFwYXJ0IHRo
ZSBjb21taXQgaXMgZmluZSB3aXRoIG1lLiBJIHdpbGwgc3VibWl0IGEgZm9sbG93IHVwCj4+IGNo
YW5nZSB0aGF0IGRvZXMgbm90IHVwZGF0ZSB0aGUgdmFsdWVzIGJ1dCBmaXhlcyB0aGUgcmVhZHMu
Cj4gQXMgcG9pbnRlZCBvdXQgZHVyaW5nIHRoZSB2NSBkaXNjdXNzaW9uLCBJJ20gdW5jb252aW5j
ZWQgdGhhdCBpZgo+IHlvdSBkbyBzbyB0aGUgY29tcGlsZXIgY2FuJ3QgcmUtaW50cm9kdWNlIHRo
ZSBpc3N1ZSB2aWEgQ1NFLiBJJ2QKPiByZWFsbHkgbGlrZSBhIHJlbGlhYmxlIHNvbHV0aW9uIHRv
IGJlIGRldGVybWluZWQgZmlyc3QuCgpJIGNhbm5vdCBnaXZlIGEgZ3VhcmFudGVlIHdoYXQgZnV0
dXJlIGNvbXBpbGVycyBtaWdodCBkby4gRnVydGhlcm1vcmUsIEkKZG8gbm90IHdhbnQgdG8gd2Fp
dCB1bnRpbCBhbGwvbW9zdCBjb21waWxlcnMgc2hpcCB3aXRoIHN1Y2ggYQpjb250cm9sbGFibGUg
Z3VhcmFudGVlLiBXaGlsZSBJIHdvdWxkIGxvdmUgdG8gaGF2ZSBhIHJlbGlhYmxlIHNvbHV0aW9u
CmFzIHdlbGwsIEknZCBnbyB3aXRoIHdoYXQgd2UgY2FuIGRvIHRvZGF5IGZvciBub3csIGFuZCBy
ZS1pdGVyYXRlIG9uY2UKd2UgaGF2ZSBzb21ldGhpbmcgbW9yZSBzdGFibGUuCgpCZXN0LApOb3Ji
ZXJ0Cgo+Cj4gSmFuCj4KPgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21i
SApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENocmlzdGlh
biBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKVXN0LUlEOiBERSAyODkgMjM3IDg3OQpFaW5nZXRy
YWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
