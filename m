From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next] net: xen-netback: fix return type
 of ndo_start_xmit function
Date: Wed, 26 Sep 2018 10:23:50 -0700 (PDT)
Message-ID: <20180926.102350.290135634279870455.davem__20871.6600588106$1537982563$gmane$org@davemloft.net>
References: <20180926091814.11104-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tidv=mi=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1g5DXV-0008Vr-M4
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 17:23:53 +0000
In-Reply-To: <20180926091814.11104-1-yuehaibing@huawei.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: yuehaibing@huawei.com
Cc: netdev@vger.kernel.org, paul.durrant@citrix.com, wei.liu2@citrix.com, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgpEYXRlOiBXZWQsIDI2IFNl
cCAyMDE4IDE3OjE4OjE0ICswODAwCgo+IFRoZSBtZXRob2QgbmRvX3N0YXJ0X3htaXQoKSBpcyBk
ZWZpbmVkIGFzIHJldHVybmluZyBhbiAnbmV0ZGV2X3R4X3QnLAo+IHdoaWNoIGlzIGEgdHlwZWRl
ZiBmb3IgYW4gZW51bSB0eXBlLCBzbyBtYWtlIHN1cmUgdGhlIGltcGxlbWVudGF0aW9uIGluCj4g
dGhpcyBkcml2ZXIgaGFzIHJldHVybnMgJ25ldGRldl90eF90JyB2YWx1ZSwgYW5kIGNoYW5nZSB0
aGUgZnVuY3Rpb24KPiByZXR1cm4gdHlwZSB0byBuZXRkZXZfdHhfdC4KPiAKPiBGb3VuZCBieSBj
b2NjaW5lbGxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVh
d2VpLmNvbT4KPiBBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkFwcGxp
ZWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
