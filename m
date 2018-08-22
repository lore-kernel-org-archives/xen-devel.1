From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] libxl: make sure string is null-terminated
 in libxl__prepare_sockaddr_un
Date: Wed, 22 Aug 2018 12:39:33 +0100
Message-ID: <23421.19317.737379.269326@mariner.uk.xensource.com>
References: <20180822102155.990-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1tiv=lf=citrix.com=prvs=7656d7fe5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fsRUA-0005eq-Dl
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 11:39:38 +0000
In-Reply-To: <20180822102155.990-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJbUEFUQ0hdIGxpYnhsOiBtYWtlIHN1cmUgc3RyaW5nIGlzIG51bGwt
dGVybWluYXRlZCBpbiBsaWJ4bF9fcHJlcGFyZV9zb2NrYWRkcl91biIpOgo+IENvdmVyaXR5LUlE
OiAxNDM4NDcyCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
CkJ1dC4uLgoKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfdXRpbHMuYyBiL3Rvb2xz
L2xpYnhsL2xpYnhsX3V0aWxzLmMKPiBpbmRleCA1ODU0NzE3YjExLi5lMDZmNzY1Njk5IDEwMDY0
NAo+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3V0aWxzLmMKPiArKysgYi90b29scy9saWJ4bC9s
aWJ4bF91dGlscy5jCj4gQEAgLTEyMzgsNiArMTIzOCw4IEBAIGludCBsaWJ4bF9fcHJlcGFyZV9z
b2NrYWRkcl91bihsaWJ4bF9fZ2MgKmdjLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IHNvY2thZGRyX3VuICp1biwgY29uc3QgY2hhciAqcGF0aCwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKndoYXQpCj4gIHsKPiArICAgIHNpemVf
dCBzeiA9IHNpemVvZih1bi0+c3VuX3BhdGgpOwo+ICsKPiAgICAgIGlmIChzaXplb2YodW4tPnN1
bl9wYXRoKSA8PSBzdHJsZW4ocGF0aCkpIHsKPiAgICAgICAgICBMT0coRVJST1IsICJVTklYIHNv
Y2tldCBwYXRoICclcycgaXMgdG9vIGxvbmcgZm9yICVzIiwgcGF0aCwgd2hhdCk7Cj4gICAgICAg
ICAgTE9HKERFQlVHLCAiUGF0aCBtdXN0IGJlIGxlc3MgdGhhbiAlenUgYnl0ZXMiLCBzaXplb2Yo
dW4tPnN1bl9wYXRoKSk7CiAgICAgICAgICAgcmV0dXJuIEVSUk9SX0lOVkFMOwo+IEBAIC0xMjQ1
LDcgKzEyNDcsOCBAQCBpbnQgbGlieGxfX3ByZXBhcmVfc29ja2FkZHJfdW4obGlieGxfX2djICpn
YywKPiAgICAgIH0KPiAgICAgIG1lbXNldCh1biwgMCwgc2l6ZW9mKHN0cnVjdCBzb2NrYWRkcl91
bikpOwo+ICAgICAgdW4tPnN1bl9mYW1pbHkgPSBBRl9VTklYOwo+IC0gICAgc3RybmNweSh1bi0+
c3VuX3BhdGgsIHBhdGgsIHNpemVvZih1bi0+c3VuX3BhdGgpKTsKPiArICAgIHN0cm5jcHkodW4t
PnN1bl9wYXRoLCBwYXRoLCBzeik7Cj4gKyAgICB1bi0+c3VuX3BhdGhbc3ogLSAxXSA9ICdcMCc7
CgpJZiB3ZSBoYXZlIHJlYWNoZWQgdGhpcyBwb2ludCwgc2l6ZW9mKHVuLT5zdW5fcGF0aCkgPiBz
dHJsZW4ocGF0aCkuClNvIGluIGZhY3QsIHN0cmNweSB3b3VsZCBkby4gIHN0cm5jcHkgd2lsbCBh
bHdheXMgYWRkIGEgbnVsLgoKV2UganVzdCBtZW1zZXQgdGhlIHdob2xlIHN0cnVjdCB0byAwLgoK
SWYgdGhpcyBuZXcgY29kZSBoYXMgYW55IGVmZmVjdCBhdCBhbGwsIGl0IHdpbGwgY29ycnVwdCB0
aGUgc3RyaW5nIGJ5CnRydW5jYXRpbmcgaXQuCgpJYW4uCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
