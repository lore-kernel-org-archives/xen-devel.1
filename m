From: "Xin Li (Talons)" <xin.li@citrix.com>
Subject: Re: [PATCH 1/2] xen/xsm: Introduce new boot parameter
 xsm
Date: Thu, 5 Jul 2018 01:38:45 +0000
Message-ID: <8fe198961a514c219bff78ac3c56aa61@SINPEX02CL01.citrite.net>
References: <20180703012629.507-1-xin.li@citrix.com>
 <5B3B21CA02000078001D00F3@prv1-mh.provo.novell.com>
 <F5F7E2FE-3180-4823-BB3B-7231855A8706@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <F5F7E2FE-3180-4823-BB3B-7231855A8706@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Xin Li <talons.lee@gmail.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, xen-devel <xen-devel@lists.xen.org>, Ming Lu <ming.lu@citrix.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZW9yZ2UgRHVubGFwDQo+IFNl
bnQ6IFRodXJzZGF5LCBKdWx5IDUsIDIwMTggMTI6NTUgQU0NCj4gVG86IEphbiBCZXVsaWNoIDxK
QmV1bGljaEBzdXNlLmNvbT4NCj4gQ2M6IFhpbiBMaSA8dGFsb25zLmxlZUBnbWFpbC5jb20+OyBB
bmRyZXcgQ29vcGVyDQo+IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgTWluZyBMdSA8bWlu
Zy5sdUBjaXRyaXguY29tPjsgU2VyZ2V5IER5YXNsaQ0KPiA8c2VyZ2V5LmR5YXNsaUBjaXRyaXgu
Y29tPjsgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT47IFhpbiBMaSAoVGFsb25zKQ0KPiA8
eGluLmxpQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5j
b20+OyBTdGVmYW5vDQo+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4t
ZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW4ub3JnPjsNCj4gS29ucmFkIFJ6ZXN6dXRlayBXaWxr
IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgRGFuaWVsIGRlIEdyYWFmDQo+IDxkZ2RlZ3JhQHR5
Y2hvLm5zYS5nb3Y+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6
IFtQQVRDSCAxLzJdIHhlbi94c206IEludHJvZHVjZSBuZXcgYm9vdCBwYXJhbWV0ZXIgeHNtDQo+
IA0KPiANCj4gDQo+ID4gT24gSnVsIDMsIDIwMTgsIGF0IDg6MTIgQU0sIEphbiBCZXVsaWNoIDxK
QmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBGaXJzdCBvZiBhbGwgLSBwbGVhc2Ug
aW5kaWNhdGUgdGhlIHZlcnNpb24gYWxzbyBpbiB0aGUgc3ViamVjdCwgaS5lLg0KPiA+IGhlcmUg
W1BBVENIIHYyIDEvMl0gb3Igc29tZSBzdWNoLg0KPiA+DQo+ID4+Pj4gT24gMDMuMDcuMTggYXQg
MDM6MjYsIDx0YWxvbnMubGVlQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4+IHYyDQo+ID4+IFRvIGZ1
cnRoZXIgZGlzY3VzczoNCj4gPj4gMSkgaXMgImR1bW15IiBhIGdvb2QgY29tbWFuZCBsaW5lIG9w
dGlvbj8NCj4gPj4gb3RoZXIgY2hvaWNlczogYmFzaWMiLCAidHJpdmlhbCIsIG9yICJzaW1wbGUi
DQo+ID4NCj4gPiBJbmRlZWQsIGJ1dCBub3QgbGltaXRlZCB0byB0aGUgbmFtZWQgc2V0Lg0KPiAN
Cj4gSSB0aGluayBJ4oCZZCBnbyB3aXRoIOKAnHN0YW5kYXJk4oCdIG9yIOKAnGRlZmF1bHTigJ0u
ICBUaGUg4oCcZGVmYXVsdOKAnSByZXN0cmljdGlvbnMgYXJlIGJ5IG5vDQo+IG1lYW5zIOKAnGR1
bW154oCdLCDigJx0cml2aWFs4oCdLCBvciDigJxzaW1wbGXigJ0g4oCUIHRoZXnigJlyZSBjYXJl
ZnVsbHkgdGhvdWdodCBvdXQgZm9yIHRoZQ0KPiBtb3N0IGNvbW1vbiBYZW4gZGVwbG95bWVudC4N
Cg0KImRlZmF1bHQiIHNlZW1zIHRvIGJlIGEgZ29vZCBjaG9pY2UuDQpJdCBtYXRjaGVzIHRoZSBj
b2RlIGxvZ2ljLg0KDQogICAgaWYgKCAhc3RyY21wKHMsICJkZWZhdWx0IikgKQ0KICAgICAgICB4
c21fYm9vdHBhcmFtID0gWFNNX0JPT1RQQVJBTV9EVU1NWTsNCg0KYWxzbyB1cGRhdGUgIiBkb2Nz
L21pc2MveGVuLWNvbW1hbmQtbGluZS5tYXJrZG93biINCg0KPiANCj4gIC1HZW9yZ2UNCg0KDQpC
ZXN0IHJlZ2FyZHMNCg0KWGluKFRhbG9ucykgTGkNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
