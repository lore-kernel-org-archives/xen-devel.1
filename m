From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v6 12/14] memory: add get_paged_gfn() as a
 wrapper...
Date: Wed, 12 Sep 2018 10:08:04 +0000
Message-ID: <da6c6860939749108456c41aadfbf369@AMSPEX02CL03.citrite.net>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-13-paul.durrant@citrix.com>
 <5B97D78602000078001E7620@prv1-mh.provo.novell.com>
 <3cae8215da44446487479f24527a5387@AMSPEX02CL03.citrite.net>
 <5B98D92B02000078001E7B17@prv1-mh.provo.novell.com>
 <66659ea9-6b54-f27c-0aac-cd33b3bf44dc@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ifft=l2=citrix.com=prvs=7869af71c=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1g024I-0006TX-Ve
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 10:08:19 +0000
In-Reply-To: <66659ea9-6b54-f27c-0aac-cd33b3bf44dc@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZW9yZ2UgRHVubGFwIFttYWls
dG86Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tXQ0KPiBTZW50OiAxMiBTZXB0ZW1iZXIgMjAxOCAx
MTowMg0KPiBUbzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPjsgUGF1bCBEdXJyYW50
DQo+IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXgu
Y29tPjsgSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBXZWkNCj4gTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPjsgeGVuLQ0KPiBkZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPjsg
S29ucmFkIFJ6ZXN6dXRlayBXaWxrDQo+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgVGltIChY
ZW4ub3JnKSA8dGltQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0gg
djYgMTIvMTRdIG1lbW9yeTogYWRkIGdldF9wYWdlZF9nZm4oKSBhcw0KPiBhIHdyYXBwZXIuLi4N
Cj4gDQo+IE9uIDA5LzEyLzIwMTggMTA6MTUgQU0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+Pj4+
IE9uIDEyLjA5LjE4IGF0IDExOjEwLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOg0K
PiA+Pj4gRnJvbTogWGVuLWRldmVsIFttYWlsdG86eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVu
cHJvamVjdC5vcmddIE9uDQo+IEJlaGFsZg0KPiA+Pj4gT2YgSmFuIEJldWxpY2gNCj4gPj4+IFNl
bnQ6IDExIFNlcHRlbWJlciAyMDE4IDE1OjU2DQo+ID4+Pg0KPiA+Pj4+Pj4gT24gMjMuMDguMTgg
YXQgMTE6NDcsIDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6DQo+ID4+Pj4gLi4uZm9y
IHNvbWUgdXNlcyBvZiBnZXRfcGFnZV9mcm9tX2dmbigpLg0KPiA+Pj4+DQo+ID4+Pj4gVGhlcmUg
YXJlIG1hbnkgb2NjdXJlbmNlcyBvZiB0aGUgZm9sbG93aW5nIHBhdHRlcm4gaW4gdGhlIGNvZGU6
DQo+ID4+Pj4NCj4gPj4+PiAgICAgcSA9IDxyZWFkb25seSBsb29rLXVwPiA/IFAyTV9BTExPQyA6
IFAyTV9VTlNIQVJFOw0KPiA+Pj4NCj4gPj4+IEVzcGVjaWFsbHkgd2l0aCB0aGlzIFVOU0hBUkUg
aW4gbWluZCAtIGlzICJwYWdlZCIgaW4gdGhlIGhlbHBlcg0KPiA+Pj4gZnVuY3Rpb24ncyBuYW1l
IHJlYWxseSBzdWl0YWJsZT8gU2luY2Ugd2UgKEkgdGhpbmspIGFscmVhZHkgaGF2ZQ0KPiA+Pj4g
Z2V0X2dmbigpLCBob3cgYWJvdXQgdHJ5X2dldF9nZm4oKT8NCj4gPj4NCj4gPj4gVGhhdCBuYW1l
IG1heSBiZSBhIGxpdHRsZSBtaXNsZWFkaW5nIHNpbmNlIGl0IHN1Z2dlc3RzIGEgY2xvc2UgZnVu
Y3Rpb25hbA0KPiA+PiByZWxhdGlvbnNoaXAgd2l0aCBnZXRfZ2ZuKCkgd2hlcmVhcyBpdCBkb2Vz
IG1vcmUgdGhhbiB0aGF0LiBIb3cgYWJvdXQNCj4gPj4gdHJ5X2dldF9wYWdlX2Zyb21fZ2ZuKCk/
DQo+ID4NCj4gPiBGaW5lIHdpdGggbWU7IEdlb3JnZT8NCj4gDQo+IEF0IHRoZSByaXNrIG9mIGJp
a2Ugc2hlZGRpbmcuLiAidHJ5IiB0byBtZSBtZWFucyBvbmx5IHBhc3MvZmFpbCwgd2l0aCBubw0K
PiBzaWRlIGVmZmVjdHMsIGFuZCB3aXRoIG5vIHBlcm1pc3Npb25zIGNoZWNrcy4gIFdoYXQgYWJv
dXQNCj4gImNoZWNrX2FuZF9nZXRfcGFnZV9mcm9tX2dmbigpIj8NCj4gDQo+IEknZCBwcmVmZXIg
J2NoZWNrJyBidXQgaWYgYW55b25lIG9iamVjdHMgSSdkIHJhdGhlciBqdXN0IGdvIHdpdGggJ3Ry
eScNCj4gYW5kIGdldCB0aGluZ3MgaW4gLS0gdGhlIGNvZGUgaXMgYSBkZWZpbml0ZSBpbXByb3Zl
bWVudC4NCj4gDQoNCkphbj8NCg0KICBQYXVsDQoNCj4gIC1HZW9yZ2UNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
