From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 2/8] xen_disk: remove open-coded use of
 libxengnttab
Date: Wed, 16 May 2018 15:02:59 +0100
Message-ID: <20180516140259.GG2057@perard.uk.xensource.com>
References: <1525461967-32174-1-git-send-email-paul.durrant@citrix.com>
 <1525461967-32174-3-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dhrn=id=citrix.com=prvs=667e0e3bc=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fIx1V-0004vB-DY
 for xen-devel@lists.xenproject.org; Wed, 16 May 2018 14:03:21 +0000
Content-Disposition: inline
In-Reply-To: <1525461967-32174-3-git-send-email-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMDQsIDIwMTggYXQgMDg6MjY6MDFQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IE5vdyB0aGF0IGhlbHBlcnMgYXJlIHByZXNlbnQgaW4geGVuX2JhY2tlbmQsIHRoaXMg
cGF0Y2ggcmVtb3ZlcyBvcGVuLWNvZGVkCj4gY2FsbHMgdG8gbGlieGVuZ250dGFiIGZyb20gdGhl
IHhlbl9kaXNrIGNvZGUuCj4gCj4gVGhpcyBwYXRjaCBhbHNvIGZpeGVzIG9uZSB3aGl0c3BhY2Ug
ZXJyb3IgaW4gdGhlIGFzc2lnbm1lbnQgb2YgdGhlCj4gWGVuRGV2T3BzIGluaXRpYWxpc2UgbWV0
aG9kLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJp
eC5jb20+CgpBY2tlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+CgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
