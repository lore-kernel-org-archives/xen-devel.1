From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xen/tools: support Python 2 and Python 3
Date: Thu, 22 Feb 2018 17:05:48 +0000
Message-ID: <20180222170548.uczzj3yal46bsyxd@citrix.com>
References: <20180222055246.32522-1-cardoe@cardoe.com>
 <30c4e0c3-ad4b-82c2-ba75-44fab36d0d49@citrix.com>
 <e67f5bf3-1db6-0b74-c4b1-0f111125c940@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=69li=fq=citrix.com=prvs=58412377d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eouKE-000373-0Z
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 17:06:30 +0000
Content-Disposition: inline
In-Reply-To: <e67f5bf3-1db6-0b74-c4b1-0f111125c940@cardoe.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMjIsIDIwMTggYXQgMTA6NDc6MjdBTSAtMDYwMCwgRG91ZyBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gMi8yMi8xOCA2OjU0IEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ID4gT24g
MjIvMDIvMTggMDU6NTIsIERvdWcgR29sZHN0ZWluIHdyb3RlOgo+ID4+IFRoZXNlIGNoYW5nZXMg
c2hvdWxkIG1ha2UgaXQgcG9zc2libGUgdG8gc3VwcG9ydCBtb2Rlcm4gUHl0aG9ucyBhcyB3ZWxs
Cj4gPj4gYXMgdGhlIG9sZGVzdCBQeXRob24gMiBzdGlsbCBzdXBwb3J0ZWQuCj4gPj4KPiA+PiBT
aWduZWQtb2ZmLWJ5OiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+Cj4gPiAKPiA+
IFRvIHRoZSBvdmVyYWxsIGVmZmVjdCwgdGhpcyBpcyBkZWZpbml0ZWx5IGEgZ29vZCB0aGluZy7C
oCBTb21lIHF1ZXJpZXMKPiA+IGhvd2V2ZXIuLi4KPiA+IAo+IAo+ID4+IGRpZmYgLS1naXQgYS94
ZW4vdG9vbHMvY29tcGF0LWJ1aWxkLWhlYWRlci5weSBiL3hlbi90b29scy9jb21wYXQtYnVpbGQt
aGVhZGVyLnB5Cj4gPj4gaW5kZXggMzI0MjFiNjQ1Yi4uNTQ2MzcxMjI1ZCAxMDA3NTUKPiA+PiAt
LS0gYS94ZW4vdG9vbHMvY29tcGF0LWJ1aWxkLWhlYWRlci5weQo+ID4+ICsrKyBiL3hlbi90b29s
cy9jb21wYXQtYnVpbGQtaGVhZGVyLnB5Cj4gPj4gQEAgLTIzLDQgKzIzLDQgQEAgcGF0cyA9IFsK
PiA+PiAgZm9yIGxpbmUgaW4gc3lzLnN0ZGluLnJlYWRsaW5lcygpOgo+ID4+ICAgICAgZm9yIHBh
dCBpbiBwYXRzOgo+ID4+ICAgICAgICAgIGxpbmUgPSByZS5zdWJuKHBhdFswXSwgcGF0WzFdLCBs
aW5lKVswXQo+ID4+IC0gICAgcHJpbnQgbGluZS5yc3RyaXAoKQo+ID4+ICsgICAgc3lzLnN0ZG91
dC53cml0ZShsaW5lLnJzdHJpcCgpICsgJ1xuJykKPiA+IAo+ID4gSXMgdGhlcmUgYW55dGhpbmcg
d3Jvbmcgd2l0aCBwcmludChsaW5lLnJzdHJpcCgpKSB3aGljaCBpcyB0aGUgbW9yZQo+ID4gY29t
bW9uIHdheSBvZiBkb2luZyB0aGlzPwo+IAo+IFRoZSBvdGhlciBzY3JpcHRzIGluIHRoZSByZXBv
IGF2b2lkZWQgdXNpbmcgcHJpbnQgYXMgYSBmdW5jdGlvbiB3aGljaAo+IHdhcyBvbmx5IGFkZGVk
IHRvIFB5dGhvbiAyLjYgYW5kIG5ld2VyIGlmIHlvdSB1c2UgZnJvbSBfX2Z1dHVyZV9fIGltcG9y
dAo+IHByaW50X2Z1bmN0aW9uLiBUaGUgUkVBRE1FIGluIHRoZSByZXBvIHN0aWxsIHNheXMgUHl0
aG9uIDIuMyBhbmQgbmV3ZXIKPiBzbyBJIGhhZCBhc3N1bWVkIGlmIEkgYnJva2UgdGhpbmdzIHBy
aW9yIHRvIFB5dGhvbiAyLjYgaXQgd291bGQgYmUgYQo+IHNob3cgc3RvcHBlci4gV2hpbGUgUHl0
aG9uIDIuMyB3YXMgcmVsZWFzZWQgSnVseSAyOXRoIDIwMDMgYW5kIFB5dGhvbgo+IDIuNiB3YXMg
cmVsZWFzZWQgT2N0IDFzdCAyMDA4IEkgZmlndXJlZCBjaGFuZ2luZyB0aGlzIHJlcXVpcmVtZW50
IHdhcwo+IGdvaW5nIHRvIGJlIG1ldCB3aXRoIHRoZSBzYW1lIGRpZmZpY3VsdGx5IEkgZW5jb3Vu
dGVyZWQgbGFzdCB0aW1lCj4gc3VnZ2VzdGluZyB0aGF0IHdlIG9ubHkgc3VwcG9ydCB2ZXJzaW9u
cyBvZiBidWlsZCB0b29scyByZWxlYXNlZCBpbiB0aGUKPiBwYXN0IGRlY2FkZS4KPiAKCjIuMyBp
cyBtb3JlIHRoYW4gfjE1IHllYXJzIGFnbywgY2FuIHdlIHNlZWsgdG8gYnVtcCB0aGUgdmVyc2lv
biBhIGJpdC4KOi0pCgoyLjYgaXMgcmVhY2hpbmcgaXRzIDEwIGJpcnRoZGF5IHRoaXMgeWVhciwg
bWF5YmUgaXQgaXMgYmV0dGVyIHRvIGp1c3QKdXNlIHRoYXQ/CgpXaGF0IGRpZmZpY3VsdHkgeW91
IGhhZCBsYXN0IHRpbWU/CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
