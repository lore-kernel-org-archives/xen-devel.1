From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 1/7] x86/p2m/pod: make it build with
 !CONFIG_HVM
Date: Fri, 21 Sep 2018 17:01:29 +0100
Message-ID: <20180921160129.mhgm6ao63fkua7v7@zion.uk.xensource.com>
References: <cover.f883694550a3da3b95e2bf2a6f6777297b851b43.1536856592.git-series.wei.liu2@citrix.com>
 <692c143f75c48c83b7011147b1861e2c9b5f87f3.1536856592.git-series.wei.liu2@citrix.com>
 <5B9BAC8D02000078001E8A9B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4pl1=md=citrix.com=prvs=7953d62ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g3NsM-0007GW-4g
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 16:01:50 +0000
Content-Disposition: inline
In-Reply-To: <5B9BAC8D02000078001E8A9B@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMTQsIDIwMTggYXQgMDY6NDE6NDlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEzLjA5LjE4IGF0IDE4OjM4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLXB0LmMKPiA+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tbS9wMm0tcHQuYwo+ID4gQEAgLTk3NCw3ICs5NzQsOSBAQCBsb25nIHAybV9wdF9hdWRp
dF9wMm0oc3RydWN0IHAybV9kb21haW4gKnAybSkKPiA+ICAgICAgdW5zaWduZWQgbG9uZyBtZm4s
IGdmbiwgbTJwZm47Cj4gPiAgCj4gPiAgICAgIEFTU0VSVChwMm1fbG9ja2VkX2J5X21lKHAybSkp
Owo+ID4gKyNpZmRlZiBDT05GSUdfSFZNCj4gPiAgICAgIEFTU0VSVChwb2RfbG9ja2VkX2J5X21l
KHAybSkpOwo+ID4gKyNlbmRpZgo+ID4gIAo+ID4gICAgICAvKiBBdWRpdCBwYXJ0IG9uZTogd2Fs
ayB0aGUgZG9tYWluJ3MgcDJtIHRhYmxlLCBjaGVja2luZyB0aGUgZW50cmllcy4gKi8KPiA+ICAg
ICAgaWYgKCBwYWdldGFibGVfZ2V0X3BmbihwMm1fZ2V0X3BhZ2V0YWJsZShwMm0pKSAhPSAwICkK
PiA+IEBAIC0xMTA1LDYgKzExMDcsNyBAQCBsb25nIHAybV9wdF9hdWRpdF9wMm0oc3RydWN0IHAy
bV9kb21haW4gKnAybSkKPiA+ICAgICAgICAgIHVubWFwX2RvbWFpbl9wYWdlKGw0ZSk7Cj4gPiAg
ICAgIH0KPiA+ICAKPiA+ICsjaWZkZWYgQ09ORklHX0hWTQo+ID4gICAgICBpZiAoIGVudHJ5X2Nv
dW50ICE9IHAybS0+cG9kLmVudHJ5X2NvdW50ICkKPiA+ICAgICAgewo+ID4gICAgICAgICAgcHJp
bnRrKCIlczogcmVmY291bnRlZCBlbnRyeSBjb3VudCAlbGQsIGF1ZGl0IGNvdW50ICVsdSFcbiIs
Cj4gPiBAQCAtMTExMyw2ICsxMTE2LDcgQEAgbG9uZyBwMm1fcHRfYXVkaXRfcDJtKHN0cnVjdCBw
Mm1fZG9tYWluICpwMm0pCj4gPiAgICAgICAgICAgICAgICAgZW50cnlfY291bnQpOwo+ID4gICAg
ICAgICAgQlVHKCk7Cj4gPiAgICAgIH0KPiA+ICsjZW5kaWYKPiA+ICAKPiA+ICAgICAgcmV0dXJu
IHBtYmFkOwo+ID4gIH0KPiAKPiBBIHNpbmdsZSAjaWZkZWYgYXJvdW5kIHRoZSBlbnRpcmUgZnVu
Y3Rpb24gcGxlYXNlLCB3aXRoCj4gCj4gI2Vsc2UKPiAjIGRlZmluZSBwMm1fcHRfYXVkaXRfcDJt
IE5VTEwKPiAjZW5kaWYKPiAKPiBvciBzb21lIHN1Y2ggKGxpa2UgbWFraW5nIHRoZSBhdWRpdF9w
Mm0gc3RydWN0dXJlIG1lbWJlciBnbyBhd2F5Cj4gYWx0b2dldGhlciksIGFzIHlvdXIgY2hhbmdl
IHRvIHRoZSBjb25kaXRpb25hbCBhcm91bmQgYXVkaXRfcDJtKCkKPiBzdXBwcmVzc2VzIHRoZSBv
bmx5IGNhbGxlci4KCkRvbmUuCgo+IAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCj4g
PiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiA+IEBAIC00OSwxOCArNDksMjggQEAgYm9v
bGVhbl9wYXJhbSgiaGFwXzJtYiIsIG9wdF9oYXBfMm1iKTsKPiA+ICAKPiA+ICBERUZJTkVfUEVS
Q1BVX1JXTE9DS19HTE9CQUwocDJtX3BlcmNwdV9yd2xvY2spOwo+ID4gIAo+ID4gK3N0YXRpYyB2
b2lkIHAybV9wb2RfaW5pdChzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtKQo+ID4gK3sKPiA+ICsjaWZk
ZWYgQ09ORklHX0hWTQo+ID4gKyAgICB1bnNpZ25lZCBpbnQgaTsKPiA+ICsKPiA+ICsgICAgbW1f
bG9ja19pbml0KCZwMm0tPnBvZC5sb2NrKTsKPiA+ICsgICAgSU5JVF9QQUdFX0xJU1RfSEVBRCgm
cDJtLT5wb2Quc3VwZXIpOwo+ID4gKyAgICBJTklUX1BBR0VfTElTVF9IRUFEKCZwMm0tPnBvZC5z
aW5nbGUpOwo+ID4gKwo+ID4gKyAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUocDJtLT5w
b2QubXJwLmxpc3QpOyArK2kgKQo+ID4gKyAgICAgICAgcDJtLT5wb2QubXJwLmxpc3RbaV0gPSBn
Zm5feChJTlZBTElEX0dGTik7Cj4gPiArI2VuZGlmCj4gPiArfQo+IAo+IEkgdGhpbmsgdGhpcyBy
ZWFsbHkgYmVsb25ncyBpbnRvIHAybS1wb2QuYy4KPiAKCkFuZCBkb25lLgoKV2VpLgoKCj4gSmFu
Cj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
