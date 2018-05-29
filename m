From: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v4 12/21] hw: Do not include
 "sysemu/block-backend.h" if it is not necessary
Date: Tue, 29 May 2018 12:14:17 +0200
Message-ID: <20180529121417.1e44484b.cohuck__18954.231500584$1527597187$gmane$org@redhat.com>
References: <20180528232719.4721-1-f4bug@amsat.org>
 <20180528232719.4721-13-f4bug@amsat.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=eqt1=iq=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1fNbe8-0003Ya-80
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 10:14:28 +0000
In-Reply-To: <20180528232719.4721-13-f4bug@amsat.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Yongbok Kim <yongbok.kim@mips.com>, Stefano Stabellini <sstabellini@kernel.org>, "open list:virtio-blk" <qemu-block@nongnu.org>, qemu-trivial@nongnu.org, David Hildenbrand <david@redhat.com>, Magnus Damm <magnus.damm@gmail.com>, Alexander Graf <agraf@suse.de>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>, David Gibson <david@gibson.dropbear.id.au>, Andrzej Zaborowski <balrogg@gmail.com>, Thomas Huth <thuth@redhat.com>, Fam Zheng <famz@redhat.com>, Alistair Francis <alistair@alistair23.me>, "open list:virtio-ccw" <qemu-s390x@nongnu.org>, "open list:ARM" <qemu-arm@nongnu.org>Stefan
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyOCBNYXkgMjAxOCAyMDoyNzoxMCAtMDMwMApQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8ZjRidWdAYW1zYXQub3JnPiB3cm90ZToKCj4gUmVtb3ZlIHRob3NlIHVubmVlZGVkIGluY2x1
ZGVzIHRvIHNwZWVkIHVwIHRoZSBjb21waWxhdGlvbgo+IHByb2Nlc3MgYSBsaXR0bGUgYml0LiAo
Q29udGludWUgN2VjZWZmNWI1YTFmYSBjbGVhbnVwKQo+IAo+IFNpZ25lZC1vZmYtYnk6IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+Cj4gLS0tCj4gIGh3L2FybS9jb2xs
aWUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxIC0KPiAgaHcvYXJtL2d1bXN0aXguYyAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDEgLQo+ICBody9hcm0vbWFpbnN0b25lLmMgICAgICAg
ICAgICAgICAgICAgICAgIHwgMSAtCj4gIGh3L2FybS9uc2VyaWVzLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAxIC0KPiAgaHcvYXJtL29tYXAxLmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDEgLQo+ICBody9hcm0vb21hcDIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSAt
Cj4gIGh3L2FybS9vbWFwX3N4MS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAxIC0KPiAgaHcv
YXJtL3B4YTJ4eC5jICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgLQo+ICBody9hcm0vc3Bp
dHouYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSAtCj4gIGh3L2FybS92ZXJzYXRpbGVw
Yi5jICAgICAgICAgICAgICAgICAgICAgfCAxIC0KPiAgaHcvYXJtL3ZleHByZXNzLmMgICAgICAg
ICAgICAgICAgICAgICAgICB8IDEgLQo+ICBody9hcm0vdmlydC5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMSAtCj4gIGh3L2FybS94aWxpbnhfenlucS5jICAgICAgICAgICAgICAgICAg
ICAgfCAxIC0KPiAgaHcvYXJtL3oyLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEg
LQo+ICBody9ibG9jay9kYXRhcGxhbmUvdmlydGlvLWJsay5jICAgICAgICAgIHwgMSAtCj4gIGh3
L2Jsb2NrL3ZpcnRpby1ibGsuYyAgICAgICAgICAgICAgICAgICAgfCAxIC0KPiAgaHcvY29yZS9x
ZGV2LXByb3BlcnRpZXMuYyAgICAgICAgICAgICAgICB8IDEgLQo+ICBody9jcmlzL2F4aXNfZGV2
ODguYyAgICAgICAgICAgICAgICAgICAgIHwgMSAtCj4gIGh3L2Rpc3BsYXkvdGM2MzkzeGIuYyAg
ICAgICAgICAgICAgICAgICAgfCAxIC0KPiAgaHcvaWRlL3BjaS5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDEgLQo+ICBody9pZGUvdmlhLmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMSAtCj4gIGh3L2lzYS9pc2Etc3VwZXJpby5jICAgICAgICAgICAgICAgICAgICAgfCAx
IC0KPiAgaHcvbG0zMi9sbTMyX2JvYXJkcy5jICAgICAgICAgICAgICAgICAgICB8IDEgLQo+ICBo
dy9sbTMyL21pbGt5bWlzdC5jICAgICAgICAgICAgICAgICAgICAgIHwgMSAtCj4gIGh3L21pY3Jv
YmxhemUvcGV0YWxvZ2l4X21sNjA1X21tdS5jICAgICAgfCAxIC0KPiAgaHcvbWljcm9ibGF6ZS9w
ZXRhbG9naXhfczNhZHNwMTgwMF9tbXUuYyB8IDEgLQo+ICBody9taXBzL21pcHNfcjRrLmMgICAg
ICAgICAgICAgICAgICAgICAgIHwgMSAtCj4gIGh3L3BwYy9zcGFwci5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAxIC0KPiAgaHcvcHBjL3ZpcnRleF9tbDUwNy5jICAgICAgICAgICAgICAg
ICAgICB8IDIgLS0KPiAgaHcvczM5MHgvdmlydGlvLWNjdy5jICAgICAgICAgICAgICAgICAgICB8
IDEgLQo+ICBody9zY3NpL21wdHNhcy5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSAtCj4g
IGh3L3NkL3BsMTgxLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxIC0KPiAgaHcvc2Qv
c2RoY2kuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgLQo+ICBody9zZC9zc2ktc2Qu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSAtCj4gIGh3L3NoNC9yMmQuYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAxIC0KPiAgaHcvdmlydGlvL3ZpcnRpby1wY2kuYyAgICAg
ICAgICAgICAgICAgICB8IDEgLQo+ICBody94ZW4veGVuX2RldmNvbmZpZy5jICAgICAgICAgICAg
ICAgICAgIHwgMSAtCj4gIGh3L3h0ZW5zYS94dGZwZ2EuYyAgICAgICAgICAgICAgICAgICAgICAg
fCAxIC0KPiAgMzggZmlsZXMgY2hhbmdlZCwgMzkgZGVsZXRpb25zKC0pCgpBY2tlZC1ieTogQ29y
bmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
