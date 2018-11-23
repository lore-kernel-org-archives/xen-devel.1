From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] mm: disallow MEMF_no_refcount to be
 passed for domain-owned allocations
Date: Fri, 23 Nov 2018 03:49:05 -0700
Message-ID: <5BF7DB2102000078001FF53F@prv1-mh.provo.novell.com>
References: <3B3E4AB50200006BB4B78B26@prv1-mh.provo.novell.com>
 <5BF4339D02000078001FE26D@prv1-mh.provo.novell.com>
 <5BF7CC5102000078001FF4AE@prv1-mh.provo.novell.com>
 <79b38b7a-29a9-256f-6e36-c85c115ccde2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wxfq=oc=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gQ91H-0008Pi-7e
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 10:49:07 +0000
In-Reply-To: <79b38b7a-29a9-256f-6e36-c85c115ccde2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjExLjE4IGF0IDExOjI4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjMvMTEvMjAxOCAwOTo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFdoZW4gc3Vj
aCBwYWdlcyBnZXQgYXNzaWduZWQgdG8gZG9tYWlucyAoYW5kIGhlbmNlIHRoZWlyIC0+dG90X3Bh
Z2VzCj4+IG5vdCBpbmNyZW1lbnRlZCBhY2NvcmRpbmdseSkgd2Ugd291bGQgb3RoZXJ3aXNlIGFs
c28gbmVlZCB0byBzdXBwcmVzcwo+PiBkZWNyZW1lbnRpbmcgdGhlIGNvdW50IHdoZW4gZnJlZWlu
ZyB0aG9zZSBwYWdlcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+PiAtLS0KPj4gdjI6IEFkZCBBU1NFUlRfVU5SRUFDSEFCTEUoKS4KPj4KPj4g
LS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPj4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2Fs
bG9jLmMKPj4gQEAgLTIzMDMsNiArMjMwMywxMSBAQCBzdHJ1Y3QgcGFnZV9pbmZvICphbGxvY19k
b21oZWFwX3BhZ2VzKAo+PiAgCj4+ICAgICAgaWYgKCBtZW1mbGFncyAmIE1FTUZfbm9fb3duZXIg
KQo+PiAgICAgICAgICBtZW1mbGFncyB8PSBNRU1GX25vX3JlZmNvdW50Owo+PiArICAgIGVsc2Ug
aWYgKCAobWVtZmxhZ3MgJiBNRU1GX25vX3JlZmNvdW50KSAmJiBkICkKPj4gKyAgICB7Cj4+ICsg
ICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOwo+IAo+IFNvcnJ5IHRvIGRvIHRoaXMsIGJ1dCBv
biBzZWNvbmQgdGhvdWdodHMsIHRoaXMgcGF0aCBpc24ndCBhY3R1YWxseQo+IHVucmVhY2hhYmxl
Lgo+IAo+IENvdWxkIEkgdGFsayB5b3UgaW50byB1c2luZyBBU1NFUlQoISJBc3NpZ25lZCBkb21o
ZWFwIHBhZ2VzIG11c3QgYmUKPiByZWZjb3VudGVkIikgaW5zdGVhZCwgdG8gZ2l2ZSBhIHNsaWdo
dGx5IG1vcmUgY2xlYXIgZXJyb3IgdG8gZGV2ZWxvcGVycwo+IHdobyBtYW5hZ2UgdG8gaGl0IGl0
PwoKSSB0aGluayB0aGVyZSBhcmUgb3RoZXIgcGxhY2VzIHdoZXJlIHdlIHVzZSBBU1NFUlRfVU5S
RUFDSEFCTEUoKQp3aGVuIHRoZSBwYXRoIGlzIHJlYWNoYWJsZSBpbiB0aGUgc2Vuc2UgdGhhdCBv
bmUgY291bGQgY29uc3RydWN0IGEKc3VpdGFibGUgcGF0aCwgYnV0IHdpdGggaG93IHRoaW5ncyBh
cmUgKHN1cHBvc2VkIHRvIGJlKSBpdCBjYW5ub3QgYmUKcmVhY2hlZC4gSSdtIHVuY29udmluY2Vk
IHRoZSBhZGRlZCBzdHJpbmcgbGl0ZXJhbCB3b3VsZCBiZSBvZiBvdmVybHkKbXVjaCBoZWxwIC0g
b25jZSB5b3Ugc2VlIHRoZSBsaW5lIG51bWJlciwgaXQgaXMgcHJldHR5IGVhc3kgdG8gZmlndXJl
Cm91dCB3aGF0cyB3cm9uZy4KCkJ1dCBpZiB5b3UgaW5zaXN0LCBJJ2xsIHN3aXRjaCB0byB0aGUg
YWx0ZXJuYXRpdmUgd2F5IG9mIGV4cHJlc3NpbmcgaXQKKGFsdGhvdWdoIEknZCB0aGVuIHBlcmhh
cHMgdXNlCkFTU0VSVCghKG1lbWZsYWdzICYgTUVNRl9ub19yZWZjb3VudCkpIGluc3RlYWQpLiBK
dXN0IGxldCBtZQprbm93LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
