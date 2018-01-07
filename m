From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 13/22] vixen: Use SCHEDOP_shutdown to
 shutdown the machine
Date: Sun, 7 Jan 2018 08:27:20 +0000
Message-ID: <20180107082720.d5bsuequmfdkdlop@MacBook-Pro-de-Roger.local>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <1515279277-16301-14-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=mhr6=ec=citrix.com=prvs=538008ad2=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eY6Io-00036X-8R
 for xen-devel@lists.xenproject.org; Sun, 07 Jan 2018 08:27:34 +0000
Content-Disposition: inline
In-Reply-To: <1515279277-16301-14-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <aliguori@amzn.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBKYW4gMDYsIDIwMTggYXQgMDI6NTQ6MjhQTSAtMDgwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+IEZyb206IEphbiBILiBTY2jDtm5oZXJyIDxqc2Nob2VuaEBhbWF6b24uZGU+Cj4g
Cj4gV2hpbGUgdGhlIGh3ZG9tX3NodXRkb3duKCkgaXMgYWJsZSB0byByZWJvb3QgdGhlIHN5c3Rl
bSwgaXQgZmFpbHMgdG8KPiBwcm9wZXJseSBwb3dlciBpdCBvZmYuIFdpdGggU0NIRURPUF9zaHV0
ZG93biwgd2UgZGVsZWdhdGUgdGhlIHByb2JsZW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEgu
IFNjaMO2bmhlcnIgPGpzY2hvZW5oQGFtYXpvbi5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255
IExpZ3VvcmkgPGFsaWd1b3JpQGFtYXpvbi5jb20+Cj4gLS0tCj4gIHhlbi9jb21tb24vZG9tYWlu
LmMgfCAxNCArKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWFpbi5jIGIveGVuL2NvbW1vbi9kb21h
aW4uYwo+IGluZGV4IGI0ZDY3OWUuLmVkZTM3N2MgMTAwNjQ0Cj4gLS0tIGEveGVuL2NvbW1vbi9k
b21haW4uYwo+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMKPiBAQCAtNDIsNiArNDIsNyBAQAo+
ICAjaW5jbHVkZSA8eGVuL3RyYWNlLmg+Cj4gICNpbmNsdWRlIDx4ZW4vdG1lbS5oPgo+ICAjaW5j
bHVkZSA8YXNtL3NldHVwLmg+Cj4gKyNpbmNsdWRlIDxhc20vZ3Vlc3Qvdml4ZW4uaD4KPiAgCj4g
IC8qIExpbnV4IGNvbmZpZyBvcHRpb246IHByb3BhZ2V0ZWQgdG8gZG9tYWluMCAqLwo+ICAvKiB4
ZW5fcHJvY2Vzc29yX3BtYml0czogeGVuIGNvbnRyb2wgQ3gsIFB4LCAuLi4gKi8KPiBAQCAtNjkz
LDYgKzY5NCwxNyBAQCB2b2lkIF9fZG9tYWluX2NyYXNoX3N5bmNocm9ub3VzKHZvaWQpCj4gIH0K
PiAgCj4gIAo+ICtzdGF0aWMgdm9pZCB2aXhlbl9zaHV0ZG93bih1OCByZWFzb24pCj4gK3sKPiAr
ICAgIHN0cnVjdCBzY2hlZF9zaHV0ZG93biBzY2hlZF9zaHV0ZG93biA9IHsgLnJlYXNvbiA9IHJl
YXNvbiB9Owo+ICsKPiArICAgIGlmICghb3B0X25vcmVib290KQo+ICsgICAgICAgIEhZUEVSVklT
T1Jfc2NoZWRfb3AoU0NIRURPUF9zaHV0ZG93biwgJnNjaGVkX3NodXRkb3duKTsKPiArCj4gKyAg
ICAvKiBGYWxsYmFjaywgaW4gY2FzZSB0aGUgaHlwZXJjYWxsIGZhaWxzICovCj4gKyAgICBod2Rv
bV9zaHV0ZG93bihyZWFzb24pOwo+ICt9Cj4gKyAKPiAgdm9pZCBkb21haW5fc2h1dGRvd24oc3Ry
dWN0IGRvbWFpbiAqZCwgdTggcmVhc29uKQo+ICB7Cj4gICAgICBzdHJ1Y3QgdmNwdSAqdjsKPiBA
QCAtNzAzLDYgKzcxNSw4IEBAIHZvaWQgZG9tYWluX3NodXRkb3duKHN0cnVjdCBkb21haW4gKmQs
IHU4IHJlYXNvbikKPiAgICAgICAgICBkLT5zaHV0ZG93bl9jb2RlID0gcmVhc29uOwo+ICAgICAg
cmVhc29uID0gZC0+c2h1dGRvd25fY29kZTsKPiAgCj4gKyAgICBpZiAoIGlzX3ZpeGVuKCkgKQo+
ICsgICAgICAgIHZpeGVuX3NodXRkb3duKHJlYXNvbik7CgpXaGF0IGhhcHBlbnMgd2l0aCBoeXBl
cnZpc29yIHRyaWdnZXJlZCBzaHV0ZG93bnM/IEZvciBwdi1zaGltIHdlCnRyYW5zbGF0ZWQgYWxs
IGh5cGVydmlzb3IgaW5pdGlhdGVkIHNodXRkb3ducyB0byBjcmFzaCByZXF1ZXN0cywgc2luY2UK
QUZBSUNUIHRoZXkgY2FuIG9ubHkgY29tZSBmcm9tIHBhbmljcy9CVUdzL0FTU0VSVHMuLi4KClJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
