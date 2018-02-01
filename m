From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: firmware/shim: fix build process to use POSIX find
 options
Date: Thu, 1 Feb 2018 10:13:58 +0000
Message-ID: <20180201101358.53jhbmdhrof4f7mp@MacBook-Pro-de-Roger.local>
References: <20180129113709.afgogfzp3pszcav3@MacBook-Pro-de-Roger.local>
 <201801301857.w0UIvSXT062690@dark.beer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tmgq=e3=citrix.com=prvs=563c9b0be=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ehBse-0000hX-Rd
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 10:14:08 +0000
Content-Disposition: inline
In-Reply-To: <201801301857.w0UIvSXT062690@dark.beer.net>
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

T24gVHVlLCBKYW4gMzAsIDIwMTggYXQgMTI6NTc6MjhQTSAtMDYwMCwgTWljaGFlbCBHbGFzZ293
IHdyb3RlOgo+IFJvZ2VyIFBhdSBbTW9ubl9dIHdyb3RlOgo+ID4gT24gRnJpLCBKYW4gMjYsIDIw
MTggYXQgMDE6NTQ6MzBQTSAtMDYwMCwgTWljaGFlbCBHbGFzZ293IHdyb3RlOgo+ID4gPiBUaGlz
IHJlY2VudCBwYXRjaCBjYW4gYmUgc2ltcGxpZmllZCBhIGJpdC4gIChUaGUgcGF0Y2ggYmVsb3cg
aXMKPiA+ID4gdW50ZXN0ZWQsIGp1c3QgYSBzdWdnZXN0aW9uLikKPiA+IAo+ID4gVGhhbmtzLCB0
aGlzIExHVE0sIGJ1dCBpdCBuZWVkcyB5b3VyIFNpZ25lZC1vZmYtYnkgdGFnIGluIG9yZGVyIHRv
IGJlCj4gPiBhcHBsaWVkLgo+IAo+IFNpbXBsaWZ5IHBvc2l4LWZyaWVuZGx5IGNoYW5nZXMgYSBi
aXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBHbGFzZ293IDxnbGFzZ293QGJlZXIubmV0
PgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoK
V2l0aCBvbmUgbml0Li4uCgo+IC0tLQo+IAo+IGRpZmYgLXVyIGEvdG9vbHMvZmlybXdhcmUveGVu
LWRpci9NYWtlZmlsZSBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUKPiAtLS0gYS90
b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlICAgMjAxOC0wMS0yNiAxMTo0MDowMC43MTEz
ODk2MDUgLTA2MDAKPiArKysgYi90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlICAgMjAx
OC0wMS0yNiAxMTo1MTo0MS4yNzk4MjUxNDIgLTA2MDAKPiBAQCAtMjAsOSArMjAsOCBAQAo+ICAg
ICAgICAgcm0gLWYgbGlua2Zhcm0uc3RhbXAudG1wCj4gICAgICAgICAkKGZvcmVhY2ggZCwgJChM
SU5LX0RJUlMpLCBcCj4gICAgICAgICAgICAgICAgICAobWtkaXIgLXAgJChEKS8kKGQpOyBcCj4g
LSAgICAgICAgICAgICAgICAgY2QgJChEKS8kKGQpOyBcCj4gLSAgICAgICAgICAgICAgICAgZmlu
ZCAkKFhFTl9ST09UKS8kKGQpLyAtdHlwZSBkIC1leGVjIHNoIC1jIFwKPiAtICAgICAgICAgICAg
ICAgICAgICAgImVjaG8ge30gfCBzZWQgJ3MsXiQoWEVOX1JPT1QpLyQoZCkvLCxnJyB8IHhhcmdz
IG1rZGlyIC1wIgo+ICBcOyk7KQo+ICsgICAgICAgICAgICAgICAgIGNkICQoRCkvJChkKSAmJiBc
CgpUaGVyZSBzaG91bGQgYmUgbm8gbmVlZCBmb3IgdGhlICcmJicsIGFsbCB0aGlzIGNodW5rIHNo
b3VsZCBiZQpleGVjdXRlZCB3aXRoICdzZXQgLWUnLCBzbyBwbGVhc2UgcmVzdG9yZSB0aGUgcHJl
dmlvdXMgJzsnLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
