From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] block drivers/block: Use octal not symbolic
 permissions
Date: Wed, 23 May 2018 15:35:31 -0700
Message-ID: <56ee8810463b6c537ca0c10c9f82e6d922acd1f1.camel__33660.3110460148$1527114860$gmane$org@perches.com>
References: <5e97a292c1ba38a6b5a0caa271d85dc3de1b2aa7.1527105857.git.joe@perches.com>
 <6bf44255-145f-bf14-e254-860731ff9296@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cqev=ik=perches.com=joe@srs-us1.protection.inumbo.net>)
 id 1fLcM6-0006BE-HS
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 22:35:38 +0000
In-Reply-To: <6bf44255-145f-bf14-e254-860731ff9296@kernel.dk>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jens Axboe <axboe@kernel.dk>, "Ed L. Cashin" <ed.cashin@acm.org>, Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, Jiri Kosina <jikos@kernel.org>, Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>, Sage Weil <sage@redhat.com>, Alex Elder <elder@kernel.org>, Philip Kelleher <pjk1939@linux.vnet.ibm.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, nbd@other.debian.org, xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org, drbd-dev@lists.linbit.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyMDE4LTA1LTIzIGF0IDE1OjI3IC0wNjAwLCBKZW5zIEF4Ym9lIHdyb3RlOgo+IE9u
IDUvMjMvMTggMjowNSBQTSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gPiBDb252ZXJ0IHRoZSBTXzxG
T08+IHN5bWJvbGljIHBlcm1pc3Npb25zIHRvIHRoZWlyIG9jdGFsIGVxdWl2YWxlbnRzIGFzCj4g
PiB1c2luZyBvY3RhbCBhbmQgbm90IHN5bWJvbGljIHBlcm1pc3Npb25zIGlzIHByZWZlcnJlZCBi
eSBtYW55IGFzIG1vcmUKPiA+IHJlYWRhYmxlLgo+ID4gCj4gPiBzZWU6IGh0dHBzOi8vbGttbC5v
cmcvbGttbC8yMDE2LzgvMi8xOTQ1Cj4gPiAKPiA+IERvbmUgd2l0aCBhdXRvbWF0ZWQgY29udmVy
c2lvbiB2aWE6Cj4gPiAkIC4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC1mIC0tdHlwZXM9U1lNQk9M
SUNfUEVSTVMgLS1maXgtaW5wbGFjZSA8ZmlsZXMuLi4+Cj4gPiAKPiA+IE1pc2NlbGxhbmVhOgo+
ID4gCj4gPiBvIFdyYXBwZWQgbW9kaWZpZWQgbXVsdGktbGluZSBjYWxscyB0byBhIHNpbmdsZSBs
aW5lIHdoZXJlIGFwcHJvcHJpYXRlCj4gPiBvIFJlYWxpZ24gbW9kaWZpZWQgbXVsdGktbGluZSBj
YWxscyB0byBvcGVuIHBhcmVudGhlc2lzCj4gCj4gSG9uZXN0bHksIEkgc2VlIHRoaXMgYXMgcHJl
dHR5IG5lZWRsZXNzIGNodXJuLgoKYnR3OgoKVGhlcmUgaXMgY3VycmVudGx5IGEgbWl4dHVyZSBv
ZiBzeW1ib2xpYyBhbmQgb2N0YWwKcGVybWlzc2lvbnMgdXNlcyBpbiBibG9jayBhbmQgZHJpdmVy
cy9ibG9jawoKaWU6IDk0IG9jdGFsIGFuZCAxNDYgc3ltYm9saWMgdXNlcy4KCklmIHRoaXMgaXMg
YXBwbGllZCwgYWxsIHdvdWxkIGJlY29tZSBvY3RhbC4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
