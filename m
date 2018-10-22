From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 21/23] xen/vpl011: buffer out chars when
 the backend is xen
Date: Mon, 22 Oct 2018 16:46:11 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1810221250050.31582@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1810051140030.24936@sstabellini-ThinkPad-X260>
 <1538765251-25256-21-git-send-email-sstabellini@kernel.org>
 <5BBB265002000078001EF70A@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1810191614150.31582@sstabellini-ThinkPad-X260>
 <1711a24d-de26-0466-89cb-1135fe5ecb4b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1711a24d-de26-0466-89cb-1135fe5ecb4b@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <stefanos@xilinx.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Jan Beulich <JBeulich@suse.com>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCAyMCBPY3QgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMTAvMjAvMTggMTI6MjAgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9u
IE1vbiwgOCBPY3QgMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIDA1LjEw
LjE4IGF0IDIwOjQ3LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gLS0t
IGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKPiA+ID4gPiArKysgYi94ZW4vZHJpdmVycy9j
aGFyL2NvbnNvbGUuYwo+ID4gPiA+IEBAIC00MDYsNiArNDA2LDEzIEBAIHN0YXRpYyB2b2lkIGR1
bXBfY29uc29sZV9yaW5nX2tleSh1bnNpZ25lZCBjaGFyCj4gPiA+ID4ga2V5KQo+ID4gPiA+ICAg
ICovCj4gPiA+ID4gICBzdGF0aWMgdW5zaWduZWQgaW50IF9fcmVhZF9tb3N0bHkgY29uc29sZV9y
eCA9IDA7Cj4gPiA+ID4gICArc3RydWN0IGRvbWFpbiAqY29uc29sZV9pbnB1dF9kb21haW4odm9p
ZCkKPiA+ID4gPiArewo+ID4gPiA+ICsgICAgaWYgKCBjb25zb2xlX3J4ID09IDAgKQo+ID4gPiA+
ICsgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+ID4gPiArICAgIHJldHVybiBnZXRfZG9tYWlu
X2J5X2lkKGNvbnNvbGVfcnggLSAxKTsKPiA+ID4gCj4gPiA+IFRoaXMgYWNxdWlyZXMgYSBkb21h
aW4gcmVmZXJlbmNlLCB5ZXQgSSBjYW4ndCBzZWUgdGhhdCByZWZlcmVuY2UKPiA+ID4gZ2V0dGlu
ZyBkcm9wcGVkIGFueXdoZXJlIGluIHRoZSBjYWxsZXIuCj4gPiAKPiA+IFdlbGwgc3BvdHRlZCEK
PiA+IAo+ID4gSSdsbCBhZGQgYSBjb21tZW50IGhlcmUgYXMgYSByZW1pbmRlciwgYW5kIEknbGwg
ZHJvcCB0aGUgZG9tYWluCj4gPiByZWZlcmVuY2UgaW4gdGhlIGNhbGxlciAoeGVuL2FyY2gvYXJt
L3ZwbDAxMS5jOnZwbDAxMV93cml0ZV9kYXRhX3hlbikuCj4gCj4gV2h5IGRvIHlvdSB1c2UgZ2V0
X2RvbWFpbl9ieV9pZCgpIGFuZCBub3QgcmN1X2xvY2tfZG9tYWluX2J5X2lkKCk/IFRoZSBsYXR0
ZXIKPiBpcyByZWNvbW1lbmQgZm9yIHNob3J0IGxpdmUgcmVmZXJlbmNlLgoKWWVzLCB5b3UgYXJl
IHJpZ2h0LCB0aGF0IGlzIGEgYmV0dGVyIHNvbHV0aW9uLiBJJ2xsIGNoYW5nZSBpdCB0byB1c2UK
cmN1X2xvY2tfZG9tYWluX2J5X2lkLiBXZSBzdGlsbCBuZWVkIHRoZSBjb3JyZXNwb25kaW5nIHJj
dV91bmxvY2tfZG9tYWluCmNhbGwsIHNvIEknbGwgc3RpbGwgYWRkIGEgbmV3IGNvbW1lbnQgYW5k
IHRoZSBjb3JyZXNwb25kaW5nIHVubG9jayBjYWxsLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
