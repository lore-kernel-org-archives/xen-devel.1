From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC 17/49] xen/sched: move some per-vcpu
 items to struct sched_item
Date: Mon, 1 Apr 2019 09:33:17 +0100
Message-ID: <73ff246a-82bb-a4bf-cbee-6b37a9bbafa8@citrix.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-18-jgross@suse.com>
 <ad9f514b-7325-0759-0a80-c8195e8c0b64@citrix.com>
 <cd2b85ff-ccc7-e261-a4b5-6a5f56e98e2a@suse.com>
 <5CA1C55302000078002236D8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eSOb=SD=citrix.com=prvs=987a6ddbb=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hAsNf-0003KM-TY
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 08:33:23 +0000
In-Reply-To: <5CA1C55302000078002236D8@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDQvMjAxOSAwOTowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzAuMDMuMTkg
YXQgMTA6NTksIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAyOS8wMy8yMDE5IDIyOjMz
LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gSWYgYXQgYWxsIHBvc3NpYmxlLCBJJ2QgcHJlZmVy
IHRvIHNlZSBhYm91dCBkaXNlbnRhbmdsaW5nIHRoZSBiaXRzIHdoaWNoCj4+PiBhY3R1YWxseSBu
ZWVkIGV4dGVybmFsIHVzZSwgYW5kIHB1dHRpbmcgdGhlbSBpbiBzY2hlZC5oLCBhbmQgbWFraW5n
Cj4+PiBzY2hlZC1pZi5oIHByb3Blcmx5IHByaXZhdGUgdG8gdGhlIHNjaGVkdWxlcnMuICBJIGFj
dHVhbGx5IGV2ZW4gc3RhcnRlZAo+Pj4gYSBjbGVhbnVwIHNlcmllcyB3aGljaCBtb3ZlZCBhbGwg
b2YgdGhlIHNjaGVkdWxlciBpbmZyYXN0cnVjdHVyZSBpbnRvCj4+PiBjb21tb24vc2NoZWQvLCBi
dXQgZm91bmQgYSBkaXNhcHBvaW50aW5nIHF1YW50aXR5IG9mIHNjaGVkLWlmLmggYmVpbmcKPj4+
IHJlZmVyZW5jZWQgZXh0ZXJuYWxseS4KPj4gSSBjYW4gYWRkIHNvbWV0aGluZyBsaWtlIHRoYXQg
dG8gbXkgc2VyaWVzIGlmIHlvdSB3YW50LiBTbzoKPj4KPj4gLSBtb3Zpbmcgc2NoZWR1bGUuYywg
c2NoZWRfKi5jIGFuZCBjcHVwb29sLmMgdG8gY29tbW9uL3NjaGVkLwo+PiAtIG1vdmUgc3R1ZmYg
ZnJvbSBzY2hlZC1pZi5oIHRvIHNjaGVkLmggaWYgbmVlZGVkIG91dHNpZGUgb2YKPj4gICBjb21t
b24vc2NoZWQvCj4+IC0gbW92ZSBzY2hlZC1pZi5oIHRvIGNvbW1vbi9zY2hlZC8KPiBCZWZvcmUg
ZnVydGhlciBnZW5lcmFsIGNvZGUgcmUtd29yayBnZXRzIGFkZGVkIHRvIHRoaXMgYWxyZWFkeQo+
IGxvbmcgc2VyaWVzLCBtYXkgSSBhc2sgd2hhdCB0aGUgYmFja3BvcnRpbmcgaW50ZW50aW9ucyBh
cmU/CgpJIGRvbid0IHNlZSB0aGlzIGFzIGEgdmlhYmxlIGJhY2twb3J0IGNhbmRpZGF0ZS7CoCBJ
dCBpcyBhIGNvbXBsZXRlCnJld3JpdGUgb2YgdGhlIHNjaGVkdWxlciBpbnRlcmZhY2UsIGFsb25n
IHdpdGggc29tZSBzdWJzdGFudGlhbCBjaGFuZ2VzCm9uIHRoZSBjb250ZXh0IHN3aXRjaCBwYXRo
LgoKUGVvcGxlIHdhbnRpbmcgdG8gdXNlIGl0IHdpbGwgYWxtb3N0IGNlcnRhaW5seSBiZSBzYWZl
ciBtb3ZpbmcgdG8gWGVuIDQuMTMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
