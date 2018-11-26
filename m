From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] xen: only clobber multicall elements
 without error
Date: Mon, 26 Nov 2018 14:54:42 +0000
Message-ID: <23548.2354.97061.49099@mariner.uk.xensource.com>
References: <20181123132516.28681-1-jgross@suse.com>
 <5BFBD1C602000078001FFE09@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xeey=of=citrix.com=prvs=86143bd3e=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gRIHk-00084r-Co
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 14:54:52 +0000
In-Reply-To: <5BFBD1C602000078001FFE09@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtQQVRDSF0geGVuOiBvbmx5IGNsb2JiZXIgbXVsdGlj
YWxsIGVsZW1lbnRzIHdpdGhvdXQgZXJyb3IiKToKPiBPbiAyMy4xMS4xOCBhdCAxNDoyNSwgPGpn
cm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4gPiBJbiBkZWJ1ZyBidWlsZHMgdGhlIGh5cGVydmlzb3Ig
d2lsbCBkZWxpYmVyYXRlbHkgY2xvYmJlciBwcm9jZXNzZWQKPiA+IGVsZW1lbnRzIG9mIHRoZSBt
dWx0aWNhbGwgc3RydWN0dXJlLiBJbiBvcmRlciB0byBlYXNlIGRpYWdub3N0aWMgZGF0YQo+ID4g
cHJpbnRvdXQgaW4gdGhlIGFmZmVjdGVkIGd1ZXN0IG9ubHkgY2xvYmJlciBlbGVtZW50cyB3aGlj
aCBkaWRuJ3QKPiA+IHJldHVybiBhbiBlcnJvci4KPiAKPiBCZXNpZGVzIHdoYXQgQW5kcmV3IGhh
cyBzYWlkIHN1Y2ggYSByZWxheGF0aW9uIHJlZHVjZXMKPiB0aGUgZ3VhcmRpbmcgYWdhaW5zdCBi
YWQgZ3Vlc3Qgc2lkZSBjb2RlLiBJZiBhIGd1ZXN0IHJlYWxseQo+IHdpc2hlcyB0byBwcm9kdWNl
IGRpYWdub3N0aWNzLCBJIHRoaW5rIGl0IHNob3VsZCBnbyB0byB0aGUKPiBsZW5ndGhzIG9mIGNv
cHlpbmcgYXJndW1lbnRzIChpZiB0aGV5IGNhbid0IGJlIHJlLWNhbGN1bGF0ZWQKPiBhbnl3YXkp
LiBTdXBwcmVzc2luZyB0aGUgY2xvYmJlcmluZyBpbiBtb3JlIGNhc2VzIG1lcmVseQo+IGludml0
ZXMgZ3Vlc3RzIHRvIHJlYWQgdGhlIGFyZ3VtZW50cyBhZnRlciB0aGUgY2FsbCwgd2hpY2gKPiB0
aGV5IHNpbXBseSBzaG91bGQgbm90IGRvLiBOb3QgY2xvYmJlcmluZyB0aGUgdmFsdWVzIGluCj4g
cmVsZWFzZSBidWlsZHMgaXMgYSBwZXJmb3JtYW5jZSBjaG9pY2UsIGFuZCB3ZSBvdWdodCB0byBi
ZQo+IGFsbG93ZWQgdG8gY2hhbmdlIG91ciBvcGluaW9uIHJlZ2FyZGluZyB0aGlzIGltcGxlbWVu
dGF0aW9uCj4gZGV0YWlsIGF0IGFueSBwb2ludCBpbiB0aW1lLgoKTWF5YmUgdGhleSBjb3VsZCBi
ZSBjbG9iYmVyZWQgbG9zc2xlc3NseSA/ICBFZywgYnkgeG9yaW5nIHdpdGggMHhhYSBvcgpzb21l
dGhpbmcuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
