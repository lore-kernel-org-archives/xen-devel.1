From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH v2 08/18] xen: add basic hooks for PVH in
 current code
Date: Mon, 22 Oct 2018 13:16:09 +0200
Message-ID: <20181022111609.GA4548__28552.0977959552$1540206927$gmane$org@olila.i.net-space.pl>
References: <20181009110317.6022-1-jgross@suse.com>
 <20181009110317.6022-9-jgross@suse.com>
 <20181019153327.giznmhrlxxjjmjsb@mac.bytemobile.com>
 <f932643f-bdce-7bed-55d2-39addfda50d2@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <f932643f-bdce-7bed-55d2-39addfda50d2@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: hans@knorrie.org, grub-devel@gnu.org, phcoder@gmail.com, xen-devel@lists.xen.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMTksIDIwMTggYXQgMDU6NTI6NDRQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAxOS8xMC8yMDE4IDE3OjMzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
T24gVHVlLCBPY3QgMDksIDIwMTggYXQgMDE6MDM6MDdQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiA+PiBBZGQgdGhlIGhvb2tzIHRvIGN1cnJlbnQgY29kZSBuZWVkZWQgZm9yIFhlbiBQ
VkguCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Cj4gPj4gLS0tCj4gPj4gIGdydWItY29yZS9rZXJuL2kzODYveGVuL3B2aC5jICAgICAgICAg
fCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4+ICBncnViLWNvcmUv
a2Vybi9pMzg2L3hlbi9zdGFydHVwX3B2aC5TIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ID4+ICBncnViLWNvcmUva2Vybi94ZW4vaW5pdC5jICAgICAgICAgICAgIHwgIDYgKysr
KysrCj4gPj4gIGluY2x1ZGUvZ3J1Yi9pMzg2L3hlbnB2aC9rZXJuZWwuaCAgICAgfCAzMCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4+ICBpbmNsdWRlL2dydWIveGVuLmggICAgICAg
ICAgICAgICAgICAgIHwgIDYgKysrKysrCj4gPj4gIDUgZmlsZXMgY2hhbmdlZCwgMTA3IGluc2Vy
dGlvbnMoKykKPiA+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGdydWItY29yZS9rZXJuL2kzODYveGVu
L3B2aC5jCj4gPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBncnViLWNvcmUva2Vybi9pMzg2L3hlbi9z
dGFydHVwX3B2aC5TCj4gPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2dydWIvaTM4Ni94
ZW5wdmgva2VybmVsLmgKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9ncnViLWNvcmUva2Vybi9pMzg2
L3hlbi9wdmguYyBiL2dydWItY29yZS9rZXJuL2kzODYveGVuL3B2aC5jCj4gPj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiA+PiBpbmRleCAwMDAwMDAwMDAuLjE4MmVmOTVmOQo+ID4+IC0tLSAvZGV2
L251bGwKPiA+PiArKysgYi9ncnViLWNvcmUva2Vybi9pMzg2L3hlbi9wdmguYwo+ID4+IEBAIC0w
LDAgKzEsMzYgQEAKPiA+PiArLyoKPiA+PiArICogIEdSVUIgIC0tICBHUmFuZCBVbmlmaWVkIEJv
b3Rsb2FkZXIKPiA+PiArICogIENvcHlyaWdodCAoQykgMjAxMSAgRnJlZSBTb2Z0d2FyZSBGb3Vu
ZGF0aW9uLCBJbmMuCj4gPgo+ID4gSXNuJ3QgdGhpcyBoZWFkZXIgKGFuZCB0aGUgb25lcyBiZWxv
dykga2luZCBvZiBvZmYgYXQgbGVhc3QgeWVhcgo+ID4gd2lzZT8KPgo+IEhtbSwgb25seSBhIGxp
dHRsZSBiaXQgOi0pCj4KPiBXaWxsIHVwZGF0ZS4KClBsZWFzZSBkbyB0aGlzIGZvciBhbGwgaGVh
ZGVycyBpbiB0aGUgcGF0Y2hzZXQKCkRhbmllbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
