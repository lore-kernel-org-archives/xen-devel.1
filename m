From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 3/3] gitlab-ci: add fedora gcc build jobs
Date: Thu, 4 Apr 2019 12:23:02 +0100
Message-ID: <20190404112302.4796-4-wei.liu2@citrix.com>
References: <20190404112302.4796-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VYWF=SG=citrix.com=prvs=9901e81f4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hC0Se-00021I-Hm
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 11:23:12 +0000
In-Reply-To: <20190404112302.4796-1-wei.liu2@citrix.com>
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

QWx0aG91Z2ggdGhlIGltYWdlIGNvbWVzIHdpdGggY2xhbmcsIGNsYW5nIGJ1aWxkcyBkb24ndCB3
b3JrIHlldC4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0t
LQogYXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQueWFtbCB8IDEwICsrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9naXRs
YWItY2kvYnVpbGQueWFtbCBiL2F1dG9tYXRpb24vZ2l0bGFiLWNpL2J1aWxkLnlhbWwKaW5kZXgg
YzI5YTc2ZTlmZi4uZGQ1NzIyYTViYiAxMDA2NDQKLS0tIGEvYXV0b21hdGlvbi9naXRsYWItY2kv
YnVpbGQueWFtbAorKysgYi9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC55YW1sCkBAIC0zMDEs
NiArMzAxLDE2IEBAIGRlYmlhbi11bnN0YWJsZS0zMi1nY2MtZGVidWc6CiAgIHZhcmlhYmxlczoK
ICAgICBDT05UQUlORVI6IGRlYmlhbjp1bnN0YWJsZS1pMzg2CiAKK2ZlZG9yYS1nY2M6CisgIGV4
dGVuZHM6IC5nY2MteDg2LTY0LWJ1aWxkCisgIHZhcmlhYmxlczoKKyAgICBDT05UQUlORVI6IGZl
ZG9yYTpsYXRlc3QKKworZmVkb3JhLWdjYy1kZWJ1ZzoKKyAgZXh0ZW5kczogLmdjYy14ODYtNjQt
YnVpbGQtZGVidWcKKyAgdmFyaWFibGVzOgorICAgIENPTlRBSU5FUjogZmVkb3JhOmxhdGVzdAor
CiAjIFVidW50dSBUcnVzdHkncyBDbGFuZyBpcyAzLjQgd2hpbGUgWGVuIHJlcXVpcmVzIDMuNQog
CiB1YnVudHUtdHJ1c3R5LWdjYzoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
