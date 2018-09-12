From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] drivers/block/xen-blkback/common.h: use
 DIV_ROUND_UP instead of reimplementing its function
Date: Wed, 12 Sep 2018 11:13:50 +0200
Message-ID: <20180912091350.6wuvt2jkvzg6wruo__24188.05441489$1536743556$gmane$org@mac.bytemobile.com>
References: <1536731100-56054-1-git-send-email-zhongjiang@huawei.com>
 <5B98CAE202000078001E79CC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nh++=l2=citrix.com=prvs=7864c2456=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g01Di-0000f4-RK
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 09:13:58 +0000
Content-Disposition: inline
In-Reply-To: <5B98CAE202000078001E79CC@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Jens Axboe <axboe@kernel.dk>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>, zhong jiang <zhongjiang@huawei.com>
List-Id: xen-devel@lists.xenproject.org

QWRkaW5nIEp1bGllbiBob3cgZGlkIHRoZSB3b3JrIHRvIHN1cHBvcnQgWEVOX1BBR0VfU0laRSAh
PSBQQUdFX1NJWkUuCgpPbiBXZWQsIFNlcCAxMiwgMjAxOCBhdCAwMjoxNDoyNkFNIC0wNjAwLCBK
YW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMTIuMDkuMTggYXQgMDc6NDUsIDx6aG9uZ2ppYW5n
QGh1YXdlaS5jb20+IHdyb3RlOgo+ID4gLS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9j
b21tb24uaAo+ID4gKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9jb21tb24uaAo+ID4g
QEAgLTY1LDcgKzY1LDcgQEAKPiA+ICAJKFhFTl9QQUdFU19QRVJfSU5ESVJFQ1RfRlJBTUUgLyBY
RU5fUEFHRVNfUEVSX1NFR01FTlQpCj4gPiAgCj4gPiAgI2RlZmluZSBNQVhfSU5ESVJFQ1RfUEFH
RVMgXAo+ID4gLQkoKE1BWF9JTkRJUkVDVF9TRUdNRU5UUyArIFNFR1NfUEVSX0lORElSRUNUX0ZS
QU1FIC0gMSkvU0VHU19QRVJfSU5ESVJFQ1RfRlJBTUUpCj4gPiArCQlESVZfUk9VTkRfVVAoTUFY
X0lORElSRUNUX1NFR01FTlRTLCBTRUdTX1BFUl9JTkRJUkVDVF9GUkFNRSkKPiA+ICAjZGVmaW5l
IElORElSRUNUX1BBR0VTKF9zZWdzKSBESVZfUk9VTkRfVVAoX3NlZ3MsIFhFTl9QQUdFU19QRVJf
SU5ESVJFQ1RfRlJBTUUpCj4gCj4gTXkgZmlyc3QgcmVhY3Rpb24gd2FzIHRvIHN1Z2dlc3QKPiAK
PiAjZGVmaW5lIE1BWF9JTkRJUkVDVF9QQUdFUyBJTkRJUkVDVF9QQUdFUyhNQVhfSU5ESVJFQ1Rf
U0VHTUVOVFMpCj4gCj4gYnV0IHRoYXQgd291bGRuJ3QgbWF0Y2ggd2hhdCdzIHRoZXJlIGN1cnJl
bnRseSAobm90ZSB0aGUgdHdvIGRpZmZlcmVudAo+IGRpdmlzb3JzKS4gSSBjYW4ndCByZWFsbHkg
ZGVjaWRlIHdoZXRoZXIgdGhhdCdzIGp1c3QgdW5mb3J0dW5hdGUgbmFtaW5nCj4gb2YgdGhlIHR3
byBtYWNyb3MsIG9yIGFuIGFjdHVhbCBidWcuCgpJIHRoaW5rIHRoZXJlJ3MgaW5kZWVkIGEgYnVn
IGhlcmUuCgpBRkFJQ1QsIE1BWF9JTkRJUkVDVF9QQUdFUyBzaG91bGQgdXNlIFhFTl9QQUdFU19Q
RVJfSU5ESVJFQ1RfRlJBTUUgYW5kCnRoZW4gaXQgY291bGQgYmUgY2hhbmdlZCBhcyBKYW4gc3Vn
Z2VzdGVkLgoKQ3VycmVudCBNQVhfSU5ESVJFQ1RfUEFHRVMgaXMgbWlzbmFtZWQgYW5kIHNob3Vs
ZCBpbnN0ZWFkIGJlCk1BWF9JTkRJUkVDVF9TRUdTICh3aGljaCBvbiB4ODYgaXMgZXhhY3RseSB0
aGUgc2FtZSBiZWNhdXNlIFBBR0VfU0laRQo9PSBYRU5fUEFHRV9TSVpFKS4KClJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
