From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] gitlab-ci: log commit range in build test
Date: Mon, 8 Apr 2019 11:11:08 +0100
Message-ID: <20190408101108.27976-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PEQb=SK=citrix.com=prvs=994fb90f6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDRFA-0003RL-56
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 10:11:12 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SXQgaXMgZWFzaWVyIHRvIGRlYnVnIHN0dWZmIHdoZW4gdGhlIHRhcmdldCByYW5nZSBpcyBjbGVh
cmx5IHZpc2libGUKYXQgdGhlIHRvcC4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+Ci0tLQogYXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQtZWFjaC1jb21taXQu
c2ggfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
YXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQtZWFjaC1jb21taXQuc2ggYi9hdXRvbWF0aW9uL2dp
dGxhYi1jaS9idWlsZC1lYWNoLWNvbW1pdC5zaAppbmRleCA2Yjc5OTg0NDhhLi4yNzViYzcxOTAy
IDEwMDc1NQotLS0gYS9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC1lYWNoLWNvbW1pdC5zaAor
KysgYi9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC1lYWNoLWNvbW1pdC5zaApAQCAtMTIsNSAr
MTIsNyBAQCBpZiBbWyAkPyAtbmUgMCBdXTsgdGhlbgogICAgIGV4aXQgMAogZmkKIAorZWNobyAi
QnVpbGRpbmcgJHtDSV9DT01NSVRfQkVGT1JFX1NIQX0uLiR7Q0lfQ09NTUlUX1NIQX0iCisKIE5P
Tl9TWU1CT0xJQ19SRUY9MSAuL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZC10ZXN0LnNoICR7Q0lf
Q09NTUlUX0JFRk9SRV9TSEF9ICR7Q0lfQ09NTUlUX1NIQX0gXAogICAgIGJhc2ggLWMgIm1ha2Ug
LWo0IGRpc3RjbGVhbiAmJiAuL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZCIKLS0gCjIuMjAuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
