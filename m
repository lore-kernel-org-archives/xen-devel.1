From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2] automation: enable building rombios with
 clang
Date: Fri, 15 Mar 2019 09:38:19 -0400
Message-ID: <269203B8-FBE6-4834-9301-D92F5F84E0B9@cardoe.com>
References: <20180824152247.9166-1-wei.liu2@citrix.com>
 <20180824153224.ufzcfzk6xbi2nzqk@doug-macbook.localdomain>
 <20180824153435.tok4pylz3ur5acer@citrix.com>
 <20180826030138.x66gbfp6eqhjmz5j@doug-macbook.localdomain>
 <20190315123436.t4azzgqap5yyqldz@zion.uk.xensource.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wIxl=RS=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1h4n2Y-00008U-Dd
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 13:38:26 +0000
Received: by mail-ua1-x941.google.com with SMTP id d4so3114450uap.5
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2019 06:38:24 -0700 (PDT)
In-Reply-To: <20190315123436.t4azzgqap5yyqldz@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Cj4+PiBPbiBNYXIgMTUsIDIwMTksIGF0IDg6MzQgQU0sIFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+IHdyb3RlOgo+Pj4gCj4+Pj4gT24gU2F0LCBBdWcgMjUsIDIwMTggYXQgMTA6MDE6MzhQ
TSAtMDUwMCwgRG91ZyBHb2xkc3RlaW4gd3JvdGU6Cj4+Pj4+IE9uIEZyaSwgQXVnIDI0LCAyMDE4
IGF0IDA0OjM0OjM1UE0gKzAxMDAsIFdlaSBMaXUgd3JvdGU6Cj4+Pj4+IE9uIEZyaSwgQXVnIDI0
LCAyMDE4IGF0IDEwOjMyOjI0QU0gLTA1MDAsIERvdWcgR29sZHN0ZWluIHdyb3RlOgo+Pj4+PiBP
biBGcmksIEF1ZyAyNCwgMjAxOCBhdCAwNDoyMjo0N1BNICswMTAwLCBXZWkgTGl1IHdyb3RlOgo+
Pj4+PiBQcmV2aW91c2x5IGl0IGlzIGRpc2FibGVkIGJlY2F1c2UgdGhlIGVtYmVkZGVkIGlweGUg
Y2FuJ3QgYmUgYnVpbHQKPj4+Pj4gd2l0aCBjbGFuZy4gTm93IHRoYXQgaXB4ZSBpcyBzcGxpdCBv
dXQgd2UgY2FuIHVzZSAtLXdpdGgtc3lzdGVtLWlweGUKPj4+Pj4gdG8gd29yayBhcm91bmQgdGhl
IGlzc3VlLgo+Pj4+PiAKPj4+Pj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICsgICAgIyBpUFhFIGNhbm5vdCBiZSBidWlsdCB3aXRo
IGNsYW5nCj4+Pj4+ICsgICAgY2ZnYXJncys9KCItLXdpdGgtc3lzdGVtLWlweGU9L3Vzci9saWIv
aXB4ZS9pcHhlLnB4ZSIpCj4+Pj4gCj4+Pj4gRGlkIHdlIGV2ZXIgZ2V0IGFsbCB0aGUgY29udGFp
bmVycyB1cGRhdGVkIHdpdGggdGhpcyBmaWxlIGluIHBsYWNlPwo+Pj4gCj4+PiBOby4gSSBkaWRu
J3QuIERvIHdlIGNhcmU/IFhlbidzIGJ1aWxkIHN5c3RlbSBkb2Vzbid0IGNoZWNrIGlmIHRoYXQg
ZmlsZQo+Pj4gZXhpc3RzLiBJdCBtZXJlbHkgcHV0cyB0aGUgc3RyaW5nIGludG8gYXBwcm9wcmlh
dGUgcGxhY2VzLgo+Pj4gCj4+PiBXZWkuCj4+IAo+PiBXZWxsIHRoZW4gdGhhdCB3b3JrcyBmb3Ig
bWUuIEp1c3Qgd29uZGVyaW5nIGlmIHlvdSd2ZSBwdXNoZWQgYSBicmFuY2gKPj4gd2l0aCB0aGlz
IGFuZCBoYWQgR2l0TGFiIHJ1biBvdmVyIGl0Pwo+IAo+IEkgdGFrZSB0aGF0ICJ0aGF0IHdvcmtz
IGZvciBtZSIgYXMgYW4gYXBwcm92YWwuIDotKQo+IAo+IEkgd2lsbCBjb21taXQgdGhpcyBwYXRj
aCBzaG9ydGx5Lgo+IAo+IFdlaS4KClllcy4gQXBvbG9naWVzIGZvciBub3QgYmVpbmcgZXhwbGlj
aXQuIAoKQWNrZWQtYnk6IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
