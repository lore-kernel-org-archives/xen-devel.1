From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/3] x86/shadow: emulate_gva_to_mfn() should
 respect p2m_ioreq_server
Date: Tue, 13 Nov 2018 04:22:16 -0700
Message-ID: <5BEAB3E802000078001FB6A8@prv1-mh.provo.novell.com>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
 <5BEAABA302000078001FB62E@prv1-mh.provo.novell.com>
 <dc11f02ac58c4834899caa1faca021e6@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k8x1=ny=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gMWlw-000179-ME
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 11:22:20 +0000
In-Reply-To: <dc11f02ac58c4834899caa1faca021e6@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjExLjE4IGF0IDExOjU5LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMTMgTm92ZW1iZXIgMjAxOCAxMDo0Nwo+
PiBUbzogeGVuLWRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4+IENjOiBB
bmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50Cj4+
IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
OyBUaW0gKFhlbi5vcmcpCj4+IDx0aW1AeGVuLm9yZz4KPj4gU3ViamVjdDogW1BBVENIIDUvM10g
eDg2L3NoYWRvdzogZW11bGF0ZV9ndmFfdG9fbWZuKCkgc2hvdWxkIHJlc3BlY3QKPj4gcDJtX2lv
cmVxX3NlcnZlcgo+PiAKPj4gV3JpdGVzIHRvIHN1Y2ggcGFnZXMgd291bGQgbmVlZCB0byBiZSBo
YW5kZWQgdG8gdGhlIGVtdWxhdG9yLCB3aGljaCB3ZSdyZQo+PiBub3QgcHJlcGFyZWQgdG8gZG8g
YXQgdGhpcyBwb2ludC4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPj4gCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvaHZtLmMKPj4g
KysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9odm0uYwo+PiBAQCAtMzM4LDcgKzMzOCw3IEBA
IHN0YXRpYyBtZm5fdCBlbXVsYXRlX2d2YV90b19tZm4oc3RydWN0IHYKPj4gICAgICB7Cj4+ICAg
ICAgICAgIHJldHVybiBfbWZuKEJBRF9HRk5fVE9fTUZOKTsKPj4gICAgICB9Cj4+IC0gICAgaWYg
KCBwMm1faXNfZGlzY2FyZF93cml0ZShwMm10KSApCj4+ICsgICAgaWYgKCBwMm1faXNfZGlzY2Fy
ZF93cml0ZShwMm10KSB8fCBwMm10ID09IHAybV9pb3JlcV9zZXJ2ZXIgKQo+PiAgICAgIHsKPj4g
ICAgICAgICAgcHV0X3BhZ2UocGFnZSk7Cj4+ICAgICAgICAgIHJldHVybiBfbWZuKFJFQURPTkxZ
X0dGTik7Cj4gCj4gSXMgdGhpcyB3aGF0IHdlIHdhbnQgaGVyZT8gSSB3b3VsZCBoYXZlIHRob3Vn
aHQgd2Ugd2FudCB0byByZXR1cm4gCj4gQkFEX0dGTl9UT19NRk4gaW4gdGhlIHAybV9pb3JlcV9z
ZXJ2ZXIgY2FzZSBzbyB0aGF0IHRoZSBjYWxsZXIgdHJlYXRzIHRoaXMgaW4gCj4gdGhlIHNhbWUg
d2F5IGl0IHdvdWxkIE1NSU8uCgpJJ20gbm90IHN1cmUgd2hpY2ggYmVoYXZpb3IgaXMgYmV0dGVy
OyBJJ20gY2VydGFpbmx5IGZpbmUgd2l0aCBzd2l0Y2hpbmcKYXMgeW91IHNheSwgYnV0IEknZCBm
aXJzdCBsaWtlIHRvIHNlZSBUaW0ncyBvcGluaW9uIGFzIHdlbGwuCgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
