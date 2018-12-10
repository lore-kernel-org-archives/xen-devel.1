From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] automation: skip test stage for some branches
Date: Mon, 10 Dec 2018 15:11:10 +0000
Message-ID: <20181210151110.12206-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rxBF=OT=citrix.com=prvs=87591bb9c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gWNDJ-0005b0-Dl
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 15:11:17 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

V2Ugc2tpcHBlZCBidWlsZCBzdGFnZSBmb3IgdGhvc2UgYnJhbmNoZXMuIFdlIHdhbnQgdG8gc2tp
cCB0ZXN0IHN0YXRlCmZvciB0aG9zZSBicmFuY2hlcyB0b28uCgpTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIGF1dG9tYXRpb24vZ2l0bGFiLWNpL3Rlc3Qu
eWFtbCB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9naXRsYWItY2kvdGVzdC55YW1sIGIvYXV0b21hdGlvbi9n
aXRsYWItY2kvdGVzdC55YW1sCmluZGV4IDBkZDVlYWVjNWYuLjhiZmEwZmJhNWYgMTAwNjQ0Ci0t
LSBhL2F1dG9tYXRpb24vZ2l0bGFiLWNpL3Rlc3QueWFtbAorKysgYi9hdXRvbWF0aW9uL2dpdGxh
Yi1jaS90ZXN0LnlhbWwKQEAgLTE1LDYgKzE1LDExIEBAIHFlbXUtc21va2UteDg2LTY0LWdjYzoK
ICAgICAtIGRlYmlhbi1zdHJldGNoLWdjYy1kZWJ1ZwogICB0YWdzOgogICAgIC0geDg2XzY0Cisg
IGV4Y2VwdDoKKyAgICAtIG1hc3RlcgorICAgIC0gc21va2UKKyAgICAtIC9eY292ZXJpdHktdGVz
dGVkXC8uKi8KKyAgICAtIC9ec3RhYmxlLS4qLwogCiBxZW11LXNtb2tlLXg4Ni02NC1jbGFuZzoK
ICAgc3RhZ2U6IHRlc3QKQEAgLTMyLDMgKzM3LDggQEAgcWVtdS1zbW9rZS14ODYtNjQtY2xhbmc6
CiAgICAgLSBkZWJpYW4tdW5zdGFibGUtY2xhbmctZGVidWcKICAgdGFnczoKICAgICAtIHg4Nl82
NAorICBleGNlcHQ6CisgICAgLSBtYXN0ZXIKKyAgICAtIHNtb2tlCisgICAgLSAvXmNvdmVyaXR5
LXRlc3RlZFwvLiovCisgICAgLSAvXnN0YWJsZS0uKi8KLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
