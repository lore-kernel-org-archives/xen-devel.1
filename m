From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v7 09/18] xen: remove unnecessary code from
 dataplane/xen-block.c
Date: Fri, 4 Jan 2019 15:56:15 +0000
Message-ID: <20190104155615.GD1508@perard.uk.xensource.com>
References: <20181220171439.11159-1-paul.durrant@citrix.com>
 <20181220171439.11159-10-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OewZ=PM=citrix.com=prvs=90051d582=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gfRpb-0003Zo-9q
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 15:56:19 +0000
Content-Disposition: inline
In-Reply-To: <20181220171439.11159-10-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMjAsIDIwMTggYXQgMDU6MTQ6MzBQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IE5vdCBhbGwgb2YgdGhlIGNvZGUgZHVwbGljYXRlZCBmcm9tIHhlbl9kaXNrLmMgaXMg
cmVxdWlyZWQgYXMgdGhlIGJhc2lzIGZvcgo+IHRoZSBuZXcgZGF0YXBsYW5lIGltcGxlbWVudGF0
aW9uIHNvIHRoaXMgcGF0Y2ggcmVtb3ZlcyBleHRyYW5lb3VzIGNvZGUsCj4gYWxvbmcgd2l0aCB0
aGUgbGVnYWN5ICNpbmNsdWRlcyBhbmQgY2FsbHMgdG8gdGhlIGxlZ2FjeSB4ZW5fcHZfcHJpbnRm
KCkKPiBmdW5jdGlvbi4gRXJyb3IgbWVzc2FnZXMgYXJlIGNoYW5nZWQgdG8gYmUgcmVwb3J0ZWQg
dXNpbmcgZXJyb3JfcmVwb3J0KCkuCj4gCj4gTk9URTogVGhlIGNvZGUgaXMgc3RpbGwgbm90IHll
dCBidWlsdC4gRnVydGhlciB0cmFuc2Zvcm1hdGlvbnMgd2lsbCBiZQo+ICAgICAgIHJlcXVpcmVk
IHRvIG1ha2UgaXQgY29ycmVjdGx5IGludGVyZmFjZSB0byB0aGUgbmV3IFhlbkJ1cy9YZW5EZXZp
Y2UKPiAgICAgICBmcmFtZXdvcmsuIFRoZXkgd2lsbCBiZSBkZWxpdmVyZWQgaW4gYSBzdWJzZXF1
ZW50IHBhdGNoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50
QGNpdHJpeC5jb20+CgpBY2tlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+CgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
