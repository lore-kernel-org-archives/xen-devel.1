From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2] x86/hvm: remove default ioreq server
Date: Tue, 7 Aug 2018 14:45:15 +0000
Message-ID: <7c15aa42369a4923a0df12df5eaa88d0@AMSPEX02CL03.citrite.net>
References: <20180807140220.13703-1-paul.durrant@citrix.com>
 <5B69AD0902000078001DB9D4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ay9j=kw=citrix.com=prvs=750b60ad6=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fn3Ee-0000KF-49
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 14:45:20 +0000
In-Reply-To: <5B69AD0902000078001DB9D4@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMDcgQXVndXN0IDIwMTggMTU6MzEKPiBUbzogUGF1
bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogeGVuLWRldmVsIDx4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0geDg2
L2h2bTogcmVtb3ZlIGRlZmF1bHQgaW9yZXEgc2VydmVyCj4gCj4gPj4+IE9uIDA3LjA4LjE4IGF0
IDE2OjAyLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gLS0tIGEveGVuL2Fy
Y2gveDg2L2h2bS9odm0uYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+ID4gQEAg
LTQwOTMsMTIgKzQwOTMsMTUgQEAgc3RhdGljIGludCBodm1fYWxsb3dfc2V0X3BhcmFtKHN0cnVj
dCBkb21haW4KPiAqZCwKPiA+ICAgICAgY2FzZSBIVk1fUEFSQU1fQ09OU09MRV9FVlRDSE46Cj4g
PiAgICAgIGNhc2UgSFZNX1BBUkFNX1g4N19GSVBfV0lEVEg6Cj4gPiAgICAgICAgICBicmVhazsK
PiA+ICsgICAgLyogVGhlIGZvbGxvd2luZyBwYXJhbWV0ZXJzIGFyZSBkZXByZWNhdGVkLiAqLwo+
ID4gKyAgICBjYXNlIEhWTV9QQVJBTV9CVUZJT1JFUV9FVlRDSE46Cj4gPiArICAgICAgICByYyA9
IC1FUEVSTTsKPiA+ICsgICAgICAgIGJyZWFrOwo+ID4gICAgICAvKgo+ID4gICAgICAgKiBUaGUg
Zm9sbG93aW5nIHBhcmFtZXRlcnMgbXVzdCBub3QgYmUgc2V0IGJ5IHRoZSBndWVzdAo+ID4gICAg
ICAgKiBzaW5jZSB0aGUgZG9tYWluIG1heSBuZWVkIHRvIGJlIHBhdXNlZC4KPiA+ICAgICAgICov
Cj4gPiAgICAgIGNhc2UgSFZNX1BBUkFNX0lERU5UX1BUOgo+ID4gLSAgICBjYXNlIEhWTV9QQVJB
TV9ETV9ET01BSU46Cj4gPiAgICAgIGNhc2UgSFZNX1BBUkFNX0FDUElfU19TVEFURToKPiA+ICAg
ICAgLyogVGhlIHJlbWFpbmluZyBwYXJhbWV0ZXJzIHNob3VsZCBub3QgYmUgc2V0IGJ5IHRoZSBn
dWVzdC4gKi8KPiA+ICAgICAgZGVmYXVsdDoKPiAKPiBTbyB3aHkgYWdhaW4gZG9uJ3QgeW91IGFk
ZCBETV9ET01BSU4gYWxvbmdzaWRlIEJVRklPUkVRX0VWVENITgo+IGFib3ZlIChhbmQgcmVtb3Zl
IGl0IGZyb20gaHZtX3NldF9wYXJhbSgpKSwgYW5kIHRoZW4gYWxzbyB0bwo+IGh2bV9hbGxvd19n
ZXRfcGFyYW0oKSdzIG5ldyBkZXByZWNhdGVkIGdyb3VwLCBwbHVzIHJlc3BlY3RpdmUKPiB0cmVh
dG1lbnQgaW4gcHVibGljL2h2bS9wYXJhbXMuaD8gSSBjYW4ndCBmaW5kIGFueSB1c2Ugb2YgdGhp
cwo+IGV4Y2VwdCBpbiB0aGUgZ2V0L3NldCBmdW5jdGlvbnMgaGVyZSwgYW5kIHlvdXIgcWVtdS10
cmFkIHBhdGNoCj4gcmVtb3ZlcyB0aGUgc29sZSB1c2UgKCJzZXQiIHJlcXVlc3QpIHRoZXJlLgo+
IAoKT2ssIHllcyBJJ2xsIGFkZCBpdCB0b28uCgogIFBhdWwKCj4gSmFuCj4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
