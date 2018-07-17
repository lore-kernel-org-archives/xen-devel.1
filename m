From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 20/21] xen: support console_switching
 between Dom0 and DomUs on ARM
Date: Tue, 17 Jul 2018 09:33:28 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1807170933030.21200@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1807061523160.13502@sstabellini-ThinkPad-X260>
 <1530918736-13965-20-git-send-email-sstabellini@kernel.org>
 <5B4CC5A602000078001D48CD@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1807161411280.21200@sstabellini-ThinkPad-X260>
 <5B4DAB8002000078001D4B92@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B4DAB8002000078001D4B92@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <stefanos@xilinx.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAxNyBKdWwgMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IE9uIDE2LjA3LjE4
IGF0IDIzOjU1LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBPbiBNb24sIDE2
IEp1bCAyMDE4LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMDcuMDcuMTggYXQgMDE6
MTIsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+PiA+ICsgICAgICAgICAgICBz
ZXJpYWxfcnhfcmluZ1tTRVJJQUxfUlhfTUFTSyhzZXJpYWxfcnhfcHJvZCsrKV0gPSBjOwo+ID4+
ID4gKyAgICB9Cj4gPj4gPiArI2lmZGVmIENPTkZJR19BUk0KPiA+PiAKPiA+PiBDT05GSUdfSEFT
X1BMMDExID8KPiA+IAo+ID4gSSBoYWQgYWxyZWFkeSBzcG90dGVkIHRoaXMgcHJvYmxlbS4gSSB0
dXJuZWQgaXQgaW50bzoKPiA+IAo+ID4gICAjaWYgZGVmaW5lZChDT05GSUdfQVJNKSAmJiBkZWZp
bmVkKENPTkZJR19TQlNBX1ZVQVJUX0NPTlNPTEUpCj4gPiAKPiA+IEl0J3MgQ09ORklHX1NCU0Ff
VlVBUlRfQ09OU09MRSByYXRoZXIgdGhhbiBDT05GSUdfSEFTX1BMMDExIGJlY2F1c2UgdGhpcwo+
ID4gaGFzIHRvIGRvIHdpdGggdGhlIHZpcnR1YWwgcGwwMTEgaW1wbGVtZW50YXRpb24gcmF0aGVy
IHRoYW4gdGhlIHBoeXNpY2FsCj4gPiBkcml2ZXIgaW4gWGVuLgo+IAo+IEkgc2VlLiBCdXQgd2h5
IHN0aWxsIHRoZSBDT05GSUdfQVJNPwoKR29vZCBwb2ludCwgSSdsbCByZW1vdmUgaXQuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
