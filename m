From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Mon, 21 Jan 2019 02:39:27 -0700
Message-ID: <5C45934F020000780020F91F@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1901091537100.15373@sstabellini-ThinkPad-X260>
 <alpine.DEB.2.10.1901171701380.18561@sstabellini-ThinkPad-X260>
 <5C3D97FE020000780020D9F3@prv1-mh.provo.novell.com>
 <B4D3ABC30200003B88BF86FB@prv1-mh.provo.novell.com>
 <5C3F051B020000780020E304@prv1-mh.provo.novell.com>
 <529ED2F90200004D00417A66@prv1-mh.provo.novell.com>
 <5C406AEA020000780020E9FA@prv1-mh.provo.novell.com>
 <76A2DEED0200005600417A66@prv1-mh.provo.novell.com>
 <5C41A256020000780020EF25@prv1-mh.provo.novell.com>
 <ca2ed7b7-f0b6-6b06-a306-b7c693e354b1@arm.com>
 <B4D3ABC30200003B88BF86FB@prv1-mh.provo.novell.com>
 <5C3F051B020000780020E304@prv1-mh.provo.novell.com>
 <529ED2F90200004D00417A66@prv1-mh.provo.novell.com>
 <5C406AEA020000780020E9FA@prv1-mh.provo.novell.com>
 <76A2DEED0200005600417A66@prv1-mh.provo.novell.com>
 <5C41A256020000780020EF25@prv1-mh.provo.novell.com>
 <9F511FC70200005E5C475325@prv1-mh.provo.novell.com>
 <5C41B3EE020000780020EFA5@prv1-mh.provo.novell.com>
 <b5db4517-8ff7-bf90-a315-2ad115acf033@arm.com>
 <B4D3ABC30200003B88BF86FB@prv1-mh.provo.novell.com>
 <5C3F051B020000780020E304@prv1-mh.provo.novell.com>
 <529ED2F90200004D00417A66@prv1-mh.provo.novell.com>
 <5C406AEA020000780020E9FA@prv1-mh.provo.novell.com>
 <76A2DEED0200005600417A66@prv1-mh.provo.novell.com>
 <5C41A256020000780020EF25@prv1-mh.provo.novell.com>
 <9F511FC70200005E5C475325@prv1-mh.provo.novell.com>
 <5C41B3EE020000780020EFA5@prv1-mh.provo.novell.com>
 <3A8206D8020000035C475325@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q2fe=P5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1glW3J-0001TS-64
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 09:39:33 +0000
In-Reply-To: <3A8206D8020000035C475325@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@gmail.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAxLjE5IGF0IDE2OjIyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDE4LzAxLzIwMTkgMTE6MDksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxOC4wMS4x
OSBhdCAxMTo0OCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDE4LzAxLzIw
MTkgMDk6NTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDE4LjAxLjE5IGF0IDAyOjI0
LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pj4+IE9uIFRodSwgMTcgSmFuIDIw
MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+Pj4gT24gMTcuMDEuMTkgYXQgMDE6MzcsIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPj4+Pj4+PiBPbiBXZWQsIDE2IEphbiAyMDE5
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBTdG9wLiBOby4gV2UgdmVyeSBtdWNoIGNhbiBwcm92
ZSB0aGV5IGFyZSAtIF9lbmQgcG9pbnRzIGF0Cj4+Pj4gb25lIHBhc3QgdGhlIGxhc3QgZWxlbWVu
dCBvZiBfc3RhcnRbXS4gSXQgaXMgdGhlIGNvbXBpbGVyIHdoaWNoCj4+Pj4gY2FuJ3QgcHJvdmUg
dGhlIG9wcG9zaXRlLCBhbmQgaGVuY2UgaXQgY2FuJ3QgbGV2ZXJhZ2UKPj4+PiB1bmRlZmluZWQg
YmVoYXZpb3IgZm9yIG9wdGltaXphdGlvbiBwdXJwb3Nlcy4KPj4+Cj4+PiBZb3Uga2VlcCBzYXlp
bmcgdGhlIGNvbXBpbGVyIGNhbid0IGxldmVyYWdlIGl0IGZvciBvcHRpbWl6YXRpb24gcHVycG9z
ZSwgaG93ZXZlcgo+Pj4gdGhlcmUgYXJlIGNvbmZpcm1hdGlvbnMgdGhhdCBHQ0MgbWF5IGFjdHVh
bGx5IGxldmVyYWdlIGl0IChlLmcgWzFdKS4gWW91Cj4+PiBhY3R1YWxseSBuZWVkIHRvIHRyaWNr
IHRoZSBjb21waWxlciB0byBhdm9pZCB0aGUgb3B0aW1pemF0aW9uIChlLmcgUkVMT0NfSElERSku
Cj4+IAo+PiBDb3JyZWN0IC0gdGhhdCdzIHRoZSBjYXNlIEknbSByZWZlcnJpbmcgdG8gd2hlbiBz
YXlpbmcgaXQgY2FuJ3QgbGV2ZXJhZ2UKPj4gdW5kZWZpbmVkIGJlaGF2aW9yIG9wdGltaXphdGlv
bnMgYW55bW9yZS4gV2l0aG91dCB0aGUgaGlkaW5nIG9mCj4+IGNvdXJzZSBpdCBjYW4uCj4gCj4g
QnV0IHRoaXMgdHJpY2sgaXMgR0NDIHNwZWNpZmljLCByaWdodD8gU28gd2Ugd291bGQgbmVlZCB0
byBoYXZlIG9uZSB0cmljayBmb3IgCj4gZWFjaCBjb21waWxlciB3ZSBzdXBwb3J0LgoKSSBkb24n
dCB0aGluayBzbzsgSSBjYW4ndCBzZWUgaXQgdG8gYmUgbGVnaXRpbWF0ZSBmb3IgYSBjb21waWxl
ciB0byBkZXJpdmUKYW55dGhpbmcgZnJvbSB3aGF0J3MgaW5zaWRlIGFuIGFzbSgpLiBJdCBtYXkg
bm90IGJlIHNwZWxsZWQgb3V0IHRoYXQKd2F5LCBidXQgaXQgaXMgbXkgdW5kZXJzdGFuZGluZyB0
aGF0IGFsbCBrbm93bGVkZ2UgdGhlIGNvbXBpbGVyIGlzCmFsbG93ZWQgdG8gZGVyaXZlIGZyb20g
YW4gYXNtKCkgaXMgZW5jb2RlZCBpbiB0aGUgaW4vb3V0L2Nsb2JiZXIgZXRjCm9wZXJhbmRzIG9m
IHRoZSBhc20oKTsgdGhlIGZpcnN0IG9wZXJhbmQgLSB0aGUgc3RyaW5nIGxpdGVyYWwgLSBpcwpz
dXBwb3NlZCB0byBiZSBvcGFxdWUgYXMgZmFyIGFzIHRoZSBhc20oKSdzIG9wZXJhdGlvbiBnb2Vz
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
