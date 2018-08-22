From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 07/34] x86: only call memory_type_changed
 for HVM guests
Date: Wed, 22 Aug 2018 17:12:28 +0100
Message-ID: <20180822161228.s4woryggzvlsd4g4@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <ede6a87dc100c0ef2cf28f7acc562244b8b0f79e.1534518694.git-series.wei.liu2@citrix.com>
 <5B7AACA502000078001E0008@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=om3v=lf=citrix.com=prvs=7650e4d92=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fsVkG-0003hn-N6
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 16:12:32 +0000
Content-Disposition: inline
In-Reply-To: <5B7AACA502000078001E0008@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjAsIDIwMTggYXQgMDU6NTc6MjVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tY3RsLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9kb21jdGwuYwo+ID4gQEAgLTQxNiw3ICs0MTYsNyBAQCBsb25nIGFyY2hfZG9fZG9tY3RsKAo+
ID4gICAgICAgICAgICAgIHJldCA9IGlvcG9ydHNfcGVybWl0X2FjY2VzcyhkLCBmcCwgZnAgKyBu
cCAtIDEpOwo+ID4gICAgICAgICAgZWxzZQo+ID4gICAgICAgICAgICAgIHJldCA9IGlvcG9ydHNf
ZGVueV9hY2Nlc3MoZCwgZnAsIGZwICsgbnAgLSAxKTsKPiA+IC0gICAgICAgIGlmICggIXJldCAp
Cj4gPiArICAgICAgICBpZiAoICFyZXQgJiYgaXNfaHZtX2RvbWFpbihkKSApCj4gPiAgICAgICAg
ICAgICAgbWVtb3J5X3R5cGVfY2hhbmdlZChkKTsKPiAKPiBJIHRoaW5rIHdoZXRoZXIgdG8gYWRk
IGlzX2h2bV8uLi4oKSBjb25kaXRpb25hbHMgb3Igd2hldGhlciB0byBpbnRyb2R1Y2UKPiBzdHVi
cyBzaG91bGQgYmUgc2VsZWN0ZWQgYmFzZWQgb24gcmVzdWx0aW5nIGNvZGUgY2h1cm46IEluIHRo
ZSBjYXNlCj4gaGVyZSB0aGlzIHdvdWxkIHNlZW0gdG8gc3VnZ2VzdCBhIHN0YXRpYyBpbmxpbmUg
c3R1YiBpcyBvbiBvcmRlci4gT3IKPiBwZXJoYXBzIG1vcmUgZ2VuZXJpY2FsbHkgLSBpZiBhIGZ1
bmN0aW9uIGFscmVhZHkgc2l0cyBzb2xlbHkgb24gaXNfaHZtXy4uLigpCj4gZ3VhcmRlZCBjb2Rl
IHBhdGhzLCBkb24ndCBpbnRyb2R1Y2UgYSBzdHViLCBidXQgb3RoZXJ3aXNlIHByb2JhYmx5Cj4g
aW50cm9kdWNpbmcgYSBzdHViIGlzIHByZWZlcmFibGUgb3ZlciBzY2F0dGVyaW5nIGFyb3VuZCBu
ZXcgaXNfaHZtXy4uLigpCj4gZ3VhcmRzLgoKSWYgdGhlcmUgaGFkIGJlZW4gZG96ZW5zIG9mIGNh
bGxzIHRvIG1lbW9yeV90eXBlX2NoYW5nZWQgSSB3b3VsZCBoYXZlCmFkZGVkIGEgc3R1YiBpbnN0
ZWFkLiBJIHdpbGwgc3dpdGNoIHRvIHVzaW5nIHN0dWJzIGluIHRoZSBuZXh0IHZlcnNpb24uCgpJ
ZiBhIGZ1bmN0aW9uIGFscmVhZHkgc2l0cyB1bmRlciBpc19odm1fKiBubyBzdHViIHdpbGwgYmUg
bmVlZGVkIGluIHRoZQpmaXJzdCBwbGFjZSwgYXNzdW1pbmcgRENFIHdvcmtzIHByb3Blcmx5LgoK
V2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
