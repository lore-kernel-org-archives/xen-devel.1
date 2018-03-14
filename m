From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: xl.cfg error in usbdev, doc and code are different
Date: Wed, 14 Mar 2018 12:46:35 +0000
Message-ID: <20180314124635.krw35gqllrwt3bdk@citrix.com>
References: <20180314114346.GA2109@perard>
 <20180314114530.ggo2e6zrftrtqs43@citrix.com>
 <b3d41bb3-6547-f227-b715-e609db2666b1@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yxl5=ge=citrix.com=prvs=60440319b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ew5oK-0002Ti-OW
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 12:47:16 +0000
Content-Disposition: inline
In-Reply-To: <b3d41bb3-6547-f227-b715-e609db2666b1@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMTI6MzY6MThQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiAwMy8xNC8yMDE4IDExOjQ1IEFNLCBXZWkgTGl1IHdyb3RlOgo+ID4gQ2MgR2Vv
cmdlIGFuZCBKdWVyZ2VuCj4gPiAKPiA+IE9uIFdlZCwgTWFyIDE0LCAyMDE4IGF0IDExOjQzOjQ2
QU0gKzAwMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4+IEhpLAo+ID4+Cj4gPj4gSSBmb2xs
b3dlZCBgbWFuIHhsLmNmZ2AgdG8gYWRkIGFuIHVzYmRldiBwcm9wZXJ0eSB0byBteSBndWVzdCBj
b25maWcsCj4gPj4gYW5kIHhsIHJlamVjdGVkIGl0Lgo+ID4+Cj4gPj4gIyB4bCBjcmVhdGUgInVz
YmRldj1bJ2RldnR5cGU9aG9zdGRldixob3N0YnVzPTEsaG9zdGFkZHI9MicsXSIgfi9hcmNoLmh2
bQo+ID4+IFVua25vd24gc3RyaW5nIGBkZXZ0eXBlPWhvc3RkZXYnIGluIHVzYmRldiBzcGVjCj4g
Pj4KPiA+Pgo+ID4+IEluIHhsX3BhcnNlLmMsIHRoZSBleHBlY3RlZCBzdHJpbmcgc2VlbXMgdG8g
YmUgInR5cGU9aG9zdGRldiIsIG5vdAo+ID4+ICJkZXZ0eXBlIi4KPiA+Pgo+ID4+IFdoYXQncyB0
aGUgcmlnaHQgcHJvcGVydHkgbmFtZT8KPiAKPiBJIGRpZCBzb21lIGFyY2hhZW9sb2d5LCBhbmQg
aXQgYXBwZWFyczoKPiAKPiAqIEluIHJlc3BvbnNlIHRvIHY3IG9mIENodW55YW4ncyBwdnVzYiBz
ZXJpZXMsIEkgc3VnZ2VzdGVkIGFkZGluZyB0aGUKPiAndHlwZT1ob3N0ZGV2JyBvcHRpb24gKGlu
IHJlc3BvbnNlIHRvIHBhdGNoIDcvNywgeGwuY2ZnKQo+IAo+ICogSW4gdjggb2YgdGhlIHNlcmll
cywgQ2h1bnlhbiBhZGRlZCB0aGUgImRldnR5cGU9aG9zdGRldiIgb3B0aW9uIChpbgo+IDUvNywg
dGhlIGNvbW1hbmQtbGluZSBwYXJzaW5nIGZ1bmN0aW9ucywgd2hpY2ggYXJlIHJlLXVzZWQgZm9y
IGNvbmZpZwo+IHBhcnNpbmcpLiAgSXQgd2FzIGFsc28gY2FsbGVkICJkZXZ0eXBlIiBpbiB0aGUg
eGwuY2ZnIG1hbiBwYWdlLgo+IAo+ICogSW4gdjkgZmlyc3Qgc2VuZCwgQ2h1bnlhbiBzdGlsbCBo
YWQgImRldnR5cGU9aG9zdGRldiIgaW4gdGhlIHBhcnNlcgo+IGFuZCB0aGUgbWFuIHBhZ2UKPiAK
PiAqIEluIHY5J3MgUkVTRU5EICh0byB3aGljaCBJIGdhdmUgbXkgUi1iKSwgaXQgaGFkIHNpbGVu
dGx5IGNoYW5nZWQgdG8KPiAidHlwZT1ob3N0ZGV2IiBpbiB0aGUgcGFyc2VyLCBidXQgd2FzIHN0
aWxsICJkZXZ0eXBlPWhvc3RkZXYiIGluIHRoZSBtYW4KPiBwYWdlLgo+IAo+IFBlcnNvbmFsbHkg
SSdkIHByb2JhYmx5IGNoYW5nZSB0aGUgZG9jcyB0byBmaXQgdGhlIGFjdHVhbCBiZWhhdmlvci4g
IEFueQo+IG90aGVyIHRob3VnaHRzPwoKSSBkb24ndCBoYXZlIGFuIG9waW5pb24gb24gd2hpY2gg
ZW50aXR5IHRvIGNoYW5nIGlmIHRoZXJlIGlzIG5vCmNvbXBhdGliaWxpdHkgaXNzdWUuCgpKdWVy
Z2VuLCBkb2VzIHN1c2UgdXNlcyB0aGlzIHBhcmFtZXRlcj8KCldlaS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
