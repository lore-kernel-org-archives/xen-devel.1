From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 3/9] x86: enclose hypercall page
 initialisation code in CONFIG_{HVM, PV}
Date: Tue, 7 Aug 2018 17:08:07 +0100
Message-ID: <20180807160807.kp327nlhtoomsuy7@citrix.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
 <d801b0cb143980c7912f5188d0887321614bbd81.1533636027.git-series.wei.liu2@citrix.com>
 <5B6977FD02000078001DB7D7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xdgf=kw=citrix.com=prvs=7503460ff=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fn4Wp-0000By-1Z
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 16:08:11 +0000
Content-Disposition: inline
In-Reply-To: <5B6977FD02000078001DB7D7@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMDcsIDIwMTggYXQgMDQ6NDQ6MTNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA3LjA4LjE4IGF0IDEyOjAwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMKPiA+ICsrKyBiL3hlbi9h
cmNoL3g4Ni94ODZfNjQvdHJhcHMuYwo+ID4gQEAgLTM1MiwxMiArMzUyLDE5IEBAIHZvaWQgc3Vi
YXJjaF9wZXJjcHVfdHJhcHNfaW5pdCh2b2lkKQo+ID4gIHZvaWQgaHlwZXJjYWxsX3BhZ2VfaW5p
dGlhbGlzZShzdHJ1Y3QgZG9tYWluICpkLCB2b2lkICpoeXBlcmNhbGxfcGFnZSkKPiA+ICB7Cj4g
PiAgICAgIG1lbXNldChoeXBlcmNhbGxfcGFnZSwgMHhDQywgUEFHRV9TSVpFKTsKPiA+ICsjaWYg
Q09ORklHX0hWTQo+ID4gICAgICBpZiAoIGlzX2h2bV9kb21haW4oZCkgKQo+ID4gICAgICAgICAg
aHZtX2h5cGVyY2FsbF9wYWdlX2luaXRpYWxpc2UoZCwgaHlwZXJjYWxsX3BhZ2UpOwo+ID4gLSAg
ICBlbHNlIGlmICggIWlzX3B2XzMyYml0X2RvbWFpbihkKSApCj4gPiAtICAgICAgICBoeXBlcmNh
bGxfcGFnZV9pbml0aWFsaXNlX3JpbmczX2tlcm5lbChoeXBlcmNhbGxfcGFnZSk7Cj4gPiAtICAg
IGVsc2UKPiA+IC0gICAgICAgIGh5cGVyY2FsbF9wYWdlX2luaXRpYWxpc2VfcmluZzFfa2VybmVs
KGh5cGVyY2FsbF9wYWdlKTsKPiA+ICsjZW5kaWYKPiA+ICsjaWYgQ09ORklHX1BWCj4gPiArICAg
IGlmICggaXNfcHZfZG9tYWluKGQpICkKPiA+ICsgICAgewo+ID4gKyAgICAgICAgaWYgKCAhaXNf
cHZfMzJiaXRfZG9tYWluKGQpICkKPiA+ICsgICAgICAgICAgICBoeXBlcmNhbGxfcGFnZV9pbml0
aWFsaXNlX3JpbmczX2tlcm5lbChoeXBlcmNhbGxfcGFnZSk7Cj4gPiArICAgICAgICBlbHNlCj4g
PiArICAgICAgICAgICAgaHlwZXJjYWxsX3BhZ2VfaW5pdGlhbGlzZV9yaW5nMV9rZXJuZWwoaHlw
ZXJjYWxsX3BhZ2UpOwo+ID4gKyAgICB9Cj4gPiArI2VuZGlmCj4gPiAgfQo+IAo+IEknbSBub3Qg
Y29udmluY2VkOiBUaGlzIGlzIHVnbGllciB0byByZWFkLCBhbmQgdGhpbmdzIGxpa2UgaXNfaHZt
X2RvbWFpbigpCj4gc2hvdWxkIGV2YWx1YXRlIHRvIGNvbnN0YW50IGZhbHNlIGFueXdheSB3aXRo
b3V0IHRoZSByZXNwZWN0aXZlCj4gQ09ORklHXyogc2V0dGluZyBlbmFibGVkLgoKSSB0YWtlIGl0
IHlvdSBhcmUgYWdhaW5zdCBhZGRpbmcgQ09ORklHXyogaGVyZT8KClRoZSBhZGRpdGlvbiBvZiBp
c19wdl9kb21haW4gYnJhbmNoIGlzIHN0aWxsIG5lZWRlZCBiZWNhdXNlIGJvdGggc2V0cwptaWdo
dCBnZXQgY29tcGlsZWQgb3V0LgoKV2VpLgoKPiAKPiBKYW4KPiAKPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
