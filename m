From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 2/3] tools: No longer advertise GIT_HTTP env var
Date: Mon, 5 Nov 2018 18:42:33 +0000
Message-ID: <20181105184234.31603-2-ian.jackson@eu.citrix.com>
References: <20181105184234.31603-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ylya=nq=citrix.com=prvs=8406b12ba=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gJjpu-0004Jg-Ul
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 18:42:54 +0000
In-Reply-To: <20181105184234.31603-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW4gImJ1aWxkOiBhZGQgYXV0b2NvbmYgdG8gcmVwbGFjZSBjdXN0b20gY2hlY2tzIGluIHRvb2xz
L2NoZWNrIgotLWVuYWJsZS1naXRodHRwIHdhcyBpbnRyb2R1Y2VkLiAgQnV0IHdlIG1pc3NlZCB0
aGlzIGNvbW1lbnQgd2hlcmUgaXQKd2FzIGFkdmVydGlzZWQuCgpTaWduZWQtb2ZmLWJ5OiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ0M6IFBhdWwgRHVycmFudCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgot
LS0KIGNvbmZpZy9Ub29scy5tay5pbiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2NvbmZpZy9Ub29scy5tay5pbiBiL2Nv
bmZpZy9Ub29scy5tay5pbgppbmRleCBkNTk4NWMwZDA5Li45ODI0NWY2M2M5IDEwMDY0NAotLS0g
YS9jb25maWcvVG9vbHMubWsuaW4KKysrIGIvY29uZmlnL1Rvb2xzLm1rLmluCkBAIC00MCw3ICs0
MCw3IEBAIFhFTl9UT09MU19SUEFUSCAgICAgOj0gQHJwYXRoQAogIyBEb3dubG9hZCBHSVQgcmVw
b3NpdG9yaWVzIHZpYSBIVFRQIG9yIEdJVCdzIG93biBwcm90b2NvbD8KICMgR0lUJ3MgcHJvdG9j
b2wgaXMgZmFzdGVyIGFuZCBtb3JlIHJvYnVzdCwgd2hlbiBpdCB3b3JrcyBhdCBhbGwgKGZpcmV3
YWxscwogIyBtYXkgYmxvY2sgaXQpLiBXZSBtYWtlIGl0IHRoZSBkZWZhdWx0LCBidXQgaWYgeW91
ciBHSVQgcmVwb3NpdG9yeSBkb3dubG9hZHMKLSMgZmFpbCBvciBoYW5nLCBwbGVhc2Ugc3BlY2lm
eSBHSVRfSFRUUD15IGluIHlvdXIgZW52aXJvbm1lbnQuCisjIGZhaWwgb3IgaGFuZywgcGxlYXNl
IHBhc3MgLS1lbmFibGUtZ2l0aHR0cCB0byBjb25maWd1cmUuCiBHSVRfSFRUUCAgICAgICAgICAg
ID89IEBnaXRodHRwQAogCiAjIE9wdGlvbmFsIGNvbXBvbmVudHMKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
