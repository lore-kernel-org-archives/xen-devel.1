From: Julien Grall <Julien.Grall@arm.com>
Subject: Re: [PATCH 23/25] argo: signal x86 HVM and ARM via VIRQ
Date: Sun, 2 Dec 2018 19:55:25 +0000
Message-ID: <23042bc2-d74f-ff7d-5e6a-1bd21de2ddb7@arm.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-24-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ds4k=ol=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gTXq0-0003hD-FA
 for xen-devel@lists.xenproject.org; Sun, 02 Dec 2018 19:55:32 +0000
In-Reply-To: <1543627984-21394-24-git-send-email-christopher.w.clark@gmail.com>
Content-Language: en-US
Content-ID: <105E880549481C468486D8D8FD861F88@eurprd08.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, James McKenzie <voreekf@madingley.org>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, nd <nd@arm.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

SGksDQoNCk9uIDAxLzEyLzIwMTggMDE6MzMsIENocmlzdG9waGVyIENsYXJrIHdyb3RlOg0KPiAq
IHg4NiBQViBkb21haW5zIGFyZSBub3RpZmllZCB2aWEgZXZlbnQgY2hhbm5lbC4NCj4gDQo+IFBW
IGd1ZXN0cyBhcmUga25vd24gdG8gaGF2ZSB0aGUgZXZlbnQgY2hhbm5lbCBzb2Z0d2FyZSBwcmVz
ZW50IGluIHRoZSBndWVzdA0KPiBrZXJuZWwsIHNvIGl0IGlzIGZpbmUgdG8gZGVwZW5kIG9uIGFu
ZCB1c2UgaXQuDQo+IA0KPiAqIHg4NiBIVk0gZG9tYWlucyBhbmQgYWxsIEFSTSBkb21haW5zIGFy
ZSBub3RpZmllZCB2aWEgVklSUS4NCj4gDQo+IFRoZSBpbnRlbnQgaXMgdG8gcmVtb3ZlIHRoZSBy
ZXF1aXJlbWVudCBmb3IgZXZlbnQgY2hhbm5lbCBzb2Z0d2FyZSB0byBiZQ0KPiBpbnN0YWxsZWQg
d2l0aGluIHRoZXNlIGd1ZXN0cyBpbiBvcmRlciB0byB1c2UgQXJnby4gVklSUSBzaWduYWxsaW5n
IGlzIGFsc28NCj4gdGhlIG1ldGhvZCB0aGF0IGhhcyBiZWVuIGluIHVzZSBmb3IgdGhlIGxvbmdl
c3QgcGVyaW9kIHdpdGggdGhpcyBoeXBlcmNhbGwNCj4gaW4gYm90aCBYZW5DbGllbnQgYW5kIE9w
ZW5YVC4NCg0KSSBhbSBhIGJpdCBjb25mdXNlZC4gdklSUXMgYXJlIGJhc2VkIG9uIGV2ZW50IGNo
YW5uZWwsIHNvIGhvdyBkbyB5b3UgDQpyZW1vdmUgdGhlIHJlcXVpcmVtZW50IG9uIGV2ZW50IGNo
YW5uZWw/DQoNCkNoZWVycywNCg0KLS0gDQpKdWxpZW4gR3JhbGwNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
