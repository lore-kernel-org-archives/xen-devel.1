From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 4/4] xen/PVH: Remove reserved entry in PVH
 GDT
Date: Wed, 2 May 2018 11:06:22 -0400
Message-ID: <ee05bb34-7671-3069-3eb0-f794a2dc68a4__42782.121586106$1525273360$gmane$org@oracle.com>
References: <20180430162339.17143-1-boris.ostrovsky@oracle.com>
 <20180430162339.17143-5-boris.ostrovsky@oracle.com>
 <20180501080009.wnjmno5pietptixo@MacBook-Pro-de-Roger.local>
 <5a357f3d-b66e-ca55-0601-18a89b549f4a@oracle.com>
 <5AE9764D02000078001C00BE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rpbp=hv=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fDtI8-0007YL-H0
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 15:03:36 +0000
In-Reply-To: <5AE9764D02000078001C00BE@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDIvMjAxOCAwNDoyNiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDEuMDUu
MTggYXQgMTQ6MzQsIDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4+IE9uIDA1
LzAxLzIwMTggMDQ6MDAgQU0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBNb24sIEFw
ciAzMCwgMjAxOCBhdCAxMjoyMzozOVBNIC0wNDAwLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+
Pj4gQW5kIHdpdGhvdXQgaXQgd2UgY2FuJ3QgdXNlIF9CT09UX1hYIG1hY3JvcyBhbnkgbG9uZ2Vy
IHNvIGRlZmluZSBuZXcgb25lcy4KPj4+IE5vdCBiZWluZyB0aGF0IGZhbWlsaWFyIHdpdGggTGlu
dXggaW50ZXJuYWxzIEknbSBub3Qgc3VyZSBJIHNlZSB0aGUKPj4+IGJlbmVmaXQgb2YgdGhpcy4g
SXNuJ3QgdGhlcmUgYSByaXNrIHRoYXQgc29tZSBvdGhlciBjb2RlIGlzIGdvaW5nIHRvCj4+PiB1
c2UgdGhlIF9fQk9PVF9YWCBkZWZpbmVzPwo+PiBUaGUgc3RhcnR1cCBjb2RlIHdlIGFyZSBqdW1w
aW5nIHRvIGxvYWRzIHRoZWlyIG93biBHRFQgYW5kIEkgZG9uJ3Qgc2VlIAo+PiBhbnkgZXhwbGlj
aXQgcmVmZXJlbmNlcyB0byBzZWdtZW50cy4KPiBObyBleHBsaWNpdCByZWZlcmVuY2VzIHRvIHNl
Z21lbnRzIGlzbid0IGVub3VnaDogWW91IGFsc28gbmVlZCB0byBtYWtlCj4gc3VyZSBubyBleGNl
cHRpb25zIGF0IGFsbCBjYW4gb2NjdXIgd2hpbGUgbG9hZGVkIHNlbGVjdG9ycyBhbmQgR0RUIGFy
ZQo+IG91dCBvZiBzeW5jIC0gaW4gcGFydGljdWxhciBOTUkgbWlnaHQgYmUgb2YgY29uY2VybiBo
ZXJlICh0aGlzIGlzbid0IFBWCj4gYWZ0ZXIgYWxsLCB3aGVyZSBub3QgaGF2aW5nIGEgY2FsbGJh
Y2sgcmVnaXN0ZXJlZCBlZmZlY3RpdmVseSBtYXNrcyBOTUkpLgoKSG93IHdvdWxkIGtlZXBpbmcg
X19CT09UX1hYIHNlbGVjdG9ycyBoZWxwIHdpdGggTk1JPyBXZSBkb24ndCBoYXZlCmFueXRoaW5n
IHNldCB1cCBmb3IgTk1JIGhhbmRsaW5nIGFueXdheSB5ZXQsIHRoaXMgaXMgYWxsIGRvbmUgaW4g
eDg2CnN0YXJ0dXAgY29kZSBsYXRlci4KCi1ib3JpcwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
