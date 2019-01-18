From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Fri, 18 Jan 2019 04:09:34 -0700
Message-ID: <5C41B3EE020000780020EFA5@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1901091537100.15373@sstabellini-ThinkPad-X260>
 <a0500e7bb7244b5aa6dc1282a2375ad0@dornerworks.com>
 <5C3F051B020000780020E304@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901161630210.18561@sstabellini-ThinkPad-X260>
 <1CACC1FB020000D800417A66@prv1-mh.provo.novell.com>
 <5C3D97FE020000780020D9F3@prv1-mh.provo.novell.com>
 <B4D3ABC30200003B88BF86FB@prv1-mh.provo.novell.com>
 <5C3F051B020000780020E304@prv1-mh.provo.novell.com>
 <529ED2F90200004D00417A66@prv1-mh.provo.novell.com>
 <5C406AEA020000780020E9FA@prv1-mh.provo.novell.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gkS1o-0000EE-Ez
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 11:09:36 +0000
In-Reply-To: <9F511FC70200005E5C475325@prv1-mh.provo.novell.com>
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

Pj4+IE9uIDE4LjAxLjE5IGF0IDExOjQ4LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDE4LzAxLzIwMTkgMDk6NTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxOC4wMS4x
OSBhdCAwMjoyNCwgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4gT24gVGh1LCAx
NyBKYW4gMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMTcuMDEuMTkgYXQgMDE6
MzcsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPj4+Pj4gT24gV2VkLCAxNiBKYW4g
MjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFN0b3AuIE5vLiBXZSB2ZXJ5IG11Y2ggY2FuIHBy
b3ZlIHRoZXkgYXJlIC0gX2VuZCBwb2ludHMgYXQKPj4gb25lIHBhc3QgdGhlIGxhc3QgZWxlbWVu
dCBvZiBfc3RhcnRbXS4gSXQgaXMgdGhlIGNvbXBpbGVyIHdoaWNoCj4+IGNhbid0IHByb3ZlIHRo
ZSBvcHBvc2l0ZSwgYW5kIGhlbmNlIGl0IGNhbid0IGxldmVyYWdlCj4+IHVuZGVmaW5lZCBiZWhh
dmlvciBmb3Igb3B0aW1pemF0aW9uIHB1cnBvc2VzLgo+IAo+IFlvdSBrZWVwIHNheWluZyB0aGUg
Y29tcGlsZXIgY2FuJ3QgbGV2ZXJhZ2UgaXQgZm9yIG9wdGltaXphdGlvbiBwdXJwb3NlLCBob3dl
dmVyIAo+IHRoZXJlIGFyZSBjb25maXJtYXRpb25zIHRoYXQgR0NDIG1heSBhY3R1YWxseSBsZXZl
cmFnZSBpdCAoZS5nIFsxXSkuIFlvdSAKPiBhY3R1YWxseSBuZWVkIHRvIHRyaWNrIHRoZSBjb21w
aWxlciB0byBhdm9pZCB0aGUgb3B0aW1pemF0aW9uIChlLmcgUkVMT0NfSElERSkuCgpDb3JyZWN0
IC0gdGhhdCdzIHRoZSBjYXNlIEknbSByZWZlcnJpbmcgdG8gd2hlbiBzYXlpbmcgaXQgY2FuJ3Qg
bGV2ZXJhZ2UKdW5kZWZpbmVkIGJlaGF2aW9yIG9wdGltaXphdGlvbnMgYW55bW9yZS4gV2l0aG91
dCB0aGUgaGlkaW5nIG9mCmNvdXJzZSBpdCBjYW4uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
