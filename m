From: Juergen Gross <jgross@suse.com>
Subject: Re: xl.cfg error in usbdev, doc and code are different
Date: Wed, 14 Mar 2018 14:12:57 +0100
Message-ID: <3c58835c-8968-cc20-117a-a464db8c0598@suse.com>
References: <20180314114346.GA2109@perard>
 <20180314114530.ggo2e6zrftrtqs43@citrix.com>
 <b3d41bb3-6547-f227-b715-e609db2666b1@citrix.com>
 <20180314124635.krw35gqllrwt3bdk@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=uuga=ge=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ew6DL-0005BR-1k
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 13:13:07 +0000
In-Reply-To: <20180314124635.krw35gqllrwt3bdk@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Ian Jackson <Ian.Jackson@eu.citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMTggMTM6NDYsIFdlaSBMaXUgd3JvdGU6Cj4gT24gV2VkLCBNYXIgMTQsIDIwMTgg
YXQgMTI6MzY6MThQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gMDMvMTQvMjAx
OCAxMTo0NSBBTSwgV2VpIExpdSB3cm90ZToKPj4+IENjIEdlb3JnZSBhbmQgSnVlcmdlbgo+Pj4K
Pj4+IE9uIFdlZCwgTWFyIDE0LCAyMDE4IGF0IDExOjQzOjQ2QU0gKzAwMDAsIEFudGhvbnkgUEVS
QVJEIHdyb3RlOgo+Pj4+IEhpLAo+Pj4+Cj4+Pj4gSSBmb2xsb3dlZCBgbWFuIHhsLmNmZ2AgdG8g
YWRkIGFuIHVzYmRldiBwcm9wZXJ0eSB0byBteSBndWVzdCBjb25maWcsCj4+Pj4gYW5kIHhsIHJl
amVjdGVkIGl0Lgo+Pj4+Cj4+Pj4gIyB4bCBjcmVhdGUgInVzYmRldj1bJ2RldnR5cGU9aG9zdGRl
dixob3N0YnVzPTEsaG9zdGFkZHI9MicsXSIgfi9hcmNoLmh2bQo+Pj4+IFVua25vd24gc3RyaW5n
IGBkZXZ0eXBlPWhvc3RkZXYnIGluIHVzYmRldiBzcGVjCj4+Pj4KPj4+Pgo+Pj4+IEluIHhsX3Bh
cnNlLmMsIHRoZSBleHBlY3RlZCBzdHJpbmcgc2VlbXMgdG8gYmUgInR5cGU9aG9zdGRldiIsIG5v
dAo+Pj4+ICJkZXZ0eXBlIi4KPj4+Pgo+Pj4+IFdoYXQncyB0aGUgcmlnaHQgcHJvcGVydHkgbmFt
ZT8KPj4KPj4gSSBkaWQgc29tZSBhcmNoYWVvbG9neSwgYW5kIGl0IGFwcGVhcnM6Cj4+Cj4+ICog
SW4gcmVzcG9uc2UgdG8gdjcgb2YgQ2h1bnlhbidzIHB2dXNiIHNlcmllcywgSSBzdWdnZXN0ZWQg
YWRkaW5nIHRoZQo+PiAndHlwZT1ob3N0ZGV2JyBvcHRpb24gKGluIHJlc3BvbnNlIHRvIHBhdGNo
IDcvNywgeGwuY2ZnKQo+Pgo+PiAqIEluIHY4IG9mIHRoZSBzZXJpZXMsIENodW55YW4gYWRkZWQg
dGhlICJkZXZ0eXBlPWhvc3RkZXYiIG9wdGlvbiAoaW4KPj4gNS83LCB0aGUgY29tbWFuZC1saW5l
IHBhcnNpbmcgZnVuY3Rpb25zLCB3aGljaCBhcmUgcmUtdXNlZCBmb3IgY29uZmlnCj4+IHBhcnNp
bmcpLiAgSXQgd2FzIGFsc28gY2FsbGVkICJkZXZ0eXBlIiBpbiB0aGUgeGwuY2ZnIG1hbiBwYWdl
Lgo+Pgo+PiAqIEluIHY5IGZpcnN0IHNlbmQsIENodW55YW4gc3RpbGwgaGFkICJkZXZ0eXBlPWhv
c3RkZXYiIGluIHRoZSBwYXJzZXIKPj4gYW5kIHRoZSBtYW4gcGFnZQo+Pgo+PiAqIEluIHY5J3Mg
UkVTRU5EICh0byB3aGljaCBJIGdhdmUgbXkgUi1iKSwgaXQgaGFkIHNpbGVudGx5IGNoYW5nZWQg
dG8KPj4gInR5cGU9aG9zdGRldiIgaW4gdGhlIHBhcnNlciwgYnV0IHdhcyBzdGlsbCAiZGV2dHlw
ZT1ob3N0ZGV2IiBpbiB0aGUgbWFuCj4+IHBhZ2UuCj4+Cj4+IFBlcnNvbmFsbHkgSSdkIHByb2Jh
Ymx5IGNoYW5nZSB0aGUgZG9jcyB0byBmaXQgdGhlIGFjdHVhbCBiZWhhdmlvci4gIEFueQo+PiBv
dGhlciB0aG91Z2h0cz8KCisxCgo+IAo+IEkgZG9uJ3QgaGF2ZSBhbiBvcGluaW9uIG9uIHdoaWNo
IGVudGl0eSB0byBjaGFuZyBpZiB0aGVyZSBpcyBubwo+IGNvbXBhdGliaWxpdHkgaXNzdWUuCj4g
Cj4gSnVlcmdlbiwgZG9lcyBzdXNlIHVzZXMgdGhpcyBwYXJhbWV0ZXI/CgpJIGRvbid0IHRoaW5r
IHNvLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
