From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 1/8] viridian: add init hooks
Date: Thu, 3 Jan 2019 09:07:52 +0000
Message-ID: <15c77645353348ee83194138812a619f@AMSPEX02CL03.citrite.net>
References: <20181220163345.10708-1-paul.durrant@citrix.com>
 <20181220163345.10708-2-paul.durrant@citrix.com>
 <08055d6c-0c5b-85cc-b7f6-444d5da0a56a@citrix.com>
 <bd9e0ba5-4ad7-c98e-0504-c56e13d6f239@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ojv4=PL=citrix.com=prvs=89931c2f2=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1geyyq-0000Nr-8B
 for xen-devel@lists.xenproject.org; Thu, 03 Jan 2019 09:07:56 +0000
In-Reply-To: <bd9e0ba5-4ad7-c98e-0504-c56e13d6f239@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyDQo+IFNl
bnQ6IDAyIEphbnVhcnkgMjAxOSAxNzozNw0KPiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJh
bnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT47IFJvZ2VyDQo+IFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggMS84XSB2aXJpZGlhbjogYWRkIGluaXQgaG9va3MNCj4g
DQo+IE9uIDAyLzAxLzIwMTkgMTY6MDgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+ID4gT24gMjAv
MTIvMjAxOCAxNjozMywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+PiBUaGlzIHBhdGNoIGFkZHMg
ZG9tYWluIGFuZCB2Y3B1IGluaXQgaG9va3MgZm9yIHZpcmlkaWFuIGZlYXR1cmVzLiBUaGUNCj4g
aW5pdA0KPiA+PiBob29rcyBkbyBub3QgeWV0IGRvIGFueXRoaW5nOyB0aGV5IHdpbGwgYmUgYWRk
ZWQgdG8gYnkgc3Vic2VxdWVudA0KPiBwYXRjaGVzLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5
OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KPiA+IFBsZWFzZSBjYW4g
d2Ugc3RhcnQgYnkgZml4aW5nIHRoZSBjdXJyZW50LCBicm9rZW4sIGluaXRpYWxpc2F0aW9uIGFu
ZA0KPiA+IGRlc3RydWN0aW9uIGxvZ2ljID8NCj4gPg0KPiA+IFRvIGdldCByaWQgb2YgRE9NQ1RM
X3NldG1heHZjcHVzLCB3ZSBuZWVkIHRoZSAqX2Rlc3Ryb3koKSBsb2dpYyB0byBiZQ0KPiA+IGZ1
bGx5IGlkZW1wb3RlbnQuwqAgQWxzbywgdmlyaWRpYW5fZG9tYWluX2RlaW5pdCgpIHNob3VsZCBu
b3QgY2FsbCBpbnRvDQo+ID4gdmlyaWRpYW5fdmNwdV9kZWluaXQoKSwgYW5kIHZpcmlkaWFuX3Zj
cHVfZGVpbml0KCkgc2hvdWxkbid0IGJlIGZha2luZw0KPiA+IHVwIGEgd3JpdGUgdG8gdGhlIGFz
c2lzdCBwYWdlLg0KPiA+DQo+ID4gQUZBSUNULCB0aGUgZGVpbml0IHBhdGggaXMgYWxsIGVudGly
ZWx5IHBvaW50bGVzcyBhdCB0aGUgbW9tZW50IGFuZCBjYW4NCj4gPiBiZSBkZWxldGVkLg0KPiAN
Cj4gR2l2ZW4gdGhhdCB3ZSBhcmUgbm93IGdvaW5nIHRvIGJlIGFsbG9jYXRpbmcgbm9uLXRyaXZp
YWwgc3RydWN0dXJlcyBmb3INCj4gdmlyaWRpYW4gZG9tYWlucywgSSdkIGxpa2UgdG8gZmxvYXQg
dGhlIGlkZWEgb2YgY2hhbmdpbmcgdmlyaWRpYW4NCj4gaW5pdGlhbGlzYXRpb24gdG8gYmUgYSBk
b21haW5jcmVhdGUgZmxhZywgcmF0aGVyIHRoYW4gYmxpbmRseSBhc3N1bWluZw0KPiB0aGF0IGFs
bCBIVk0gZ3Vlc3RzIHdhbnQgaXQuDQoNClRoYXQgd291bGQgY2VydGFpbmx5IGJlIGNsZWFuZXIg
YnV0IHNvdW5kcyBub24tdHJpdmlhbC4NCg0KPiANCj4gSSB0aGluayB0aGlzIGlzIGdvaW5nIHRv
IGJlIG5lY2Vzc2FyeSBwYXJ0IG9mIGZpeGluZyBDUFVJRCBwb2xpY3kNCj4gZGVyaXZhdGlvbiBp
biB0aGUgbG9uZ3Rlcm0sIGJlY2F1c2UgcmVnZW5lcmF0aW5nIHRoZSBwb2xpY3kgd2hlbg0KPiBI
Vk1fUEFSQU1fVklSSURJQU4gY2hhbmdlcyBpc24ndCB2aWFibGUuDQo+IA0KDQpJbmRlZWQsIGJ1
dCBhZ2FpbiBpdCdzICdsb25ndGVybScuDQoNCiAgUGF1bA0KDQo+IH5BbmRyZXcNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
