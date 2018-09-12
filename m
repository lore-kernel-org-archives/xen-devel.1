From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: Re: [PATCH v3 2/3] x86/viridan: Clean up Viridian MSR
 infrastructure
Date: Wed, 12 Sep 2018 08:14:16 +0000
Message-ID: <2cde400afe09f195fe885b264d4384f421768cfa.camel@citrix.com>
References: <1536692177-15675-1-git-send-email-andrew.cooper3@citrix.com>
 <1536692177-15675-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1536692177-15675-3-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
Content-ID: <13738B623C53AE4D8AB4F10A43B627F9@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: Wei Liu <wei.liu2@citrix.com>, "JBeulich@suse.com" <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyMDE4LTA5LTExIGF0IDE5OjU2ICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBSZW5hbWUgdGhlIGZ1bmN0aW9ucyB0byBndWVzdF97cmQsd3J9bXNyX3ZpcmlkaWFuKCkgZm9y
IGNvbnNpc3RlbmN5LCBhbmQNCj4gYmVjYXVzZSB0aGUgX3JlZ3MoKSBzdWZmaXggaXNuJ3QgdmVy
eSBhcHByb3ByaWF0ZS4NCj4gDQo+IFVwZGF0ZSB0aGVtIHRvIHRha2UgYSB2Y3B1IHBvaW50ZXIg
cmF0aGVyIHRoYW4gcHJlc3VtaW5nIHRoYXQgdGhleSBhY3Qgb24NCj4gY3VycmVudCwgd2hpY2gg
aXMgc2FmZSBmb3IgYWxsIGltcGxlbWVudGVkIG9wZXJhdGlvbnMsIGFuZCBzd2l0Y2ggdGhlaXIg
cmV0dXJuDQo+IEFCSSB0byB1c2UgWDg2RU1VTF8qLg0KPiANCj4gVGhlIGRlZmF1bHQgY2FzZXMg
bm8gbG9uZ2VyIG5lZWQgdG8gZGVhbCB3aXRoIE1TUnMgb3V0IG9mIHRoZSBWaXJpZGlhbiByYW5n
ZSwNCj4gYnV0IGRyb3AgdGhlIHByaW50a3MgdG8gZGVidWcgYnVpbGRzIG9ubHkgYW5kIGlkZW50
aWZ5IHRoZSB2YWx1ZSBhdHRlbXB0aW5nIHRvDQo+IGJlIHdyaXR0ZW4uDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBSZXZp
ZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCj4gLS0tDQo+
IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+DQo+IENDOiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPg0KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+DQo+IENDOiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+DQo+
IA0KPiB2MzoNCj4gICogQ2xlYW4gdXAgYWZ0ZXIgc3BsaXR0aW5nIHRoZSBzZXJpZXMuICBSZXRh
aW4gYXBwcm9wcmlhdGUgUi1ieSdzDQo+IC0tLQ0KPiAgeGVuL2FyY2gveDg2L2h2bS92aXJpZGlh
bi5jICAgICAgICB8IDQ2ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
ICB4ZW4vYXJjaC94ODYvbXNyLmMgICAgICAgICAgICAgICAgIHwgIDYgKystLS0NCj4gIHhlbi9p
bmNsdWRlL2FzbS14ODYvaHZtL3ZpcmlkaWFuLmggfCAxMSArKy0tLS0tLS0NCj4gIDMgZmlsZXMg
Y2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pDQo+IA0KDQpSZXZpZXdl
ZC1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPg0KDQotLSANClRo
YW5rcywNClNlcmdleQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
