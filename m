From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: only clobber multicall elements
 without error
Date: Mon, 26 Nov 2018 14:52:23 +0100
Message-ID: <d38b1c33-5cca-572a-a942-b1db8ca309a2@suse.com>
References: <20181123132516.28681-1-jgross@suse.com>
 <5BFBD1C602000078001FFE09@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XwCH=OF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gRHJL-0001Kw-Jp
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 13:52:27 +0000
In-Reply-To: <5BFBD1C602000078001FFE09@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMTEvMjAxOCAxMTo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjMuMTEuMTgg
YXQgMTQ6MjUsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBJbiBkZWJ1ZyBidWlsZHMgdGhl
IGh5cGVydmlzb3Igd2lsbCBkZWxpYmVyYXRlbHkgY2xvYmJlciBwcm9jZXNzZWQKPj4gZWxlbWVu
dHMgb2YgdGhlIG11bHRpY2FsbCBzdHJ1Y3R1cmUuIEluIG9yZGVyIHRvIGVhc2UgZGlhZ25vc3Rp
YyBkYXRhCj4+IHByaW50b3V0IGluIHRoZSBhZmZlY3RlZCBndWVzdCBvbmx5IGNsb2JiZXIgZWxl
bWVudHMgd2hpY2ggZGlkbid0Cj4+IHJldHVybiBhbiBlcnJvci4KPiAKPiBCZXNpZGVzIHdoYXQg
QW5kcmV3IGhhcyBzYWlkIHN1Y2ggYSByZWxheGF0aW9uIHJlZHVjZXMKPiB0aGUgZ3VhcmRpbmcg
YWdhaW5zdCBiYWQgZ3Vlc3Qgc2lkZSBjb2RlLiBJZiBhIGd1ZXN0IHJlYWxseQo+IHdpc2hlcyB0
byBwcm9kdWNlIGRpYWdub3N0aWNzLCBJIHRoaW5rIGl0IHNob3VsZCBnbyB0byB0aGUKPiBsZW5n
dGhzIG9mIGNvcHlpbmcgYXJndW1lbnRzIChpZiB0aGV5IGNhbid0IGJlIHJlLWNhbGN1bGF0ZWQK
PiBhbnl3YXkpLiBTdXBwcmVzc2luZyB0aGUgY2xvYmJlcmluZyBpbiBtb3JlIGNhc2VzIG1lcmVs
eQo+IGludml0ZXMgZ3Vlc3RzIHRvIHJlYWQgdGhlIGFyZ3VtZW50cyBhZnRlciB0aGUgY2FsbCwg
d2hpY2gKPiB0aGV5IHNpbXBseSBzaG91bGQgbm90IGRvLiBOb3QgY2xvYmJlcmluZyB0aGUgdmFs
dWVzIGluCj4gcmVsZWFzZSBidWlsZHMgaXMgYSBwZXJmb3JtYW5jZSBjaG9pY2UsIGFuZCB3ZSBv
dWdodCB0byBiZQo+IGFsbG93ZWQgdG8gY2hhbmdlIG91ciBvcGluaW9uIHJlZ2FyZGluZyB0aGlz
IGltcGxlbWVudGF0aW9uCj4gZGV0YWlsIGF0IGFueSBwb2ludCBpbiB0aW1lLgoKUmlnaHQuIEFu
ZCBub3QgY29weWluZyB0aGUgdmFsdWVzIGJlZm9yZSB0aGUgY2FsbCBpcyBhIHBlcmZvcm1hbmNl
CmNob2ljZSBvbiBndWVzdCBzaWRlLCBhcyBlcnJvcnMgYXJlIG5vdCB0aGUgY29tbW9uIGNhc2Uu
CgpJIGtub3cgdGhlcmUgaXMgbm8gZ3VhcmFudGVlIGZvciB0aGUgZ3Vlc3QgdGhhdCB0aGUgdmFs
dWVzIGFyZSBwcmVzZXJ2ZWQKYWZ0ZXIgdGhlIGNhbGwsIGJ1dCBpbiB0aGUgZXJyb3IgY2FzZSAo
d2hpY2ggc2hvdWxkIGJlIF92ZXJ5XyByYXJlKSBpdAp3aWxsIG1ha2UgZGlhZ25vc2lzIG9mIHRo
YXQgY2FzZSBtdWNoIGVhc2llci4KCkkgZG9uJ3QgdGhpbmsgdGhlIGh5cGVydmlzb3Igc2hvdWxk
IGV4cGxpY2l0bHkgdHJ5IHRvIG1ha2UgaXQgYXMgaGFyZCBhcwpwb3NzaWJsZSBmb3IgdGhlIGd1
ZXN0IHRvIGZpbmQgcHJvYmxlbXMgaW4gdGhlIGNvZGUuCgoKSnVlcmdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
