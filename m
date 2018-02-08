From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: Re: [PATCH v1] x86/msr: add Raw and Host domain policies
Date: Thu, 8 Feb 2018 11:29:48 +0000
Message-ID: <1518089388.3287.1.camel@citrix.com>
References: <20180208102321.25193-1-sergey.dyasli@citrix.com>
 <20180208112131.yq6ls6diw7azwrj5@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180208112131.yq6ls6diw7azwrj5@MacBook-Pro-de-Roger.local>
Content-Language: en-US
Content-ID: <A8C4368F8D394148B1BF14CBA2571597@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMDE4LTAyLTA4IGF0IDExOjIxICswMDAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3Rl
Og0KPiBPbiBUaHUsIEZlYiAwOCwgMjAxOCBhdCAxMDoyMzoyMUFNICswMDAwLCBTZXJnZXkgRHlh
c2xpIHdyb3RlOg0KPiA+ICtzdGF0aWMgdm9pZCBfX2luaXQgY2FsY3VsYXRlX2hvc3RfcG9saWN5
KHZvaWQpDQo+ID4gK3sNCj4gPiArICAgIHN0cnVjdCBtc3JfZG9tYWluX3BvbGljeSAqZHAgPSAm
aG9zdF9tc3JfZG9tYWluX3BvbGljeTsNCj4gPiArDQo+ID4gKyAgICAqZHAgPSByYXdfbXNyX2Rv
bWFpbl9wb2xpY3k7DQo+IA0KPiBob3N0X21zcl9kb21haW5fcG9saWN5ID0gcmF3X21zcl9kb21h
aW5fcG9saWN5Ow0KPiANCj4gU2hvdWxkIHdvcmsgQUZBSUNULg0KDQpUaGlzIGlzIGEgdGVtcGxh
dGUgZm9yIHRoZSBmdXR1cmUuIFRoZSBjb2RlIHdpdGggKmRwIGlzIG11Y2ggc2hvcnRlcg0KdGhh
biB3aXRoIGhvc3RfbXNyX2RvbWFpbl9wb2xpY3kuDQoNCj4gDQo+ID4gZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL2FzbS14ODYvbXNyLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21zci5oDQo+ID4g
aW5kZXggOTI4ZjFjYzQ1NC4uODQwMWQzNzZjMyAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vaW5jbHVk
ZS9hc20teDg2L21zci5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tc3IuaA0KPiA+
IEBAIC0yMjAsNiArMjIwLDE0IEBAIHN0cnVjdCBtc3JfZG9tYWluX3BvbGljeQ0KPiA+ICAgICAg
fSBwbGFmb3JtX2luZm87DQo+ID4gIH07DQo+ID4gIA0KPiA+ICsvKiBSQVcgbXNyIGRvbWFpbiBw
b2xpY3k6IGNvbnRhaW5zIHRoZSBhY3R1YWwgdmFsdWVzIGZyb20gSC9XIE1TUnMgKi8NCj4gPiAr
ZXh0ZXJuIG1zcl9kb21haW5fcG9saWN5IHJhd19tc3JfZG9tYWluX3BvbGljeTsNCj4gPiArLyoN
Cj4gPiArICogSE9TVCBtc3IgZG9tYWluIHBvbGljeTogZmVhdHVyZXMgdGhhdCBYZW4gYWN0dWFs
bHkgZGVjaWRlZCB0byB1c2UsDQo+ID4gKyAqIGEgc3Vic2V0IG9mIFJBVyBwb2xpY3kuDQo+ID4g
KyAqLw0KPiA+ICtleHRlcm4gbXNyX2RvbWFpbl9wb2xpY3kgaG9zdF9tc3JfZG9tYWluX3BvbGlj
eTsNCj4gDQo+IEFyZW4ndCB5b3UgbWlzc2luZyBhICdzdHJ1Y3QnIGhlcmU/IEkgZG9uJ3Qgc2Vl
IGFueSB0eXBlZGVmIGZvciBzdHJ1Y3QNCj4gbXNyX2RvbWFpbl9wb2xpY3kuDQoNCkkgZG9uJ3Qg
a25vdyBob3cgSSBtaXNzZWQgdGhpcy4gWW91IGFyZSByaWdodCwgJ3N0cnVjdCcgaXMgbWFuZGF0
b3J5Lg0KDQotLSANClRoYW5rcywNClNlcmdleQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
