From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v4 3/6] tools/dm_restrict: Ask QEMU to chroot
Date: Tue, 6 Nov 2018 11:12:40 +0000
Message-ID: <bb55b47de0cd4bbbbd715b5ad73d3abf@AMSPEX02CL03.citrite.net>
References: <20181105180711.20322-1-george.dunlap@citrix.com>
 <20181105180711.20322-3-george.dunlap@citrix.com>
 <47ff2f996ada4b23b58265aea74e62af@AMSPEX02CL03.citrite.net>
 <d1a2c6af-5b1d-b053-5bcf-9e478b012aec@citrix.com>
 <7a48f28641704dd1913ef691bd4c39d3@AMSPEX02CL03.citrite.net>
 <20181106111120.GB1302@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9pgl=nr=citrix.com=prvs=84117823e=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gJzI5-0001A5-0j
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 11:13:01 +0000
In-Reply-To: <20181106111120.GB1302@perard.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Perard <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAwNiBOb3ZlbWJlciAyMDE4IDEx
OjExCj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IEdl
b3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IHhlbi0KPiBkZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZzsgSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBX
ZWkgTGl1Cj4gPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxd
IFtQQVRDSCB2NCAzLzZdIHRvb2xzL2RtX3Jlc3RyaWN0OiBBc2sgUUVNVSB0bwo+IGNocm9vdAo+
IAo+IE9uIFR1ZSwgTm92IDA2LCAyMDE4IGF0IDEwOjUzOjQ4QU0gKzAwMDAsIFBhdWwgRHVycmFu
dCB3cm90ZToKPiA+IE9rLiBUaGUgdHJhY2UgYmFja2VuZCBpcyBzZXQgYXQgYnVpbGQgdGltZSBp
biB0b29scy9NYWtlZmlsZToKPiA+Cj4gPiAgICAgICAgIGlmICQkc291cmNlL3NjcmlwdHMvdHJh
Y2V0b29sLnB5IC0tY2hlY2stYmFja2VuZCAtLWJhY2tlbmQgbG9nIDsKPiB0aGVuIFwKPiA+ICAg
ICAgICAgICAgICAgICBlbmFibGVfdHJhY2VfYmFja2VuZD0nLS1lbmFibGUtdHJhY2UtYmFja2Vu
ZD1sb2cnOwo+ID4gICAgICAgICBlbGlmICQkc291cmNlL3NjcmlwdHMvdHJhY2V0b29sLnB5IC0t
Y2hlY2stYmFja2VuZCAtLWJhY2tlbmQKPiBzdGRlcnIgOyB0aGVuIFwKPiA+ICAgICAgICAgICAg
ICAgICBlbmFibGVfdHJhY2VfYmFja2VuZD0nLS1lbmFibGUtdHJhY2UtYmFja2VuZD1zdGRlcnIn
OyBcCj4gPiAgICAgICAgIGVsc2UgXAo+ID4gICAgICAgICAgICAgICAgIGVuYWJsZV90cmFjZV9i
YWNrZW5kPScnIDsgXAo+ID4gICAgICAgICBmaSA7IFwKPiA+Cj4gPiBhbmQgbG9nIGFwcGVhcnMg
dG8gZmF2b3VyZWQuIElzIHRoaXMgc3RpbGwgZ29pbmcgdG8gd29yayB3aXRoIHRoZQo+ID4gY2hy
b290PyBXZSByZWx5IG9uIHRoZSB0cmFjaW5nIGluIHhlbl9wbGF0Zm9ybSB0byBnZXQgbG9nIG1l
c3NhZ2VzIG91dAo+ID4gb2YgUFYgZHJpdmVycy4KPiAKPiBsb2cgdnMgc3RkZXJyIGFyZSBqdXN0
IGRpZmZlcmVudCBuYW1lcyBmb3IgdGhlIHNhbWUgdGhpbmcuICJzdGRlcnIiCj4gZG9lc24ndCBl
eGlzdCBhbnltb3JlIGluIHJlY2VudCB2ZXJzaW9uIG9mIFFFTVUgYW5kIGFzIGJlZW4gcmVuYW1l
ZAo+ICJsb2ciLgoKT2ggeWVzLCBJJ2QgZm9yZ290dGVuLi4uIFRoYXQncyBmaW5lIHRoZW4gOi0p
CgogIFBhdWwKCj4gCj4gLS0KPiBBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
