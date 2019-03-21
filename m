From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] public/io/blkif.h: make the comments on
 "sectors" self-consistent
Date: Thu, 21 Mar 2019 17:23:08 +0000
Message-ID: <20190321172308.GR11621@perard.uk.xensource.com>
References: <20190320125228.36440-1-paul.durrant@citrix.com>
 <20190321122211.GB10145@perard.uk.xensource.com>
 <59c47c75ca664fd6b38dbaf42fd7d935@AMSPEX02CL02.citrite.net>
 <20190321152338.GQ11621@perard.uk.xensource.com>
 <31b7b852a09143db8a00dd2385f6f80d@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H/7w=RY=citrix.com=prvs=976f82c14=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1h71PV-00025m-9Z
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2019 17:23:21 +0000
Content-Disposition: inline
In-Reply-To: <31b7b852a09143db8a00dd2385f6f80d@AMSPEX02CL02.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: xen-devel@lists.xenproject.org

PiA+IEkgdGhpbmsgdGhpcyBpcyBob3cgdGhlIGN1cnJlbnRzIGltcGxlbWVudGF0aW9ucyBhcmUg
d29ya2luZzoKPiA+ICAgICBtZWRpYS9kaXNrIHNpemUgPSAic2VjdG9ycyIgKiAic2VjdG9yLXNp
emUiCj4gPiB0aGVuLCAic2VjdG9ycyIgYW5kICJzZWN0b3Itc2l6ZSIgYXJlIG5ldmVyIHVzZWQg
YWdhaW4uCj4gCj4gTm90IHRydWUsIHVuZm9ydHVuYXRlbHkuIEF0IGxlYXN0IHRoZSBXaW5kb3dz
IGZyb250ZW5kcyBhcmUgKG1pcyljb2RlZCB0byB1c2Ugc2VjdG9yIG51bWJlcnMgZGlyZWN0bHkg
aW4gYmxraWZfcmVxdWVzdF90IGFuZCBibGtpZl9yZXF1ZXN0X3NlZ21lbnQgcmF0aGVyIHRoYW4g
cmUtc2NhbGluZyB0byA1MTIgYnl0ZXMsIHNvIHNldHRpbmcgc2VjdG9yLXNpemUgIT0gNTEyIHdp
bGwgY2VydGFpbmx5IG1ha2UgdGhlbSBtaXNiZWhhdmUgYWNjb3JkaW5nIHRvIHRoZSBwcm90b2Nv
bC4gVGhpcyBjYW4sIG9mIGNvdXJzZSwgYmUgZml4ZWQgYnV0IEkgdGhpbmsgd2UncmUgYXQgcG9p
bnQgd2hlcmUgdGhlIG9ubHkgc2FmZSB3YXkgdG8gc2V0IGEgbGFyZ2VyIHNlY3Rvci1zaXplIHdv
dWxkIGJlIHRvIGhhdmUgdGhlIGZyb250ZW5kIHdyaXRlIGFuICdJJ20gbm90IGJyb2tlbicgZmxh
ZyBpbnRvIHhlbnN0b3JlIHRoYXQgdGhlIGJhY2tlbmQgcmVhZHMgYmVmb3JlIHNldHRpbmcgc2Vj
dG9yLXNpemUgKGFuZCBpZiB0aGF0IG1lYW5zIHRoYXQgdGhlIGJhY2tlbmQgaGFzIHRvIGRvIHJl
YWQtbW9kaWZ5LXdyaXRlIGN5Y2xlcyBmb3IgYW4gdW5kZXJseWluZyBzdG9yYWdlIGRldmljZSB3
aXRoIGEgbGFyZ2VyIGxvZ2ljYWwgYmxvY2sgc2l6ZSB0aGVuIHNvIGJlIGl0KS4KClNvLCBoYXJk
LWNvZGluZyAic2VjdG9yLXNpemUiIHRvIDUxMiBpbiBibGtpZi5oIHNvdW5kIGdvb2QgdG8gbWUu
CgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
