From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH for-4.12 v3 7/8] xenalyze: Build for Both ARM
 and x86 Platforms
Date: Fri, 21 Dec 2018 16:26:49 +0000
Message-ID: <20181221162650.11515-8-julien.grall@arm.com>
References: <20181221162650.11515-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8mGA=O6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gaNdl-0006Af-8l
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 16:27:09 +0000
In-Reply-To: <20181221162650.11515-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabelini@kernel.org>, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>, Benjamin Sanda <ben.sanda@dornerworks.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQmVuamFtaW4gU2FuZGEgPGJlbi5zYW5kYUBkb3JuZXJ3b3Jrcy5jb20+CgpNb2RpZmll
ZCB0byBwcm92aWRlIGJ1aWxkaW5nIG9mIHRoZSB4ZW5hbHl6ZSBiaW5hcnkgZm9yIGJvdGggQVJN
IGFuZAp4ODYgcGxhdGZvcm1zLiBUaGUgeGVuYWx5emUgYmluYXJ5IGlzIG5vdyBidWlsdCBhcyBw
YXJ0IG9mIHRoZSBCSU4KbGlzdCBmb3IgYm90aCBwbGF0Zm9ybXMuCgpTaWduZWQtb2ZmLWJ5OiBC
ZW5qYW1pbiBTYW5kYSA8YmVuLnNhbmRhQGRvcm5lcndvcmtzLmNvbT4KU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQWNrZWQtYnk6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+CkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxp
bmlAa2VybmVsLm9yZz4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MzoKICAgICAgICAtIEFkZCBTdGVm
YW5vJ3MgYWNrZWQtYnkKCiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0gQWRkIFdlaSdzIGFj
a2VkLWJ5Ci0tLQogdG9vbHMveGVudHJhY2UvTWFrZWZpbGUgfCAzICstLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3hl
bnRyYWNlL01ha2VmaWxlIGIvdG9vbHMveGVudHJhY2UvTWFrZWZpbGUKaW5kZXggMGJhZDk0MmJk
Zi4uOWZiN2ZjOTZlNyAxMDA2NDQKLS0tIGEvdG9vbHMveGVudHJhY2UvTWFrZWZpbGUKKysrIGIv
dG9vbHMveGVudHJhY2UvTWFrZWZpbGUKQEAgLTksOCArOSw3IEBAIExETElCUyArPSAkKExETElC
U19saWJ4ZW5ldnRjaG4pCiBMRExJQlMgKz0gJChMRExJQlNfbGlieGVuY3RybCkKIExETElCUyAr
PSAkKEFSR1BfTERGTEFHUykKIAotQklOLSQoQ09ORklHX1g4NikgPSB4ZW5hbHl6ZQotQklOICAg
ICAgPSAkKEJJTi15KQorQklOICAgICAgPSB4ZW5hbHl6ZQogU0JJTiAgICAgPSB4ZW50cmFjZSB4
ZW50cmFjZV9zZXRzaXplCiBMSUJCSU4gICA9IHhlbmN0eAogU0NSSVBUUyAgPSB4ZW50cmFjZV9m
b3JtYXQKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
