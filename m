From: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-users] Future of 32-bit PV support
Date: Thu, 23 Aug 2018 12:53:17 +0200
Message-ID: <e4180fa0-0d7b-b227-e435-48fffd0915dc@suse.com>
References: <ede80e02-5704-1d46-4edf-58515ad63f40@suse.com>
 <20180816223306.GG4569@bitfolk.com>
 <10c246ed-55f6-a3cc-c57b-22304a69392c@suse.com>
 <ba446a4a-025d-1df8-ab61-3f9bb8a71a0f@knorrie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xsvn=lg=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fsnEx-0007uq-9I
 for xen-devel@lists.xenproject.org; Thu, 23 Aug 2018 10:53:23 +0000
In-Reply-To: <ba446a4a-025d-1df8-ab61-3f9bb8a71a0f@knorrie.org>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Hans van Kranenburg <hans@knorrie.org>, Andy Smith <andy@strugglers.net>
Cc: xen-devel <xen-devel@lists.xenproject.org>, "xen-users@lists.xenproject.org" <xen-users@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDgvMTggMTg6MDEsIEhhbnMgdmFuIEtyYW5lbmJ1cmcgd3JvdGU6Cj4gT24gMDgvMTcv
MjAxOCAwNjowOSBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMTcvMDgvMTggMDA6MzMs
IEFuZHkgU21pdGggd3JvdGU6Cj4+PiBIaSBKdWVyZ2VuLAo+Pj4KPj4+IFsuLi5dIAo+Pj4gSWYg
c28sIGNvdWxkIHRoZSBmaW5hbCByZW1vdmFsIG9mIDMyLWJpdCBQViBpbiB0aGUgTGludXgga2Vy
bmVsIGJlCj4+PiBoZWxkIG9mZiB1bnRpbCB0aGVyZSBpczoKPj4+Cj4+PiAxKSBhIGtlcm5lbCBz
aGlwcGluZyBpbiBEZWJpYW4gc3RhYmxlLCBVYnVudHUgTFRTIGFuZCBDZW50T1MgdGhhdAo+Pj4g
ICAgYm9vdHMgdW5kZXIgUFZILCBhbmQ7Cj4+Pgo+Pj4gMikgc3VwcG9ydCBpbiBncnViMiBzbyBJ
IGNhbiBidWlsZCBhIGdydWIgaW1hZ2UgdGhhdCBib290cyB1bmRlcgo+Pj4gICAgUFZIPwo+Pgo+
PiBJIHRoaW5rIHRoaXMgaXMgYSByZWFzb25hYmxlIHJlcXVlc3QuCj4+Cj4+PiBJZiBncnViIFBW
SCBzdXBwb3J0IGlzIG5vdCBnb2luZyB0byBoYXBwZW4sIHdoYXQgaXMgdGhlIHJvYWRtYXAgZm9y
Cj4+PiB1c2VyLXNwZWNpZmllZCBndWVzdCBrZXJuZWxzIHVuZGVyIFBWSD8KPj4KPj4gSSBoYXZl
IGEgcGF0Y2ggc2VyaWVzIGx5aW5nIGFyb3VuZCBmb3IgZ3J1YjIgUFZIIHN1cHBvcnQuIEl0IHJl
cXVpcmVzCj4+IHNvbWUgcmV3b3JrIGFuZCBhbm90aGVyIGtlcm5lbCBlbmhhbmNlbWVudC4gSSds
bCB0cnkgdG8gcmVzdW1lIHdvcmsgb24KPj4gdGhlIHBhdGNoZXMgc29vbi4KPiAKPiArMSwgWWVz
IHBsZWFzZSEKPiAKPiBEbyBJIHVuZGVyc3RhbmQgY29ycmVjdGx5ICgnYW5vdGhlciBrZXJuZWwg
ZW5oYW5jZW1lbnQnKSB0aGF0IHlvdSBmb3VuZAo+IG1vcmUgdGhpbmdzIHdoaWNoIG5lZWQgdG8g
YmUgZG9uZSB0aGFuIHRoZSAzMi1iaXQgbWVtb3J5IG1hcCBsaW1pdGF0aW9uCj4gaXNzdWUgYXQg
dGhlIGdydWIgc2lkZT8KClRoZSBrZXJuZWwgaXMgc3RpbGwgbGFja2luZyBzdXBwb3J0IGZvciBo
YW5kaW5nIG92ZXIgUlNEUCBhZGRyZXNzIGZyb20KZ3J1YiB0byB0aGUga2VybmVsLiBUaGUgaW5p
dGlhbCBwYXRjaGVzIGFkZGluZyB0aGF0IGhhdmVuJ3QgYmVlbiB0YWtlbgphcyBzZXZlcmFsIGRp
c3RyaWJ1dGlvbnMgYXJlIHNoaXBwaW5nIGEgcGF0Y2hlZCBncnViMiB3aGljaCBpcyBicmVha2lu
Zwp0aGUgZ3J1Yi9rZXJuZWwgYm9vdCBwcm90b2NvbCBieSBjbG9iYmVyaW5nIGtlcm5lbCBkYXRh
LgoKSSBuZWVkIHRvIGV4dGVuZCB0aGF0IHByb3RvY29sIHRvIGRldGVjdCBzdWNoIGEgY2xvYmJl
cmluZyBpbiBvcmRlciB0bwpiZSBhYmxlIHRvIHRlbGwgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBn
cnViIGhhdmluZyBzZXQgYSBuZXcgcGFyYW1ldGVyCm9yIGp1c3Qgd3JpdHRlbiBnYXJiYWdlIHRv
IGl0LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
