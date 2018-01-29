From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: firmware/shim: fix build process to use POSIX find
 options
Date: Mon, 29 Jan 2018 11:37:31 +0000
Message-ID: <20180129113709.afgogfzp3pszcav3@MacBook-Pro-de-Roger.local>
References: <201801261954.w0QJsVrb043842@dark.beer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zcj1=ey=citrix.com=prvs=56023d68c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eg7kq-0007DU-9i
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2018 11:37:40 +0000
Content-Disposition: inline
In-Reply-To: <201801261954.w0QJsVrb043842@dark.beer.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michael Glasgow <glasgow@beer.net>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMjYsIDIwMTggYXQgMDE6NTQ6MzBQTSAtMDYwMCwgTWljaGFlbCBHbGFzZ293
IHdyb3RlOgo+IFRoaXMgcmVjZW50IHBhdGNoIGNhbiBiZSBzaW1wbGlmaWVkIGEgYml0LiAgKFRo
ZSBwYXRjaCBiZWxvdyBpcwo+IHVudGVzdGVkLCBqdXN0IGEgc3VnZ2VzdGlvbi4pCj4gCgpUaGFu
a3MsIHRoaXMgTEdUTSwgYnV0IGl0IG5lZWRzIHlvdXIgU2lnbmVkLW9mZi1ieSB0YWcgaW4gb3Jk
ZXIgdG8gYmUKYXBwbGllZC4KCkFsc28gcmVtZW1iZXIgdG8gQ2MgdGhlIG1haW50YWluZXJzIHdo
ZW4gcmVzZW5kaW5nLCBJJ3ZlIGRvbmUgdGhpcyBmb3IKeW91IG5vdy4KCj4gZGlmZiAtdXIgYS90
b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlIGIvdG9vbHMvZmlybXdhcmUveGVuLWRpci9N
YWtlZmlsZQo+IC0tLSBhL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUJMjAxOC0wMS0y
NiAxMTo0MDowMC43MTEzODk2MDUgLTA2MDAKPiArKysgYi90b29scy9maXJtd2FyZS94ZW4tZGly
L01ha2VmaWxlCTIwMTgtMDEtMjYgMTE6NTE6NDEuMjc5ODI1MTQyIC0wNjAwCj4gQEAgLTIwLDkg
KzIwLDggQEAKPiAgCXJtIC1mIGxpbmtmYXJtLnN0YW1wLnRtcAo+ICAJJChmb3JlYWNoIGQsICQo
TElOS19ESVJTKSwgXAo+ICAJCSAobWtkaXIgLXAgJChEKS8kKGQpOyBcCj4gLQkJICBjZCAkKEQp
LyQoZCk7IFwKPiAtCQkgIGZpbmQgJChYRU5fUk9PVCkvJChkKS8gLXR5cGUgZCAtZXhlYyBzaCAt
YyBcCj4gLQkJICAgICAgImVjaG8ge30gfCBzZWQgJ3MsXiQoWEVOX1JPT1QpLyQoZCkvLCxnJyB8
IHhhcmdzIG1rZGlyIC1wIiBcOyk7KQo+ICsJCSAgY2QgJChEKS8kKGQpICYmIFwKPiArCQkgIChj
ZCAkKFhFTl9ST09UKS8kKGQpICYmIGZpbmQgLiAtdHlwZSBkKSB8IHhhcmdzIG1rZGlyIC1wIFw7
KTspCj4gIAkkKGZvcmVhY2ggZCwgJChMSU5LX0RJUlMpLCBcCj4gIAkJKGNkICQoWEVOX1JPT1Qp
OyBcCj4gIAkJIGZpbmQgJChkKSAhIC10eXBlIGwgLXR5cGUgZiBcCj4gCj4gCj4gLS0gCj4gTWlj
aGFlbCBHbGFzZ293IDxnbGFzZ293QGJlZXIubmV0Pgo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
