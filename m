From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v3 30/31] libxl_dm: Pre-open QMP socket for
 QEMU
Date: Wed, 27 Jun 2018 17:14:06 +0100
Message-ID: <23347.47054.377956.456736@mariner.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-31-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7qrb=jn=citrix.com=prvs=709d59aa7=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fYD58-0008UH-8p
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 16:14:10 +0000
In-Reply-To: <20180601143720.24637-31-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYzIDMwLzMxXSBsaWJ4bF9kbTogUHJlLW9w
ZW4gUU1QIHNvY2tldCBmb3IgUUVNVSIpOgo+IFdoZW4gc3RhcnRpbmcgUUVNVSB3aXRoIGRtX3Jl
c3RyaWN0PTEsIHByZS1vcGVuIHRoZSBRTVAgc29ja2V0IGJlZm9yZQo+IGV4ZWMgUUVNVS4gVGhh
dCBzb2NrZXQgd2lsbCBiZSB1c2VmdWxsIHRvIGZpbmRvdXQgaWYgUUVNVSBpcyByZWFkeSwgYW5k
Cj4gcHJlLW9wZW5pbmcgaXQgbWVhbnMgdGhhdCBsaWJ4bCBjYW4gY29ubmVjdCB0byBpdCB3aXRo
b3V0IHdhaXRpbmcgZm9yCj4gUUVNVSB0byBjcmVhdGUgaXQuCi4uLgo+ICsgICAgICAgIHNvY2tl
dF9mZCA9IHNvY2tldChBRl9VTklYLCBTT0NLX1NUUkVBTSwgMCk7Cj4gKyAgICAgICAgKmRtX21v
bml0b3JfZmQgPSBzb2NrZXRfZmQ7Cj4gKyAgICAgICAgaWYgKHNvY2tldF9mZCA8IDApIHsKPiAr
ICAgICAgICAgICAgTE9HRUQoRVJST1IsIGd1ZXN0X2RvbWlkLCAiRmFpbGVkIHRvIGNyZWF0ZSBV
TklYIHNvY2tldCIpOwo+ICsgICAgICAgICAgICByZXR1cm4gRVJST1JfRkFJTDsKPiArICAgICAg
ICB9CgpJIGNhbid0IGhlbHAgdGhpbmtpbmcgdGhhdCB0aGlzIGlzIGEgbG90IG9mIGxpbmVzIG9m
IGNvZGUuICBJcyBub25lIG9mCnRoaXMgYXZhaWxhYmxlIGFueXdoZXJlIGVsc2UgZm9yIHJldXNl
ID8KCj4gKyAgICAgICAgc29ja2V0X3BhdGggPSBHQ1NQUklOVEYoIiVzL3FtcC1saWJ4bC0lZCIs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX3J1bl9kaXJfcGF0aCgp
LCBndWVzdF9kb21pZCk7Cj4gKyAgICAgICAgaWYgKHN0cmxlbihzb2NrZXRfcGF0aCkgPiBzaXpl
b2YodW4uc3VuX3BhdGgpKSB7Cj4gKyAgICAgICAgICAgIExPR0QoRVJST1IsIGd1ZXN0X2RvbWlk
LCAiVU5JWCBzb2NrZXQgcGF0aCAnJXMnIGlzIHRvbyBsb25nIiwKPiArICAgICAgICAgICAgICAg
ICBzb2NrZXRfcGF0aCk7Cj4gKyAgICAgICAgICAgIExPR0QoREVCVUcsIGd1ZXN0X2RvbWlkLCAi
UGF0aCBtdXN0IGJlIGxlc3MgdGhhbiAlenUgYnl0ZXMiLAo+ICsgICAgICAgICAgICAgICAgIHNp
emVvZih1bi5zdW5fcGF0aCkpOwo+ICsgICAgICAgICAgICByZXR1cm4gRVJST1JfRkFJTDsKPiAr
ICAgICAgICB9CgpFZyB0aGlzIHBhcnQgbWF5YmUgPwoKVGhhbmtzLApJYW4uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
