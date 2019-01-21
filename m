From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Mon, 21 Jan 2019 02:34:50 -0700
Message-ID: <5C45923A020000780020F907@prv1-mh.provo.novell.com>
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
 (envelope-from <SRS0=q2fe=P5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1glW0o-0001LC-JO
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 09:36:58 +0000
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
Y29tcGlsZXIgY2FuJ3QgbGV2ZXJhZ2UgaXQgZm9yIG9wdGltaXphdGlvbiBwdXJwb3NlLCAKPiBo
b3dldmVyIAo+IHRoZXJlIGFyZSBjb25maXJtYXRpb25zIHRoYXQgR0NDIG1heSBhY3R1YWxseSBs
ZXZlcmFnZSBpdCAoZS5nIFsxXSkuIFlvdSAKPiBhY3R1YWxseSBuZWVkIHRvIHRyaWNrIHRoZSBj
b21waWxlciB0byBhdm9pZCB0aGUgb3B0aW1pemF0aW9uIChlLmcgCj4gUkVMT0NfSElERSkuCj4g
Cj4gU28gb2J2aW91c2x5LCB0aGlzIGlzIG5vdCBvbmx5IGEgTUlTUkEgInByb2JsZW0iIGFzIHlv
dSBzdGF0ZSBoZXJlIGFuZCAKPiBiZWxvdy4KPiAKPiBJIGJlbGlldmUgU3RlZmFubywgU3Rld2Fy
dCBhbmQgSSBwcm92aWRlZCBwbGVudHkgb2YgZG9jdW1lbnRhdGlvbi90aHJlYWQgdG8gCj4gc3Vw
cG9ydCBvdXIgcG9zaXRpb25zLiBDYW4geW91IHByb3ZpZGUgdXMgZG9jdW1lbnRhdGlvbi90aHJl
YWQgc2hvd2luZyB0aGUgCj4gY29tcGlsZXIgd2lsbCBub3QgdHJ5IHRvIGxldmVyYWdlIHRoYXQg
Y2FzZT8KPiAKPiBDaGVlcnMsCj4gCj4gWzFdIAo+IGh0dHBzOi8va3Jpc3RlcncuYmxvZ3Nwb3Qu
Y29tLzIwMTYvMTIvcG9pbnRlci1jb21wYXJpc29uLWludmFsaWQtb3B0aW1pemF0aW9uLmh0bWw/
bT0xCgpCdHcuLCB0aGUgX19zdGFydFtdIC8gX19lbmRbXSBleGFtcGxlIGdpdmVuIHRoZXJlIGRv
ZXMgbm90IG1hdGNoCnVwIHdpdGggd2hhdCBJIHNlZS4gT25seSBzeW1ib2xzIGRlZmluZWQgaW4g
dGhlIHNhbWUgQ1UgYXMgd2hlcmUKdGhlIGNvbXBhcmlzb24gc2l0cyBnZXQgIm9wdGltaXplZCIg
dGhpcyB3YXkuIEV4dGVybnMgYXMgd2VsbCBhcwp3ZWFrIHN5bWJvbHMgZGVmaW5lZCBsb2NhbGx5
IGRvbid0IGdldCBkZWFsdCB3aXRoIGxpa2UgdGhpcy4gQW5kIGhvdwpjb3VsZCB0aGV5PyBOb3Ro
aW5nIHRlbGxzIHRoZSBjb21waWxlciB0aGF0IHR3byBkaXN0aW5jdCBzeW1ib2xzCnJlZmVyIHRv
IHR3byBkaXN0aW5jdCBvYmplY3RzLiBJdCBpcyBlYXN5IHRvIGNyZWF0ZSBvYmplY3RzIHdpdGgK
bXVsdGlwbGUgbmFtZXMsIG5vdCBvbmx5IGluIGFzc2VtYmx5IGJ1dCBhbHNvIGluIEMgKHVzaW5n
IHRoZSAiYWxpYXMiCmF0dHJpYnV0ZSkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
