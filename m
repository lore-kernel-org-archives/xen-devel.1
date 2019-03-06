From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-next RFC 3/4] pygrub: convert python
 files with 2to3
Date: Wed, 6 Mar 2019 11:31:40 +0000
Message-ID: <20190306113140.mr6kzbhx3ue5im7e@zion.uk.xensource.com>
References: <20190305164206.6793-1-wei.liu2@citrix.com>
 <20190305164206.6793-4-wei.liu2@citrix.com>
 <ed7db103-1ed4-2fa1-4b10-f7c27e551c1e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ECHp=RJ=citrix.com=prvs=9619a384d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h1UmC-0003L8-5q
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 11:31:56 +0000
Content-Disposition: inline
In-Reply-To: <ed7db103-1ed4-2fa1-4b10-f7c27e551c1e@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMDUsIDIwMTkgYXQgMDU6NTE6MDRQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwNS8wMy8yMDE5IDE2OjQyLCBXZWkgTGl1IHdyb3RlOgo+ID4gU2lnbmVkLW9m
Zi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gTm90IHN1cmUg
dGhpcyB3b3JrcyB3aXRoIHB5dGhvbiAyLjQsIGJ1dCBpdCBzaG91bGQgd29yayB3aXRoIDIuNyBz
aW5jZQo+ID4gdGhlIGNoYW5nZXMgbG9vayBtb3JlIG9yIGxlc3MgaW4gdGhlIHNhbWUgdmVpbiBh
cyB0aGUgY2hhbmdlcyBpbgo+ID4gbGlieGwuCj4gPgo+ID4gVGhlIGNvbnZlcnNpb24gb2YgdGhl
IGltcG9ydCBpcyBpbnRlcmVzdGluZy4gVGhpcyBkZWZpbml0ZWx5IG5lZWRzCj4gPiBzb21lIHRl
c3RpbmcuCj4gPiAtLS0KPiA+ICB0b29scy9weWdydWIvc3JjL0V4dExpbnV4Q29uZi5weSB8IDE2
ICsrKysrKysrLS0tLS0tLS0KPiA+ICB0b29scy9weWdydWIvc3JjL0dydWJDb25mLnB5ICAgICB8
IDM2ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIHRvb2xzL3B5Z3J1
Yi9zcmMvTGlsb0NvbmYucHkgICAgIHwgMTYgKysrKysrKystLS0tLS0tLQo+ID4gIDMgZmlsZXMg
Y2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL3Rvb2xzL3B5Z3J1Yi9zcmMvRXh0TGludXhDb25mLnB5IGIvdG9vbHMvcHlncnViL3Ny
Yy9FeHRMaW51eENvbmYucHkKPiA+IGluZGV4IGQxNzg5YmYwMjAuLjYwZGE5NjBjNGIgMTAwNjQ0
Cj4gPiAtLS0gYS90b29scy9weWdydWIvc3JjL0V4dExpbnV4Q29uZi5weQo+ID4gKysrIGIvdG9v
bHMvcHlncnViL3NyYy9FeHRMaW51eENvbmYucHkKPiA+IEBAIC0xMiw3ICsxMiw3IEBACj4gPiAg
Cj4gPiAgaW1wb3J0IHN5cywgcmUsIG9zCj4gPiAgaW1wb3J0IGxvZ2dpbmcKPiA+IC1pbXBvcnQg
R3J1YkNvbmYKPiA+ICtmcm9tIC4gaW1wb3J0IEdydWJDb25mCj4gCj4gUmVsYXRpdmUgaW1wb3J0
cyBkZWZpbml0ZWx5IGRvbid0IGV4aXN0IGluIFB5IDIuNAo+IAo+ID4gIAo+ID4gIGNsYXNzIEV4
dExpbnV4SW1hZ2Uob2JqZWN0KToKPiA+ICAgICAgZGVmIF9faW5pdF9fKHNlbGYsIGxpbmVzLCBw
YXRoKToKPiA+IEBAIC0zMiw3ICszMiw3IEBAIGNsYXNzIEV4dExpbnV4SW1hZ2Uob2JqZWN0KToK
PiA+ICAgICAgICAgIHNlbGYubGluZXMgPSBbXQo+ID4gICAgICAgICAgc2VsZi5wYXRoID0gcGF0
aAo+ID4gICAgICAgICAgc2VsZi5yb290ID0gIiIKPiA+IC0gICAgICAgIG1hcChzZWxmLnNldF9m
cm9tX2xpbmUsIGxpbmVzKQo+ID4gKyAgICAgICAgbGlzdChtYXAoc2VsZi5zZXRfZnJvbV9saW5l
LCBsaW5lcykpCj4gCj4gVGhpcyBhbiBhYnVzZSBvZiBtYXAoKSBpbiB0aGUgZmlyc3QgcGxhY2Us
IGJ1dCB0aGUgYXV0b21hdGljCj4gdHJhbnNmb3JtYXRpb24gbWFrZXMgdGhlIHJlc3VsdCBldmVu
IG1vcmUgY29uZnVzaW5nLgoKUmlnaHQuIEkgdHJpZWQgdG8gZmluZCB0aGUganVzdGlmaWNhdGlv
biBmb3IgdGhpcyB0cmFuc2Zvcm1hdGlvbiBidXQgdGhlCmRvY3VtZW50IGRvZXNuJ3QgcHJvdmlk
ZSB0aGF0LgoKSSB3aWxsIGRyb3AgdGhpcyBhbmQgdGhlIHJlbGF0aXZlIGltcG9ydCAtLSBJIF90
aGlua18gdGhlIG9yaWdpbmFsIGNvZGUKc2hvdWxkIHN0aWxsIHdvcmsgd2l0aCBweXRob24gMy4K
CldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
