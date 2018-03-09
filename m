From: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [PATCH] Move missing items from
 docs/misc/qemu-xen-security to SUPPORT.md
Date: Fri, 9 Mar 2018 10:41:03 +0000
Message-ID: <081C779A-D40A-47C9-929A-713F4124FBA7@citrix.com>
References: <20180308173719.14791-1-lars.kurth@citrix.com>
 <23201.30331.17592.424886@mariner.uk.xensource.com>
 <8473046C-FDDE-436E-963C-2965F183F013@citrix.com>
 <f3c5d615-84e6-0796-705b-26450f2894a4@citrix.com>
 <E514A8D1-BF1F-44CF-9243-603C708A6F02@citrix.com>
 <32f2432d-b567-1c4f-498e-27766014eb9b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=7v9i=f7=citrix.com=prvs=599f723f2=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1euFSZ-0003X4-NU
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 10:41:11 +0000
In-Reply-To: <32f2432d-b567-1c4f-498e-27766014eb9b@citrix.com>
Content-Language: en-US
Content-ID: <F2A347D3D5784E4184B953FDCF6C6B8C@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>, 'Jan Beulich' <JBeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "committers@xenproject.org" <committers@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCu+7v09uIDA5LzAzLzIwMTgsIDExOjM4LCAiR2VvcmdlIER1bmxhcCIgPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT4gd3JvdGU6DQoNCiAgICBPbiAwMy8wOS8yMDE4IDEwOjM0IEFNLCBMYXJz
IEt1cnRoIHdyb3RlOg0KICAgID4gDQogICAgPiBPbiAwOS8wMy8yMDE4LCAxMTozMiwgIkdlb3Jn
ZSBEdW5sYXAiIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KICAgID4gDQogICAg
PiAgICAgT24gMDMvMDgvMjAxOCAwNjowNyBQTSwgTGFycyBLdXJ0aCB3cm90ZToNCiAgICA+ICAg
ICA+IA0KICAgID4gICAgID4gQEphbjogdGhpcyBzaG91bGQgYmUgYmFja3BvcnRlZCB0byA0LjEw
IGFsc28NCiAgICA+ICAgICANCiAgICA+ICAgICBJIHRoaW5rIHdlIHNob3VsZCBiYWNrcG9ydCBh
bnkgdXBkYXRlcyB0byBTVVBQT1JULm1kLCBidXQgSSBkb24ndCB0aGluaw0KICAgID4gICAgIHdl
IHNob3VsZCByZW1vdmUgcWVtdS14ZW4tc2VjdXJpdHkgaW4gNC4xMC4gIFRoYXQncyBub3QgdGhl
IGtpbmQgb2YNCiAgICA+ICAgICB0aGluZyB3ZSBzaG91bGQgcmVhbGx5IGRlbGV0ZSBpbiBhIHBv
aW50IHJlbGVhc2UuDQogICAgPiAgICAgDQogICAgPiAgICAgTGFycywgbWF5YmUgd2hlbiB5b3Ug
cmUtc3VibWl0IHlvdSBjb3VsZCBtYWtlIHRoaXMgdHdvIHBhdGNoZXMgLS0gb25lIHRvDQogICAg
PiAgICAgdXBkYXRlIFNVUFBPUlQubWQgKHdoaWNoIHdvdWxkIGJlIGJhY2twb3J0ZWQpIGFuZCBv
bmUgdG8gcmVtb3ZlDQogICAgPiAgICAgcWVtdS14ZW4tc2VjdXJpdHkgKHdoaWNoIHdvdWxkIG5v
dCBiZSk/DQogICAgPiANCiAgICA+IFN1cmUuIEkgd2lsbCBuZWVkIHlvdSBndXlzIHRvIGhlbHAg
bWUgcHV0IHRoZSByaWdodCB0ZXJtaW5vbG9neSBpbiBwbGFjZSBmb3IgU1VQUE9SVC5tZA0KICAg
ID4gSSB0aG91Z2h0IHRoZSB0YXNrIGlzIG1vcmUgbWVjaGFuaWNhbCB0aGFuIGl0IGlzDQogICAg
DQogICAgWW91IGRpZG4ndCBsZWFybiBmcm9tIHRoZSBpbnRlcm1pbmFibGUgZGlzY3Vzc2lvbnMg
d2UgaGFkIHJldmlzaW5nDQogICAgU1VQUE9SVC5tZCB0aGUgZmlyc3QgdGltZSBhcm91bmQ/IDot
KQ0KDQpJIHdhcyBvbiBob2xpZGF5cywgc28gZGlkbuKAmXQgZm9sbG93IGl0DQogICAgDQogICAg
SWYgeW91IHdhbnQgSSBjYW4gdHJ5IHRvIHRha2UgdGhpcyBvdmVyIC0tIGl0IHNvdW5kcyBsaWtl
IHRoaXMgaXNuJ3QNCiAgICBxdWl0ZSB3aGF0IHlvdSBzaWduZWQgdXAgZm9yLg0KDQpJZiB5b3Ug
Y291bGQsIHRoYXQgbWF5IG1ha2UgdGhpbmdzIGEgbG90IGVhc2llci4gVGhpcyBpcyBvYnZpb3Vz
bHkgbXVjaCBsZXNzIG1lY2hhbmljYWwgdGhhbiBJIHRob3VnaHQuDQpBbHRlcm5hdGl2ZWx5LCB5
b3UgY291bGQgc3VtbWFyaXplIHRoZSB0aHJlYWQgYXQgdGhlIGVuZCBhbmQgSSBjYW4gcmUtc3Vi
bWl0LiAgDQoNCkxhcnMNCiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
