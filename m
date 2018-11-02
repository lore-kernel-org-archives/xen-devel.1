From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 11/16] x86: don't set sysenter_entry in
 vmcs when !CONFIG_PV
Date: Fri, 2 Nov 2018 14:33:39 +0000
Message-ID: <20181102143339.yd6j7q4wgwqzple5@zion.uk.xensource.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <7298eaf9e6174052e0fa5a629ca2cc8664996efb.1539959287.git-series.wei.liu2@citrix.com>
 <20181102140521.ovkqowatsuak4sa2@zion.uk.xensource.com>
 <5BDC5FEB02000078001F749E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1awx=nn=citrix.com=prvs=837bb29b5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gIaWC-0005ti-Ss
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 14:33:48 +0000
Content-Disposition: inline
In-Reply-To: <5BDC5FEB02000078001F749E@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMDIsIDIwMTggYXQgMDg6MzI6MTFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDAyLjExLjE4IGF0IDE1OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBGcmksIE9jdCAxOSwgMjAxOCBhdCAwMzoyODozN1BNICswMTAwLCBXZWkgTGl1
IHdyb3RlOgo+ID4+IFRoZSBzeW1ib2wgd2lsbCBub3QgYmUgYXZhaWxhYmxlIHdoZW4gUFYgaXMg
ZGlzYWJsZWQuCj4gPj4gCj4gPj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KPiA+IAo+ID4gSW4gbGlnaHQgb2YgdGhlIGRpc2N1c3Npb24gb2YgdGhlIHByZXZp
b3VzIHBhdGNoLCBhIHN0dWIgZm9yCj4gPiBzeXNlbnRlcl9lbnRyeSB3aWxsIGJlIHByb3ZpZGVk
LCBzbyB0aGlzIHBhdGNoIGNhbiBiZSBkcm9wcGVkLgo+IAo+IEFzIHNhaWQgLSBTWVNFTlRFUiBp
cyBmaW5lIHdpdGhvdXQgc3R1YiwgZHVlIHRvIGl0cyBkaWZmZXJlbnQKPiBmYXVsdGluZyBjb25k
aXRpb25zIGNvbXBhcmVkIHRvIFNZU0NBTEwuIEp1c3QgemVybyB0aGUKPiByZXNwZWN0aXZlIE1T
UihzKS4KCk9LLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
