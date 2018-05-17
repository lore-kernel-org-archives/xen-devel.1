From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 5/8] xen_disk: remove use of grant
 map/unmap
Date: Thu, 17 May 2018 11:31:05 +0100
Message-ID: <20180517103105.GJ2057__11578.7791241475$1526553010$gmane$org@perard.uk.xensource.com>
References: <1525461967-32174-1-git-send-email-paul.durrant@citrix.com>
 <1525461967-32174-6-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kmnw=ie=citrix.com=prvs=6682a862c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fJGBh-0006WY-H6
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 10:31:09 +0000
Content-Disposition: inline
In-Reply-To: <1525461967-32174-6-git-send-email-paul.durrant@citrix.com>
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

T24gRnJpLCBNYXkgMDQsIDIwMTggYXQgMDg6MjY6MDRQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IE5vdyB0aGF0IHRoZSAobmF0aXZlIG9yIGVtdWxhdGVkKSB4ZW5fYmVfY29weV9ncmFu
dF9yZWZzKCkgaGVscGVyIGlzCj4gYWx3YXlzIGF2YWlsYWJsZSwgdGhlIHhlbl9kaXNrIGNvZGUg
Y2FuIGJlIHNpZ25pZmljYW50bHkgc2ltcGxpZmllZCBieQo+IHJlbW92aW5nIGRpcmVjdCB1c2Ug
b2YgZ3JhbnQgbWFwIGFuZCB1bm1hcCBvcGVyYXRpb25zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBh
dWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpBY2tlZC1ieTogQW50aG9ueSBQ
RVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgotLSAKQW50aG9ueSBQRVJBUkQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
