From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/9] x86: enclose hypercall page
 initialisation code in CONFIG_{HVM, PV}
Date: Tue, 7 Aug 2018 11:49:12 +0100
Message-ID: <bf9199d2-f4e9-7e02-a7bd-533496d61618@citrix.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
 <d801b0cb143980c7912f5188d0887321614bbd81.1533636027.git-series.wei.liu2@citrix.com>
 <5B6977FD02000078001DB7D7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dbyb=kw=citrix.com=prvs=7504029a4=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fmzYB-0001Ko-Bv
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 10:49:15 +0000
In-Reply-To: <5B6977FD02000078001DB7D7@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDgvMTggMTE6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA3LjA4LjE4IGF0
IDEyOjAwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni94ODZfNjQvdHJhcHMuYwo+PiArKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMKPj4g
QEAgLTM1MiwxMiArMzUyLDE5IEBAIHZvaWQgc3ViYXJjaF9wZXJjcHVfdHJhcHNfaW5pdCh2b2lk
KQo+PiAgdm9pZCBoeXBlcmNhbGxfcGFnZV9pbml0aWFsaXNlKHN0cnVjdCBkb21haW4gKmQsIHZv
aWQgKmh5cGVyY2FsbF9wYWdlKQo+PiAgewo+PiAgICAgIG1lbXNldChoeXBlcmNhbGxfcGFnZSwg
MHhDQywgUEFHRV9TSVpFKTsKPj4gKyNpZiBDT05GSUdfSFZNCj4+ICAgICAgaWYgKCBpc19odm1f
ZG9tYWluKGQpICkKPj4gICAgICAgICAgaHZtX2h5cGVyY2FsbF9wYWdlX2luaXRpYWxpc2UoZCwg
aHlwZXJjYWxsX3BhZ2UpOwo+PiAtICAgIGVsc2UgaWYgKCAhaXNfcHZfMzJiaXRfZG9tYWluKGQp
ICkKPj4gLSAgICAgICAgaHlwZXJjYWxsX3BhZ2VfaW5pdGlhbGlzZV9yaW5nM19rZXJuZWwoaHlw
ZXJjYWxsX3BhZ2UpOwo+PiAtICAgIGVsc2UKPj4gLSAgICAgICAgaHlwZXJjYWxsX3BhZ2VfaW5p
dGlhbGlzZV9yaW5nMV9rZXJuZWwoaHlwZXJjYWxsX3BhZ2UpOwo+PiArI2VuZGlmCj4+ICsjaWYg
Q09ORklHX1BWCj4+ICsgICAgaWYgKCBpc19wdl9kb21haW4oZCkgKQo+PiArICAgIHsKPj4gKyAg
ICAgICAgaWYgKCAhaXNfcHZfMzJiaXRfZG9tYWluKGQpICkKPj4gKyAgICAgICAgICAgIGh5cGVy
Y2FsbF9wYWdlX2luaXRpYWxpc2VfcmluZzNfa2VybmVsKGh5cGVyY2FsbF9wYWdlKTsKPj4gKyAg
ICAgICAgZWxzZQo+PiArICAgICAgICAgICAgaHlwZXJjYWxsX3BhZ2VfaW5pdGlhbGlzZV9yaW5n
MV9rZXJuZWwoaHlwZXJjYWxsX3BhZ2UpOwo+PiArICAgIH0KPj4gKyNlbmRpZgo+PiAgfQo+IEkn
bSBub3QgY29udmluY2VkOiBUaGlzIGlzIHVnbGllciB0byByZWFkLCBhbmQgdGhpbmdzIGxpa2Ug
aXNfaHZtX2RvbWFpbigpCj4gc2hvdWxkIGV2YWx1YXRlIHRvIGNvbnN0YW50IGZhbHNlIGFueXdh
eSB3aXRob3V0IHRoZSByZXNwZWN0aXZlCj4gQ09ORklHXyogc2V0dGluZyBlbmFibGVkLgoKSSBh
Z3JlZS4KCkVhY2ggb2YgdGhlIDQgaW5pdGlhbGlzYXRpb24gZnVuY3Rpb25zIGNvdWxkIGJlIHN0
YXRpYyBpbmxpbmVzLCBiZWNhdXNlCnRoZXJlIGlzIG5vdGhpbmcgY29tcGxpY2F0ZWQgYWJvdXQg
dGhlbSwgYW5kIHRoZSBzdGF0aWMgZXZhbHVhdGlvbiBvZgppc18qX2RvbWFpbigpIHdvdWxkIGNh
dXNlIHRoZSBwcm9wZXJseSB1bnVzZWQgb25lcyB0byBiZSBvbWl0dGVkLgoKfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
