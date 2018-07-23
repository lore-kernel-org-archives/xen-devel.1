From: Christian Lindig <christian.lindig@citrix.com>
Subject: Re: [PATCH 2/2] ocaml: remove undefined behaviour in
 systemd_stubs.c
Date: Mon, 23 Jul 2018 09:56:35 +0000
Message-ID: <1B67D682-7A99-46B1-B004-C345DF53ADAD@citrix.com>
References: <20180723093039.20382-1-wei.liu2@citrix.com>
 <20180723093039.20382-3-wei.liu2@citrix.com>
 <a8d83f90-9134-6d74-2e0b-7688ba5bc2d6@citrix.com>
 <20180723095209.el5x26qa3e3d5va2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jqba=kh=citrix.com=prvs=7358b8244=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1fhXa2-0001L8-BS
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 09:56:38 +0000
In-Reply-To: <20180723095209.el5x26qa3e3d5va2@citrix.com>
Content-Language: en-US
Content-ID: <312B365D8D816A4280A1D06679BDCB65@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>, David Scott <dave@recoil.org>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gMjMgSnVsIDIwMTgsIGF0IDEwOjUyLCBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgSnVsIDIzLCAyMDE4IGF0IDEwOjQ3OjA0QU0gKzAx
MDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyMy8wNy8xOCAxMDozMCwgV2VpIExpdSB3
cm90ZToNCj4+PiBDbGFuZyBjb21wbGFpbnM6DQo+Pj4gDQo+Pj4gc3lzdGVtZF9zdHVicy5jOjUx
Ojg6IGVycm9yOiBzaGlmdGluZyBhIG5lZ2F0aXZlIHNpZ25lZCB2YWx1ZSBpcyB1bmRlZmluZWQg
Wy1XZXJyb3IsLVdzaGlmdC1uZWdhdGl2ZS12YWx1ZV0NCj4+PiAgICAgICAgcmV0ID0gVmFsX2lu
dCgtMVUpOw0KPj4+ICAgICAgICAgICAgICBefn5+fn5+fn5+fn4NCj4+PiANCj4+PiBTaW1wbHkg
Y2hhbmdlIHRoZSByZXR1cm4gdmFsdWUgdG8gMC4NCj4+IA0KPj4gVGhhdCB3aWxsIGJyZWFrIHRo
ZSBmdW5jdGlvbiB0aG91Z2gsIGFzIGl0IHByZXZpb3VzbHkgcmV0dXJuZWQgLTEuDQo+IA0KPiBJ
IGRvbid0IHRoaW5rIHRoZSBjYWxsZXIgY2FyZXMgYWJvdXQgdGhlIHJldHVybiB2YWx1ZS4gVGhl
IGZ1bmN0aW9uDQo+IHNpZ25hdHVyZSBpcyB1bml0IC0+IHVuaXQgZm9yIHNkX25vZml0eV9yZWFk
eSwgYW5kIHRoZSByZXR1cm4gdmFsdWUgaXMNCj4gbm90IGNoZWNrZWQgYXQgYWxsLiBJIGFkbWl0
IEkgY291bGQgaGF2ZSBtaXNyZWFkIHRoZSBjb2RlIHRob3VnaC4NCj4gDQo+IFdlaS4NCg0KVGhp
cyBpcyBjb3JyZWN0Og0KDQpleHRlcm5hbCBzZF9ub3RpZnlfcmVhZHk6IHVuaXQgLT4gdW5pdCA9
ICJvY2FtbF9zZF9ub3RpZnlfcmVhZHkiDQoNCkFueSByZXR1cm4gdmFsdWUgY2Fu4oCZdCBiZSBv
YnNlcnZlZCBvbiB0aGUgT0NhbWwgc2lkZS4gSXQgaXMgYSBiaXQgc3RyYW5nZSB0aG91Z2ggdGhh
dCB0aGUgQyBjb2RlIGRvZXMgbm90IHJldHVybiB1bml0IGFjY29yZGluZ2x5LCB3aGljaCB3b3Vs
ZCBiZQ0KDQpyZXR1cm4gVmFsX3VuaXQ7DQoNCuKAlCBDDQoNCg0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
