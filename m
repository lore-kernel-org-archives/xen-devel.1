From: James <james@bromium.com>
Subject: Re: [PATCH 23/25] argo: signal x86 HVM and ARM via VIRQ
Date: Wed, 12 Dec 2018 14:49:00 +0000
Message-ID: <1195030e-0945-a8a8-be32-2660453e3a0a@bromium.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-24-git-send-email-christopher.w.clark@gmail.com>
 <23042bc2-d74f-ff7d-5e6a-1bd21de2ddb7@arm.com>
 <CACMJ4GaOPCvzVrCThFGQ79qqMs75vbysuVX4ur0EsfMMPPdXUg@mail.gmail.com>
 <0a20c215d12342d99f5a3b1c06bb9440@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PvI6=OV=bromium.com=james.mckenzie@srs-us1.protection.inumbo.net>)
 id 1gX5ow-0007Ao-1n
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 14:49:06 +0000
In-Reply-To: <0a20c215d12342d99f5a3b1c06bb9440@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Content-ID: <8BA5CD18B302A546A611ADCBFAB0C41B@namprd13.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Christopher Clark' <christopher.w.clark@gmail.com>, Julien Grall <Julien.Grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, James McKenzie <voreekf@madingley.org>, Rich Persaud <persaur@gmail.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, "nd@arm.com" <nd@arm.com>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

SSB0aGluayB0aGVyZSBhcmUgdHdvIGlzc3VlczoNCg0KMSkgVklSUSB2cyBzb21lIG90aGVyIHNv
cnQgb2YgZXZlbnQgY2hhbm5lbA0KDQogICBGb3IgUFYgZ3Vlc3RzIHdlIG9yaWdpbmFsbHkgY2hv
c2UgYSBWSVJRIGluIG9yZGVyIHRvIGhhdmUgYSB3ZWxsIGtub3duDQogICBudW1iZXIgYWdhaW5z
dCB3aGljaCB0aGUga2VybmVsIGRyaXZlciBjb3VsZCBiaW5kLCBzbyB0aGF0IGl0IHdhc24ndA0K
ICAgZGVwZW5kZW50IG9uIGFueSBvZiB0aGUgb3RoZXIgaW50ZXJkb21haW4gY29tbXVuaWNhdGlv
biBzeXN0ZW1zIChzdWNoDQogICBhcyB4ZW5zdG9yZSkgdG8gZmluZCB0aGUgY29ycmVjdCBjaGFu
bmVsLg0KDQogICBWSVJRcyBhbmQgZXZlbnRzIGluIGdlbmVyYWwgbWFrZSBzZW5zZSBmb3IgUFYg
ZG9tYWlucyBzaW5jZSB0aGUNCiAgIHVwIGNhbGwgbWVjaGFuaXNtIGZpdHMgd2VsbCBpbnRvIHRo
ZSB3YXkgYXJnbyBleHBlY3RzIHNjaGVkdWxpbmcgdG8gd29yay4NCg0KICAgSSBkb250IHNlZSBh
bnkgcHJlc3NpbmcgcmVhc29uIHRvIG5vdCB1c2UgYSBWSVJRIGZvciBQViBvciBQVkggZG9tYWlu
cywNCiAgIHBlcmhhcHMgSSd2ZSBtaXNzZWQgc29tZXRoaW5nLg0KDQoyKSBWSVJRIHZzIGRpcmVj
dCBpbmplY3Rpb24gb2YgdmVjdG9yIGluIGh2bSBjYXNlLg0KDQogICBmb3IgSFZNIGd1ZXN0cyAt
IHlvdSBjYW4gbWFrZSB0aGUgYXJndW1lbnQgZm9yIGluamVjdGlvbiB2aWEgYSAocG90ZW50aWFs
bHkNCiAgIGhhcmR3YXJlKSBlbXVsYXRlZCBMQVBJQy4gSW4gdGhpcyBjYXNlIHRoZSBiZXN0IHBl
cmZvcm1hbmNlIGlzIG9idGFpbmVkIGJ5DQogICBub3QgaGF2aW5nIHRvIGNsZWFyIHRoZSBpbnRl
cnJ1cHQgKHJlcXVpcmluZyBhbm90aGVyIFZNRVhJVCkuIFRoZSBvbmx5IHR3bw0KICAgc29ydHMg
b2YgaW50ZXJydXB0cyB0aGF0IGhhdmUgdGhhdCBwcm9wZXJ0eSBhcmUgMSkgTVNJcywgYW5kIDIp
IGVkZ2UgaW50ZXJydXB0cw0KICAgdmlhIHRoZSBJT0FQSUM6DQoNCiAgIE5vdCBhbGwgb3BlcmF0
aW5nIHN5c3RlbXMgaGFkL2hhdmUgZ29vZCBNU0kgc3VwcG9ydCwgUENJIGRvZXNuJ3QgW3JlYWxs
eV0gc3VwcG9ydA0KICAgZWRnZSBpbnRlcnJ1cHRzIG9uIExOS1tBQkNEXSwgYW5kIGV2ZW4gaWYg
eW91IGdvIHRoZSBQQ0kgcm91dGUgYWxtb3N0IG5vIE9TZXMgZG8NCiAgIHRoZSByaWdodCB0aGlu
ZyBhbnl3YXkuIEhvd2V2ZXIgaXQgaXMgcG9zc2libGUgdG8gc3BlY2lmeSBhIGRldmljZSB2aWEg
QUNQSSB3aXRoIGENCiAgIGZpeGVkIEdTSSB3aXRoIGFuIGVkZ2UgaW50ZXJydXB0LiBXaW5kb3dz
IGZyb20gYXQgbGVhc3QgWFAsIGFuZCBsaW51eCBib3RoIGhhbmRsZQ0KICAgdGhhdCB3ZWxsIGFu
ZCBpdCdzIHRoZSBwZXJmZWN0IGZpdCBmb3Igc2VuZGluZyB0aGUgaWRlbXBvdGVudCAieW91IGhh
dmUgd29yayB0bw0KICAgZG8iIHR5cGUgaW50ZXJydXB0IHRoYXQgYXJnbyBuZWVkcy4NCg0KICAg
T25lIG9mIHRoZSBkZXNpZ24gZ29hbHMgd2FzIHRoYXQgbXVsdGlwbGUgaW5kZXBlbmRlbnQgYWN0
b3JzIGluIGEgVk0gc2hvdWxkDQogICBiZSBhYmxlIHRvIHJ1biB3aXRob3V0IGtub3dsZWRnZSBv
ZiBlYWNoIG90aGVyLCBhbmQgdXNpbmcgYSBzdGFuZGFyZCBHU0kgYWxsb3dzDQogICBzb21ldGhp
bmcgbGlrZSBhbiBFREsgSUksIGdydWIgYW5kIGxpbnV4IHRvIGFsbCB1c2UgaXQgd2l0aG91dCBo
YXZpbmcgdG8gaGFuZA0KICAgZm9yd2FyZCBzdGF0ZS4NCg0KDQpKLg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
