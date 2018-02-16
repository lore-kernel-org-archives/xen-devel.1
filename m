From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] shut down domain when last vCPU goes down
Date: Fri, 16 Feb 2018 15:20:27 +0000
Message-ID: <f0538ea6-5648-4b82-1240-0d02bfeaa065@citrix.com>
References: <5A87028802000078001A8759@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=bmal=fk=citrix.com=prvs=5781d3f3f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1emhof-0002B7-SP
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 15:20:49 +0000
In-Reply-To: <5A87028802000078001A8759@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDIvMTggMTU6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IC0tLSBhL3hlbi9jb21tb24v
ZG9tYWluLmMKPiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jCj4gQEAgLTEzMjEsNiArMTMyMSwy
MiBAQCBsb25nIGRvX3ZjcHVfb3AoaW50IGNtZCwgdW5zaWduZWQgaW50IHZjCj4gICAgICAgICAg
YnJlYWs7Cj4gIAo+ICAgICAgY2FzZSBWQ1BVT1BfZG93bjoKPiArICAgICAgICBmb3JfZWFjaF92
Y3B1ICggZCwgdiApCj4gKyAgICAgICAgICAgIGlmICggdi0+dmNwdV9pZCAhPSB2Y3B1aWQgJiYg
IXRlc3RfYml0KF9WUEZfZG93biwgJnYtPnBhdXNlX2ZsYWdzKSApCj4gKyAgICAgICAgICAgIHsK
PiArICAgICAgICAgICAgICAgcmMgPSAxOwo+ICsgICAgICAgICAgICAgICBicmVhazsKPiArICAg
ICAgICAgICAgfQo+ICsKPiArICAgICAgICBpZiAoICFyYyApCgpIb3cgYWJvdXQ6CgppZiAoICFy
YyApIC8qIExhc3QgdmNwdSBnb2luZyBkb3duPyAqLwoKanVzdCB0byBnaXZlIHNvbWUgaGludCBv
ZiB3aGF0IGlzIGdvaW5nIG9uIHRvIGEgY2FzdWFsIHJlYWRlcj8KClByZWZlcmFibHkgd2l0aCB0
aGlzIGlzIG9yIHNvbWV0aGluZyBzaW1pbGFyLCBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3Blcgo8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBk
b21haW5fc2h1dGRvd24oZCwgU0hVVERPV05fcG93ZXJvZmYpOwo+ICsgICAgICAgICAgICBicmVh
azsKPiArICAgICAgICB9Cj4gKwo+ICsgICAgICAgIHJjID0gMDsKPiArICAgICAgICB2ID0gZC0+
dmNwdVt2Y3B1aWRdOwo+ICsKPiAgI2lmZGVmIENPTkZJR19YODYKPiAgICAgICAgICBpZiAoIHB2
X3NoaW0gKQo+ICAgICAgICAgICAgICByYyA9IGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9jcHUoMCwg
cHZfc2hpbV9jcHVfZG93biwgdik7Cj4KPgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
