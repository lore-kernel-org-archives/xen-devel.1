From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/hvm: remove default ioreq server
Date: Tue, 07 Aug 2018 08:30:33 -0600
Message-ID: <5B69AD0902000078001DB9D4@prv1-mh.provo.novell.com>
References: <20180807140220.13703-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hjto=kw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fn30P-0007FN-GK
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 14:30:37 +0000
In-Reply-To: <20180807140220.13703-1-paul.durrant@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA4LjE4IGF0IDE2OjAyLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZt
L2h2bS5jCj4gQEAgLTQwOTMsMTIgKzQwOTMsMTUgQEAgc3RhdGljIGludCBodm1fYWxsb3dfc2V0
X3BhcmFtKHN0cnVjdCBkb21haW4gKmQsCj4gICAgICBjYXNlIEhWTV9QQVJBTV9DT05TT0xFX0VW
VENITjoKPiAgICAgIGNhc2UgSFZNX1BBUkFNX1g4N19GSVBfV0lEVEg6Cj4gICAgICAgICAgYnJl
YWs7Cj4gKyAgICAvKiBUaGUgZm9sbG93aW5nIHBhcmFtZXRlcnMgYXJlIGRlcHJlY2F0ZWQuICov
Cj4gKyAgICBjYXNlIEhWTV9QQVJBTV9CVUZJT1JFUV9FVlRDSE46Cj4gKyAgICAgICAgcmMgPSAt
RVBFUk07Cj4gKyAgICAgICAgYnJlYWs7Cj4gICAgICAvKgo+ICAgICAgICogVGhlIGZvbGxvd2lu
ZyBwYXJhbWV0ZXJzIG11c3Qgbm90IGJlIHNldCBieSB0aGUgZ3Vlc3QKPiAgICAgICAqIHNpbmNl
IHRoZSBkb21haW4gbWF5IG5lZWQgdG8gYmUgcGF1c2VkLgo+ICAgICAgICovCj4gICAgICBjYXNl
IEhWTV9QQVJBTV9JREVOVF9QVDoKPiAtICAgIGNhc2UgSFZNX1BBUkFNX0RNX0RPTUFJTjoKPiAg
ICAgIGNhc2UgSFZNX1BBUkFNX0FDUElfU19TVEFURToKPiAgICAgIC8qIFRoZSByZW1haW5pbmcg
cGFyYW1ldGVycyBzaG91bGQgbm90IGJlIHNldCBieSB0aGUgZ3Vlc3QuICovCj4gICAgICBkZWZh
dWx0OgoKU28gd2h5IGFnYWluIGRvbid0IHlvdSBhZGQgRE1fRE9NQUlOIGFsb25nc2lkZSBCVUZJ
T1JFUV9FVlRDSE4KYWJvdmUgKGFuZCByZW1vdmUgaXQgZnJvbSBodm1fc2V0X3BhcmFtKCkpLCBh
bmQgdGhlbiBhbHNvIHRvCmh2bV9hbGxvd19nZXRfcGFyYW0oKSdzIG5ldyBkZXByZWNhdGVkIGdy
b3VwLCBwbHVzIHJlc3BlY3RpdmUKdHJlYXRtZW50IGluIHB1YmxpYy9odm0vcGFyYW1zLmg/IEkg
Y2FuJ3QgZmluZCBhbnkgdXNlIG9mIHRoaXMKZXhjZXB0IGluIHRoZSBnZXQvc2V0IGZ1bmN0aW9u
cyBoZXJlLCBhbmQgeW91ciBxZW11LXRyYWQgcGF0Y2gKcmVtb3ZlcyB0aGUgc29sZSB1c2UgKCJz
ZXQiIHJlcXVlc3QpIHRoZXJlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
