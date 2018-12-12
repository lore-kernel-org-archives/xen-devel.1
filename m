From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: xen_disk qdevification (was: [PATCH 0/3]
 Performance improvements for xen_disk v2)
Date: Wed, 12 Dec 2018 09:22:23 +0000
Message-ID: <c3e4bfee4a904eccb2be812a7f9eb641@AMSPEX02CL03.citrite.net>
References: <154115285434.11300.8459925605672823399.stgit@dhcp-3-135.uk.xensource.com>
 <20181102110412.GD7521@dhcp-200-186.str.redhat.com>
 <20181212085951.GA7604@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lg+2=OV=citrix.com=prvs=877c75a5a=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gX0ip-0005KO-3N
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 09:22:27 +0000
In-Reply-To: <20181212085951.GA7604@aepfle.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Olaf Hering' <olaf@aepfle.de>, Kevin Wolf <kwolf@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, Tim Smith <tim.smith@citrix.com>, "armbru@redhat.com" <armbru@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBPbGFmIEhlcmluZyBbbWFpbHRv
Om9sYWZAYWVwZmxlLmRlXQ0KPiBTZW50OiAxMiBEZWNlbWJlciAyMDE4IDA5OjAwDQo+IFRvOiBL
ZXZpbiBXb2xmIDxrd29sZkByZWRoYXQuY29tPg0KPiBDYzogVGltIFNtaXRoIDx0aW0uc21pdGhA
Y2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IHFlbXUtYmxvY2tAbm9uZ251Lm9yZzsgYXJtYnJ1QHJlZGhhdC5jb207IHFlbXUtDQo+IGRl
dmVsQG5vbmdudS5vcmc7IE1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+OyBQYXVsIER1cnJh
bnQNCj4gPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgQW50aG9ueSBQZXJhcmQgPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+Ow0KPiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4g
U3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIHhlbl9kaXNrIHFkZXZpZmljYXRpb24gKHdhczogW1BB
VENIIDAvM10NCj4gUGVyZm9ybWFuY2UgaW1wcm92ZW1lbnRzIGZvciB4ZW5fZGlzayB2MikNCj4g
DQo+IE9uIEZyaSwgTm92IDAyLCBLZXZpbiBXb2xmIHdyb3RlOg0KPiANCj4gPiBBIHdoaWxlIGFn
bywgYSBkb3duc3RyZWFtIHBhdGNoIHJldmlldyBmb3VuZCBvdXQgdGhhdCB0aGVyZSBhcmUgc29t
ZSBRTVANCj4gPiBjb21tYW5kcyB0aGF0IHdvdWxkIGltbWVkaWF0ZWx5IGNyYXNoIGlmIGEgeGVu
X2Rpc2sgZGV2aWNlIHdlcmUgcHJlc2VudA0KPiA+IGJlY2F1c2Ugb2YgdGhlIGxhY2tpbmcgcWRl
dmlmaWNhdGlvbi4gVGhpcyBpcyBub3QgdGhlIGNvZGUgcXVhbGl0eQ0KPiA+IHN0YW5kYXJkIEkg
ZW52aXNpb24gZm9yIFFFTVUuIEl0J3MgdGltZSBmb3Igbm9uLXFkZXYgZGV2aWNlcyB0byBnby4N
Cj4gDQo+IERvIHlvdSBoYXZlIHRoYXQgYmFja3dhcmRzIGJ5IGFueSBjaGFuY2U/IElNTyB0aGUg
cHJlc2VuY2Ugb2YgYXNzZXJ0KCkNCj4gY29udHJpYnV0ZXMgdG8gYmFkIGNvZGUgcXVhbGl0eSwg
bm90IHRoZSBkcml2ZXJzIHRoYXQgdHJpZ2dlciB0aG9zZQ0KPiBhc3NlcnRzLiBJdCBpcyBiYWQg
ZW5vdWdoIHRoYXQgdHdvIFFFTVUgcmVsZWFzZXMgd2VudCBvdXQgd2hpbGUgYmVpbmcgaW4NCj4g
YmFkIHNoYXBlLg0KPiANCj4gQW55d2F5LCBob3BlZnVsbHkgUGF1bCBvciB3aG9ldmVyIHdpbGwg
ZmluZCB0aGUgdGltZSBhbmQgZW5lcmd5IHRvDQo+IGNvbnZlcnQgdGhlIGNvZGUgYXQgc29tZSBw
b2ludC4NCg0KSXQncyBkb25lLiBWNCBvZiBteSBzZXJpZXMgaGFzIGFja3MgZnJvbSB0aGUgWGVu
IG1haW50YWluZXJzLiBJIHRoaW5rIGl0IG5lZWRzIHNvbWUgb3RoZXIgYWNrcyBmcm9tIGJsb2Nr
IG1haW50YWluZXJzIGJ1dCBpdCdzIGJhc2ljYWxseSByZWFkeSB0byBnbyBpbiAoYW5kIEkndmUg
dmVyaWZpZWQgdGhhdCBubyBhc3NlcnQgaXMgdHJpcHBlZCBieSB4ZW50b3AgYXQgbGVhc3QpLiBB
bHNvIEkgaG9wZSB0byBwb3N0IHRoZSByZS1iYXNlZCBwYXRjaGVzIGZyb20gVGltIChvbmUgb2Yg
d2hpY2ggZml4ZXMgdGhlIG1lbW9yeSBpc3N1ZXMpIGxhdGVyIHRvZGF5Lg0KDQogIFBhdWwNCg0K
PiANCj4gT2xhZg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
