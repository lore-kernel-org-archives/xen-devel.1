From: Christian Lindig <christian.lindig@citrix.com>
Subject: Re: [PATCH RFC] ocaml: Fix compile with ocaml 4.06,
 use unsafe strings
Date: Fri, 26 Jan 2018 11:47:34 +0000
Message-ID: <0079C722-DC8F-4930-8E85-42DAE5E8C979@citrix.com>
References: <20180126085208.15212-1-git@johnthomson.fastmail.com.au>
 <alpine.LFD.2.21.1801260903220.28542@algedi.dur.ac.uk>
 <DD256C43-6511-4327-A611-DDE1784764E7@citrix.com>
 <20180126114306.mpklwqjlworpuewf@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zvi/=ev=citrix.com=prvs=557898145=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1ef2Tt-0008D2-Oa
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2018 11:47:41 +0000
In-Reply-To: <20180126114306.mpklwqjlworpuewf@citrix.com>
Content-Language: en-US
Content-ID: <7F5CDC87FB6C1C47B8A84DAD6DE1B185@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Marcello Seri <marcello.seri@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>, John Thomson <git@johnthomson.fastmail.com.au>, M A Young <m.a.young@durham.ac.uk>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gMjYuIEphbiAyMDE4LCBhdCAxMTo0MywgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIEphbiAyNiwgMjAxOCBhdCAwOToyOToyMEFNICsw
MDAwLCBDaHJpc3RpYW4gTGluZGlnIHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiAyNi4gSmFuIDIw
MTgsIGF0IDA5OjA5LCBNIEEgWW91bmcgPG0uYS55b3VuZ0BkdXJoYW0uYWMudWs+IHdyb3RlOg0K
Pj4+IA0KPj4+IE9uIEZyaSwgMjYgSmFuIDIwMTgsIEpvaG4gVGhvbXNvbiB3cm90ZToNCj4+PiAN
Cj4+Pj4gVXNlIGF1dG9jb25mIHRvIHRlc3QgaWYgb2NhbWwgdmVyc2lvbiA+PSA0LjAyDQo+Pj4+
IElmIHNvLCB1c2UgLXVuc2FmZS1zdHJpbmcgZm9yIG9jYW1sb3B0IGFuZCBvY2FtbGMNCj4+Pj4g
DQo+Pj4+IEJ5dGVzICYgc2FmZS1zdHJpbmcgd2VyZSBpbnRyb2R1Y2VkIGluIG9jYW1sIDQuMDIg
KDIwMTUtMDctMjcpDQo+Pj4+IA0KPj4+PiBXaXRoIG9jYW1sIDQuMDYsIC1zYWZlLXN0cmluZyBp
cyBub3cgZGVmYXVsdA0KPj4+PiBUaGlzIHNlcGFyYXRlcyB0aGUgdHlwZXMgYnl0ZXMgKG11dGFi
bGUgc3RyaW5nKSBhbmQgc3RyaW5nDQo+Pj4gDQo+Pj4gRm9yIEZlZG9yYSBSYXdoaWRlLCB3aGlj
aCBoYXMgb2NhbWwgNC4wNiwgd2UgY2FtZSB1cCB3aXRoIGEgcGF0Y2ggdG8gbWFrZSANCj4+PiB4
ZW4gb2NhbWwgc2FmZS1zdHJpbmdzIGNvbXBsaWFudCAod2hpY2ggSSBoYXZlbid0IGdvdCBhcm91
bmQgdG8gc3VibWl0dGluZyANCj4+PiB0byB0aGlzIGxpc3QgeWV0KS4NCj4+PiANCj4+PiBUaGUg
cGF0Y2ggaXMgYXQNCj4+PiBodHRwczovL3NyYy5mZWRvcmFwcm9qZWN0Lm9yZy9ycG1zL3hlbi9i
bG9iL21hc3Rlci9mL3hlbi5vY2FtbC5zYWZlLXN0cmluZ3MucGF0Y2gNCj4+PiB3aXRoIHRoZSBy
ZWxhdGVkIEZlZG9yYSBidWcgYXQNCj4+PiBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hv
d19idWcuY2dpP2lkPTE1MjY3MDMNCj4+PiANCj4+PiAJTWljaGFlbCBZb3VuZw0KPj4gDQo+PiBU
aGUgcGF0Y2ggbG9va3MgZ29vZCBhbmQgSSB3b3VsZCBwcmVmZXIgdG8gdGFrZSBpdCB0aGFuIHRv
IHVzZSAtdW5zYWZlLXN0cmluZyB3aGljaCBpc27igJl0IGEgc29sdXRpb24gaW4gdGhlIGxvbmcg
cnVuLg0KPj4gDQo+IA0KPiBIaSBDaHJpc3RpYW4NCj4gDQo+IElzIHRoYXQgYW4gYWNrPw0KPiAN
Cj4gQ291bGQgeW91IHBsZWFzZSBpbiBmdXR1cmUgZXhwbGljaXRseSBnaXZlIGFuIEFja2VkLWJ5
IG9yIFJldmlld2VkLWJ5DQo+IHRhZyBzbyB0aGF0IGNvbW1pdHRlcnMga25vdyB0aGV5IGNhbiBh
cHBseSB0aGUgcHJvcG9zZWQgcGF0Y2ggZGlyZWN0bHk/DQoNCg0KU29ycnksIEkgd2FzIGFzc3Vt
aW5nIGJlY2F1c2UgdGhpcyBpcyBhbiBSRkMgdGhhdCB3ZSBhcmUgaW4gYSBnZW5lcmFsIGRpc2N1
c3Npb24uIEFsc28sIHRoZSBwYXRjaCB3YXMgbm90IHBhcnQgb2YgdGhlIG1lc3NhZ2UuIEkgc3Rp
bGwgcmV2aWV3ZWQgaXQuDQoNClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3Rp
YW4ubGluZGlnQGNpdHJpeC5jb20+DQoNCuKAlCBDaHJpc3RpYW4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
