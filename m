From: Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC PATCH v2 3/9] MAINTAINERS: adding Hyper_DMABUF
	driver section in MAINTAINERS
Date: Tue, 13 Feb 2018 17:50:02 -0800
Message-ID: <20180214015008.9513-4-dongwon.kim__16207.2099083618$1518573034$gmane$org@intel.com>
References: <20180214015008.9513-1-dongwon.kim@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ojmv=fi=intel.com=dongwon.kim@srs-us1.protection.inumbo.net>)
 id 1elmEO-00077o-OZ
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2018 01:51:32 +0000
In-Reply-To: <20180214015008.9513-1-dongwon.kim@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, xen-devel@lists.xenproject.org
Cc: sumit.semwal@linaro.org, dongwon.kim@intel.com, dri-devel@lists.freedesktop.org, mateuszx.potrola@intel.com
List-Id: xen-devel@lists.xenproject.org

SHlwZXJfRE1BQlVGIERSSVZFUgpNOiAgICAgIERvbmd3b24gS2ltIDxkb25nd29uLmtpbUBpbnRl
bC5jb20+Ck06ICAgICAgTWF0ZXVzeiBQb2xyb2xhIDxtYXRldXN6eC5wb3Ryb2xhQGludGVsLmNv
bT4KTDogICAgICBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCkw6ICAgICAgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnClM6ICAgICAgTWFpbnRhaW5lZApGOiAgICAgIGRyaXZlcnMv
ZG1hLWJ1Zi9oeXBlcl9kbWFidWYqCkY6ICAgICAgaW5jbHVkZS91YXBpL2xpbnV4L2h5cGVyX2Rt
YWJ1Zi5oCkY6ICAgICAgRG9jdW1lbnRhdGlvbi9oeXBlci1kbWFidWYtc2hhcmluZy50eHQKVDog
ICAgICBodHRwczovL2dpdGh1Yi5jb20vZG93bm9yL2xpbnV4X2h5cGVyX2RtYWJ1Zi8KClNpZ25l
ZC1vZmYtYnk6IERvbmd3b24gS2ltIDxkb25nd29uLmtpbUBpbnRlbC5jb20+Ci0tLQogTUFJTlRB
SU5FUlMgfCAxMSArKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IGQ0ZmRjYjEyNjE2
Yy4uMTU1ZjdmODM5MjAxIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVS
UwpAQCAtNjQ2OCw2ICs2NDY4LDE3IEBAIFM6CU1haW50YWluZWQKIEY6CW1tL21lbW9yeS1mYWls
dXJlLmMKIEY6CW1tL2h3cG9pc29uLWluamVjdC5jCiAKK0h5cGVyX0RNQUJVRiBEUklWRVIKK006
CURvbmd3b24gS2ltIDxkb25nd29uLmtpbUBpbnRlbC5jb20+CitNOglNYXRldXN6IFBvbHJvbGEg
PG1hdGV1c3p4LnBvdHJvbGFAaW50ZWwuY29tPgorTDoJbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZworTDoJeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCitTOglNYWludGFpbmVkCitG
Oglkcml2ZXJzL2RtYS1idWYvaHlwZXJfZG1hYnVmKgorRjoJaW5jbHVkZS91YXBpL2xpbnV4L2h5
cGVyX2RtYWJ1Zi5oCitGOglEb2N1bWVudGF0aW9uL2h5cGVyLWRtYWJ1Zi1zaGFyaW5nLnR4dAor
VDoJaHR0cHM6Ly9naXRodWIuY29tL2Rvd25vci9saW51eF9oeXBlcl9kbWFidWYvCisKIEh5cGVy
LVYgQ09SRSBBTkQgRFJJVkVSUwogTToJIksuIFkuIFNyaW5pdmFzYW4iIDxreXNAbWljcm9zb2Z0
LmNvbT4KIE06CUhhaXlhbmcgWmhhbmcgPGhhaXlhbmd6QG1pY3Jvc29mdC5jb20+Ci0tIAoyLjE2
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
