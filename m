From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v2 13/23] vixen: Use SCHEDOP_shutdown to
 shutdown the machine
Date: Sun, 7 Jan 2018 19:22:53 -0500
Message-ID: <20180108002253.GA21689@char.us.oracle.com>
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-14-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=45m3=ed=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1eYLDZ-0006vS-DH
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 00:23:09 +0000
Content-Disposition: inline
In-Reply-To: <1515356919-922-14-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <aliguori@amzn.com>
Cc: Wei Liu <wei.liu2@citrix.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gMDcsIDIwMTggYXQgMTI6Mjg6MjlQTSAtMDgwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+IEZyb206IEphbiBILiBTY2jDtm5oZXJyIDxqc2Nob2VuaEBhbWF6b24uZGU+Cj4g
Cj4gV2hpbGUgdGhlIGh3ZG9tX3NodXRkb3duKCkgaXMgYWJsZSB0byByZWJvb3QgdGhlIHN5c3Rl
bSwgaXQgZmFpbHMgdG8KPiBwcm9wZXJseSBwb3dlciBpdCBvZmYuIFdpdGggU0NIRURPUF9zaHV0
ZG93biwgd2UgZGVsZWdhdGUgdGhlIHByb2JsZW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEgu
IFNjaMO2bmhlcnIgPGpzY2hvZW5oQGFtYXpvbi5kZT4KPiAtLS0KPiAgeGVuL2NvbW1vbi9kb21h
aW4uYyB8IDE0ICsrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2Rv
bWFpbi5jCj4gaW5kZXggYjRkNjc5ZS4uZWRlMzc3YyAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9u
L2RvbWFpbi5jCj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYwo+IEBAIC00Miw2ICs0Miw3IEBA
Cj4gICNpbmNsdWRlIDx4ZW4vdHJhY2UuaD4KPiAgI2luY2x1ZGUgPHhlbi90bWVtLmg+Cj4gICNp
bmNsdWRlIDxhc20vc2V0dXAuaD4KPiArI2luY2x1ZGUgPGFzbS9ndWVzdC92aXhlbi5oPgo+ICAK
PiAgLyogTGludXggY29uZmlnIG9wdGlvbjogcHJvcGFnZXRlZCB0byBkb21haW4wICovCj4gIC8q
IHhlbl9wcm9jZXNzb3JfcG1iaXRzOiB4ZW4gY29udHJvbCBDeCwgUHgsIC4uLiAqLwo+IEBAIC02
OTMsNiArNjk0LDE3IEBAIHZvaWQgX19kb21haW5fY3Jhc2hfc3luY2hyb25vdXModm9pZCkKPiAg
fQo+ICAKPiAgCj4gK3N0YXRpYyB2b2lkIHZpeGVuX3NodXRkb3duKHU4IHJlYXNvbikKPiArewo+
ICsgICAgc3RydWN0IHNjaGVkX3NodXRkb3duIHNjaGVkX3NodXRkb3duID0geyAucmVhc29uID0g
cmVhc29uIH07Cj4gKwo+ICsgICAgaWYgKCFvcHRfbm9yZWJvb3QpCgpGb3Jnb3QgdGhlIHNwYWNl
cyBhcm91bmQgaXQuLgooTm90IHRoYXQgdGhpcyBtYXR0ZXJzIHRoYXQgbXVjaCkuCj4gKyAgICAg
ICAgSFlQRVJWSVNPUl9zY2hlZF9vcChTQ0hFRE9QX3NodXRkb3duLCAmc2NoZWRfc2h1dGRvd24p
Owo+ICsKPiArICAgIC8qIEZhbGxiYWNrLCBpbiBjYXNlIHRoZSBoeXBlcmNhbGwgZmFpbHMgKi8K
PiArICAgIGh3ZG9tX3NodXRkb3duKHJlYXNvbik7Cj4gK30KPiArIAo+ICB2b2lkIGRvbWFpbl9z
aHV0ZG93bihzdHJ1Y3QgZG9tYWluICpkLCB1OCByZWFzb24pCj4gIHsKPiAgICAgIHN0cnVjdCB2
Y3B1ICp2Owo+IEBAIC03MDMsNiArNzE1LDggQEAgdm9pZCBkb21haW5fc2h1dGRvd24oc3RydWN0
IGRvbWFpbiAqZCwgdTggcmVhc29uKQo+ICAgICAgICAgIGQtPnNodXRkb3duX2NvZGUgPSByZWFz
b247Cj4gICAgICByZWFzb24gPSBkLT5zaHV0ZG93bl9jb2RlOwo+ICAKPiArICAgIGlmICggaXNf
dml4ZW4oKSApCj4gKyAgICAgICAgdml4ZW5fc2h1dGRvd24ocmVhc29uKTsKPiAgICAgIGlmICgg
aXNfaGFyZHdhcmVfZG9tYWluKGQpICkKPiAgICAgICAgICBod2RvbV9zaHV0ZG93bihyZWFzb24p
Owo+ICAKPiAtLSAKPiAxLjkuMQo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
