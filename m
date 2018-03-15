From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 09/11] vpci/msi: add MSI handlers
Date: Thu, 15 Mar 2018 10:19:10 -0600
Message-ID: <5AAAAB0E02000078001B2501@prv-mh.provo.novell.com>
References: <20180314140408.40947-1-roger.pau@citrix.com>
 <20180314140408.40947-10-roger.pau@citrix.com>
 <5AA9610B02000078001B1AFD@prv-mh.provo.novell.com>
 <20180315114817.kenim6hpnqjdbuzp@MacBook-Pro-de-Roger.local>
 <5AAA78AD02000078001B21F2@prv-mh.provo.novell.com>
 <20180315155440.v3gr65t376x4kfde@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ovtz=gf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewVb1-00036F-3P
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 16:19:15 +0000
In-Reply-To: <20180315155440.v3gr65t376x4kfde@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE4IGF0IDE2OjU0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgTWFyIDE1LCAyMDE4IGF0IDA2OjQ0OjEzQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTUuMDMuMTggYXQgMTI6NDgsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMTA6NTE6MDdBTSAtMDYwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+ID4+PiBPbiAxNC4wMy4xOCBhdCAxNTowNCwgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPj4gPj4gPiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2ku
Ywo+PiA+PiA+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCj4+ID4+ID4gQEAgLTQ3LDYg
KzQ3LDEwIEBAIHZvaWQgdnBjaV9yZW1vdmVfZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+
PiA+PiA+ICAgICAgICAgIHhmcmVlKHIpOwo+PiA+PiA+ICAgICAgfQo+PiA+PiA+ICAgICAgc3Bp
bl91bmxvY2soJnBkZXYtPnZwY2ktPmxvY2spOwo+PiA+PiA+ICsjaWZkZWYgX19YRU5fXwo+PiA+
PiA+ICsgICAgLyogTkI6IGZpZWxkcyBiZWxvdyBhcmUgbm90IGV4cG9zZWQgdG8gdGhlIHVzZXIt
c3BhY2UgdGVzdCBoYXJuZXNzLiAqLwo+PiA+PiA+ICsgICAgeGZyZWUocGRldi0+dnBjaS0+bXNp
KTsKPj4gPj4gPiArI2VuZGlmCj4+ID4+IAo+PiA+PiBXb3VsZCBpdCBtYXliZSBiZSBiZXR0ZXIg
dG8gYWRkIHN1Y2ggZHVtbXkgZmllbGQocyksIHRvIGF2b2lkIHRoZQo+PiA+PiAjaWZkZWYgaGVy
ZT8gQW55d2F5LCB3aXRoIG9yIHdpdGhvdXQgdGhhdAo+PiA+PiBSZXZpZXdlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiA+IAo+PiA+IEZvciB0aGUgbXNpIHN0cnVjdHVy
ZSB0aGF0J3MgZG9hYmxlLCBidXQgZm9yIG1zaXggaXQncyBtb3JlIGNvbXBsZXgKPj4gPiBiZWNh
dXNlIGl0IGluY2x1ZGVzIHRoZSB2cGNpX2FyY2hfbXNpeF9lbnRyeSBzdHJ1Y3R1cmUsIGFuZCB0
aGF0IHdvdWxkCj4+ID4gbWVhbiBleHBvc2luZyBtb3JlIHN0dWZmIHRvIHRoZSB1c2VyLXNwYWNl
IHRlc3QgaGFybmVzcy4KPj4gCj4+IEkgZG9uJ3QgdW5kZXJzdGFuZDogVGhlc2UgYXJlIHBvaW50
ZXJzLCBoZW5jZSBpdCBzdWZmaWNlcyB0bwo+PiB1c2UgdGhlIHN0cnVjdHVyZXMgaGVyZSB3aXRo
b3V0IGFjdHVhbGx5IGRlZmluaW5nIHRoZWlyIG1lbWJlcnMKPj4gYW55d2hlcmU7IHlvdSBkb24n
dCBldmVuIG5lZWQgdG8gZGVjbGFyZSB0aGVtIGFzIGFuIGVtcHR5Cj4+IHN0cnVjdHVyZS4gWW91
J2QganVzdCBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSB0ZXN0IHRvb2wgZmlsbHMKPj4gdGhl
IHBvaW50ZXIgZmllbGRzIHdpdGggTlVMTCAoc28gdGhhdCBmcmVlKClpbmcgdGhlbSBpcyBhIG5v
LW9wKS4KPiAKPiBUaGUgaXNzdWUgaXMgdGhhdCB0aGUgc3RydWN0dXJlIGRlZmluaXRpb24gYW5k
IHRoZSBmaWVsZCBkZWNsYXJhdGlvbgo+IGFyZSBkb25lIGF0IHRoZSBzYW1lIHRpbWU6Cj4gCj4g
c3RydWN0IHZwY2kgewo+ICAgICAuLi4KPiAjaWZkZWYgX19YRU5fXwo+ICAgICBzdHJ1Y3QgdnBj
aV9tc2kgewo+ICAgICAgICAgLi4uCj4gICAgIH0gKm1zaTsKPiAKPiAgICAgc3RydWN0IHZwY2lf
bXNpeCB7Cj4gICAgICAgICAuLi4KPiAgICAgfSAqbXNpeDsKPiAjZW5kaWYKPiB9Cj4gCj4gV291
bGQgeW91IGxpa2UgbWUgdG8gYWRkIGEgI2Vsc2Ugd2l0aCB2b2lkICogZGVjbGFyYXRpb25zIGZv
ciBib3RoIG1zaQo+IGFuZCBtc2l4PwoKVGhhdCAoYnV0IGluc3RlYWQgb2YgdXNpbmcgdm9pZCB3
aXRoIHRoZSBhY3R1YWwgc3RydWN0IDxuYW1lPiksIG9yIGUuZy4KCnN0cnVjdCB2cGNpIHsKICAg
IC4uLgogICAgc3RydWN0IHZwY2lfbXNpIHsKI2lmZGVmIF9fWEVOX18KICAgICAgICAuLi4KI2Vu
ZGlmCiAgICB9ICptc2k7CgogICAgc3RydWN0IHZwY2lfbXNpeCB7CiNpZmRlZiBfX1hFTl9fCiAg
ICAgICAgLi4uCiNlbmRpZgogICAgfSAqbXNpeDsKfQoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
