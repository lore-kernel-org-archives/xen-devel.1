From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 17/49] xen/sched: move some per-vcpu
 items to struct sched_item
Date: Mon, 01 Apr 2019 02:05:08 -0600
Message-ID: <5CA1C63402000078002236F5@prv1-mh.provo.novell.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-18-jgross@suse.com>
 <ad9f514b-7325-0759-0a80-c8195e8c0b64@citrix.com>
 <cd2b85ff-ccc7-e261-a4b5-6a5f56e98e2a@suse.com>
 <05874d79-0470-2895-d231-c56ddd834dde@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hArwS-0000Es-L1
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 08:05:16 +0000
In-Reply-To: <05874d79-0470-2895-d231-c56ddd834dde@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjA0LjE5IGF0IDA3OjU5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAz
MC8wMy8yMDE5IDEwOjU5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAyOS8wMy8yMDE5IDIy
OjMzLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gSWYgYXQgYWxsIHBvc3NpYmxlLCBJJ2QgcHJl
ZmVyIHRvIHNlZSBhYm91dCBkaXNlbnRhbmdsaW5nIHRoZSBiaXRzIHdoaWNoCj4+PiBhY3R1YWxs
eSBuZWVkIGV4dGVybmFsIHVzZSwgYW5kIHB1dHRpbmcgdGhlbSBpbiBzY2hlZC5oLCBhbmQgbWFr
aW5nCj4+PiBzY2hlZC1pZi5oIHByb3Blcmx5IHByaXZhdGUgdG8gdGhlIHNjaGVkdWxlcnMuICBJ
IGFjdHVhbGx5IGV2ZW4gc3RhcnRlZAo+Pj4gYSBjbGVhbnVwIHNlcmllcyB3aGljaCBtb3ZlZCBh
bGwgb2YgdGhlIHNjaGVkdWxlciBpbmZyYXN0cnVjdHVyZSBpbnRvCj4+PiBjb21tb24vc2NoZWQv
LCBidXQgZm91bmQgYSBkaXNhcHBvaW50aW5nIHF1YW50aXR5IG9mIHNjaGVkLWlmLmggYmVpbmcK
Pj4+IHJlZmVyZW5jZWQgZXh0ZXJuYWxseS4KPj4gCj4+IEkgY2FuIGFkZCBzb21ldGhpbmcgbGlr
ZSB0aGF0IHRvIG15IHNlcmllcyBpZiB5b3Ugd2FudC4gU286Cj4+IAo+PiAtIG1vdmluZyBzY2hl
ZHVsZS5jLCBzY2hlZF8qLmMgYW5kIGNwdXBvb2wuYyB0byBjb21tb24vc2NoZWQvCj4+IC0gbW92
ZSBzdHVmZiBmcm9tIHNjaGVkLWlmLmggdG8gc2NoZWQuaCBpZiBuZWVkZWQgb3V0c2lkZSBvZgo+
PiAgIGNvbW1vbi9zY2hlZC8KPj4gLSBtb3ZlIHNjaGVkLWlmLmggdG8gY29tbW9uL3NjaGVkLwo+
IAo+IFF1ZXN0aW9ucyB0byBlc3BlY2lhbGx5IHRoZSBzY2hlZHVsZXIgbWFpbnRhaW5lcnMgYW5k
ICJ0aGUgUkVTVCI6IHNob3VsZAo+IHdlIG1vdmUgdGhlIHNjaGVkdWxlciBzdHVmZiB0byB4ZW4v
Y29tbW9uL3NjaGVkLyBvciB3b3VsZCAveGVuL3NjaGVkLyBiZQo+IG1vcmUgYXBwcm9wcmlhdGU/
Cj4gCj4gTWF5YmUgaXQgd291bGQgYmUgd29ydGh3aGlsZSB0byBtb3ZlIGUuZy4gdGhlIGNvbnRl
eHQgc3dpdGNoaW5nIGZyb20KPiB4ZW4vYXJjaC8qL2RvbWFpbi5jIHRvIHhlbi9zY2hlZC9jb250
ZXh0XzxhcmNoPi5jPyBJIHRoaW5rIHRoaXMgY29kZSBpcwo+IHJhdGhlciBzY2hlZHVsZXIgcmVs
YXRlZCBhbmQgbW92aW5nIGl0IHRvIHRoZSBzY2hlZCBkaXJlY3RvcnkgbWlnaHQgaGVscAo+IGhp
ZGluZyBzb21lIHNjaGVkdWxlciBpbnRlcm5hbHMgZnJvbSBvdGhlciBzb3VyY2VzLCBlc3BlY2lh
bGx5IHdpdGggbXkKPiBjb3JlIHNjaGVkdWxpbmcgc2VyaWVzLiBJTU8gdGhpcyB3b3VsZCBtYWtl
IHRoZSB4ZW4vc2NoZWQvIGRpcmVjdG9yeSB0aGUKPiBwcmVmZXJyZWQgb25lLgoKRldJVywgSSBk
b24ndCByZWFsbHkgbWluZCBzdWNoIGEgbW92ZSBhcyBsb25nIGFzIGl0IHdvbid0IHJlc3VsdCBp
bgp0aGVuIGhhdmluZyB0byBleHBvc2UgdmFyaW91cyBhcmNoLWludGVybmFscyBqdXN0IHRvIG1h
a2UgdGhlbQp1c2FibGUgZnJvbSB4ZW4vc2NoZWQvY29udGV4dF88YXJjaD4uYyAob3Igd2hhdGV2
ZXIgaXQncyBnb2luZwp0byBiZSBuYW1lZCAtIHRoZSBuYW1lIGlzIGEgbGl0dGxlIGxvbmdpc2gg
Zm9yIG15IHRhc3RlKS4KCkJ1dCBtYXkgSSByZWNvbW1lbmQgbm90IHRvIGRvIHRvbyBtYW55IHRo
aW5ncyBhbGwgaW4gb25lIGdvPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
