From: Julien Grall <Julien.Grall@arm.com>
Subject: Re: [PATCH 13/25] argo: implement the register op
Date: Sun, 2 Dec 2018 20:10:59 +0000
Message-ID: <6c9074fa-eb9a-350b-1019-93c35803e0e1@arm.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-14-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ds4k=ol=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gTY54-0005EN-Dv
 for xen-devel@lists.xenproject.org; Sun, 02 Dec 2018 20:11:06 +0000
In-Reply-To: <1543627984-21394-14-git-send-email-christopher.w.clark@gmail.com>
Content-Language: en-US
Content-ID: <26B1011A571CC64491B9964FBCD80CC4@eurprd08.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, James McKenzie <voreekf@madingley.org>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, nd <nd@arm.com>, Eric Chanudet <eric.chanudet@gmail.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCk9uIDAxLzEyLzIwMTggMDE6MzIsIENocmlzdG9waGVyIENsYXJrIHdyb3RlOg0KPiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2FyZ28uaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9h
cmdvLmgNCj4gaW5kZXggMjBkYWJjMC4uNWFkOGUyYiAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1
ZGUvcHVibGljL2FyZ28uaA0KPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJnby5oDQo+IEBA
IC0yMSw2ICsyMSwyMCBAQA0KPiAgIA0KPiAgICNpbmNsdWRlICJ4ZW4uaCINCj4gICANCj4gKyNk
ZWZpbmUgQVJHT19SSU5HX01BR0lDICAgICAgMHhiZDY3ZTE2M2U3Nzc3ZjJmVUxMDQo+ICsNCj4g
KyNkZWZpbmUgQVJHT19ET01JRF9BTlkgICAgICAgICAgIERPTUlEX0lOVkFMSUQNCj4gKw0KPiAr
LyoNCj4gKyAqIFRoZSBtYXhpbXVtIHNpemUgb2YgYW4gQXJnbyByaW5nIGlzIGRlZmluZWQgdG8g
YmU6IDE2R0INCj4gKyAqICAtLSB3aGljaCBpcyAweDEwMDAwMDAgb3IgMTY3NzcyMTYgYnl0ZXMu
DQo+ICsgKiBBIGJ5dGUgaW5kZXggaW50byB0aGUgcmluZyBpcyBhdCBtb3N0IDI0IGJpdHMuDQo+
ICsgKi8NCj4gKyNkZWZpbmUgQVJHT19NQVhfUklOR19TSVpFICAoMTY3NzcyMTZVTEwpDQo+ICsN
Cj4gKy8qIHBmbiB0eXBlOiA2NC1iaXQgb24gYWxsIGFyY2hpdGVjdHVyZXMgdG8gYWlkIGF2b2lk
aW5nIGEgY29tcGF0IEFCSSAqLw0KPiArdHlwZWRlZiB1aW50NjRfdCBhcmdvX3Bmbl90Ow0KDQpB
cyB5b3UgYWx3YXlzIHVzZSA2NC1iaXQsIGNhbiB3ZSBqdXN0IHVzZSBhbiBhZGRyZXNzPyBUaGlz
IHdvdWxkIG1ha2UgDQp0aGUgQUJJIGFnbm9zdGljIHRvIHRoZSBoeXBlcnZpc29yIHBhZ2UgZ3Jh
bnVsYXJpdHkuDQoNCkNoZWVycywNCg0KLS0gDQpKdWxpZW4gR3JhbGwNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
