From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 01/12] x86: infrastructure to allow
 converting certain indirect calls to direct ones
Date: Tue, 2 Oct 2018 14:35:05 +0100
Message-ID: <01503197-8c8f-921b-7a13-f4862777f1a3@citrix.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
 <5BB3447802000078001EDA08@prv1-mh.provo.novell.com>
 <f04b3731-481c-b7a0-f5b5-e0e611b391b1@citrix.com>
 <7977a721-e2f6-db00-ee6a-2744cde3cc66@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=okrt=mo=citrix.com=prvs=806f63693=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g7KpQ-0000WV-NS
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 13:35:08 +0000
In-Reply-To: <7977a721-e2f6-db00-ee6a-2744cde3cc66@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTAvMTggMTQ6MjgsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBBbmRyZXcsCj4KPiBP
biAwMi8xMC8yMDE4IDE0OjIxLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAwMi8xMC8xOCAx
MToxMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbGliLmgK
Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9saWIuaAo+Pj4gQEAgLTY2LDYgKzY2LDEwIEBACj4+
PiDCoCDCoCAjZGVmaW5lIFJPVU5EVVAoeCwgYSkgKCgoeCkgKyAoYSkgLSAxKSAmIH4oKGEpIC0g
MSkpCj4+PiDCoCArI2RlZmluZSBjb3VudF92YV9hcmdfKGRvdCwgYTEsIGEyLCBhMywgYTQsIGE1
LCBhNiwgYTcsIGE4LCB4LCAuLi4pIHgKPj4+ICsjZGVmaW5lIGNvdW50X3ZhX2FyZyhhcmdzLi4u
KSBcCj4+PiArwqDCoMKgIGNvdW50X3ZhX2FyZ18oLiwgIyMgYXJncywgOCwgNywgNiwgNSwgNCwg
MywgMiwgMSwgMCkKPj4KPj4gVGhpcyBwYXJ0aWN1bGFyIGJpdCBvZiByZXZpZXcgc3BsaXQgb3V0
IGZvciBvYnZpb3VzIHJlYXNvbnMuCj4+Cj4+IFdlIGFscmVhZHkgaGF2ZSBfX2NvdW50X2FyZ3Mo
KSBpbiB0aGUgQVJNIFNNQ0NDIGluZnJhc3RydWN0dXJlLsKgIFBsZWFzZQo+PiBjYW4gd2UgZGVk
dXAgdGhhdCAoYnJva2VuIG91dCBpbnRvIGEgc2VwYXJhdGUgcGF0Y2gpIHJhdGhlciB0aGFuCj4+
IGludHJvZHVjaW5nIGEgY29tcGV0aW5nIHZlcnNpb24uCj4+Cj4+IFRoZSBBUk0gdmVyc2lvbiBp
cyBidWdneS7CoCBJdCBpcyBvZmYtYnktdHdvIGluIHRoZSBiYXNlIGNhc2UsIGFuZAo+PiBkb2Vz
bid0IGNvbXBpbGUgaWYgZmV3ZXIgdGhhbiB0d28gcGFyYW1ldGVycyBhcmUgcGFzc2VkLsKgIFRo
aXMgdmVyc2lvbgo+PiBmdW5jdGlvbnMgY29ycmVjdGx5LCBidXQgc2hvdWxkIGJlIG5hbWVkIHdp
dGggYSBwbHVyYWwuCj4KPiBUaGUgQVJNIHZlcnNpb24gaXMgKm5vdCogYnVnZ3kuIFdoYXQgdGhl
IEFSTSB2ZXJzaW9uIGNvdW50IGlzIHRoZQo+IG51bWJlciBvZiBwYXJhbWV0ZXJzIGZvciB0aGUg
U01DQ0MgZnVuY3Rpb24sICpub3QqIHRoZSBudW1iZXIgb2YKPiBwYXJhbWV0ZXIgZm9yIHRoZSBj
YWxsLgo+Cj4gVGhpcyBtYXRjaGVzIHRoZSBTTUNDQyB3aGVyZSB0aGUgZmlyc3QgcGFyYW1ldGVy
IGlzIGFsd2F5cyB0aGUKPiBmdW5jdGlvbiBJRCwgdGhlIGxhc3QgcGFyYW1ldGVyIGlzIGFsd2F5
cyB0aGUgcmVzdWx0IHN0cnVjdHVyZS4KPgo+IFRoZSBjb2RlIHdpbGwgZW5kIHVwIHRvIGJlIGxl
c3MgcmVhZGFibGUgdXNpbmcgYSBnZW5lcmljIGNvdW50LiBJIGFtCj4gcGxhbm5pbmcgdG8gTmFj
ayBhbnl0aGluZyB0cnlpbmcgdG8gdXNlIGEgZ2VuZXJpYyBjb3VudCBpbiB0aGUgU01DQ0MKPiBj
b2RlLgoKWWVzIGl0IGlzIGJ1Z2d5LCBiZWNhdXNlIGl0IGRvZXNuJ3QgYmVoYXZlIGFzIHRoZSBu
YW1lIHN1Z2dlc3RzLgoKSWYgeW91IG1lYW4gdGhlIGluZnJhc3RydWN0dXJlIHRvIGhhdmUgU01D
Q0Mgc3BlY2lmaWMgYmVoYXZpb3VyLCB0aGUKbWFjcm9zIHNob3VsZCBiZSBuYW1lZCBzdWl0YWJs
eSwgdG8gYXZvaWQgaW50ZXJmZXJpbmcgd2l0aCBjb21tb24gY29kZS4KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
