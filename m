From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2 01/13] grant_table: use term 'mfn' for
 machine frame numbers...
Date: Wed, 11 Jul 2018 08:31:51 +0000
Message-ID: <45a43434aafd4ec89b48198d3e36662b@AMSPEX02CL03.citrite.net>
References: <20180707110526.35822-1-paul.durrant@citrix.com>
 <20180707110526.35822-2-paul.durrant@citrix.com>
 <dd14956a-a37a-667f-e468-134ad24a6f7f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oywb=j3=citrix.com=prvs=72382d508=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fdAXb-0005eE-HQ
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 08:32:03 +0000
In-Reply-To: <dd14956a-a37a-667f-e468-134ad24a6f7f@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZW9yZ2UgRHVubGFwIFttYWls
dG86Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tXQ0KPiBTZW50OiAxMCBKdWx5IDIwMTggMTQ6MjAN
Cj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIz
QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwDQo+IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+
OyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IEphbg0KPiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+OyBL
b25yYWQNCj4gUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBTdGVmYW5v
IFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBUaW0gKFhlbi5vcmcpIDx0
aW1AeGVuLm9yZz47IFdlaSBMaXUNCj4gPHdlaS5saXUyQGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjIgMDEvMTNdIGdyYW50X3RhYmxlOiB1c2UgdGVybSAnbWZuJyBmb3IgbWFj
aGluZSBmcmFtZQ0KPiBudW1iZXJzLi4uDQo+IA0KPiBPbiAwNy8wNy8yMDE4IDEyOjA1IFBNLCBQ
YXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gLi4ucmF0aGVyIHRoYW4gbW9yZSBhbWJpZ3VvdXMgdGVy
bSAnZnJhbWUnLg0KPiA+DQo+ID4gVGhlcmUgYXJlIG1hbnkgcGxhY2VzIGluIHRoZSBncmFudCB0
YWJsZSBjb2RlIHRoYXQgdXNlIGEgdmFyaWFibGUgb3INCj4gPiBmaWVsZCBuYW1lICcuKmZyYW1l
JyB0byByZWZlciB0byBhIHF1YW50aXR5IHRoYXQgaXMgc3RyaWN0bHkgYW4gTUZOLCBhbmQNCj4g
PiBldmVuIGhhcyB0eXBlIG1mbl90Lg0KPiA+IFRoaXMgcGF0Y2ggaXMgYSBwdXJlbHkgY29zbWV0
aWMgcGF0Y2ggdGhhdCBzdWJzdGl0dXRlcyAnZnJhbWUnIHdpdGggJ21mbicNCj4gPiBpbiB0aG9z
ZSBwbGFjZXMgdG8gbWFrZSB0aGUgcHVycG9zZSBvZiB0aGUgdmFyaWFibGUgb3IgZmllbGQgbmFt
ZSBtb3JlDQo+ID4gb2J2aW91cy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFu
dCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+DQo+IA0KPiBMb29rcyBnb29kLiAgT25lIG1pbm9y
IGNvbW1lbnQuLi4NCj4gDQo+ID4gQEAgLTIzMjAsNyArMjMyMCw3IEBAIHJlbGVhc2VfZ3JhbnRf
Zm9yX2NvcHkoDQo+ID4gICAgICBzdHJ1Y3QgZ3JhbnRfdGFibGUgKnJndCA9IHJkLT5ncmFudF90
YWJsZTsNCj4gPiAgICAgIGdyYW50X2VudHJ5X2hlYWRlcl90ICpzaGE7DQo+ID4gICAgICBzdHJ1
Y3QgYWN0aXZlX2dyYW50X2VudHJ5ICphY3Q7DQo+ID4gLSAgICBtZm5fdCByX2ZyYW1lOw0KPiA+
ICsgICAgbWZuX3QgbWZuOw0KPiA+ICAgICAgdWludDE2X3QgKnN0YXR1czsNCj4gPiAgICAgIGdy
YW50X3JlZl90IHRyYW5zX2dyZWY7DQo+ID4gICAgICBzdHJ1Y3QgZG9tYWluICp0ZDsNCj4gDQo+
IElmIHlvdSBlbmQgdXAgcmVzcGlubmluZyB0aGlzLCB5b3UgbWlnaHQgY29uc2lkZXIgbWFraW5n
IHRoaXMgJ3JtZm4nIG9yDQo+IHNvbWV0aGlnbiwganVzdCBiZWNhdXNlIGV2ZXJ5dGhpbmcgaW4g
dGhpcyBmdW5jdGlvbiBzZWVtcyB0byBoYXZlIHRoZQ0KPiAncicgcHJlZml4Lg0KPg0KDQpJIGxv
b2tlZCBhZ2FpbiBhbmQgVEJIIEknZCBwcmVmZXIgdG8ganVzdCBzdGljayB3aXRoIG1mbi4NCiAN
Cj4gQnV0IGVpdGhlciB3YXk6DQo+IA0KPiBSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2Vv
cmdlLmR1bmxhcEBjaXRyaXguY29tPg0KDQpUaGFua3MsDQoNCiAgUGF1bA0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
