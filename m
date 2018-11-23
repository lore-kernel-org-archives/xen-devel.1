From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] mm: disallow MEMF_no_refcount to be
 passed for domain-owned allocations
Date: Fri, 23 Nov 2018 10:50:19 +0000
Message-ID: <b245229e-ae0d-1b57-d23a-49b1915ccd85@citrix.com>
References: <3B3E4AB50200006BB4B78B26@prv1-mh.provo.novell.com>
 <5BF4339D02000078001FE26D@prv1-mh.provo.novell.com>
 <5BF7CC5102000078001FF4AE@prv1-mh.provo.novell.com>
 <79b38b7a-29a9-256f-6e36-c85c115ccde2@citrix.com>
 <5BF7DB2102000078001FF53F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zeqx=oc=citrix.com=prvs=8587bc52e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gQ92U-0000rB-Tw
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 10:50:22 +0000
In-Reply-To: <5BF7DB2102000078001FF53F@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMTEvMjAxOCAxMDo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjMuMTEuMTgg
YXQgMTE6MjgsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjMvMTEv
MjAxOCAwOTo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBXaGVuIHN1Y2ggcGFnZXMgZ2V0IGFz
c2lnbmVkIHRvIGRvbWFpbnMgKGFuZCBoZW5jZSB0aGVpciAtPnRvdF9wYWdlcwo+Pj4gbm90IGlu
Y3JlbWVudGVkIGFjY29yZGluZ2x5KSB3ZSB3b3VsZCBvdGhlcndpc2UgYWxzbyBuZWVkIHRvIHN1
cHByZXNzCj4+PiBkZWNyZW1lbnRpbmcgdGhlIGNvdW50IHdoZW4gZnJlZWluZyB0aG9zZSBwYWdl
cy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Cj4+PiAtLS0KPj4+IHYyOiBBZGQgQVNTRVJUX1VOUkVBQ0hBQkxFKCkuCj4+Pgo+Pj4gLS0tIGEv
eGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPj4+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5j
Cj4+PiBAQCAtMjMwMyw2ICsyMzAzLDExIEBAIHN0cnVjdCBwYWdlX2luZm8gKmFsbG9jX2RvbWhl
YXBfcGFnZXMoCj4+PiAgCj4+PiAgICAgIGlmICggbWVtZmxhZ3MgJiBNRU1GX25vX293bmVyICkK
Pj4+ICAgICAgICAgIG1lbWZsYWdzIHw9IE1FTUZfbm9fcmVmY291bnQ7Cj4+PiArICAgIGVsc2Ug
aWYgKCAobWVtZmxhZ3MgJiBNRU1GX25vX3JlZmNvdW50KSAmJiBkICkKPj4+ICsgICAgewo+Pj4g
KyAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7Cj4+IFNvcnJ5IHRvIGRvIHRoaXMsIGJ1dCBv
biBzZWNvbmQgdGhvdWdodHMsIHRoaXMgcGF0aCBpc24ndCBhY3R1YWxseQo+PiB1bnJlYWNoYWJs
ZS4KPj4KPj4gQ291bGQgSSB0YWxrIHlvdSBpbnRvIHVzaW5nIEFTU0VSVCghIkFzc2lnbmVkIGRv
bWhlYXAgcGFnZXMgbXVzdCBiZQo+PiByZWZjb3VudGVkIikgaW5zdGVhZCwgdG8gZ2l2ZSBhIHNs
aWdodGx5IG1vcmUgY2xlYXIgZXJyb3IgdG8gZGV2ZWxvcGVycwo+PiB3aG8gbWFuYWdlIHRvIGhp
dCBpdD8KPiBJIHRoaW5rIHRoZXJlIGFyZSBvdGhlciBwbGFjZXMgd2hlcmUgd2UgdXNlIEFTU0VS
VF9VTlJFQUNIQUJMRSgpCj4gd2hlbiB0aGUgcGF0aCBpcyByZWFjaGFibGUgaW4gdGhlIHNlbnNl
IHRoYXQgb25lIGNvdWxkIGNvbnN0cnVjdCBhCj4gc3VpdGFibGUgcGF0aCwgYnV0IHdpdGggaG93
IHRoaW5ncyBhcmUgKHN1cHBvc2VkIHRvIGJlKSBpdCBjYW5ub3QgYmUKPiByZWFjaGVkLiBJJ20g
dW5jb252aW5jZWQgdGhlIGFkZGVkIHN0cmluZyBsaXRlcmFsIHdvdWxkIGJlIG9mIG92ZXJseQo+
IG11Y2ggaGVscCAtIG9uY2UgeW91IHNlZSB0aGUgbGluZSBudW1iZXIsIGl0IGlzIHByZXR0eSBl
YXN5IHRvIGZpZ3VyZQo+IG91dCB3aGF0cyB3cm9uZy4KPgo+IEJ1dCBpZiB5b3UgaW5zaXN0LCBJ
J2xsIHN3aXRjaCB0byB0aGUgYWx0ZXJuYXRpdmUgd2F5IG9mIGV4cHJlc3NpbmcgaXQKPiAoYWx0
aG91Z2ggSSdkIHRoZW4gcGVyaGFwcyB1c2UKPiBBU1NFUlQoIShtZW1mbGFncyAmIE1FTUZfbm9f
cmVmY291bnQpKSBpbnN0ZWFkKS4gSnVzdCBsZXQgbWUKPiBrbm93LgoKVGhhdCdzIGZpbmUgYXMg
d2VsbC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
