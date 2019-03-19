From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 1/2] x86: decouple xen alignment setting
 from EFI/ELF build
Date: Tue, 19 Mar 2019 13:52:22 +0000
Message-ID: <20190319135222.GI14641@zion.uk.xensource.com>
References: <20190319130550.32570-1-wei.liu2@citrix.com>
 <20190319130550.32570-2-wei.liu2@citrix.com>
 <5C90F24102000078002204B2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yczf=RW=citrix.com=prvs=9744cf058=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h6FAk-00047V-U6
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 13:52:54 +0000
Content-Disposition: inline
In-Reply-To: <5C90F24102000078002204B2@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMTksIDIwMTkgYXQgMDc6NDQ6MzNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjAzLjE5IGF0IDE0OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZpZwo+ID4gKysrIGIveGVuL2FyY2gveDg2
L0tjb25maWcKPiA+IEBAIC0xMzgsNiArMTM4LDI5IEBAIGNvbmZpZyBUQk9PVAo+ID4gIAo+ID4g
IAkgIElmIHVuc3VyZSwgc2F5IFkuCj4gPiAgCj4gPiArY2hvaWNlCj4gPiArCXByb21wdCAiQWxp
Z25tZW50IG9mIFhlbiBpbWFnZSIKPiA+ICsJZGVwZW5kcyBvbiBYODYKPiAKPiBTb3JyeSwgbm90
aWNlZCBvbmx5IHdoaWxlIGxvb2tpbmcgYXQgcGF0Y2ggMiBhZ2FpbjogVGhpcyBsaW5lIHNlZW1z
Cj4gdW5uZWNlc3NhcnksIGNvbnNpZGVyaW5nIHRoZSBmaWxlIHdlJ3JlIGluLiBJIG5vdGljZSBU
Qk9PVCBoYXMgYQo+IHNpbWlsYXIgcG9pbnRsZXNzIGRlcGVuZGVuY3kuCgpXaWxsIGZpeCAtLSBJ
IGFkZGVkIHRoaXMgZGVwIGFmdGVyIGxvb2tpbmcgYXQgVEJPT1QuIDpwCgpXZWkuCgo+IAo+IEph
bgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
