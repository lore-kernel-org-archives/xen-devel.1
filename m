From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v3] schedule: move last_run_time to the
 credit scheduler privates
Date: Fri, 31 May 2019 10:26:10 +0000
Message-ID: <16B40EA2-7781-48E7-94CA-52B328CE197B@citrix.com>
References: <1559225751-30736-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nX14=T7=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hWejo-0000kT-0m
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 10:26:16 +0000
In-Reply-To: <1559225751-30736-1-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
Content-ID: <6AC3DEBC941E8643943D2E332EE11674@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gTWF5IDMwLCAyMDE5LCBhdCAzOjE1IFBNLCBBbmRyaWkgQW5pc292IDxhbmRyaWku
YW5pc292QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBGcm9tOiBBbmRyaWkgQW5pc292IDxhbmRy
aWlfYW5pc292QGVwYW0uY29tPg0KPiANCj4gVGhlIHN0cnVjdHVyZSBtZW1iZXIgbGFzdF9ydW5f
dGltZSBpcyB1c2VkIGJ5IGNyZWRpdCBzY2hlZHVsZXIgb25seS4NCj4gU28gbW92ZSBpdCBmcm9t
IGEgZ2VuZXJpYyB2Y3B1IHN0cnVjdHVyZSB0byB0aGUgY3JlZGl0IHNjaGVkdWxlciBwcml2YXRl
DQo+IHZjcHUgZGVmaW5pdGlvbi4NCg0KVGhpcyBzZWVtcyBsaWtlIGEgdXNlZnVsIGNoYW5nZSwg
YW5kIHRoZSBjb21taXQgbWVzc2FnZSBoYXMgYSBsb3Qgb2YgZ29vZCBkZXRhaWwsIHRoYW5rcy4g
IEJ1dCBJ4oCZbSBsZWZ0IHdvbmRlcmluZzogSXMgdGhlIG1haW4gaWRlYSBoZXJlIGp1c3QgdG8g
Z2VuZXJhbGx5IHJlZHVjZSBjb2RlIGFuZCBkYXRhIHVzYWdlIHdoZW4gbm90IHJ1bm5pbmcgdGhl
IGNyZWRpdCBzY2hlZHVsZXIsIG9yIGlzIHRoZXJlIGFub3RoZXIgcmVhc29uPw0KDQpJZiBpdOKA
mXMgdGhlIGZpcnN0LCBhIHF1aWNrIG5vdGUgdG8gdGhhdCBlZmZlY3Qgd2lsbCBoZWxwIHB1dCBh
cmNoYWVvbG9naXN04oCZcyBtaW5kcyBhdCBlYXNlLiA6LSkgIFRoaXMgY291bGQgcHJvYmFibHkg
YmUgYWRkZWQgb24gY29tbWl0LiAgKEnigJlsbCBkbyBhIGZ1bGwgcmV2aWV3IGl0IGluIGEgZGF5
IG9yIHR3byBpZiBEYXJpbyBkb2VzbuKAmXQgYmVhdCBtZSB0byBpdC4pDQoNCiAtR2VvcmdlDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
