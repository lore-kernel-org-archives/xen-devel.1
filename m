From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/4] x86: Add map_domain_pages_global
Date: Tue, 18 Sep 2018 04:51:33 -0600
Message-ID: <5BA0D8B502000078001E940A@prv1-mh.provo.novell.com>
References: <cover.1536850239.git.ppircalabu@bitdefender.com><cover.1536850239.git.ppircalabu@bitdefender.com>
 <0843cadf468ac7d3fabda7fe290619c07fc3c274.1536850239.git.ppircalabu@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xuki=ma=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2DbY-0007DZ-JL
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 10:51:40 +0000
In-Reply-To: <0843cadf468ac7d3fabda7fe290619c07fc3c274.1536850239.git.ppircalabu@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA5LjE4IGF0IDE3OjAxLCA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+IHdy
b3RlOgo+IENyZWF0ZSBhIHNpbmdsZSBtYXBwaW5nIGZvciBtdWx0aXBsZSBkb21haW4gcGFnZXMu
CgpBdCBsZWFzdCBhcyBmYXIgYXMgbWFwX2RvbWFpbl9wYWdlc19nbG9iYWwoKSBnb2VzLCB5b3Ug
d2lsbCB3YW50IHRvIGp1c3RpZnkKd2h5IHdoYXQgd2UgaGF2ZSBpc24ndCBlbm91Z2guCgo+IC0t
LSBhL3Rvb2xzL2xpYnhjL3hjX3ZtX2V2ZW50LmMKPiArKysgYi90b29scy9saWJ4Yy94Y192bV9l
dmVudC5jCj4gQEAgLTc0LDcgKzc0LDcgQEAgc3RhdGljIGludCB4Y192bV9ldmVudF9kb21jdGwo
aW50IHR5cGUsIHVuc2lnbmVkIGludCAqcGFyYW0pCj4gICAgICB7Cj4gICAgICBjYXNlIFhFTl9W
TV9FVkVOVF9UWVBFX1BBR0lORzoKPiAgICAgICAgICAqcGFyYW0gPSBYRU5fRE9NQ1RMX1ZNX0VW
RU5UX09QX1BBR0lORzsKPiAtCWJyZWFrOwo+ICsgICAgICAgIGJyZWFrOwo+ICAKPiAgICAgIGNh
c2UgWEVOX1ZNX0VWRU5UX1RZUEVfTU9OSVRPUjoKPiAgICAgICAgICAqcGFyYW0gPSBYRU5fRE9N
Q1RMX1ZNX0VWRU5UX09QX01PTklUT1I7CgpDbGVhcmx5IG5vdCBzb21ldGhpbmcgeW91IHdhbnQg
dG8gZG8gaW4gYW4gb3RoZXJ3aXNlIGh5cGVydmlzb3Itb25seQpwYXRjaC4KCj4gK3ZvaWQgKl9f
bWFwX2RvbWFpbl9wYWdlc19nbG9iYWwoY29uc3Qgc3RydWN0IHBhZ2VfaW5mbyAqcGcsIHVuc2ln
bmVkIGludCBucikKCkkgd2UgcmVhbGx5IHRoaW5rIHdlIG5lZWQgdGhpcyBmdW5jdGlvbiwgbm8g
bmV3IG5hbWUgc3BhY2UgdmlvbGF0aW9ucwpwbGVhc2UgKGhlcmU6IG5vIHVuZHVlIGxlYWRpbmcg
dW5kZXJzY29yZXMpLgoKPiArewo+ICsgICAgbWZuX3QgbWZuW25yXTsKCkkgdGhpbmsgd2UnZCBs
aWtlIHRvIGF2b2lkIGFueSAobmV3KSBWTEFzIG9uIHRoZSBzdGFjay4KCj4gKyAgICBpbnQgaTsK
CnVuc2lnbmVkIGludAoKPiBAQCAtNjgsNiArNzEsMTIgQEAgc3RhdGljIGlubGluZSB2b2lkICpf
X21hcF9kb21haW5fcGFnZV9nbG9iYWwoY29uc3Qgc3RydWN0IHBhZ2VfaW5mbyAqcGcpCj4gICAg
ICByZXR1cm4gcGFnZV90b192aXJ0KHBnKTsKPiAgfQo+ICAKPiArc3RhdGljIGlubGluZSB2b2lk
ICpfX21hcF9kb21haW5fcGFnZXNfZ2xvYmFsKGNvbnN0IHN0cnVjdCBwYWdlX2luZm8gKnBnLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
aW50IG5yKQo+ICt7Cj4gKyAgICByZXR1cm4gX19tYXBfZG9tYWluX3BhZ2VfZ2xvYmFsKHBnKTsK
PiArfQoKRXZlbiBpZiBmdW5jdGlvbmFsbHkgdGhpcyBtaWdodCBiZSBjb3JyZWN0LCB5b3Ugc2hv
dWxkbid0IGRvIHNvLCBhcyB5b3UKZHJvcCBuciB3aXRob3V0IGFueSBleHBsYW5hdGlvbi4KCk92
ZXJhbGwsIGNvbnNpZGVyaW5nIHRoZSBvdGhlciBjb21tZW50IHlvdSd2ZSBnb3Qgb24gdGhlIGxh
c3QgcGF0Y2gsCmFzc3VtaW5nIGNvbnRpZ3VvdXMgcGh5c2ljYWwgcGFnZXMgaGVyZSBpcyBsaWtl
bHkgdGhlIHdyb25nIHJvdXRlCmFueXdheS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
