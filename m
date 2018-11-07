From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/8] xen/page_alloc: Move
 get_pg_owner()/put_pg_owner() from x86 to common code
Date: Wed, 07 Nov 2018 02:28:48 -0700
Message-ID: <5BE2B05002000078001F8F8D@prv1-mh.provo.novell.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-2-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jvck=ns=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gKK8r-0003df-QP
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 09:28:53 +0000
In-Reply-To: <20181106191454.22143-2-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Benjamin Sanda <ben.sanda@dornerworks.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjExLjE4IGF0IDIwOjE0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEZyb206IEJlbmphbWluIFNhbmRhIDxiZW4uc2FuZGFAZG9ybmVyd29ya3MuY29tPgo+IAo+IGdl
dF9wZ19vd25lcigpIGFuZCBwdXRfcGdfb3duZXIoKSB3aWxsIGJlIG5lY2Vzc2FyeSBpbiBhIGZv
bGxvdy11cAo+IGNvbW1pdCB0byBzdXBwb3J0IHhlbnRyYWNlIG9uIEFybS4gU28gbW92ZSB0aGUg
aGVscGVyIHRvIGNvbW1vbiBjb2RlLgo+IAo+IE5vdGUgdGhhdCBwdXRfcGdfb3duZXIoKSBoYXMg
YmVlbiB0dXJuZWQgdG8gYSBtYWNybyByYXRoZXIgdGhhbiBzdGF0aWMKPiBpbmxpbmUgYmVjYXVz
ZSBvZiBpbnRlci1kZXBlbmRlbmN5IGJldHdlZW4gaW5jbHVkZXMuCgpDb3VsZCB0aGlzIGJlIGF2
b2lkZWQgYnkgcGxhY2luZyBib3RoIGluIGEgZGlmZmVyZW50IGhlYWRlciwKZS5nLiBzY2hlZC5o
PyBNaWQtdGVybSB3ZSBzaG91bGQgcHJvYmFibHkgdHJ5IHRvIHNwbGl0IG91dAp0eXBlIChzdHJ1
Y3R1cmUpIGRlY2xhcmF0aW9ucyBmcm9tIHNjaGVkLmgsIHRvIG1ha2UgaXQgZWFzaWVyCnRvIGhh
dmUgZnVsbCB0eXBlcyBhdmFpbGFibGUgd2l0aG91dCBoYXZpbmcgdG8gcmVzcGVjdCBvdGhlcgpp
bmNsdWRlIGRlcGVuZGVuY2llcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
