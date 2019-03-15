From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] automation: enable building rombios with
 clang
Date: Fri, 15 Mar 2019 12:34:36 +0000
Message-ID: <20190315123436.t4azzgqap5yyqldz@zion.uk.xensource.com>
References: <20180824152247.9166-1-wei.liu2@citrix.com>
 <20180824153224.ufzcfzk6xbi2nzqk@doug-macbook.localdomain>
 <20180824153435.tok4pylz3ur5acer@citrix.com>
 <20180826030138.x66gbfp6eqhjmz5j@doug-macbook.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1zYA=RS=citrix.com=prvs=9700dc273=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h4m2u-00023p-4o
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 12:34:44 +0000
Content-Disposition: inline
In-Reply-To: <20180826030138.x66gbfp6eqhjmz5j@doug-macbook.localdomain>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBBdWcgMjUsIDIwMTggYXQgMTA6MDE6MzhQTSAtMDUwMCwgRG91ZyBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gRnJpLCBBdWcgMjQsIDIwMTggYXQgMDQ6MzQ6MzVQTSArMDEwMCwgV2VpIExp
dSB3cm90ZToKPiA+IE9uIEZyaSwgQXVnIDI0LCAyMDE4IGF0IDEwOjMyOjI0QU0gLTA1MDAsIERv
dWcgR29sZHN0ZWluIHdyb3RlOgo+ID4gPiBPbiBGcmksIEF1ZyAyNCwgMjAxOCBhdCAwNDoyMjo0
N1BNICswMTAwLCBXZWkgTGl1IHdyb3RlOgo+ID4gPiA+IFByZXZpb3VzbHkgaXQgaXMgZGlzYWJs
ZWQgYmVjYXVzZSB0aGUgZW1iZWRkZWQgaXB4ZSBjYW4ndCBiZSBidWlsdAo+ID4gPiA+IHdpdGgg
Y2xhbmcuIE5vdyB0aGF0IGlweGUgaXMgc3BsaXQgb3V0IHdlIGNhbiB1c2UgLS13aXRoLXN5c3Rl
bS1pcHhlCj4gPiA+ID4gdG8gd29yayBhcm91bmQgdGhlIGlzc3VlLgo+ID4gPiA+IAo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPiA+ID4gLS0t
Cj4gPiA+ID4gKyAgICAjIGlQWEUgY2Fubm90IGJlIGJ1aWx0IHdpdGggY2xhbmcKPiA+ID4gPiAr
ICAgIGNmZ2FyZ3MrPSgiLS13aXRoLXN5c3RlbS1pcHhlPS91c3IvbGliL2lweGUvaXB4ZS5weGUi
KQo+ID4gPiAKPiA+ID4gRGlkIHdlIGV2ZXIgZ2V0IGFsbCB0aGUgY29udGFpbmVycyB1cGRhdGVk
IHdpdGggdGhpcyBmaWxlIGluIHBsYWNlPwo+ID4gCj4gPiBOby4gSSBkaWRuJ3QuIERvIHdlIGNh
cmU/IFhlbidzIGJ1aWxkIHN5c3RlbSBkb2Vzbid0IGNoZWNrIGlmIHRoYXQgZmlsZQo+ID4gZXhp
c3RzLiBJdCBtZXJlbHkgcHV0cyB0aGUgc3RyaW5nIGludG8gYXBwcm9wcmlhdGUgcGxhY2VzLgo+
ID4gCj4gPiBXZWkuCj4gCj4gV2VsbCB0aGVuIHRoYXQgd29ya3MgZm9yIG1lLiBKdXN0IHdvbmRl
cmluZyBpZiB5b3UndmUgcHVzaGVkIGEgYnJhbmNoCj4gd2l0aCB0aGlzIGFuZCBoYWQgR2l0TGFi
IHJ1biBvdmVyIGl0PwoKSSB0YWtlIHRoYXQgInRoYXQgd29ya3MgZm9yIG1lIiBhcyBhbiBhcHBy
b3ZhbC4gOi0pCgpJIHdpbGwgY29tbWl0IHRoaXMgcGF0Y2ggc2hvcnRseS4KCldlaS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
