From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v8 06/17] libxl_qmp: Implementation of
 libxl__ev_qmp_*
Date: Fri, 11 Jan 2019 12:06:07 +0000
Message-ID: <23608.34479.976461.767202@mariner.uk.xensource.com>
References: <20190104153056.19138-1-anthony.perard@citrix.com>
 <20190104153056.19138-7-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ayr2=PT=citrix.com=prvs=9077728fb=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ghvZp-0007uc-Jv
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 12:06:17 +0000
In-Reply-To: <20190104153056.19138-7-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHY4IDA2LzE3XSBsaWJ4bF9xbXA6IEltcGxl
bWVudGF0aW9uIG9mIGxpYnhsX19ldl9xbXBfKiIpOgo+IFRoaXMgcGF0Y2ggaW1wbGVtZW50IHRo
ZSBBUEkgbGlieGxfX2V2X3FtcCBkb2N1bWVudGVkIGluIHRoZSBwcmV2aW91cwo+IHBhdGNoLCAi
bGlieGw6IERlc2lnbiBvZiBhbiBhc3luYyBBUEkgdG8gaXNzdWUgUU1QIGNvbW1hbmRzIHRvIFFF
TVUiLgo+IAo+IFNpbmNlIHRoaXMgQVBJIGlzIHRvIGludGVyYWN0IHdpdGggUUVNVSB2aWEgdGhl
IFFNUCBwcm90b2NvbCwgaXQgYWxzbwo+IGltcGxlbWVudCBhIFFNUCBjbGllbnQuIFRoZSBzcGVj
aWZpY2F0aW9uIGZvciB0aGUgUUVNVSBNYWNoaW5lIFByb3RvY29sCj4gKFFNUCkgY2FuIGJlIGZv
dW5kIGluIHRoZSBRRU1VIHJlcG9zaXRvcnkgYXQ6Cj4gaHR0cHM6Ly9naXQucWVtdS5vcmcvP3A9
cWVtdS5naXQ7YT1ibG9iX3BsYWluO2Y9ZG9jcy9pbnRlcm9wL3FtcC1zcGVjLnR4dAoKVGhhbmtz
LiAgSSBoYXZlIHJlLXJldmlld2VkIHRoaXMgYW5kIEkgaGF2ZSBvbmx5IHRoaXMgb25lIHF1ZXN0
aW9uOgoKPiArICAgIHdoaWxlIChldi0+dHhfYnVmX29mZiA8IGV2LT50eF9idWZfbGVuKSB7Cj4g
KyAgICAgICAgc3NpemVfdCBtYXhfd3JpdGUgPSBldi0+dHhfYnVmX2xlbiAtIGV2LT50eF9idWZf
b2ZmOwo+ICsgICAgICAgIHIgPSB3cml0ZShmZCwgZXYtPnR4X2J1ZiArIGV2LT50eF9idWZfb2Zm
LCBtYXhfd3JpdGUpOwo+ICsgICAgICAgIGlmIChyIDwgMCkgewo+ICsgICAgICAgICAgICBpZiAo
ZXJybm8gPT0gRUlOVFIpCj4gKyAgICAgICAgICAgICAgICBjb250aW51ZTsKPiArICAgICAgICAg
ICAgaWYgKGVycm5vID09IEVXT1VMREJMT0NLKQo+ICsgICAgICAgICAgICAgICAgYnJlYWs7Cj4g
KyAgICAgICAgICAgIExPR0VEKEVSUk9SLCBldi0+ZG9taWQsICJmYWlsZWQgdG8gd3JpdGUgdG8g
UU1QIHNvY2tldCIpOwo+ICsgICAgICAgICAgICByZXR1cm4gRVJST1JfRkFJTDsKPiArICAgICAg
ICB9Cj4gKyAgICAgICAgYXNzZXJ0KHIgPj0gMCAmJiByIDw9IG1heF93cml0ZSk7CgpEb2Vzbid0
IHRoaXMgd2FudCB0byBiZQogICsgICAgICAgIGFzc2VydChyID4gMCAmJiByIDw9IG1heF93cml0
ZSk7Cj8KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
