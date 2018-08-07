From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/9] x86: enclose hypercall page
 initialisation code in CONFIG_{HVM, PV}
Date: Tue, 07 Aug 2018 04:44:13 -0600
Message-ID: <5B6977FD02000078001DB7D7@prv1-mh.provo.novell.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
 <d801b0cb143980c7912f5188d0887321614bbd81.1533636027.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hjto=kw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fmzTN-0000nv-6l
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 10:44:17 +0000
In-Reply-To: <d801b0cb143980c7912f5188d0887321614bbd81.1533636027.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA4LjE4IGF0IDEyOjAwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC90cmFwcy5jCj4gKysrIGIveGVuL2FyY2gveDg2L3g4
Nl82NC90cmFwcy5jCj4gQEAgLTM1MiwxMiArMzUyLDE5IEBAIHZvaWQgc3ViYXJjaF9wZXJjcHVf
dHJhcHNfaW5pdCh2b2lkKQo+ICB2b2lkIGh5cGVyY2FsbF9wYWdlX2luaXRpYWxpc2Uoc3RydWN0
IGRvbWFpbiAqZCwgdm9pZCAqaHlwZXJjYWxsX3BhZ2UpCj4gIHsKPiAgICAgIG1lbXNldChoeXBl
cmNhbGxfcGFnZSwgMHhDQywgUEFHRV9TSVpFKTsKPiArI2lmIENPTkZJR19IVk0KPiAgICAgIGlm
ICggaXNfaHZtX2RvbWFpbihkKSApCj4gICAgICAgICAgaHZtX2h5cGVyY2FsbF9wYWdlX2luaXRp
YWxpc2UoZCwgaHlwZXJjYWxsX3BhZ2UpOwo+IC0gICAgZWxzZSBpZiAoICFpc19wdl8zMmJpdF9k
b21haW4oZCkgKQo+IC0gICAgICAgIGh5cGVyY2FsbF9wYWdlX2luaXRpYWxpc2VfcmluZzNfa2Vy
bmVsKGh5cGVyY2FsbF9wYWdlKTsKPiAtICAgIGVsc2UKPiAtICAgICAgICBoeXBlcmNhbGxfcGFn
ZV9pbml0aWFsaXNlX3JpbmcxX2tlcm5lbChoeXBlcmNhbGxfcGFnZSk7Cj4gKyNlbmRpZgo+ICsj
aWYgQ09ORklHX1BWCj4gKyAgICBpZiAoIGlzX3B2X2RvbWFpbihkKSApCj4gKyAgICB7Cj4gKyAg
ICAgICAgaWYgKCAhaXNfcHZfMzJiaXRfZG9tYWluKGQpICkKPiArICAgICAgICAgICAgaHlwZXJj
YWxsX3BhZ2VfaW5pdGlhbGlzZV9yaW5nM19rZXJuZWwoaHlwZXJjYWxsX3BhZ2UpOwo+ICsgICAg
ICAgIGVsc2UKPiArICAgICAgICAgICAgaHlwZXJjYWxsX3BhZ2VfaW5pdGlhbGlzZV9yaW5nMV9r
ZXJuZWwoaHlwZXJjYWxsX3BhZ2UpOwo+ICsgICAgfQo+ICsjZW5kaWYKPiAgfQoKSSdtIG5vdCBj
b252aW5jZWQ6IFRoaXMgaXMgdWdsaWVyIHRvIHJlYWQsIGFuZCB0aGluZ3MgbGlrZSBpc19odm1f
ZG9tYWluKCkKc2hvdWxkIGV2YWx1YXRlIHRvIGNvbnN0YW50IGZhbHNlIGFueXdheSB3aXRob3V0
IHRoZSByZXNwZWN0aXZlCkNPTkZJR18qIHNldHRpbmcgZW5hYmxlZC4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
