From: Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC PATCH 58/60] hyper_dmabuf: move device node out of
	/dev/xen/
Date: Tue, 19 Dec 2017 11:30:14 -0800
Message-ID: <1513711816-2618-58-git-send-email-dongwon.kim__8112.27256567708$1513712298$gmane$org@intel.com>
References: <1513711816-2618-1-git-send-email-dongwon.kim@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=edeo=dp=intel.com=dongwon.kim@srs-us1.protection.inumbo.net>)
 id 1eRNk8-0001Zw-20
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 19:40:00 +0000
In-Reply-To: <1513711816-2618-1-git-send-email-dongwon.kim@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, mateuszx.potrola@intel.com, dri-devel@lists.freedesktop.org, dongwon.kim@intel.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogTWF0ZXVzeiBQb2xyb2xhIDxtYXRldXN6eC5wb3Ryb2xhQGludGVsLmNvbT4KCmh5cGVy
X2RtYWJ1ZiBkcml2ZXIgaXMgZ2VuZXJpYyBkcml2ZXIgdGhhdCBpcyBkZXNpZ25lZCB0byB3b3Jr
CndpdGggYW55IGh5cGVydmlzb3Igd2l0aCB2YXJpb3VzIGJhY2tlbmQgaW1wbGVtZW50YXRpb25z
LiBTbwptb3Zpbmcgb3V0IGl0cyBkZXZpY2Ugbm9kZSBvdXQgb2YgL2Rldi94ZW4uCgpTaWduZWQt
b2ZmLWJ5OiBNYXRldXN6IFBvbHJvbGEgPG1hdGV1c3p4LnBvdHJvbGFAaW50ZWwuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBEb25nd29uIEtpbSA8ZG9uZ3dvbi5raW1AaW50ZWwuY29tPgotLS0KIGRyaXZl
cnMveGVuL2h5cGVyX2RtYWJ1Zi9oeXBlcl9kbWFidWZfZHJ2LmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3hlbi9oeXBlcl9kbWFidWYvaHlwZXJfZG1hYnVmX2Rydi5jIGIvZHJpdmVycy94ZW4vaHlwZXJf
ZG1hYnVmL2h5cGVyX2RtYWJ1Zl9kcnYuYwppbmRleCBmMjczMWJmLi5iYmIzNDE0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL3hlbi9oeXBlcl9kbWFidWYvaHlwZXJfZG1hYnVmX2Rydi5jCisrKyBiL2Ry
aXZlcnMveGVuL2h5cGVyX2RtYWJ1Zi9oeXBlcl9kbWFidWZfZHJ2LmMKQEAgLTIyNyw3ICsyMjcs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBoeXBlcl9kbWFidWZfZHJp
dmVyX2ZvcHMgPSB7CiAKIHN0YXRpYyBzdHJ1Y3QgbWlzY2RldmljZSBoeXBlcl9kbWFidWZfbWlz
Y2RldiA9IHsKIAkubWlub3IgPSBNSVNDX0RZTkFNSUNfTUlOT1IsCi0JLm5hbWUgPSAieGVuL2h5
cGVyX2RtYWJ1ZiIsCisJLm5hbWUgPSAiaHlwZXJfZG1hYnVmIiwKIAkuZm9wcyA9ICZoeXBlcl9k
bWFidWZfZHJpdmVyX2ZvcHMsCiB9OwogCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
