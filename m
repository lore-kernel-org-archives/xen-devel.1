From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/boot: Make alternative patching
	NMI-safe
Date: Tue, 06 Feb 2018 03:08:26 -0700
Message-ID: <5A798CAA02000078001A5933@prv-mh.provo.novell.com>
References: <1517857833-3897-1-git-send-email-andrew.cooper3@citrix.com>
 <20180205192339.GR26220@char.us.oracle.com>
 <1330a274-2ad9-456e-9876-ada125284742@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1330a274-2ad9-456e-9876-ada125284742@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjAyLjE4IGF0IDAyOjA3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDUvMDIvMjAxOCAxOToyMywgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIHdyb3RlOgo+
PiBPbiBNb24sIEZlYiAwNSwgMjAxOCBhdCAwNzoxMDozM1BNICswMDAwLCBBbmRyZXcgQ29vcGVy
IHdyb3RlOgo+Pj4gLSAgICBhcHBseV9hbHRlcm5hdGl2ZXMoX19hbHRfaW5zdHJ1Y3Rpb25zLCBf
X2FsdF9pbnN0cnVjdGlvbnNfZW5kKTsKPj4+ICsgICAgLyogU2VuZCBvdXJzZWx2ZXMgYW4gTk1J
IHRvIHRyaWdnZXIgdGhlIGNhbGxiYWNrLiAqLwo+Pj4gKyAgICBzZWxmX25taSgpOwo+Pj4gKwo+
Pj4gKyAgICAvKgo+Pj4gKyAgICAgKiBTZW5kaW5nIG91cnNlbGYgYW4gTk1JIGlzbid0IGFyY2hp
dGVjdHVyYWxseSBndWFyYW50ZWVkIHRvIHJlc3VsdCBpbgo+Pj4gKyAgICAgKiB0aGUgc3luY2hy
b25vdXMgZGVsaXZlcnkgKGFsdGhvdWdoIGluIHByYWN0aWNlLCBpdCBhcHBlYXJzIHRvIGJlKS4K
Pj4+ICsgICAgICogUG9sbCBhbHRfZG9uZSBmb3IgdXAgdG8gMSBzZWNvbmQuCj4+PiArICAgICAq
Lwo+Pj4gKyAgICBmb3IgKCBpID0gMDsgIUFDQ0VTU19PTkNFKGFsdF9kb25lKSAmJiBpIDwgMTAw
MDsgKytpICkKPj4gUGVyaGFwcyBhbiAjZGVmaW5lIGZvciB0aGlzPwo+IAo+IEkgZG9uJ3QgcmVh
bGx5IHNlZSB0aGUgcG9pbnQuICBJJ20gZmFpcmx5IHN1cmUgdGhhdCBubyA2NGJpdCBDUFUgd2ls
bAo+IGVudGVyIHRoaXMgbG9vcCwgYnV0IHRoZSBBUElDIHNwZWMgZG9lc24ndCBndWFyYW50ZWUg
dGhhdCBkZWxpdmVyeSBpcwo+IHN5bmNocm9ub3VzLgoKSSBhZ3JlZS4gSWYgYW55dGhpbmcsIHRo
ZSBzdWJzZXF1ZW50IGNoZWNrIGNvdWxkIGJlIGNoYW5nZWQKZnJvbSAiaSA+PSAxMDAwIiB0byAi
IUFDQ0VTU19PTkNFKGFsdF9kb25lKSIsIGVsaW1pbmF0aW5nIHRoZQpkb3VibGUgdXNlIG9mIHRo
ZSBzYW1lIHBsYWluIG51bWJlci4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
