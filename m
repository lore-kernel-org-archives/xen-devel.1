From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 9/9] x86/shim: pass through vcpu runstate to
	L0 Xen
Date: Fri, 19 Jan 2018 11:18:38 +0000
Message-ID: <20180119111838.ib45r6zsenom5xrv@MacBook-Pro-de-Roger.local>
References: <20180118181652.26397-1-wei.liu2@citrix.com>
 <20180118181652.26397-10-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zmcs=eo=citrix.com=prvs=55082200c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ecUhg-0005IU-E5
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 11:19:24 +0000
Content-Disposition: inline
In-Reply-To: <20180118181652.26397-10-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Anthony Liguori <anthony@codemonkey.ws>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMTgsIDIwMTggYXQgMDY6MTY6NTJQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21haW4uYyBiL3hlbi9jb21tb24vZG9tYWluLmMK
PiBpbmRleCA1NTgzMThlODUyLi4xODlmZmFjOWIxIDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24v
ZG9tYWluLmMKPiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jCj4gQEAgLTQ1LDYgKzQ1LDcgQEAK
PiAgCj4gICNpZmRlZiBDT05GSUdfWDg2Cj4gICNpbmNsdWRlIDxhc20vZ3Vlc3QuaD4KPiArI2lu
Y2x1ZGUgPGFzbS9ndWVzdC9oeXBlcmNhbGwuaD4KPiAgI2VuZGlmCj4gIAo+ICAvKiBMaW51eCBj
b25maWcgb3B0aW9uOiBwcm9wYWdldGVkIHRvIGRvbWFpbjAgKi8KPiBAQCAtMTQyNSw2ICsxNDI2
LDE1IEBAIGxvbmcgZG9fdmNwdV9vcChpbnQgY21kLCB1bnNpZ25lZCBpbnQgdmNwdWlkLCBYRU5f
R1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykKPiAgICAgICAgICBpZiAoICFndWVzdF9oYW5k
bGVfb2theShhcmVhLmFkZHIuaCwgMSkgKQo+ICAgICAgICAgICAgICBicmVhazsKPiAgCj4gKyNp
ZiBDT05GSUdfWDg2Cj4gKyAgICAgICAgaWYgKCBwdl9zaGltICkKPiArICAgICAgICB7Cj4gKyAg
ICAgICAgICAgIHJjID0geGVuX2h5cGVyY2FsbF92Y3B1X29wKFZDUFVPUF9yZWdpc3Rlcl9ydW5z
dGF0ZV9tZW1vcnlfYXJlYSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdmNwdWlkLCAmYXJlYSk7Cj4gKyAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgIH0KPiAr
I2VuZGlmCgpUaGlzIG9ubHkgZml4ZXMgVkNQVU9QX3JlZ2lzdGVyX3J1bnN0YXRlX21lbW9yeV9h
cmVhLCBidXQKVkNQVU9QX2dldF9ydW5zdGF0ZV9pbmZvIHdpbGwgc3RpbGwgcmVwb3J0IHdyb25n
IGluZm9ybWF0aW9uLiBJJ3ZlCmFsc28gd29uZGVyZWQgd2hldGhlciBzaW1wbHkgcmV0dXJuaW5n
IEwwIGluZm9ybWF0aW9uIGlzIGNvcnJlY3QuIFRvCmdldCB0aGUgZXhhY3QgaW5mb3JtYXRpb24g
dGhlIHNoaW0gc2hvdWxkIGFjdHVhbGx5IHJldHVybiB0aGUgTDAKaW5mb3JtYXRpb24gcGx1cyB3
aGF0ZXZlciB0aW1lIGl0IHN0ZWFscyBmcm9tIHRoZSBndWVzdC4KCkFsc28sIGJlZm9yZSBhZGRp
bmcgbW9yZSBob29rcyB0byBkb192Y3B1X29wIEkgd291bGQgYXR0ZW1wdCB0byBhZGQgYQpwdl9z
aGltX2RvX3ZjcHVfb3AgaGVscGVyIGFuZCBwYXRjaCB0aGUgaHlwZXJjYWxsIHRhYmxlLCBpbiBv
cmRlciB0bwphdm9pZCBtb2RpZnlpbmcgbW9yZSBjb21tb24gY29kZS4gQUZBSUNUIHRoaXMgZG9l
c24ndCByZXF1aXJlIGFkZGluZwptdWNoIGNvbXBhdCBjb2RlIHRvIHRoZSBzaGltIGltcGxlbWVu
dGF0aW9uLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
