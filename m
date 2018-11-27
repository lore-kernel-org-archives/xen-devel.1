From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH] CODING_STYLE: explicitly call out label
 indentation
Date: Tue, 27 Nov 2018 17:09:15 +0000
Message-ID: <57FE1FC9-1014-47C2-99BC-D7501766B688@citrix.com>
References: <5BFBB70502000078001FFBDC@prv1-mh.provo.novell.com>
 <20181127152313.aicyygwdipch3fbf@zion.uk.xensource.com>
 <5BFD656A02000078002006EA@prv1-mh.provo.novell.com>
 <23549.28476.853916.355490@mariner.uk.xensource.com>
 <35a60c3a-8b80-c5e8-48e9-f65fb9828364@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tVVo=OG=citrix.com=prvs=862dda752=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gRgrP-00005Y-0V
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 17:09:19 +0000
In-Reply-To: <35a60c3a-8b80-c5e8-48e9-f65fb9828364@citrix.com>
Content-Language: en-US
Content-ID: <F42DC678AC263140AE9B70BA1C777681@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gTm92IDI3LCAyMDE4LCBhdCA0OjQ4IFBNLCBBbmRyZXcgQ29vcGVyIDxBbmRyZXcu
Q29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDI3LzExLzIwMTggMTY6MjIsIElh
biBKYWNrc29uIHdyb3RlOg0KPj4gU2luY2UgdGhlcmUgd2FzIHNvbWUgY29uZnVzaW9uIGFib3V0
IHdoYXQgd2UgYXJlIHRhbGtpbmcgYWJvdXQsIHNlZQ0KPj4gYmVsb3cuICBPYnZpb3VzbHkgdGhl
IGRpZmYgb3V0cHV0IGluIG15IGAxJyB0ZXN0IGNhc2VzIGlzDQo+PiBwcmVmZXJlYWJsZS4gICBO
b3RlIHRoYXQgYGdpdCBkaWZmJyBkb2VzIHRoZSBzYW1lIHRoaW5nIGFzIGRpZmYgLXANCj4+IChh
bmQgaXQgZG9lc24ndCBldmVuIG5lZWQgYSAtcCBvcHRpb24gdG8gZG8gaXQpLg0KPiANCj4gQWZ0
ZXIgc29tZSBpbnZlc3RpZ2F0aW9uLCBnaXQgZG9lcyB0aGUgY29ycmVjdCB0aGluZyB3aGVuIHlv
dSBhc2sgdG8NCj4gdHJlYXQgYyBmaWxlcyBhcyBjIGZpbGVzLg0KPiANCj4gYW5kcmV3Y29vcEBh
bmRyZXdjb29wOn4kIGNhdCAuY29uZmlnL2dpdC9hdHRyaWJ1dGVzDQo+ICouW2hjXSBkaWZmPWNw
cA0KPiANCj4gVGhpcyBoYXMgdGhlIGFkZGl0aW9uYWwgc2lkZSBlZmZlY3Qgb2YgbWFraW5nIGBn
aXQgZGlmZiAtLWNvbG9yLXdvcmRzYA0KPiBhbmQgZnJpZW5kcyBmYXIgbW9yZSBsZWdpYmxlIGFu
ZCBuaWNlIHRvIHVzZS4gIEl0cyBhIHNoYW1lIHRoaXMgaXNuJ3QNCj4gdGhlIGRlZmF1bHQuDQo+
IA0KPj4gSSBhbHNvIG9ic2VydmUgdGhhdCBieSBkZWZhdWx0LCBlbWFjcyB3YW50cyB0byBpbmRl
bnQgdGhlIGxhYmVsIGJ5IDENCj4+IGNoYXJhY3RlciAtIGV2ZW4gdGhvdWdoIHVzdWFsbHkgaXQg
bGlrZXMgdG8gYWxpZ24gbGFiZWxzIHRvIHRoZSBMSFMgb2YNCj4+IHRoZSBlbmNsb3NpbmcgYmxv
Y2suICBQcmVzdW1hYmx5IGZvciB0aGlzIHJlYXNvbi4NCj4gDQo+IEFuZCBhZnRlciBzb21lIGlu
dmVzdGlnYXRpb24sIGVtYWNzIGRvZXMgdGhlIHdyb25nIHRoaW5nIGluIHRoZSBYZW4gdHJlZQ0K
PiBiZWNhdXNlIHdlIGV4cGxpY2l0bHkgYXNrIGZvciBCU0Qgc3R5bGUgaW4gdGhlIGxvY2FsIGJs
b2NrLg0KPiANCj4gV2Ugc2hvdWxkIG1ha2UgYSBjaG9pY2UsIHRoZW4gZml4IG91ciBhdXRvbWF0
aWMgdG9vbGluZyB0byBub3QgZm9yY2UNCj4gY29kZSB0byBiZSBub24tY29tcGxpYW50Lg0KDQpG
V0lXLCBoYXZpbmcgbGFiZWxzIGluIGNvbHVtbiAwIGFsd2F5cyBsb29rZWQgd3JvbmcgdG8gbWUu
ICBJ4oCZbSBoYXBweSB0byBjaGFuZ2UgdGhlIHN0eWxlIHRvIHJlcXVpcmUgYXQgbGVhc3QgMSBz
cGFjZSwgYnV0IEnigJltICpub3QqIGhhcHB5IHRvIGhhdmUgYSBzdHlsZSBlbmZvcmNlZCB0aGF0
IGNvbnRyYWRpY3RzIHdoYXQgd2XigJl2ZSB3cml0dGVuIGluIHRoZSBlbWFjcyBzdHlsZSBibG9j
a3MgYXQgdGhlIGJvdHRvbSBvZiBhbGwgdGhlIGZpbGVzLg0KDQpXb3VsZCBpdCBiZSBPSyBpZiB3
ZSANCiogQ2hlY2tlZCBpbiB0aGlzIHBhdGNoLCBidXQNCiogV2VyZW7igJl0IHBpY2t5IGFib3V0
IGVuZm9yY2luZyBpdCB5ZXQNCiogTG9va2VkIGludG8gYW4gZWZmaWNpZW50IHdheSB0byBnZXQg
YSBzdWl0YWJsZSBzdHlsZSB1cGRhdGU/DQoNCiAtR2VvcmdlCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
