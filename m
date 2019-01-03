From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 1/8] viridian: add init hooks
Date: Thu, 3 Jan 2019 09:13:22 +0000
Message-ID: <9185c9b25ca94f2e940cc972ab1f5fef@AMSPEX02CL03.citrite.net>
References: <20181220163345.10708-1-paul.durrant@citrix.com>
 <20181220163345.10708-2-paul.durrant@citrix.com>
 <08055d6c-0c5b-85cc-b7f6-444d5da0a56a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ojv4=PL=citrix.com=prvs=89931c2f2=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gez4A-0001AX-0H
 for xen-devel@lists.xenproject.org; Thu, 03 Jan 2019 09:13:26 +0000
In-Reply-To: <08055d6c-0c5b-85cc-b7f6-444d5da0a56a@citrix.com>
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
bnQ6IDAyIEphbnVhcnkgMjAxOSAxNjowOA0KPiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJh
bnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT47IFJvZ2VyDQo+IFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMS84XSB2aXJpZGlhbjogYWRkIGluaXQgaG9va3MNCj4gDQo+IE9uIDIwLzEy
LzIwMTggMTY6MzMsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIGFkZHMgZG9t
YWluIGFuZCB2Y3B1IGluaXQgaG9va3MgZm9yIHZpcmlkaWFuIGZlYXR1cmVzLiBUaGUNCj4gaW5p
dA0KPiA+IGhvb2tzIGRvIG5vdCB5ZXQgZG8gYW55dGhpbmc7IHRoZXkgd2lsbCBiZSBhZGRlZCB0
byBieSBzdWJzZXF1ZW50DQo+IHBhdGNoZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVs
IER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KPiANCj4gUGxlYXNlIGNhbiB3ZSBz
dGFydCBieSBmaXhpbmcgdGhlIGN1cnJlbnQsIGJyb2tlbiwgaW5pdGlhbGlzYXRpb24gYW5kDQo+
IGRlc3RydWN0aW9uIGxvZ2ljID8NCj4gDQo+IFRvIGdldCByaWQgb2YgRE9NQ1RMX3NldG1heHZj
cHVzLCB3ZSBuZWVkIHRoZSAqX2Rlc3Ryb3koKSBsb2dpYyB0byBiZQ0KPiBmdWxseSBpZGVtcG90
ZW50LsKgIEFsc28sIHZpcmlkaWFuX2RvbWFpbl9kZWluaXQoKSBzaG91bGQgbm90IGNhbGwgaW50
bw0KPiB2aXJpZGlhbl92Y3B1X2RlaW5pdCgpLCBhbmQgdmlyaWRpYW5fdmNwdV9kZWluaXQoKSBz
aG91bGRuJ3QgYmUgZmFraW5nDQo+IHVwIGEgd3JpdGUgdG8gdGhlIGFzc2lzdCBwYWdlLg0KDQpU
aGUgZGVpbml0IGNhbGxpbmcgbG9naWMgaXMgbm90IGNoYW5nZWQgYnkgdGhpcyBwYXRjaC4uLiB0
aGUgZG9tYWluIGRlaW5pdCBmdW5jdGlvbiBoYXMgYWx3YXlzIGNhbGxlZCBpbnRvIHRoZSB2Y3B1
IGRlaW5pdCBmdW5jdGlvbi4gSSBjYW4gdHJ5IGRyb3BwaW5nIGl0IGlmIHlvdSB3YW50Lg0KVGhl
IHplcm8gd3JpdGUgdG8gdGhlIGFzc2lzdCBwYWdlIE1TUiBpcyB0aGVyZSB0byBjYXVzZSB0aGUg
bWFwcGluZyB0byBiZSBmcmVlZCwgd2hpY2ggaXMgbmVjZXNzYXJ5IHRvIGF2b2lkIGEgbGVhay4g
SXQgaXMgYSBzb21ld2hhdCBoYWNreSB3YXkgb2YgZG9pbmcgaXQgdGhvdWdoLCBJIGFncmVlLCBh
bmQgaXQgaXMgY2hhbmdlZCBieSBhIGxhdGVyIHBhdGNoIGluIHRoZSBzZXJpZXMuDQoNCj4gDQo+
IEFGQUlDVCwgdGhlIGRlaW5pdCBwYXRoIGlzIGFsbCBlbnRpcmVseSBwb2ludGxlc3MgYXQgdGhl
IG1vbWVudCBhbmQgY2FuDQo+IGJlIGRlbGV0ZWQuDQo+IA0KDQpJdCBpcyBub3QgcmVxdWlyZWQg
YXQgdGhpcyBzdGFnZSwgYnV0IGl0IHdpbGwgYmUgcmVxdWlyZWQgbGF0ZXIgYW5kIEkgZ2VuZXJh
bGx5IHByZWZlciB0byBpbnRyb2R1Y2UgbWlycm9yZWQgcGFpcnMgb2YgaG9va3MgaW4gdGhlIHNh
bWUgcGF0Y2ggcmF0aGVyIHRoYW4gc2VwYXJhdGUgcGF0Y2hlcyBpbiB0aGUgc2FtZSBzZXJpZXMu
DQoNCiAgUGF1bA0KDQogfkFuZHJldw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
