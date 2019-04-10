From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 2/3] xen-bus: allow AioContext to be
 specified for each event channel
Date: Wed, 10 Apr 2019 13:57:08 +0100
Message-ID: <20190410125708.GE1435__20573.1346433581$1554901093$gmane$org@perard.uk.xensource.com>
References: <20190408151617.13025-1-paul.durrant@citrix.com>
 <20190408151617.13025-3-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Da5p=SM=citrix.com=prvs=9966e4c82=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hECmu-0006J4-Mx
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 12:57:12 +0000
Content-Disposition: inline
In-Reply-To: <20190408151617.13025-3-paul.durrant@citrix.com>
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

T24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMDQ6MTY6MTZQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggYWRkcyBhbiBBaW9Db250ZXh0IHBhcmFtZXRlciB0byB4ZW5fZGV2
aWNlX2JpbmRfZXZlbnRfY2hhbm5lbCgpCj4gYW5kIHRoZW4gdXNlcyBhaW9fc2V0X2ZkX2hhbmRs
ZXIoKSB0byBzZXQgdGhlIGNhbGxiYWNrIHJhdGhlciB0aGFuCj4gcWVtdV9zZXRfZmRfaGFuZGxl
cigpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJp
eC5jb20+Cj4gLS0tCj4gQEAgLTk0Myw2ICs5NDQsNyBAQCBzdGF0aWMgdm9pZCB4ZW5fZGV2aWNl
X2V2ZW50KHZvaWQgKm9wYXF1ZSkKPiAgfQo+ICAKPiAgWGVuRXZlbnRDaGFubmVsICp4ZW5fZGV2
aWNlX2JpbmRfZXZlbnRfY2hhbm5lbChYZW5EZXZpY2UgKnhlbmRldiwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBaW9Db250ZXh0ICpjdHgsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50
IHBvcnQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
WGVuRXZlbnRIYW5kbGVyIGhhbmRsZXIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdm9pZCAqb3BhcXVlLCBFcnJvciAqKmVycnApCj4gQEAgLTk2OCw4
ICs5NzAsOSBAQCBYZW5FdmVudENoYW5uZWwgKnhlbl9kZXZpY2VfYmluZF9ldmVudF9jaGFubmVs
KFhlbkRldmljZSAqeGVuZGV2LAo+ICAgICAgY2hhbm5lbC0+aGFuZGxlciA9IGhhbmRsZXI7Cj4g
ICAgICBjaGFubmVsLT5vcGFxdWUgPSBvcGFxdWU7Cj4gIAo+IC0gICAgcWVtdV9zZXRfZmRfaGFu
ZGxlcih4ZW5ldnRjaG5fZmQoY2hhbm5lbC0+eGVoKSwgeGVuX2RldmljZV9ldmVudCwgTlVMTCwK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgY2hhbm5lbCk7Cj4gKyAgICBjaGFubmVsLT5jdHgg
PSBjdHg7Cj4gKyAgICBhaW9fc2V0X2ZkX2hhbmRsZXIoY2hhbm5lbC0+Y3R4LCB4ZW5ldnRjaG5f
ZmQoY2hhbm5lbC0+eGVoKSwgZmFsc2UsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgeGVuX2Rl
dmljZV9ldmVudCwgTlVMTCwgTlVMTCwgY2hhbm5lbCk7CgpJIHdvbmRlciBpZiB0aGUgYCdpc19l
eHRlcm5hbCcgcGFyYW1ldGVyIG9mIGFpb19zZXRfZmRfaGFuZGxlciBzaG91ZCBiZQpgdHJ1ZScg
aGVyZSwgaW5zdGVhZC4gVGhhdCBmbGFnIHNlZW1zIHRvIGJlIHVzZWQgd2hlbiBtYWtpbmcgYSBz
bmFwc2hvdApvZiBhIGJsb2NrZGV2LCBmb3IgZXhhbXBsZS4KClRoYXQgd2FzIGludHJvZHVjZWQg
Ynk6CmRjYTIxZWYyM2JhNDhmNmYxNDI4YzU5ZjI5NWE4NTdlNWRjMjAzYzheLi5jMDdiYzJjMTY1
OGZmZmVlZTA4ZWI0NjQwMmIyZjY2ZDU1YjA3NTg2CgpXaGF0IGRvIHlvdSB0aGluaz8KCgotLSAK
QW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
