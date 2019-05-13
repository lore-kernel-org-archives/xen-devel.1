From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 3/4] README: document that `python` is
 required
Date: Mon, 13 May 2019 15:38:24 +0100
Message-ID: <62fa5069-b65b-e540-1981-a464e84c076a@citrix.com>
References: <20190513134714.3124-1-wei.liu2@citrix.com>
 <20190513134714.3124-4-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fllF=TN=citrix.com=prvs=029ba87d2=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hQC61-0002eM-B1
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:38:29 +0000
In-Reply-To: <20190513134714.3124-4-wei.liu2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS8xMy8xOSAyOjQ3IFBNLCBXZWkgTGl1IHdyb3RlOgo+IFRoZSBoeXBlcnZpc29yIGJ1aWxk
IHN5c3RlbSByZXF1aXJlcyBgcHl0aG9uYC4gVG8gYXZvaWQgcHV0dGluZyB0b28KPiBtdWNoIChj
b25mdXNpbmcpIGluZm9ybWF0aW9uIGluIFJFQURNRSwgbWFuZGF0ZSBhdmFpbGFiaWxpdHkgb2YK
PiBgcHl0aG9uYC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgo+IC0tLQo+ICBSRUFETUUgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9SRUFETUUgYi9SRUFETUUKPiBpbmRleCAyM2U0Zjdj
M2RjLi5hNjBjY2Y2ZTljIDEwMDY0NAo+IC0tLSBhL1JFQURNRQo+ICsrKyBiL1JFQURNRQo+IEBA
IC0xODEsNiArMTgxLDEwIEBAIFZhcmlvdXMgdG9vbHMsIHN1Y2ggYXMgcHlncnViLCBoYXZlIHRo
ZSBmb2xsb3dpbmcgcnVudGltZSBkZXBlbmRlbmNpZXM6Cj4gICAgICAgICAgICBVUkw6ICAgIGh0
dHA6Ly93d3cucHl0aG9uLm9yZy8KPiAgICAgICAgICAgIERlYmlhbjogcHl0aG9uCj4gIAo+ICtO
b3RlIHRoYXQgdGhlIGJ1aWxkIHN5c3RlbSBleHBlY3RzIGBweXRob25gIHRvIGJlIGF2YWlsYWJs
ZS4gSWYgeW91ciBzeXN0ZW0KPiArb25seSBoYXMgYHB5dGhvbjJgIG9yIGBweXRob24zYCBidXQg
bm90IGBweXRob25gIChhcyBpbiBMaW51eCBGcm9tIFNjcmF0Y2gpLAo+ICt5b3Ugd2lsbCBuZWVk
IHRvIGNyZWF0ZSBhIHN5bWxpbmsgZm9yIGl0LgoKU2luY2Ugd2UncmUgbm90IGluIGEgcmVsZWFz
ZSBjcnVuY2ggYW55IG1vcmUsIGl0IHNlZW1zIGxpa2UgdXBkYXRpbmcKLi9jb25maWd1cmUgdG8g
bG9vayBmb3IgIiJweXRob24zIiwgInB5dGhvbjIiLCBhbmQgInB5dGhvbiIgKHByb2JhYmx5IGlu
CnRoYXQgb3JkZXIpIHdvdWxkIGJlIGEgYmV0dGVyIHNvbHV0aW9uIGhlcmUuCgogLUdlb3JnZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
