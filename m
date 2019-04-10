From: Julien Grall <julien.grall@arm.com>
Subject: Re: [OSSTEST PATCH 13/62] Extend workaround
 `clk_ignore_unused' to stretch
Date: Wed, 10 Apr 2019 16:47:05 +0100
Message-ID: <f6c6ecc8-c2bc-76a8-19f4-a2e6526fde02@arm.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
 <20190410142408.22848-14-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PZ5s=SM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hEFRr-0003nc-VY
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 15:47:40 +0000
In-Reply-To: <20190410142408.22848-14-ian.jackson@eu.citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMC8wNC8yMDE5IDE1OjIzLCBJYW4gSmFja3NvbiB3cm90ZToKPiBGcm9tOiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IAo+IFRoaXMgaXMgaHR0cHM6Ly9idWdzLnhlbnBy
b2plY3Qub3JnL3hlbi9idWcvNDUKU3RpbGwgbm8gcmVzb2x1dGlvbiBmb3IgdGhpcyBvbmUgOi8u
Cgo+IAo+IFdpdGhvdXQgdGhhdCBwYXJhbWV0ZXIgd2UgbG9zZSB1YXJ0IG91dHB1dC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IENDOiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ0M6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGxpbmFyby5vcmc+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCj4gLS0tCj4gICBPc3N0ZXN0L0RlYmlhbi5wbSB8IDIg
Ky0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS9Pc3N0ZXN0L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCj4gaW5k
ZXggODJiNWZiNDAuLjkxYmZmZGZmIDEwMDY0NAo+IC0tLSBhL09zc3Rlc3QvRGViaWFuLnBtCj4g
KysrIGIvT3NzdGVzdC9EZWJpYW4ucG0KPiBAQCAtMjQxLDcgKzI0MSw3IEBAIEVORAo+ICAgCXB1
c2ggQHhlbmtvcHQsICR4ZW5rb3B0Owo+ICAgCSMgaHR0cDovL2J1Z3MueGVucHJvamVjdC5vcmcv
eGVuL2J1Zy80NQo+ICAgCXB1c2ggQHhlbmtvcHQsICJjbGtfaWdub3JlX3VudXNlZCIKPiAtCSAg
ICBpZiAkaG8tPntTdWl0ZX0gPX4gbS93aGVlenl8amVzc2llLzsKPiArCSAgICBpZiAkaG8tPntT
dWl0ZX0gPX4gbS93aGVlenl8amVzc2llfHN0cmV0Y2gvOwo+ICAgCj4gICAJJHhlbmtvcHQgPSBq
b2luICcgJywgQHhlbmtvcHQ7Cj4gICAJbG9nbSgiRG9tMCBMaW51eCBvcHRpb25zOiAkeGVua29w
dCIpOwo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
