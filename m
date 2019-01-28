From: "Woods, Brian" <Brian.Woods@amd.com>
Subject: Re: [PATCH v3] x86/AMD: flush TLB after ucode update
Date: Mon, 28 Jan 2019 15:51:43 +0000
Message-ID: <b7652f58-1ccd-b6ae-4d08-773bbdb47c56@amd.com>
References: <5C4ED0A302000078002119D5@prv1-mh.provo.novell.com>
 <b8beb440-ef96-1764-4bac-fbd4d5649be1@citrix.com>
 <5C4F0F7A0200007800211C54@prv1-mh.provo.novell.com>
 <53c2c231-8996-eb8f-7463-713f4c36f68b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s5Vo=QE=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1go9CP-0002MO-Th
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 15:51:50 +0000
In-Reply-To: <53c2c231-8996-eb8f-7463-713f4c36f68b@citrix.com>
Content-Language: en-US
Content-ID: <A346D488B013434AA96A4A8C6B4FB434@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMS8yOC8xOSA4OjI1IEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPiBPbiAyOC8wMS8yMDE5
IDE0OjE5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21pY3Jv
Y29kZV9hbWQuYw0KPj4+PiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2FtZC5jDQo+Pj4+
IEBAIC0yMTgsNiArMjE4LDEyIEBAIHN0YXRpYyBpbnQgYXBwbHlfbWljcm9jb2RlKHVuc2lnbmVk
IGludA0KPj4+PiAgIA0KPj4+PiAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZtaWNyb2Nv
ZGVfdXBkYXRlX2xvY2ssIGZsYWdzKTsNCj4+Pj4gICANCj4+Pj4gKyAgICAvKg0KPj4+PiArICAg
ICAqIEV4cGVyaW1lbnRhbGx5IHRoaXMgaGVscHMgd2l0aCBwZXJmb3JtYW5jZSBpc3N1ZXMgb24g
YXQgbGVhc3QgY2VydGFpbg0KPj4+PiArICAgICAqIEZhbTE1IG1vZGVscy4NCj4+PiBUaGlzIGlz
IG5vIGxvbmdlciBleHBlcmltZW50YWwsIG5vdyB0aGF0IHdlIHVuZGVyc3RhbmQgd2h5LiAgSG93
IGFib3V0Og0KPj4+DQo+Pj4gIlNvbWUgcHJvY2Vzc29ycyBsZWF2ZSB0aGUgdWNvZGUgYmxvYiBt
YXBwaW5nIGFzIFVDIGFmdGVyIHRoZSB1cGRhdGUuDQo+Pj4gRmx1c2ggdGhlIG1hcHBpbmcgdG8g
cmVnYWluIG5vcm1hbCBjYWNoZWFiaWxpdHkiID8NCj4+Pg0KPj4+IFRoYXQgd2F5LCBpdHMgYWxz
byBzbGlnaHRseSBsZXNzIGNyeXB0aWMgaW4gdGhlIGNvZGUuDQo+PiBJIGRpZCBjb25zaWRlciBy
ZS13b3JkaW5nIHRoZSBjb21tZW50LCBidXQgZGVjaWRlZCB0byBsZWF2ZSBpdCB1bmNoYW5nZWQs
DQo+PiBmb3IgdGhlIHdheSB5b3Ugd29yZCBpdCBub3QgaGF2aW5nIHB1YmxpYyBwcm9vZiBhbnl3
aGVyZSAoZm9yIG5vdyBhdCBsZWFzdCkuDQo+PiBJJ20gZmluZSB0byBjaGFuZ2UgdGhlIGNvbW1l
bnQsIGlmIEkgY2FuIGV4cGxpY2l0IGdvLWFoZWFkIGZyb20gQU1ELiBCcmlhbiwNCj4+IFN1cmF2
ZWU/DQo+IA0KPiBQcmVmZXJhYmx5IHdpdGggdGhlIGFtZW5kZWQgd29yZGluZywgKGJ1dCB1bHRp
bWF0ZWx5LCBhcyBhZ3JlZWQgdXBvbg0KPiB3aXRoIEFNRCksIFJldmlld2VkLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiANCkxpa2V3aXNlLA0KUmV2aWV3
ZWQtYnk6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
