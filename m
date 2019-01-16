From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] hw/block/xen: use proper format string for
 printing sectors
Date: Wed, 16 Jan 2019 12:19:40 +0000
Message-ID: <0dbd67c55295400980f87a191fc5d22c@AMSPEX02CL03.citrite.net>
References: <20190116121350.23863-1-alex.bennee@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FqKl=PY=citrix.com=prvs=9126ffe88=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gjkAa-0006zr-FO
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 12:19:44 +0000
In-Reply-To: <20190116121350.23863-1-alex.bennee@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?utf-8?B?J0FsZXggQmVubsOpZSc=?= <alex.bennee@linaro.org>, "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "open list:Block layer core" <qemu-block@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>, =?utf-8?B?J1BoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpJw==?= <philmd@redhat.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4IEJlbm7DqWUgW21haWx0
bzphbGV4LmJlbm5lZUBsaW5hcm8ub3JnXQ0KPiBTZW50OiAxNiBKYW51YXJ5IDIwMTkgMTI6MTQN
Cj4gVG86IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZw0KPiBDYzogcWVtdS1kZXZlbEBub25nbnUu
b3JnOyBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+OyBTdGVmYW5vDQo+IFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBBbnRob255IFBlcmFyZA0KPiA8YW50
aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJp
eC5jb20+OyBLZXZpbg0KPiBXb2xmIDxrd29sZkByZWRoYXQuY29tPjsgTWF4IFJlaXR6IDxtcmVp
dHpAcmVkaGF0LmNvbT47IG9wZW4gbGlzdDpYODYNCj4gPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZz47IG9wZW4gbGlzdDpCbG9jayBsYXllciBjb3JlIDxxZW11LQ0KPiBibG9ja0Bub25n
bnUub3JnPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIGh3L2Jsb2NrL3hlbjogdXNlIHByb3BlciBmb3Jt
YXQgc3RyaW5nIGZvciBwcmludGluZw0KPiBzZWN0b3JzDQo+IA0KPiBUaGUgJWx1IGZvcm1hdCBz
dHJpbmcgaXMgZGlmZmVyZW50IGRlcGVuZGluZyBvbiB0aGUgaG9zdCBhcmNoaXRlY3R1cmUNCj4g
d2hpY2ggY2F1c2VzIGJ1aWxkcyBsaWtlIHRoZSBkZWJpYW4tYXJtaGYtY3Jvc3MgYnVpbGQgdG8g
ZmFpbC4gVXNlIHRoZQ0KPiBjb3JyZWN0IFBSaTY0IGZvcm1hdCBzdHJpbmcuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQoNClRoaXMg
ZG9lcyB0aGUgc2FtZSB0aGluZyBhcyAieGVuOiBGaXggZm9ybWF0IHN0cmluZyIgZnJvbSBQaGls
aXBwZSwgYnV0IHRoaXMgdmFyaWFudCBpcyBiZXR0ZXIuLi4NCg0KUmV2aWV3ZWQtYnk6IFBhdWwg
RHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+DQoNCj4gLS0tDQo+ICBody9ibG9jay94
ZW4tYmxvY2suYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L2Jsb2NrL3hlbi1ibG9jay5jIGIvaHcv
YmxvY2sveGVuLWJsb2NrLmMNCj4gaW5kZXggYmUyOGI2MzQ0Mi4uYTYzNjQ4N2IzZSAxMDA2NDQN
Cj4gLS0tIGEvaHcvYmxvY2sveGVuLWJsb2NrLmMNCj4gKysrIGIvaHcvYmxvY2sveGVuLWJsb2Nr
LmMNCj4gQEAgLTIxNSw3ICsyMTUsNyBAQCBzdGF0aWMgdm9pZCB4ZW5fYmxvY2tfcmVhbGl6ZShY
ZW5EZXZpY2UgKnhlbmRldiwgRXJyb3INCj4gKiplcnJwKQ0KPiANCj4gICAgICB4ZW5fZGV2aWNl
X2JhY2tlbmRfcHJpbnRmKHhlbmRldiwgInNlY3Rvci1zaXplIiwgIiV1IiwNCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbmYtPmxvZ2ljYWxfYmxvY2tfc2l6ZSk7DQo+IC0gICAg
eGVuX2RldmljZV9iYWNrZW5kX3ByaW50Zih4ZW5kZXYsICJzZWN0b3JzIiwgIiVsdSIsDQo+ICsg
ICAgeGVuX2RldmljZV9iYWNrZW5kX3ByaW50Zih4ZW5kZXYsICJzZWN0b3JzIiwgIiUiUFJJaTY0
LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxrX2dldGxlbmd0aChjb25mLT5i
bGspIC8NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmYtPmxvZ2ljYWxfYmxv
Y2tfc2l6ZSk7DQo+IA0KPiAtLQ0KPiAyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
