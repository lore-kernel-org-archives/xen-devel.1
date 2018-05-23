From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] block drivers/block: Use octal not symbolic
 permissions
Date: Wed, 23 May 2018 14:41:30 -0700
Message-ID: <cd46916c876eb552579a5c91b62780c315dd67f8.camel__20799.5204873898$1527111627$gmane$org@perches.com>
References: <5e97a292c1ba38a6b5a0caa271d85dc3de1b2aa7.1527105857.git.joe@perches.com>
 <6bf44255-145f-bf14-e254-860731ff9296@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cqev=ik=perches.com=joe@srs-us1.protection.inumbo.net>)
 id 1fLbVq-00010W-2j
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 21:41:38 +0000
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
dHR5IG5lZWRsZXNzIGNodXJuLgoKSXQncyBqdXN0IGZvciBjb25zaXN0ZW5jeSBhbmQgdGhlIGFi
aWxpdHkgdG8gaGlnaGxpZ2h0CnNvbWV3aGF0IHVudXN1YWwgcGVybWlzc2lvbnMgdXNlcyBsaWtl
IGp1c3QgMDQwMC4KCkFwcGx5IGl0IGF0IHlvdXIgbGVpc3VyZSBvciBpZ25vcmUgaXQuCgpidHc6
IEpvc2h1YSBNb3JyaXMnIGVtYWlsIGFkZHJlc3MgaXMgYm91bmNpbmcuCk1heWJlIGl0IHNob3Vs
ZCBiZSByZW1vdmVkIGZyb20gTUFJTlRBSU5FUlMuCi0tLQogTUFJTlRBSU5FUlMgfCAxIC0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9N
QUlOVEFJTkVSUwppbmRleCA5MDUxYTljYTI0YTIuLjBkNTQ2YTEwZDBiOSAxMDA2NDQKLS0tIGEv
TUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTU1OTgsNyArNTU5OCw2IEBAIEY6CWRy
aXZlcnMvYmFzZS9maXJtd2FyZV9sb2FkZXIvCiBGOglpbmNsdWRlL2xpbnV4L2Zpcm13YXJlLmgK
IAogRkxBU0ggQURBUFRFUiBEUklWRVIgKElCTSBGbGFzaCBBZGFwdGVyIDkwMEdCIEZ1bGwgSGVp
Z2h0IFBDSSBGbGFzaApDYXJkKQotTToJSm9zaHVhIE1vcnJpcyA8am9zaC5oLm1vcnJpc0B1cy5p
Ym0uY29tPgogTToJUGhpbGlwIEtlbGxlaGVyIDxwamsxOTM5QGxpbnV4LnZuZXQuaWJtLmNvbT4K
IFM6CU1haW50YWluZWQKIEY6CWRyaXZlcnMvYmxvY2svcnN4eC8KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
