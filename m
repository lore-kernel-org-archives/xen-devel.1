From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH 04/15] x86/cpu/mce: Add Hygon Dhyana support
 to the MCA infrastructure
Date: Tue, 15 Jan 2019 20:52:15 +0800
Message-ID: <37d7079f-f91f-a24e-972f-885d54211108@hygon.cn>
References: <cover.1545284932.git.puwen@hygon.cn>
 <b495fe7a40b55c4de42607fabf12bce10b636515.1545284932.git.puwen@hygon.cn>
 <5C3CB76E020000780020D6C3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N85w=PX=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1gjOHc-0001Ck-P1
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 12:57:32 +0000
In-Reply-To: <5C3CB76E020000780020D6C3@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS8xLzE1IDA6NDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIwLjEyLjE4IGF0
IDE0OjEyLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1
L21jaGVjay9tY2VfYW1kLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWNlX2Ft
ZC5jCj4+IEBAIC0xNjIsNyArMTYyLDggQEAgbWNlcXVpcmtfbG9va3VwX2FtZF9xdWlya2RhdGEo
c3RydWN0IGNwdWluZm9feDg2ICpjKQo+PiAgIHsKPj4gICAgICAgaW50IGk7Cj4+ICAgCj4+IC0g
ICAgQlVHX09OKGMtPng4Nl92ZW5kb3IgIT0gWDg2X1ZFTkRPUl9BTUQpOwo+PiArICAgIGlmIChj
LT54ODZfdmVuZG9yICE9IFg4Nl9WRU5ET1JfQU1EKQo+PiArICAgICAgICByZXR1cm4gMDsKPiAK
PiBQbGVhc2UgY2FuIHlvdSBsZWF2ZSB0aGlzIHVudG91Y2hlZCBhbmQgY2hhbmdlIHRoZSBzaW5n
bGUKPiBjYWxsZXIgaW5zdGVhZD8gSWYgbmVlZCBiZSBkb3duIHRoZSByb2FkIChidXQgb2YgY291
cnNlIHlvdSdsbAo+IG5ldmVyIGludHJvZHVjZSBxdWlya3kgYmVoYXZpb3IpLCB3ZSdkIHRoZW4g
YWRkCj4gbWNlcXVpcmtfbG9va3VwX2h5Z29uX3F1aXJrZGF0YSgpLgoKWWVzLCBJIGNhbiBsZWF2
ZSB0aGlzIGZ1bmN0aW9uIHVudG91Y2hlZC4gQW5kIGNoYW5nZSB0aGUgc2luZ2xlIGNhbGxlcgph
bWRfbWNoZWNrX2luaXQoKToKLSAgICBlbnVtIG1jZXF1aXJrX2FtZF9mbGFncyBxdWlya2ZsYWcg
PSBtY2VxdWlya19sb29rdXBfYW1kX3F1aXJrZGF0YShjaSk7CisgICAgZW51bSBtY2VxdWlya19h
bWRfZmxhZ3MgcXVpcmtmbGFnID0gMDsKKworICAgIGlmIChjaS0+eDg2X3ZlbmRvciAhPSBYODZf
VkVORE9SX0hZR09OKQorICAgICAgICBxdWlya2ZsYWcgPSBtY2VxdWlya19sb29rdXBfYW1kX3F1
aXJrZGF0YShjaSk7CgpJcyB0aGUgbW9kaWZpY2F0aW9uIE9LPwoKQWxzbyBhZGQgbWNlcXVpcmtf
bG9va3VwX2h5Z29uX3F1aXJrZGF0YSgpIGlzIGFub3RoZXIgc29sdXRpb24sIGV2ZW4KdGhvdWdo
IGl0IHdpbGwgZG8gbm90aGluZyBhdCB0aGUgbW9tZW50LgoKLS0gClJlZ2FyZHMsClB1IFdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
