From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 3/3] automation: properly tag x86 jobs in Gitlab
 CI
Date: Fri, 16 Nov 2018 13:12:30 +0000
Message-ID: <20181116131230.25885-4-wei.liu2@citrix.com>
References: <20181116131230.25885-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cpgy=n3=citrix.com=prvs=851546e96=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gNdvH-0007BD-KI
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 13:12:35 +0000
In-Reply-To: <20181116131230.25885-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

U2luY2Ugd2UgaGF2ZSBpbnRyb2R1Y2VkIGFybTY0IHZhcmlhbnRzLCB3ZSdkIGJldHRlciBzdGFy
dCB0YWdnaW5nIHRoZQpvbGQgb25lcy4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+Ci0tLQpEb3VnLCB0aGlzIHJlcXVpcmVzIHByb3Blcmx5IHRhZ2dpbmcgYWxs
IHRoZSB4ODYgcnVubmVyIGhvc3RzIGZpcnN0LgotLS0KIC5naXRsYWItY2kueW1sIHwgNCArKysr
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvLmdpdGxhYi1j
aS55bWwgYi8uZ2l0bGFiLWNpLnltbAppbmRleCBiMjY4MTgyYmM2Li4wMGM5ZmI5ZTNjIDEwMDY0
NAotLS0gYS8uZ2l0bGFiLWNpLnltbAorKysgYi8uZ2l0bGFiLWNpLnltbApAQCAtMzIsNiArMzIs
OCBAQCBzdGFnZXM6CiAgIDw8OiAqYnVpbGQKICAgdmFyaWFibGVzOgogICAgIFhFTl9UQVJHRVRf
QVJDSDogeDg2XzY0CisgIHRhZ3M6CisgICAgLSB4ODZfNjQKIAogLng4Ni02NC1idWlsZDoKICAg
ZXh0ZW5kczogLng4Ni02NC1idWlsZC10bXBsCkBAIC00Nyw2ICs0OSw4IEBAIHN0YWdlczoKICAg
PDw6ICpidWlsZAogICB2YXJpYWJsZXM6CiAgICAgWEVOX1RBUkdFVF9BUkNIOiB4ODZfMzIKKyAg
dGFnczoKKyAgICAtIHg4Nl8zMgogCiAueDg2LTMyLWJ1aWxkOgogICBleHRlbmRzOiAueDg2LTMy
LWJ1aWxkLXRtcGwKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
