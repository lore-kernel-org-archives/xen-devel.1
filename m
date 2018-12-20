From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
Subject: Re: [RFC PATCH 4/6] vm_event: Use slotted channels for
 sync requests.
Date: Thu, 20 Dec 2018 14:25:45 +0000
Message-ID: <2d3e6587946c1f82e07303876e6d03a4dc2f525b.camel@bitdefender.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <01b5a66439239a23384c7939d961edbca81e41ae.1545245243.git.ppircalabu@bitdefender.com>
 <a043ec46eed445c28b24e84fc7822019@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=71O5=O5=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1gZzGn-0001nw-Oz
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 14:25:49 +0000
In-Reply-To: <a043ec46eed445c28b24e84fc7822019@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Content-ID: <031C30B13D5A1446A857BC759864ED47@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMDE4LTEyLTIwIGF0IDEyOjA1ICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
ID4gVGhlIG1lbW9yeSBmb3IgdGhlIGFzeW5jaHJvbm91cyByaW5nIGFuZCB0aGUgc3luY2hyb25v
dXMgY2hhbm5lbHMNCj4gPiB3aWxsDQo+ID4gYmUgYWxsb2NhdGVkIGZyb20gZG9taGVhcCBhbmQg
bWFwcGVkIHRvIHRoZSBjb250cm9sbGluZyBkb21haW4NCj4gPiB1c2luZyB0aGUNCj4gPiBmb3Jl
aWdubWVtb3J5X21hcF9yZXNvdXJjZSBpbnRlcmZhY2UuIFVubGlrZSB0aGUgY3VycmVudA0KPiA+
IGltcGxlbWVudGF0aW9uLA0KPiA+IHRoZSBhbGxvY2F0ZWQgcGFnZXMgYXJlIG5vdCBwYXJ0IG9m
IHRoZSB0YXJnZXQgRG9tVSwgc28gdGhleSB3aWxsDQo+ID4gbm90IGJlDQo+ID4gcmVjbGFpbWVk
IHdoZW4gdGhlIHZtX2V2ZW50IGRvbWFpbiBpcyBkaXNhYmxlZC4NCj4gDQo+IFdoeSByZS1pbnZl
bnQgdGhlIHdoZWVsIGhlcmU/IFRoZSBpb3JlcSBpbmZyYXN0cnVjdHVyZSBhbHJlYWR5IGRvZXMN
Cj4gcHJldHR5IG11Y2ggZXZlcnl0aGluZyB5b3UgbmVlZCBBRkFJQ1QuDQo+IA0KPiAgIFBhdWwN
Cg0KSSB3YW50ZWQgcHJlc2V2ZSBhcyBtdWNoIGFzIHBvc3NpYmxlIGZyb20gdGhlIGV4aXN0aW5n
IHZtX2V2ZW50IERPTUNUTA0KaW50ZXJmYWNlIGFuZCBhZGQgb25seSB0aGUgbmVjZXNzYXJ5IGNv
ZGUgdG8gYWxsb2NhdGUgYW5kIG1hcCB0aGUNCnZtX2V2ZW50X3BhZ2VzLg0KQWxzbywgdG8gbXkg
a25vd2xlZGdlLCB0aGUgaW9yZXEgc2VydmVyIGlzIG9ubHkgc3VwcG9ydGVkIGZvciB4ODYgaHZt
DQp0YXJnZXRzLiBJIGRpZG4ndCB3YW50IHRvIGFkZCBhbiBleHRyYSBsaW1pdGF0aW9uIHRvIHRo
ZSB2bV9ldmVudA0Kc3lzdGVtLg0KLy9QZXRyZQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
