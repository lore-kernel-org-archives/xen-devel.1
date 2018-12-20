From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12 v2 7/8] xenalyze: Build for Both
 ARM and x86 Platforms
Date: Thu, 20 Dec 2018 15:24:57 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1812201521160.15901@sstabellini-ThinkPad-X260>
References: <20181220192338.17526-1-julien.grall@arm.com>
 <20181220192338.17526-8-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NfYO=O5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ga7ga-0007xx-Kz
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 23:25:00 +0000
In-Reply-To: <20181220192338.17526-8-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>, Benjamin Sanda <ben.sanda@dornerworks.com>, George Dunlap <george.dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMCBEZWMgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEZyb206IEJlbmphbWlu
IFNhbmRhIDxiZW4uc2FuZGFAZG9ybmVyd29ya3MuY29tPgo+IAo+IE1vZGlmaWVkIHRvIHByb3Zp
ZGUgYnVpbGRpbmcgb2YgdGhlIHhlbmFseXplIGJpbmFyeSBmb3IgYm90aCBBUk0gYW5kCj4geDg2
IHBsYXRmb3Jtcy4gVGhlIHhlbmFseXplIGJpbmFyeSBpcyBub3cgYnVpbHQgYXMgcGFydCBvZiB0
aGUgQklOCj4gbGlzdCBmb3IgYm90aCBwbGF0Zm9ybXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmVu
amFtaW4gU2FuZGEgPGJlbi5zYW5kYUBkb3JuZXJ3b3Jrcy5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBBY2tlZC1ieTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+Cgo+IC0tLQo+ICAgICBDaGFuZ2VzIGluIHYyOgo+ICAgICAgICAg
LSBBZGQgV2VpJ3MgYWNrZWQtYnkKPiAtLS0KPiAgdG9vbHMveGVudHJhY2UvTWFrZWZpbGUgfCAz
ICstLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnRyYWNlL01ha2VmaWxlIGIvdG9vbHMveGVudHJhY2Uv
TWFrZWZpbGUKPiBpbmRleCAwYmFkOTQyYmRmLi45ZmI3ZmM5NmU3IDEwMDY0NAo+IC0tLSBhL3Rv
b2xzL3hlbnRyYWNlL01ha2VmaWxlCj4gKysrIGIvdG9vbHMveGVudHJhY2UvTWFrZWZpbGUKPiBA
QCAtOSw4ICs5LDcgQEAgTERMSUJTICs9ICQoTERMSUJTX2xpYnhlbmV2dGNobikKPiAgTERMSUJT
ICs9ICQoTERMSUJTX2xpYnhlbmN0cmwpCj4gIExETElCUyArPSAkKEFSR1BfTERGTEFHUykKPiAg
Cj4gLUJJTi0kKENPTkZJR19YODYpID0geGVuYWx5emUKPiAtQklOICAgICAgPSAkKEJJTi15KQo+
ICtCSU4gICAgICA9IHhlbmFseXplCj4gIFNCSU4gICAgID0geGVudHJhY2UgeGVudHJhY2Vfc2V0
c2l6ZQo+ICBMSUJCSU4gICA9IHhlbmN0eAo+ICBTQ1JJUFRTICA9IHhlbnRyYWNlX2Zvcm1hdAo+
IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
