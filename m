From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] build: don't mandate availability of a
 fetcher program
Date: Thu, 4 Apr 2019 14:13:38 +0100
Message-ID: <20190404131338.GN14641@zion.uk.xensource.com>
References: <20190314140847.19328-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VYWF=SG=citrix.com=prvs=9901e81f4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hC2Ba-0003x7-QJ
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 13:13:42 +0000
Content-Disposition: inline
In-Reply-To: <20190314140847.19328-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMTQsIDIwMTkgYXQgMDI6MDg6NDdQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBJdCBpcyBjb21tb24gdGhhdCBidWlsZCBob3N0cyBhcmUgaXNvbGF0ZWQgZnJvbSBvdXRzaWRl
IHdvcmxkLiBUaGV5Cj4gZG9uJ3QgbmVjZXNzYXJpbHkgaGF2ZSB3Z2V0IG9yIGZ0cCBpbnN0YWxs
ZWQuCj4gCj4gVHVybiB0aGUgZXJyb3IgaW50byB3YXJuaW5nIGluIGNvbmZpZ3VyZS4gQW5kIHBv
aW50IEZFVENIRVIgdG8gYGZhbHNlJwo+IGNvbW1hbmQgaWYgbmVpdGhlciB3Z2V0IG5vciBmdHAg
aXMgYXZhaWxhYmxlLCBzbyBhbnkgYXR0ZW1wdCB0bwo+IGRvd25sb2FkIHdpbGwgcmVzdWx0IGlu
IGVycm9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
CgpQaW5nPwoKVGhpcyBvbmUgaXMgcmF0aGVyIGxvdyByaXNrLiBJIGludGVuZCB0byBjb21taXQg
aXQgaWYgSSBkb24ndCBoZWFyIGJhY2sKYnkgbmV4dCB3ZWVrLgoKV2VpLgoKPiAtLS0KPiAgbTQv
ZmV0Y2hlci5tNCAgICAgfCAgNCArKystCj4gIHN0dWJkb20vY29uZmlndXJlIHwgNDYgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICB0b29scy9jb25maWd1
cmUgICB8IDQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0K
PiAgMyBmaWxlcyBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9tNC9mZXRjaGVyLm00IGIvbTQvZmV0Y2hlci5tNAo+IGluZGV4IDg2ZjMz
YjM5MzcuLmMxYTcyYzE4OWMgMTAwNjQ0Cj4gLS0tIGEvbTQvZmV0Y2hlci5tNAo+ICsrKyBiL200
L2ZldGNoZXIubTQKPiBAQCAtMSw1ICsxLDYgQEAKPiAgQUNfREVGVU4oW0FYX0NIRUNLX0ZFVENI
RVJdLCBbCj4gIEFDX1BBVEhfUFJPRyhbV0dFVF0sW3dnZXRdLCBbbm9dKQo+ICtBQ19QQVRIX1BS
T0coW0ZBTFNFXSxbZmFsc2VdLCBbL2Jpbi9mYWxzZV0pCj4gIEFTX0lGKFt0ZXN0IHgiJFdHRVQi
ICE9IHgibm8iXSwgWwo+ICAgICAgRkVUQ0hFUj0iJFdHRVQgLWMgLU8iCj4gIF0sIFsKPiBAQCAt
Nyw3ICs4LDggQEAgQVNfSUYoW3Rlc3QgeCIkV0dFVCIgIT0geCJubyJdLCBbCj4gICAgICBBU19J
RihbdGVzdCB4IiRGVFAiICE9IHgibm8iXSwgWwo+ICAgICAgICAgIEZFVENIRVI9IiRGVFAgLW8i
Cj4gICAgICBdLCBbCj4gLSAgICAgICAgQUNfTVNHX0VSUk9SKFtjYW5ub3QgZmluZCB3Z2V0IG9y
IGZ0cF0pCj4gKyAgICAgICAgRkVUQ0hFUj0iJEZBTFNFIgo+ICsgICAgICAgIEFDX01TR19XQVJO
KFtjYW5ub3QgZmluZCB3Z2V0IG9yIGZ0cF0pCj4gICAgICBdKQo+ICBdKQo+ICBBQ19TVUJTVChG
RVRDSEVSKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
