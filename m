From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 6/6] docs/pvh: document initial MTRR state
Date: Wed, 16 May 2018 02:17:34 -0600
Message-ID: <5AFBE91E02000078001C31D3@prv1-mh.provo.novell.com>
References: <20180515143617.69711-1-roger.pau@citrix.com>
 <20180515143617.69711-7-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=iqfx=id=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fIrcx-0000aU-Ob
 for xen-devel@lists.xenproject.org; Wed, 16 May 2018 08:17:39 +0000
In-Reply-To: <20180515143617.69711-7-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjA1LjE4IGF0IDE2OjM2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFByb3ZpZGVkIHRvIGJvdGggRG9tMCBhbmQgRG9tVXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gLS0tCj4gQ2M6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQ2M6IEdlb3JnZSBEdW5sYXAgPEdl
b3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KPiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGV1LmNpdHJpeC5jb20+Cj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBD
YzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBDYzogS29ucmFkIFJ6ZXN6
dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgo+IENjOiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3Jn
Pgo+IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IC0tLQo+IENoYW5nZXMgc2lu
Y2UgdjE6Cj4gIC0gQWRkIGFuIGV4dHJhIHBhcmFncmFwaCB0byBjbGFyaWZ5IHRoZSBpbml0aWFs
IE1UUlIgc3RhdGUuCj4gLS0tCj4gIGRvY3MvbWlzYy9wdmgubWFya2Rvd24gfCAxOCArKysrKysr
KysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvZG9jcy9taXNjL3B2aC5tYXJrZG93biBiL2RvY3MvbWlzYy9wdmgubWFya2Rvd24K
PiBpbmRleCBlODVmYjE1Mzc0Li5mYzMxMTMyNjE4IDEwMDY0NAo+IC0tLSBhL2RvY3MvbWlzYy9w
dmgubWFya2Rvd24KPiArKysgYi9kb2NzL21pc2MvcHZoLm1hcmtkb3duCj4gQEAgLTkyLDMgKzky
LDIxIEBAIGV2ZW50IGNoYW5uZWxzLiBEZWxpdmVyeSBvZiB0aG9zZSBpbnRlcnJ1cHRzIGNhbiBi
ZSBjb25maWd1cmVkIGluIHRoZSBzYW1lIHdheQo+ICBhcyBIVk0gZ3Vlc3RzLCBjaGVjayB4ZW4v
aW5jbHVkZS9wdWJsaWMvaHZtL3BhcmFtcy5oIGFuZAo+ICB4ZW4vaW5jbHVkZS9wdWJsaWMvaHZt
L2h2bVxfb3AuaCBmb3IgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCBhdmFpbGFibGUgZGVsaXZlcnkK
PiAgbWV0aG9kcy4KPiArCj4gKyMjIE1UUlIgIyMKPiArCj4gKyMjIyBVbnByaXZpbGVnZWQgZ3Vl
c3RzICMjIwo+ICsKPiArUFZIIGd1ZXN0cyBhcmUgYm9vdGVkIHdpdGggdGhlIGRlZmF1bHQgTVRS
UiB0eXBlIHNldCB0byB3cml0ZS1iYWNrIGFuZCBNVFJSCj4gK2VuYWJsZWQuIFRoaXMgYWxsb3dz
IERvbVVzIHRvIHN0YXJ0IHdpdGggYSBzYW5lIE1UUlIgc3RhdGUuIE5vdGUgdGhhdCB0aGlzIHdp
bGwKPiAraGF2ZSB0byBiZSByZXZpc2l0ZWQgd2hlbiBwY2ktcGFzc3Rocm91Z2ggaXMgYWRkZWQg
dG8gUFZIIGluIG9yZGVyIHRvIHNldCBNTUlPCj4gK3JlZ2lvbnMgYXMgVUMuCj4gKwo+ICtYZW4g
Z3VhcmFudGVlcyB0aGF0IFJBTSByZWdpb25zIHdpbGwgYWx3YXlzIGhhdmUgdGhlIFdCIGNhY2hl
IHR5cGUgc2V0IGluIHRoZQo+ICtpbml0aWFsIE1UUlIgc3RhdGUsIGVpdGhlciBzZXQgYnkgdGhl
IGRlZmF1bHQgTVRSUiB0eXBlIG9yIGJ5IG90aGVyIG1lYW5zLgoKV2hpbGUgYWRkaW5nIHRoZSBz
ZWNvbmQgcGFyYWdyYXBoIGhhcyBoZWxwZWQsIEkgc3RpbGwgdGhpbmsgdGhlIGZpcnN0IG9uZSBp
cyBsYWNraW5nCiJjdXJyZW50bHkiIG9yIHNvbWUgc3VjaCBpbiB0aGUgZmlyc3Qgc2VudGVuY2Uu
CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
