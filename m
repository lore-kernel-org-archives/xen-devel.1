From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] vpci/msi: fix update of bound MSI
 interrupts
Date: Mon, 14 May 2018 15:27:45 +0100
Message-ID: <20180514142745.giejgb3sdnnw3nbh@MacBook-Pro-de-Roger.local>
References: <20180508092359.6829-1-roger.pau@citrix.com>
 <20180508092547.7017-1-roger.pau@citrix.com>
 <5AF9813102000078001C2792@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xph0=ib=citrix.com=prvs=66538a94f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fIESE-00045p-JY
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 14:27:58 +0000
Content-Disposition: inline
In-Reply-To: <5AF9813102000078001C2792@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMTQsIDIwMTggYXQgMDY6Mjk6MzdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA4LjA1LjE4IGF0IDExOjI1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXNpLmMKPiA+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9odm0vdm1zaS5jCj4gPiBAQCAtNjk5LDYgKzY5OSwyOSBAQCBzdGF0aWMgaW50IHZwY2lf
bXNpX3VwZGF0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdWludDMyX3QgZGF0YSwKPiA+
ICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4gIAo+ID4gK2ludCB2cGNpX21zaV9hcmNoX3VwZGF0
ZShzdHJ1Y3QgdnBjaV9tc2kgKm1zaSwgY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gPiAr
ewo+ID4gKyAgICBpbnQgcmM7Cj4gPiArCj4gPiArICAgIEFTU0VSVChtc2ktPmFyY2gucGlycSAh
PSBJTlZBTElEX1BJUlEpOwo+ID4gKwo+ID4gKyAgICBwY2lkZXZzX2xvY2soKTsKPiA+ICsgICAg
cmMgPSB2cGNpX21zaV91cGRhdGUocGRldiwgbXNpLT5kYXRhLCBtc2ktPmFkZHJlc3MsIG1zaS0+
dmVjdG9ycywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgbXNpLT5hcmNoLnBpcnEsIG1z
aS0+bWFzayk7Cj4gPiArICAgIGlmICggcmMgKQo+ID4gKyAgICB7Cj4gPiArICAgICAgICBzcGlu
X2xvY2soJnBkZXYtPmRvbWFpbi0+ZXZlbnRfbG9jayk7Cj4gPiArICAgICAgICB1bm1hcF9kb21h
aW5fcGlycShwZGV2LT5kb21haW4sIG1zaS0+YXJjaC5waXJxKTsKPiAKPiBUaGlzIGxvb2tzIHF1
aXRlIHVuZGVzaXJhYmxlIC0gYSBmYWlsZWQgdXBkYXRlIHNob3VsZCBsZWF2ZSB0aGUgaW50ZXJy
dXB0IGluIGl0cwo+IHByaW9yIHN0YXRlIHJhdGhlciB0aGFuIHVuYmluZGluZyBpdC4gSXMgdGhh
dCBvdmVybHkgZGlmZmljdWx0IHRvIGFjaGlldmU/CgpPaCwgVEJIIEkgd291bGQgZXhwZWN0IHRo
YXQgd3JpdGluZyBhbiBpbnZhbGlkIGRhdGEgb3IgYWRkcmVzcyBmaWVsZHMKd2lsbCBkaXNhYmxl
IE1TSSBpbnN0ZWFkIG9mIGtlZXAgdXNpbmcgdGhlIG9sZCB2YWx1ZXMuIEknbSBub3Qgc3VyZSBJ
CnNlZSB0aGUgcmVhc29uIHRvIGtlZXAgdXNpbmcgdGhlIG9sZCB2YWx1ZXMsIGNlcnRhaW5seSB0
aGF0IGNvdWxkIG1ha2UKc29tZXRoaW5nIGVsc2UgZ28gdmVyeSB3b25reSBpbnNpZGUgb2YgdGhl
IGd1ZXN0IGl0c2VsZi4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
