From: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [PATCH] CONTRIBUTING: Clarifications on how to
 handle license deviations
Date: Sun, 9 Dec 2018 08:07:59 +0000
Message-ID: <3FDBD643-23F9-4B8D-9FA1-4A5FB2B9C02D@citrix.com>
References: <7551796e8982384aa3fca0b437892e289768aaee.1542650373.git.lars.kurth@citrix.com>
 <20181206140912.kuxab7bowppi3nil@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9qQR=OS=citrix.com=prvs=87456c0be=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1gVu8I-0007dx-OM
 for xen-devel@lists.xenproject.org; Sun, 09 Dec 2018 08:08:10 +0000
In-Reply-To: <20181206140912.kuxab7bowppi3nil@zion.uk.xensource.com>
Content-Language: en-US
Content-ID: <B118DB23B56C0546BF326C627BEB8E8F@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

VGhhbmsgeW91IFdlaSwNCg0K77u/T24gMDYvMTIvMjAxOCwgMTQ6MDksICJXZWkgTGl1IiA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6DQoNCiAgICBPbiBNb24sIE5vdiAxOSwgMjAxOCBhdCAw
NjowNToxMFBNICswMDAwLCBMYXJzIEt1cnRoIHdyb3RlOg0KICAgID4gVGhpcyBwYXRjaCBtYWtl
cyBhIGZldyBjbGFyaWZpY2F0aW9ucyB3aGljaCB3ZXJlIGRpc2N1c3NlZCBvbg0KICAgID4gSVJD
IHJlY2VudGx5LiANCiAgICA+IA0KICAgID4gU3BlY2lmaWNhbGx5OiANCiAgICA+IC0gSGlnaGxp
Z2h0IHRoZSBwcmluY2lwbGUgdGhhdCBsaWNlbnNlIGRldmlhdGlvbnMNCiAgICA+ICAgc2hvdWxk
IGJlIGJyb3VnaHQgdG8gdGhlIGF0dGVudGlvbiBvZiBtYWludGFpbmVycyANCiAgICA+IC0gQWRk
IGEgcmVxdWlyZW1lbnQgZm9yIEdQTHYyIGNvbXBhdGliaWxpdHkgDQogICAgPiAtIFJlc3RydWN0
dXJlIHRoZSBkb2N1bWVudCB0b2dobGlnaHQgIHVzZS1jYXNlcyBmb3IgIA0KICAgIA0KICAgIHRv
IGhpZ2hsaWdodA0KICAgIA0KICAgID4gICAiTmV3IGNvbXBvbmVudHMiIGFuZCAiSW1wb3J0aW5n
IGNvZGUiIGNsZWFyZXIgDQogICAgPiAtIEFkZCBjb252ZW50aW9ucyBhbmQgaW5zdHJ1Y3Rpb25z
IGZvciAiTmV3IGZpbGVzIg0KICAgID4gDQogICAgPiBTaWduZWQtb2ZmLWJ5OiBMYXJzIEt1cnRo
IDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+DQogICAgPiAtLS0NCiAgICA+ICBDT05UUklCVVRJTkcg
fCAyNyArKysrKysrKysrKysrKysrKysrKysrKy0tLS0NCiAgICA+ICAxIGZpbGUgY2hhbmdlZCwg
MjMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCiAgICA+IA0KICAgID4gZGlmZiAtLWdp
dCBhL0NPTlRSSUJVVElORyBiL0NPTlRSSUJVVElORw0KICAgID4gaW5kZXggY2ZlZThmMTU2Ny4u
NjMwNTBlOTE0MSAxMDA2NDQNCiAgICA+IC0tLSBhL0NPTlRSSUJVVElORw0KICAgID4gKysrIGIv
Q09OVFJJQlVUSU5HDQogICAgPiBAQCAtMTksNiArMTksMTkgQEAgTW9zdCBub3RhYmx5Og0KICAg
ID4gICAtIHRvb2xzL3hsICAgICAgICAgICA6IExHUEwgdjIuMQ0KICAgID4gICAtIHhlbi9pbmNs
dWRlL3B1YmxpYyA6IE1JVCBsaWNlbnNlDQogICAgPiAgDQogICAgPiArVGhlIENPTU1PTiBDT1BZ
UklHSFQgTk9USUNFUyBzZWN0aW9uIG9mIHRoaXMgZG9jdW1lbnQgY29udGFpbnMNCiAgICA+ICtz
YW1wbGUgY29weXJpZ2h0IG5vdGljZXMgZm9yIHRoZSBtb3N0IGNvbW1vbiBsaWNlbnNlcyB1c2Vk
IHdpdGhpbg0KICAgID4gK3RoaXMgcmVwb3NpdG9yeS4NCiAgICA+ICsNCiAgICA+ICtXaGVuIGNy
ZWF0aW5nIG5ldyBjb21wb25lbnRzLCBuZXcgZmlsZXMsIG9yIGltcG9ydGluZyBjb2RlIHBsZWFz
ZSBmb2xsb3cNCiAgICA+ICt0aGUgY29udmVudGlvbnMgb3V0bGluZWQgYmVsb3cuIEFzIGEgZ2Vu
ZXJhbCBydWxlLCB3aGVuZXZlciBjb2RlIHVzaW5nIGENCiAgICA+ICtsaWNlbnNlIG90aGVyIHRo
YW4gR1BMdjIgaXMgaW50cm9kdWNlZCwgYXR0ZW50aW9uIG11c3QgYmUgZHJhd24gdG8gdGhlDQog
ICAgPiArZGlmZmVyZW5jZSwgc3VjaCB0aGF0IG1haWJ0YWluZXJzIGNhbiBtYWtlIGFuIGluZm9y
bWVkIGRlY2lzaW9uIGFib3V0IHRoZQ0KICAgIA0KICAgIG1haW50YWluZXJzDQogICAgDQogICAg
T3ZlcmFsbCB0aGlzIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuDQogICAgDQpBbnlvbmUgZWxzZSBh
bnkgdmlld3MsIGJlZm9yZSBJIHJlLXJvbGwgdGhlIHBhdGNoDQpMYXJzICAgIA0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
