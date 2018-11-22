From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] mm: fix LLVM code-generation issue
Date: Thu, 22 Nov 2018 14:03:55 +0000
Message-ID: <cb727842-018a-0181-9788-e3f1b8dd28b8@arm.com>
References: <20181122120327.66403-1-roger.pau@citrix.com>
 <c0b25df2-49ca-fbe1-804a-e1a9839bb854@citrix.com>
 <6fde305e-7f47-2577-d795-0291e2adc137@arm.com>
 <5BF6AEB602000078001FEE5D@prv1-mh.provo.novell.com>
 <9cd10d0c-8c1a-0c1f-39a1-c3a2bbd1d734@citrix.com>
 <5BF6B0F502000078001FEE76@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7bX1=OB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gPpaL-0002Rf-BJ
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 14:04:01 +0000
In-Reply-To: <5BF6B0F502000078001FEE76@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMTEvMjIvMTggMTozNiBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MjIuMTEuMTggYXQgMTQ6MzEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4g
SSB0aGluayBKdWxpZW4ncyBwb2ludCBpcyB0aGF0IHdpdGhvdXQgZXhwbGljaXRseSBiYXJyaWVy
cywgQ1BVMCdzCj4+IHVwZGF0ZSB0byBzeXN0ZW1fc3RhdGUgbWF5IG5vdCBiZSB2aXNpYmxlIG9u
IENQVTEsIGV2ZW4gdGhvdWdoIHRoZQo+PiBtYXBwaW5ncyBoYXZlIGJlZW4gc2hvdCBkb3duLgo+
Pgo+PiBUaGVyZWZvcmUsIGZyb20gdGhlIHByb2Nlc3NvcnMgcG9pbnQgb2YgdmlldywgaXQgZGlk
IGV2ZXJ5dGhpbmcKPj4gY29ycmVjdGx5LCBhbmQgaGl0IGEgcmVhbCBwYWdlZmF1bHQuCj4gCj4g
Qm9vdCB0aW1lIHVwZGF0ZXMgb2Ygc3lzdGVtX3N0YXRlIHNob3VsZCBiZSBvZiBubyBpbnRlcmVz
dCBoZXJlLAo+IGFzIGF0IHRoYXQgdGltZSB0aGUgQVBzIGFyZSBhbGwgaWRsaW5nLgoKVGhhdCdz
IHByb2JhYmx5IHRydWUgdG9kYXkuIEJ1dCB0aGlzIGNvZGUgbG9va3MgcmF0aGVyIGZyYWdpbGUg
YXMgeW91IApkb24ndCBrbm93IGhvdyB0aGlzIGlzIGdvaW5nIHRvIGJlIHVzZWQgaW4gdGhlIGZ1
dHVyZS4KCklmIHlvdSBkZWNpZGUgdG8gZ2F0ZSBpbml0IGNvZGUgd2l0aCBzeXN0ZW1fc3RhdGUs
IHRoZW4geW91IG5lZWQgYSAKYmFycmllciB0byBlbnN1cmUgdGhlIGNvZGUgaXMgZnV0dXJlIHBy
b29mLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
