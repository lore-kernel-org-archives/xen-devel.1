From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 07/12] hvmloader: allocate MMCONFIG area
 in the MMIO hole + minor code refactoring
Date: Wed, 30 May 2018 02:12:37 -0600
Message-ID: <5B0E5CF502000078001C6DC3@prv1-mh.provo.novell.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <cover.1520867740.git.x1917x@gmail.com>
 <62c7a3037bb9f5631542f635dc36ae3338c7bf47.1520867741.git.x1917x@gmail.com>
 <5B0D627702000078001C6A9E@prv1-mh.provo.novell.com>
 <20180530035607.000071e0@gmail.com> <20180530044749.00006c68@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ai2o=ir=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fNwXQ-00030G-Ij
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 08:32:56 +0000
In-Reply-To: <20180530044749.00006c68@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexey Gerasimenko <x1917x@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA1LjE4IGF0IDIwOjQ3LCA8eDE5MTd4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24g
V2VkLCAzMCBNYXkgMjAxOCAwMzo1NjowNyArMTAwMAo+IEFsZXhleSBHIDx4MTkxN3hAZ21haWwu
Y29tPiB3cm90ZToKPj5PbiBUdWUsIDI5IE1heSAyMDE4IDA4OjIzOjUxIC0wNjAwCj4+IkphbiBC
ZXVsaWNoIiA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+Pj4gT24gMTIuMDMuMTggYXQg
MTk6MzMsIDx4MTkxN3hAZ21haWwuY29tPiB3cm90ZTogICAgCj4+Pj4gQEAgLTE3MiwxMCArMTcz
LDE0IEBAIHZvaWQgcGNpX3NldHVwKHZvaWQpCj4+Pj4gIAo+Pj4+ICAgICAgLyogQ3JlYXRlIGEg
bGlzdCBvZiBkZXZpY2UgQkFScyBpbiBkZXNjZW5kaW5nIG9yZGVyIG9mIHNpemUuICovCj4+Pj4g
ICAgICBzdHJ1Y3QgYmFycyB7Cj4+Pj4gLSAgICAgICAgdWludDMyX3QgaXNfNjRiYXI7Cj4+Pj4g
ICAgICAgICAgdWludDMyX3QgZGV2Zm47Cj4+Pj4gICAgICAgICAgdWludDMyX3QgYmFyX3JlZzsK
Pj4+PiAgICAgICAgICB1aW50NjRfdCBiYXJfc3o7Cj4+Pj4gKyAgICAgICAgdWludDY0X3QgYWRk
cl9tYXNrOyAvKiB3aGljaCBiaXRzIG9mIHRoZSBiYXNlIGFkZHJlc3MgY2FuIGJlIHdyaXR0ZW4g
Ki8KPj4+PiArICAgICAgICB1aW50MzJfdCBiYXJfZGF0YTsgIC8qIGluaXRpYWwgdmFsdWUgLSBC
QVIgZmxhZ3MgaGVyZSAqLyAgICAKPj4+Cj4+PldoeSAzMiBiaXRzPyBZb3Ugb25seSB1c2UgdGhl
IGxvdyBmZXcgb25lcyBhZmFpY3MuIEFsc28gcGxlYXNlIGF2b2lkIGZpeGVkIHdpZHRoCj4+PnR5
cGVzIHVubGVzcyB5b3UgcmVhbGx5IG5lZWQgdGhlbS4gIAo+Pgo+PmJhcl9kYXRhIGlzIHN1cHBv
c2VkIHRvIGhvbGQgb25seSBCQVIncyBrbHVkZ2UgYml0cyBsaWtlICdlbmFibGVkJyBiaXQKPj52
YWx1ZXMgb3IgTU1DT05GSUcgd2lkdGggYml0cy4gQWxsIG9mIHRoZW0gb2NjdXB5IHRoZSBsb3cg
ZHdvcmQgb25seQo+PndoaWxlIEJBUidzIGhpZ2ggZHdvcmQgaXMganVzdCBhIHBhcnQgb2YgdGhl
IGFkZHJlc3Mgd2hpY2ggd2lsbCBiZQo+PnJlcGxhY2VkIGJ5IGFsbG9jYXRlZCBvbmUgKGZvciBt
ZW02NCBCQVJzKSwgdGh1cyBubyBuZWVkIHRvIGtlZXAgdGhlCj4+aGlnaCBoYWxmLgo+Pgo+PlNv
IHRoaXMgaXMgYSBzb3J0IG9mIG1pbm9yIG9wdGltaXphdGlvbiAtLSBhdm9pZGluZyB1c2luZyA2
NC1iaXQgb3BlcmFuZAo+PnNpemUgd2hlbiAzMiBiaXQgaXMgZW5vdWdoLgo+IAo+IFNvcnJ5LCBs
b29rcyBsaWtlIEkndmUgbWlzcmVhZCB0aGUgcXVlc3Rpb24uIFlvdSB3ZXJlIGFjdHVhbGx5IAo+
IHN1Z2dlc3RpbmcgdG8gbWFrZSBiYXJfZGF0YSBzaG9ydGVyLiA4IGJpdHMgaXMgZW5vdWdoIGF0
IHRoZSBtb21lbnQsIHNvCj4gYmFyX2RhdGEgY2FuIGJlIGNoYW5nZWQgdG8gdWludDhfdCwgeWVz
LgoKUmlnaHQuCgo+IFJlZ2FyZGluZyBhdm9pZGluZyB1c2luZyBib29sIGhlcmUgLS0gdGhlIG9u
bHkgcmVhc29uIHdhcyBhZGFwdGluZyB0bwo+IHRoZSBleGlzdGluZyBjb2RlIHN0eWxlLiBGb3Ig
c29tZSByZWFzb24gdGhlIGV4aXN0aW5nIGh2bWxvYWRlciBjb2RlCj4gcHJlZmVycyB0byB1c2Ug
dWludC10eXBlcyBmb3IgYm9vbCB2YWx1ZXMuCgpBbmQgd3JvbmdseSBzby4gV2UncmUgc2xvd2x5
IG1vdmluZyBvdmVyLCBhbmQgd2UnZCBwcmVmZXIgdGhlIGlzc3VlIHRvCm5vdCBiZSB3aWRlbmVk
IGJ5IG5ldyBjb2RlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
