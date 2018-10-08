From: "Xin Li (Talons)" <xin.li@citrix.com>
Subject: Re: [Non-DoD Source] [PATCH 1/2] xen/xsm: Introduce new
 boot parameter xsm
Date: Mon, 8 Oct 2018 06:32:19 +0000
Message-ID: <7701c80c11eb43b283c2b3199654b1b8@SINPEX02CL01.citrite.net>
References: <20180929092251.17661-1-xin.li@citrix.com>
 <BA190A75E8413C49BB9E1D2B85D118115D89F18B@MSMR-GH1-UEA01.corp.nsa.gov>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <BA190A75E8413C49BB9E1D2B85D118115D89F18B@MSMR-GH1-UEA01.corp.nsa.gov>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "dgdegra@tycho.nsa.gov" <dgdegra@tycho.nsa.gov>, 'Xin Li' <talons.lee@gmail.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, Ming Lu <ming.lu@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhhbmtzIERhbmllbC4NCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IERlR3JhYWYsIERhbmllbCBHIFttYWlsdG86ZGdkZWdyYUBuc2EuZ292XQ0KPiBTZW50OiBNb25k
YXksIE9jdG9iZXIgMSwgMjAxOCAxMToxOCBQTQ0KPiBUbzogJ1hpbiBMaScgPHRhbG9ucy5sZWVA
Z21haWwuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbi5vcmcNCj4gQ2M6IFhpbiBMaSAoVGFsb25z
KSA8eGluLmxpQGNpdHJpeC5jb20+OyBEYW5pZWwgRGUgR3JhYWYNCj4gPGRnZGVncmFAdHljaG8u
bnNhLmdvdj47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEphbg0K
PiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT47IEtvbnJhZCBSemVzenV0ZWsgV2lsaw0KPiA8
a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47IFRpbQ0KPiAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT47IFNlcmdleSBEeWFzbGkNCj4gPHNlcmdleS5keWFzbGlAY2l0cml4
LmNvbT47IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+Ow0KPiBNaW5n
IEx1IDxtaW5nLmx1QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbTm9uLURvRCBTb3VyY2Vd
IFtQQVRDSCAxLzJdIHhlbi94c206IEludHJvZHVjZSBuZXcgYm9vdA0KPiBwYXJhbWV0ZXIgeHNt
DQo+IA0KPiA+DQo+ID4gSW50cm9kdWNlIG5ldyBib290IHBhcmFtZXRlciB4c20gdG8gY2hvb3Nl
IHdoaWNoIHhzbSBtb2R1bGUgaXMNCj4gPiBlbmFibGVkLCBhbmQgc2V0IGRlZmF1bHQgdG8gZHVt
bXkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaW4gTGkgPHhpbi5saUBjaXRyaXguY29tPg0K
PiANCj4gQWNrZWQtYnk6IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292Pg0K
PiANCj4gSXQgbWlnaHQgYmUgdXNlZnVsIGZvciB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gYWxzbyBy
ZWZlcmVuY2UgdGhlIG5ldyBLY29uZmlnDQo+IG9wdGlvbjsgdGhhbmtzIGZvciBhZGRpbmcgaXQu
DQoNCk9LLiBTdXJlLg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
