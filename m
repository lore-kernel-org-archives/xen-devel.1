From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 6/6] xen/arm: introduce NO_PLAT
Date: Fri, 24 Aug 2018 12:33:00 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808241231530.14449@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1808231631270.14449@sstabellini-ThinkPad-X260>
 <1535067220-16825-6-git-send-email-sstabellini@kernel.org>
 <b577990a-65a3-051f-0631-42d3e3c22aa7@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fe4w=lh=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ftHpP-0007SQ-7Z
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 19:33:03 +0000
In-Reply-To: <b577990a-65a3-051f-0631-42d3e3c22aa7@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, Stefano Stabellini <stefanos@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyNCBBdWcgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDI0
LzA4LzE4IDAwOjMzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBBZGQgYSBLY29uZmln
IG9wdGlvbiB0byBzZWxlY3Qgbm8gc3BlY2lmaWMgcGxhdGZvcm0gc3VwcG9ydC4KPiAKPiBUaGF0
J3Mgbm90IGVudGlyZWx5IHRydWUuIEFmdGVyIHRoaXMgc2VyaWVzIGFwcGxpZWQsIHRoZXJlIGFy
ZSBzdGlsbCBzb21lCj4gb2JqLXkgcHJlc2VudCBpbiB0aGUgTWFrZWZpbGUuCgpTb3JyeSBJIG11
c3QgaGF2ZSBiZWVuIHRvbyB0aXJlZCwgSSBtaXNzZWQgb25lIGNoYW5nZSBpbiB0aGUgcHJldmlv
dXMKcGF0Y2guIDotLwoKCj4gCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPiA+IC0tLQo+ID4gICB4ZW4vYXJjaC9hcm0vcGxh
dGZvcm1zL0tjb25maWcgfCA1ICsrKysrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvS2NvbmZp
ZyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvS2NvbmZpZwo+ID4gaW5kZXggNjQ4NmJmNi4uNGM4
YjIyNSAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvS2NvbmZpZwo+ID4g
KysrIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9LY29uZmlnCj4gPiBAQCAtNjcsNiArNjcsMTEg
QEAgY29uZmlnIE9NQVA1Cj4gPiAgIAktLS1oZWxwLS0tCj4gPiAgIAlFbmFibGUgYWxsIHRoZSBy
ZXF1aXJlZCBkcml2ZXJzIGZvciBUSSBPTUFQNSBiYXNlZCBwbGF0Zm9ybXMuCj4gPiAgICtjb25m
aWcgTk9fUExBVAo+ID4gKwlib29sICJObyBQbGF0Zm9ybXMiCj4gPiArCS0tLWhlbHAtLS0KPiA+
ICsJRG8gbm90IGVuYWJsZSBzcGVjaWZpYyBzdXBwb3J0IGZvciBhbnkgcGxhdGZvcm0uCj4gPiAr
Cj4gPiAgIGVuZGNob2ljZQo+ID4gICAgIGNvbmZpZyBBTEw2NF9QTEFUCj4gPiAKPiAKPiAtLSAK
PiBKdWxpZW4gR3JhbGwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
