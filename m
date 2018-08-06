From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 28/32] libxl_qmp: Store advertised QEMU
 version in libxl__ev_qmp
Date: Mon, 6 Aug 2018 17:52:16 +0100
Message-ID: <20180806165216.GP1327@perard.uk.xensource.com>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
 <20180727140614.13256-29-anthony.perard@citrix.com>
 <20180802150815.rlgwiu6xvrhiymug@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sagg=kv=citrix.com=prvs=749c18510=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fmik0-0003qC-5a
 for xen-devel@lists.xenproject.org; Mon, 06 Aug 2018 16:52:20 +0000
Content-Disposition: inline
In-Reply-To: <20180802150815.rlgwiu6xvrhiymug@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBdWcgMDIsIDIwMTggYXQgMDU6MDg6MTVQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBGcmksIEp1bCAyNywgMjAxOCBhdCAwMzowNjoxMFBNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+IFRoaXMgd2lsbCBiZSB1c2VkIGluIGEgbGF0ZXIgcGF0Y2gu
Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBj
aXRyaXguY29tPgo+ID4gLS0tCj4gPiAgdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8ICA3
ICsrKysrKysKPiA+ICB0b29scy9saWJ4bC9saWJ4bF9xbXAuYyAgICAgIHwgMTYgKysrKysrKysr
KysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xpYnhsL2xp
YnhsX2ludGVybmFsLmgKPiA+IGluZGV4IDAxYzM4Njg3NDguLjRmYTU0Y2RiNmEgMTAwNjQ0Cj4g
PiAtLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCj4gPiArKysgYi90b29scy9saWJ4
bC9saWJ4bF9pbnRlcm5hbC5oCj4gPiBAQCAtNDMyLDYgKzQzMiwxMyBAQCBzdHJ1Y3QgbGlieGxf
X2V2X3FtcCB7Cj4gPiAgICAgIGxpYnhsX19ldl9xbXBfY2FsbGJhY2sgKmNhbGxiYWNrOwo+ID4g
ICAgICBsaWJ4bF9fY2FyZWZkICpjZmQ7IC8qIHNldCB0byBzZW5kIGEgZmQgd2l0aCB0aGUgY29t
bWFuZCwgTlVMTCBvdGhlcndpc2UgKi8KPiA+ICAKPiA+ICsgICAgLyogcmVhZC1vbmx5IHdoZW4g
Q29ubmVjdGVkICovCj4gPiArICAgIHN0cnVjdCB7Cj4gPiArICAgICAgICBpbnQgbWFqb3I7Cj4g
PiArICAgICAgICBpbnQgbWlub3I7Cj4gPiArICAgICAgICBpbnQgbWljcm87Cj4gPiArICAgIH0g
cWVtdV92ZXJzaW9uOwo+IAo+IEkgd291bGQgaW5pdCB0aG9zZSBmaWVsZCB0byBzb21lIGJvZ3Vz
IHZhbHVlICgtMSkgdG8gbWFrZSBzdXJlIGFuIHVzZQo+IGJlZm9yZSBpbml0aWFsaXphdGlvbiB3
aWxsIG1vcmUgbGlrZWx5IGNhdXNlIGEgZmFpbHVyZS4KCkkgZG9uJ3QgdGhpbmsgaXQgbWF0dGVy
LCBidXQgSSdsbCBkbyBpdCBpbiBsaWJ4bF9fZXZfcW1wX2luaXQuCihUaG9zZSBmaWVsZCBzaG91
bGQgbm90IGJlIHJlYWQgYmVmb3JlIHRoZXkgaGF2ZSBiZWVuIHdyaXR0ZW4uKQoKLS0gCkFudGhv
bnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
