From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 05/34] xen: is_hvm_domain should evaluate to
 0 when !CONFIG_HVM
Date: Tue, 21 Aug 2018 19:50:49 +0100
Message-ID: <b7d92bb9-16cd-f917-84f8-617dbeb57e8c@arm.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <32dc160e20e574c7ec736fad43157928de86962e.1534518694.git-series.wei.liu2@citrix.com>
 <5B7AAB4002000078001DFFF7@prv1-mh.provo.novell.com>
 <20180821163127.fmzdxpj5kedmvecl@citrix.com>
 <faa2beb9-f589-a396-5133-2f76c2837349@arm.com>
 <20180821184900.yy256xnosycpxnzf@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hivl=le=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fsBjy-0006fc-Va
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 18:50:55 +0000
In-Reply-To: <20180821184900.yy256xnosycpxnzf@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwOC8yMS8yMDE4IDA3OjQ5IFBNLCBXZWkgTGl1IHdyb3RlOgo+IE9uIFR1ZSwgQXVnIDIx
LCAyMDE4IGF0IDA3OjMzOjU2UE0gKzAxMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgV2Vp
LAo+Pgo+PiBPbiAwOC8yMS8yMDE4IDA1OjMxIFBNLCBXZWkgTGl1IHdyb3RlOgo+Pj4gT24gTW9u
LCBBdWcgMjAsIDIwMTggYXQgMDU6NTE6MjhBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4+Pj4gT24gMTcuMDguMTggYXQgMTc6MTIsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToK
Pj4+Pj4gU2luY2UgaXQgaXMgZGVmaW5lZCBpbiBjb21tb24gaGVhZGVyIGZpbGUsIGludHJvZHVj
ZSBDT05GSUdfSFZNIHRvCj4+Pj4+IEFybSB0byBhdm9pZCBicmVha2FnZS4KPj4+Pj4KPj4+Pj4g
U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPj4+Pj4gLS0tCj4+
Pj4+ICAgIHhlbi9hcmNoL2FybS9LY29uZmlnICAgIHwgMyArKysKPj4+Pj4gICAgeGVuL2luY2x1
ZGUveGVuL3NjaGVkLmggfCA2ICsrKysrKwo+Pj4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKQo+Pj4+PiAsCj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vS2NvbmZp
ZyBiL3hlbi9hcmNoL2FybS9LY29uZmlnCj4+Pj4+IGluZGV4IDU4NmJjNjIuLmMwZTk2OWUgMTAw
NjQ0Cj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9LY29uZmlnCj4+Pj4+ICsrKyBiL3hlbi9hcmNo
L2FybS9LY29uZmlnCj4+Pj4+IEBAIC01Miw2ICs1Miw5IEBAIGNvbmZpZyBIQVNfSVRTCj4+Pj4+
ICAgICAgICAgICAgcHJvbXB0ICJHSUN2MyBJVFMgTVNJIGNvbnRyb2xsZXIgc3VwcG9ydCIgaWYg
RVhQRVJUID0gInkiCj4+Pj4+ICAgICAgICAgICAgZGVwZW5kcyBvbiBHSUNWMyAmJiAhTkVXX1ZH
SUMKPj4+Pj4gK2NvbmZpZyBIVk0KPj4+Pj4gKyAgICAgICAgZGVmX2Jvb2wgeQo+Pj4+Cj4+Pj4g
SSdtIG5vdCBjb252aW5jZWQgdGhpcyBpcyBhIGdvb2QgaWRlYSwgYnV0IEknbGwgbGV0IHRoZSBB
Uk0gbWFpbnRhaW5lcnMKPj4+PiBqdWRnZS4KPj4+Cj4+PiBBbmRyZXcgZGlzY292ZXJlZCB0aGF0
IGh2bSBmbGFnIGlzIG5vdCBzZXQgYnkgdG9vbHN0YWNrIHNvIEFSTSBndWVzdHMKPj4+IGFyZSBQ
ViBndWVzdHMgdG8gWGVuLiBJIHRoaW5rIHRoZSBhZGRpdGlvbiBoZXJlIGNhbiBiZSBvbWl0dGVk
Lgo+Pj4KPj4+IEhvd2V2ZXIgSSB3b3VsZCBzdGlsbCBsaWtlIHRvIGhlYXIgZnJvbSBBUk0gbWFp
bnRhaW5lcnMgd2hhdCBndWVzdCB0eXBlCj4+PiBzaG91bGQgYmUgc2V0IGZvciBBUk0sIGJlY2F1
c2Ugc29vbmVyIG9yIGxhdGVyIEkgd2lsbCBuZWVkIHRvIGNoYW5nZSBQVgo+Pj4gY29kZSBhcyB3
ZWxsLgo+Pj4KPj4+IEdyZXBwaW5nIGZvciBpc197aHZtLHB2fV8qIGluIGFyY2gvYXJtIHlpZWxk
cyBubyByZXN1bHQsIGJ1dCB0aGVuIHRoZXJlCj4+PiBpcyBjb21tb24gY29kZSB0aGF0IHdlIG5l
ZWQgdG8gdGFrZSBjYXJlIG9mLgo+Pgo+PiBVc2luZyBQViB3YXMgbW9yZSBhIGNvbnZlbmllbmNl
IGF0IHRoZSB0aW1lIGJlY2F1c2Ugd2FzIG5vdCB0aGVyZS4gVGhlIHBsYW4KPj4gaXMgdG8gc3dp
dGNoIHRvIFBWSCAoc2VlIFJGQyBbMV0pLgo+Pgo+PiBJIHdpbGwgdHJ5IHRvIGZpbmQgc29tZSB0
aW1lcyB0aGlzIHdlZWsgdG8gcmV3b3JrIHRoZSBwYXRjaCBiYXNlZCBvbiB0aGUKPj4gY29tbWVu
dHMuCj4+Cj4+IENoZWVycywKPj4KPj4gWzFdIGh0dHBzOi8vbGlzdHMueGVuLm9yZy9hcmNoaXZl
cy9odG1sL3hlbi1kZXZlbC8yMDE4LTA2L21zZzAxNTM3Lmh0bWwKPiAKPiBZZXMsIHN3aXRjaGlu
ZyB0byBQVkggaW4gdG9vbHN0YWNrIGlzIGlkZWFsLgo+IAo+IFRoZSBwcm9ibGVtIHdlIGRpc2N1
c3MgaGVyZSBpcyBpbiB0aGUgaHlwZXJ2aXNvci4gSHlwZXJ2aXNvciBvbmx5IGhhcwo+IEhWTSBh
bmQgUFYuIFdoYXQgdHlwZSBzaG91bGQgQVJNIGd1ZXN0cyBiZT8gSSB0aGluayB3aXRoIHRoZSBt
b3ZlIHRvIHVzZQo+IFBWSCBpbiB0b29sc3RhY2ssIHRoZSB0eXBlIGluIGh5cGVydmlzb3Igc2hv
dWxkIGJlIEhWTSAoYXMgb3Bwb3NlIHRvIFBWCj4gbm93KT8KCkFybSBndWVzdCBhcmUgbXVjaCBj
bG9zZXIgdG8gSFZNIHRoYW4gUFYuIFNvIHRoZSBoeXBlcnZpc29yIHNob3VsZCB1c2UgCkhWTSBo
ZXJlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
