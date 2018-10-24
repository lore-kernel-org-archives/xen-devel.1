From: Andrii Anisov <Andrii_Anisov@epam.com>
Subject: Re: [PATCH 04/22] xen/arm: bugs: Move do_bug_frame to
 traps.h
Date: Wed, 24 Oct 2018 14:44:01 +0000
Message-ID: <a3914b6d-6b82-cc09-00b3-114b117a0e68@epam.com>
References: <20181018132109.31192-1-julien.grall@arm.com>
 <20181018132109.31192-5-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181018132109.31192-5-julien.grall@arm.com>
Content-Language: en-US
Content-ID: <798821158AF38C4B85CC82DBCEE72F30@eurprd03.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTguMTAuMTggMTY6MjAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gZG9fYnVnX2ZyYW1lIGlz
IG9ubHkgbmVjZXNzYXJ5IHdoZW4gdHJhcHBpbmcuIFRoaXMgYWxsb3dzIHRvIHJlbW92ZQ0KPiBw
cm9jZXNzb3IuaCBpbmNsdWRlLg0KPg0KPiBIb3dldmVyLCB0aW1lLmggd2FzIG1pc3NpbmcgYW4g
aW5jbHVkZSByZXN1bHRpbmcgdG8gY29tcGlsYXRpb24gZXJyb3IgaWYNCj4gcHJvY2Vzc29yLmgg
aXMgcmVtb3ZlZCBmcm9tIGJ1Zy5oLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPg0KPiAtLS0NCj4gICB4ZW4vYXJjaC9hcm0vYXJtMzIvdHJh
cHMuYyAgfCAxICsNCj4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL2J1Zy5oICAgfCA0IC0tLS0NCj4g
ICB4ZW4vaW5jbHVkZS9hc20tYXJtL3RpbWUuaCAgfCAyICsrDQo+ICAgeGVuL2luY2x1ZGUvYXNt
LWFybS90cmFwcy5oIHwgMiArKw0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQ0KDQpSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2Fu
aXNvdkBlcGFtLmNvbT4NCg0KLS0gDQoNCipBbmRyaWkgQW5pc292Kg0KDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
