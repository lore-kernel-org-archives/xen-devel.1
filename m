From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86emul: fix vector-length check for
 AVX512F scalar fused-multiply-add insns
Date: Mon, 10 Dec 2018 14:26:04 +0000
Message-ID: <5e9d8cbb-9f91-1168-b7a3-c06274a22bf4@citrix.com>
References: <5C0A55780200007800204012@prv1-mh.provo.novell.com>
 <5C0A56E7020000780020401C@prv1-mh.provo.novell.com>
 <8ad3493a-1068-492b-916c-f4fd4d13fc49@citrix.com>
 <5C0E73F90200007800204B18@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R27G=OT=citrix.com=prvs=87506bf53=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gWMVw-0008M5-Hx
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 14:26:28 +0000
In-Reply-To: <5C0E73F90200007800204B18@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMTIvMjAxOCAxNDoxMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTAuMTIuMTgg
YXQgMTQ6NTAsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMDcvMTIv
MjAxOCAxMToxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBUaGUgY2hlY2sgbmVlZHMgdG8gaGFw
cGVuIHdoZW5ldmVyIEVWRVguYiBpcyBjbGVhciwgbm90IGp1c3QgaW4gdGhlCj4+PiBtZW1vcnkg
b3BlcmFuZCBjYXNlLgo+PiBFVkVYLmIgaXMgYSBkaWZmZXJlbnQgZmllbGQgdG8gRVZFWC5icgo+
Pgo+PiBJJ20gYWZyYWlkIHRoYXQgdGhpcyBnb2VzIGJhY2sgdG8gbXkgb3JpZ2luYWwgY29uY2Vy
biB3aXRoIHRoZSBzZXJpZXMuIAo+PiBIYXZpbmcgdGhlIGZpZWxkcyBuYW1lZCBkaWZmZXJlbnRs
eSBiZXR3ZWVuIG91ciBjb2RlIGFuZCB0aGUgbWFudWFsIGlzCj4+IG5vdyBjYXVzaW5nIHByb2Js
ZW1zIGZvciBldmVyeW9uZS4KPiBJJ20gdHJ5aW5nIHRvIGJlIHZlcnkgc3RyaWN0IHdpdGggZGlz
dGluZ3Vpc2hpbmcgdGhpbmdzIGluIHRleHQ6Cj4gRVZFWC5CIGlzIHdoYXQgaW4gY29kZSB3ZSBj
YWxsIGV2ZXguYjsgRVZFWC5iIGlzIHdoYXQgaW4gY29kZQo+IHdlIGNhbGwgZXZleC5ici4gVGhl
cmUncyBubyBzdWNoIHRoaW5nIGFzIEVWRVguYnIuIEkgc3RyaWN0bHkKPiBtZWFuIHRvIG1ha2Ug
dGhlIHRleHR1YWwgKG91dHNpZGUgb2YgY29kZSkgZGlzdGluY3Rpb24gdmlhCj4gY2FzZTogRVZF
WCBpcyB0byBiZSB1c2VkIHdpdGggU0RNIG5hbWVzLCBldmV4IHdpdGggb3VyIGNvZGUncwo+IG9u
ZXMuCj4KPiBJIHRob3VnaHQgd2UgaGFkIG1lYW53aGlsZSBzZXR0bGVkIHRoaXMgZGlzcHV0ZSwg
cmVhbGl6aW5nCj4gdGhhdCB0aGVyZSBzaW1wbHkgaXMgbm8gcmVhbGx5IGdvb2Qgd2F5IG9mIG5h
bWluZyB0aGluZ3MgaW4KPiBjb2RlIHdpdGhvdXQgc29tZSAodW5kZXNpcmFibGUpIGRldmlhdGlv
biBmcm9tIHRoZSBTRE0uCgpUaGUgZmFjdCB0aGF0IHdlIGRvbid0IGhhdmUgYSBiZXR0ZXIgb3B0
aW9uIGRvZXMgbm90IG1lYW4gdGhhdCB0aGUKY29uZnVzaW9uIGhhcyBzdG9wcGVkLsKgIFRoZSBm
YWN0IHRoYXQgdGhlcmUgYXJlIG9uZSBhbmQgYSBoYWxmIHBlb3BsZSBpbgp0aGUgd29ybGQgd2hv
IGNhbiByZWFkIHRoaXMgY29kZSBtZWFucyB0aGF0IGl0IHdpbGwga2VlcCBiZWluZyBhIHByb2Js
ZW0KdW50aWwgd2UgZmluZCBzb21lIGJldHRlciBvcHRpb24uCgpBcyBmb3IgdGhpcyBwYXRjaCwg
dGhpcyBpcyB0aGUgZmlyc3QgdGltZSBJJ3ZlIChrbm93aW5nbHkpIGVuY291bnRlcmVkCnlvdXIg
c2NoZW1lIGZvciBkaXNhbWJpZ3VhdGlvbi7CoCBJJ3ZlIG5vdCAoa25vd2luZ2x5KSBzZWVuIGl0
IHdyaXR0ZW4KZG93biBvciBwb2ludGVkIG91dCBhbnl3aGVyZS4KCkJhc2ljYWxseSAtIHRoZSBj
b21taXQgbWVzc2FnZSBhbmQgdGhlIHBhdGNoIGNvbnRlbnQgY29udHJhZGljdCBlYWNoCm90aGVy
LCBhbmQgaXQgaXMgbm90IHJlYXNvbmFibGUgdG8gZXhwZWN0IHJlYWRlcnMgdG8ga25vdyB0aGF0
IEVWRVggaW4KdGhlIGNvbW1pdCBtZXNzYWdlIGJlYXJzIG5vIHJlbGF0aW9uc2hpcCB0byBldmV4
IGluIHRoZSBjb2RlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
