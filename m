From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] drivers/block/xen-blkback/common.h: use
 DIV_ROUND_UP instead of reimplementing its function
Date: Wed, 12 Sep 2018 11:16:39 +0200
Message-ID: <20180912091639.oynlvdo6pghnqfvt__30188.2447828122$1536743730$gmane$org@mac.bytemobile.com>
References: <1536731100-56054-1-git-send-email-zhongjiang@huawei.com>
 <5B98CAE202000078001E79CC@prv1-mh.provo.novell.com>
 <20180912091350.6wuvt2jkvzg6wruo@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nh++=l2=citrix.com=prvs=7864c2456=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g01GW-00012v-12
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 09:16:52 +0000
Content-Disposition: inline
In-Reply-To: <20180912091350.6wuvt2jkvzg6wruo@mac.bytemobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Jens Axboe <axboe@kernel.dk>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, zhong jiang <zhongjiang@huawei.com>
List-Id: xen-devel@lists.xenproject.org

U29ycnksIEkndmUgZmFpbGVkIHRvIGFkZCBKdWxpZW4gaW4gbXkgcHJldmlvdXMgcmVwbHkuCgpP
biBXZWQsIFNlcCAxMiwgMjAxOCBhdCAxMToxMzo1MEFNICswMjAwLCBSb2dlciBQYXUgTW9ubsOp
IHdyb3RlOgo+IEFkZGluZyBKdWxpZW4gaG93IGRpZCB0aGUgd29yayB0byBzdXBwb3J0IFhFTl9Q
QUdFX1NJWkUgIT0gUEFHRV9TSVpFLgo+IAo+IE9uIFdlZCwgU2VwIDEyLCAyMDE4IGF0IDAyOjE0
OjI2QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPj4+IE9uIDEyLjA5LjE4IGF0IDA3
OjQ1LCA8emhvbmdqaWFuZ0BodWF3ZWkuY29tPiB3cm90ZToKPiA+ID4gLS0tIGEvZHJpdmVycy9i
bG9jay94ZW4tYmxrYmFjay9jb21tb24uaAo+ID4gPiArKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1i
bGtiYWNrL2NvbW1vbi5oCj4gPiA+IEBAIC02NSw3ICs2NSw3IEBACj4gPiA+ICAJKFhFTl9QQUdF
U19QRVJfSU5ESVJFQ1RfRlJBTUUgLyBYRU5fUEFHRVNfUEVSX1NFR01FTlQpCj4gPiA+ICAKPiA+
ID4gICNkZWZpbmUgTUFYX0lORElSRUNUX1BBR0VTIFwKPiA+ID4gLQkoKE1BWF9JTkRJUkVDVF9T
RUdNRU5UUyArIFNFR1NfUEVSX0lORElSRUNUX0ZSQU1FIC0gMSkvU0VHU19QRVJfSU5ESVJFQ1Rf
RlJBTUUpCj4gPiA+ICsJCURJVl9ST1VORF9VUChNQVhfSU5ESVJFQ1RfU0VHTUVOVFMsIFNFR1Nf
UEVSX0lORElSRUNUX0ZSQU1FKQo+ID4gPiAgI2RlZmluZSBJTkRJUkVDVF9QQUdFUyhfc2Vncykg
RElWX1JPVU5EX1VQKF9zZWdzLCBYRU5fUEFHRVNfUEVSX0lORElSRUNUX0ZSQU1FKQo+ID4gCj4g
PiBNeSBmaXJzdCByZWFjdGlvbiB3YXMgdG8gc3VnZ2VzdAo+ID4gCj4gPiAjZGVmaW5lIE1BWF9J
TkRJUkVDVF9QQUdFUyBJTkRJUkVDVF9QQUdFUyhNQVhfSU5ESVJFQ1RfU0VHTUVOVFMpCj4gPiAK
PiA+IGJ1dCB0aGF0IHdvdWxkbid0IG1hdGNoIHdoYXQncyB0aGVyZSBjdXJyZW50bHkgKG5vdGUg
dGhlIHR3byBkaWZmZXJlbnQKPiA+IGRpdmlzb3JzKS4gSSBjYW4ndCByZWFsbHkgZGVjaWRlIHdo
ZXRoZXIgdGhhdCdzIGp1c3QgdW5mb3J0dW5hdGUgbmFtaW5nCj4gPiBvZiB0aGUgdHdvIG1hY3Jv
cywgb3IgYW4gYWN0dWFsIGJ1Zy4KPiAKPiBJIHRoaW5rIHRoZXJlJ3MgaW5kZWVkIGEgYnVnIGhl
cmUuCj4gCj4gQUZBSUNULCBNQVhfSU5ESVJFQ1RfUEFHRVMgc2hvdWxkIHVzZSBYRU5fUEFHRVNf
UEVSX0lORElSRUNUX0ZSQU1FIGFuZAo+IHRoZW4gaXQgY291bGQgYmUgY2hhbmdlZCBhcyBKYW4g
c3VnZ2VzdGVkLgo+IAo+IEN1cnJlbnQgTUFYX0lORElSRUNUX1BBR0VTIGlzIG1pc25hbWVkIGFu
ZCBzaG91bGQgaW5zdGVhZCBiZQo+IE1BWF9JTkRJUkVDVF9TRUdTICh3aGljaCBvbiB4ODYgaXMg
ZXhhY3RseSB0aGUgc2FtZSBiZWNhdXNlIFBBR0VfU0laRQo+ID09IFhFTl9QQUdFX1NJWkUpLgo+
IAo+IFJvZ2VyLgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
