From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v6 6/9] is_control_domain:
 block speculation
Date: Thu, 14 Feb 2019 14:45:16 +0100
Message-ID: <a4a25ec7-e73b-3956-82e9-d8924b3ee97f@amazon.de>
References: <1c2b8322-1b66-ccc6-9ba9-e86eafb0227a@amazon.de>
 <1549633489-12724-1-git-send-email-nmanthey@amazon.de>
 <1549633489-12724-7-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0101E7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C532AC00200007800212EA2@prv1-mh.provo.novell.com>
 <A18FF6C80200006BB1E090C7@prv1-mh.provo.novell.com>
 <01CCAAAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <01CF2AAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <5C62D4020200007800215F4F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tSEH=QV=amazon.de=prvs=9419de174=nmanthey@srs-us1.protection.inumbo.net>)
 id 1guHKY-00074F-DJ
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 13:45:34 +0000
In-Reply-To: <5C62D4020200007800215F4F@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xMi8xOSAxNToxMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDguMDIuMTkgYXQg
MTQ6NDQsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+PiBDaGVja3Mgb2YgZG9tYWluIHBy
b3BlcnRpZXMsIHN1Y2ggYXMgaXNfaGFyZHdhcmVfZG9tYWluIG9yIGlzX2h2bV9kb21haW4sCj4+
IG1pZ2h0IGJlIGJ5cGFzc2VkIGJ5IHNwZWN1bGF0aXZlbHkgZXhlY3V0aW5nIHRoZXNlIGluc3Ry
dWN0aW9ucy4gQSByZWFzb24KPj4gZm9yIGJ5cGFzc2luZyB0aGVzZSBjaGVja3MgaXMgdGhhdCB0
aGVzZSBtYWNyb3MgYWNjZXNzIHRoZSBkb21haW4KPj4gc3RydWN0dXJlIHZpYSBhIHBvaW50ZXIs
IGFuZCBjaGVjayBhIGNlcnRhaW4gZmllbGQuIFNpbmNlIHRoaXMgbWVtb3J5Cj4+IGFjY2VzcyBp
cyBzbG93LCB0aGUgQ1BVIGFzc3VtZXMgYSByZXR1cm5lZCB2YWx1ZSBhbmQgY29udGludWVzIHRo
ZQo+PiBleGVjdXRpb24uCj4+Cj4+IEluIGNhc2UgYW4gaXNfY29udHJvbF9kb21haW4gY2hlY2sg
aXMgYnlwYXNzZWQsIGZvciBleGFtcGxlIGR1cmluZyBhCj4+IGh5cGVyY2FsbCwgZGF0YSB0aGF0
IHNob3VsZCBvbmx5IGJlIGFjY2Vzc2libGUgYnkgdGhlIGNvbnRyb2wgZG9tYWluIGNvdWxkCj4+
IGJlIGxvYWRlZCBpbnRvIHRoZSBjYWNoZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTm9yYmVydCBN
YW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+Cj4+Cj4+IC0tLQo+Pgo+PiBOb3RlczoKPj4gICB2
NjogRHJvcCBub3NwZWMuaCBpbmNsdWRlCj4gQW5kIHRoaXMgd2FzIGJlY2F1c2Ugb2Ygd2hhdD8g
SSB0aGluayBpdCBpcyBnb29kIHByYWN0aWNlIHRvIGluY2x1ZGUKPiBvdGhlciBoZWFkZXJzIHdo
aWNoIGFkZGVkIGRlZmluaXRpb25zIHJlbHkgb24sIGV2ZW4gaWYgaW4gcHJhY3RpY2UKPiBfcmln
aHQgbm93XyB0aGF0IGhlYWRlciBnZXRzIGluY2x1ZGVkIGFscmVhZHkgYnkgb3RoZXIgbWVhbnMu
IElmCj4gdGhlcmUncyBzb21lIHJlY3Vyc2lvbiBpbiBoZWFkZXIgZGVwZW5kZW5jaWVzLCB0aGVu
IGl0IHdvdWxkIGhhdmUKPiBiZWVuIG5pY2UgaWYgeW91IGhhZCBwb2ludGVkIG91dCB0aGUgYWN0
dWFsIGlzc3VlLgoKVGhlIG5vc3BlYy5oIGhlYWRlciBoYXMgYmVlbiBpbnRyb2R1Y2VkIGJ5IHRo
ZSBjb21taXQgInhlbi9zY2hlZDoKSW50cm9kdWNlIGRvbWFpbl92Y3B1KCkgaGVscGVyIiBiZXR3
ZWVuIG15IHY0IGFuZCB2Niwgc28gSSBoYWQgdG8gZHJvcApteSBpbmNsdWRlIHRoZXJlLiBUaGUg
c2NoZWQuaCBmaWxlIHN0aWxsIGluY2x1ZGVzIHRoZSBub3NwZWMuaCBmaWxlLCBJCmp1c3QgZG8g
bm90IGhhdmUgdG8gYWRkIGl0IGFueSBtb3JlLiBJIGNvdWxkIGhhdmUgYmVlbiBhIGJpdCBtb3Jl
CnZlcmJvc2UgaW4gdGhlIG5vdGVzIHNlY3Rpb24uCgpCZXN0LApOb3JiZXJ0Cgo+Cj4gSmFuCj4K
PgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAz
OAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJh
bGYgSGVyYnJpY2gKVXN0LUlEOiBERSAyODkgMjM3IDg3OQpFaW5nZXRyYWdlbiBhbSBBbXRzZ2Vy
aWNodCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
