From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 10/11] viridian: add implementation of
 synthetic timers
Date: Tue, 19 Mar 2019 07:32:28 -0600
Message-ID: <5C90EF6C0200007800220476@prv1-mh.provo.novell.com>
References: <20190319092116.1525-1-paul.durrant@citrix.com>
 <20190319092116.1525-11-paul.durrant@citrix.com>
 <5C90DE0202000078002203DA@prv1-mh.provo.novell.com>
 <22207b1c797348289442efcf6af882b5@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a8QS=RW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h6Er5-0001nO-JW
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 13:32:35 +0000
In-Reply-To: <22207b1c797348289442efcf6af882b5@AMSPEX02CL02.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAzLjE5IGF0IDEzOjQ3LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAxOSBNYXJjaCAyMDE5IDEyOjE4Cj4+IAo+PiBTbyBwZXJoYXBzIGEgc2V0Cj4+IHBlbmRpbmcg
Yml0IHNob3VsZCByZXN1bHQgaW4gdGhlIFJETVNSIGhhbmRsaW5nIHRvIGNsZWFyIHRoZSBlbmFi
bGVkCj4+IGJpdCBpbiB0aGUgcmV0dXJuZWQgdmFsdWUgZm9yIGEgbm9uLXBlcmlvZGljIHRpbWVy
Pwo+IAo+IEkgZ2V0IHRpZWQgaW4ga25vdHMgZXZlcnkgdGltZSBJIHRoaW5rIGFib3V0IHRoaXMg
YW5kIHdpdGhvdXQgd2FpdGluZyBmb3IgYSAKPiBwZW5kaW5nIHRpbWVyIHRvIHN0b3Agd2hlbiBp
dCBpcyBkaXNhYmxlZCBJIHNlZSBubyB3YXkgb2YgdGhlIHJhY2UsIGJ1dCBJIAo+IHRoaW5rIGRv
aW5nIHRoYXQgd291bGQgYmUgcHJvaGliaXRpdmVseSBzbG93IGJlY2F1c2Ugd2luZG93cyBzZWVt
cyB0byBmbGlwIAo+IGJldHdlZW4gc2luZ2xlLXNob3QgYW5kIHBlcmlvZGljIHRpbWVycyBvbiBx
dWl0ZSBhIGZyZXF1ZW50IGJhc2lzLgoKSSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQ6IFdo
eSBhIHRpbWVyIG9yIGFueSBvdGhlciBjb21wbGljYXRpb25zLgpBbGwgSSdtIHRoaW5raW5nIGFi
b3V0IGlzCgogICAgY2FzZSBIVl9YNjRfTVNSX1NUSU1FUjBfQ09ORklHOgogICAgY2FzZSBIVl9Y
NjRfTVNSX1NUSU1FUjFfQ09ORklHOgogICAgY2FzZSBIVl9YNjRfTVNSX1NUSU1FUjJfQ09ORklH
OgogICAgY2FzZSBIVl9YNjRfTVNSX1NUSU1FUjNfQ09ORklHOgogICAgewogICAgICAgIHVuc2ln
bmVkIGludCBzdGltZXJ4ID0gKGlkeCAtIEhWX1g2NF9NU1JfU1RJTUVSMF9DT05GSUcpIC8gMjsK
ICAgICAgICBjb25zdCBzdHJ1Y3QgdmlyaWRpYW5fc3RpbWVyICp2cyA9CiAgICAgICAgICAgICZh
cnJheV9hY2Nlc3Nfbm9zcGVjKHZ2LT5zdGltZXIsIHN0aW1lcngpOwoKICAgICAgICBpZiAoICEo
dmlyaWRpYW5fZmVhdHVyZV9tYXNrKGQpICYgSFZNUFZfc3RpbWVyKSApCiAgICAgICAgICAgIHJl
dHVybiBYODZFTVVMX0VYQ0VQVElPTjsKCiAgICAgICAgKnZhbCA9IHZzLT5jb25maWcucmF3Owog
ICAgICAgIGlmICggIXZzLT5jb25maWcucGVyaW9kaWMgJiYgdGVzdF9iaXQoc3RpbWVyeCwgdnYt
PnN0aW1lcl9wZW5kaW5nKSApCiAgICAgICAgICAgICp2YWwgJj0gfjE7CiAgICAgICAgYnJlYWs7
CiAgICB9CgpvciBhIHN1aXRhYmxlIGVxdWl2YWxlbnQgdG8gYXZvaWQgdGhlIGxpdGVyYWwgMSwg
cGx1cyBwZXJoYXBzIGEKaGVscGZ1bCBjb21tZW50LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
