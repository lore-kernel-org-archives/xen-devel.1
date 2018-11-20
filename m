From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/4] x86: correct instances of PGC_allocated
 clearing
Date: Tue, 20 Nov 2018 16:59:58 +0000
Message-ID: <7cdc3f95-b97d-11ad-a8a2-5f7f325d57f4@citrix.com>
References: <5BF4328902000078001FE240@prv1-mh.provo.novell.com>
 <5BF433E702000078001FE270@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pwha=n7=citrix.com=prvs=8552da0fd=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gP9ST-0005Rl-TK
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 17:05:05 +0000
In-Reply-To: <5BF433E702000078001FE270@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMTEvMjAxOCAxNjoxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRm9yIGRvbWFpbiBoZWFw
IHBhZ2VzIGFzc2lnbmVkIHRvIGEgZG9tYWluIGRyb3BwaW5nIHRoZSBwYWdlIHJlZmVyZW5jZQo+
IHRpZWQgdG8gUEdDX2FsbG9jYXRlZCBtYXkgbm90IGRyb3AgdGhlIGxhc3QgcmVmZXJlbmNlLCBh
cyBvdGhlcndpc2UgdGhlCj4gdGVzdF9hbmRfY2xlYXJfYml0KCkgbWlnaHQgYWxyZWFkeSBhY3Qg
b24gYW4gdW5vd25lZCBwYWdlLgo+Cj4gV29yayBhcm91bmQgdGhpcyB3aGVyZSBwb3NzaWJsZSwg
YnV0IHRoZSBuZWVkIHRvIGFjcXVpcmUgZXh0cmEgcGFnZQo+IHJlZmVyZW5jZXMgaXMgYSBmYWly
IGhpbnQgdGhhdCByZWZlcmVuY2VzIHNob3VsZCBoYXZlIGJlZW4gYWNxdWlyZWQgaW4KPiBvdGhl
ciBwbGFjZXMgaW5zdGVhZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiAtLS0KPiBDb21waWxlIHRlc3RlZCBvbmx5LCBhcyBJIGhhdmUgbmVpdGhl
ciBhIG1lbS1zaGFyaW5nIG5vciBhIG1lbS1wYWdpbmcKPiBlbnZpcm9ubWVudCBzZXQgdXAgcmVh
ZHkgdG8gYmUgdXNlZCBmb3Igc3VjaCB0ZXN0aW5nLgoKUGVyaGFwcyB3ZSBzaG91bGQgY29tcGls
ZSB0aGVtIG91dCBieSBkZWZhdWx0P8KgIEl0J3MgY2xlYXIgdGhlcmUgYXJlIG5vCnByb2R1Y3Rp
b24gdXNlcnMsIGdpdmVuIHRoZSBxdWFsaXR5IG9mIHRoZSBjb2RlIGFuZCBob3cgbWFueSBzZWN1
cml0eQppc3N1ZXMgd2Ugc3BvdCBhY2NpZGVudGFsbHkuCgpFaXRoZXIgd2F5LCB0aGUgY29kZSBs
b29rcyBwbGF1c2libGUuwqAgQWNrZWQtYnk6IEFuZHJldyBDb29wZXIKPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
