From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 17/17] automation: build Xen with CONFIG_PV and
 CONFIG_HVM explicitly set
Date: Thu, 4 Oct 2018 16:43:36 +0100
Message-ID: <a56cb9e9a9f2883b4e12ca08a04c340fa21032cb.1538667753.git-series.wei.liu2@citrix.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a7fh=mq=citrix.com=prvs=808c92aaa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g861S-0007LT-OF
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 15:58:42 +0000
In-Reply-To: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
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

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiBhdXRvbWF0
aW9uL3NjcmlwdHMvYnVpbGQgfCAxOCArKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAxOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxk
IGIvYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkCmluZGV4IGM0NjNiMDYuLjhhZjNmYWIgMTAwNzU1
Ci0tLSBhL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZAorKysgYi9hdXRvbWF0aW9uL3NjcmlwdHMv
YnVpbGQKQEAgLTMxLDMgKzMxLDIxIEBAIGZpCiAuL2NvbmZpZ3VyZSAiJHtjZmdhcmdzW0BdfSIK
IAogbWFrZSAtaiQobnByb2MpIGRpc3QKKworIyBidWlsZCBQViBvbmx5LCBIVk0gb25seSBhbmQg
YmFyZSBib25lIFhlbiBvbiB4ODYKK2lmIFtbICIke1hFTl9UQVJHRVRfQVJDSH0iID09ICJ4ODZf
NjQiIF1dOyB0aGVuCisgICAgIyBQViBvbmx5CisgICAgcm0gLWYgeGVuLy5jb25maWcKKyAgICBt
YWtlIC1DIHhlbiBLQlVJTERfREVGQ09ORklHPXB2X29ubHlfZGVmY29uZmlnIFhFTl9DT05GSUdf
RVhQRVJUPXkgZGVmY29uZmlnCisgICAgbWFrZSAtaiQobnByb2MpIC1DIHhlbiBYRU5fQ09ORklH
X0VYUEVSVD15CisKKyAgICAjIEhWTSBvbmx5CisgICAgcm0gLWYgeGVuLy5jb25maWcKKyAgICBt
YWtlIC1DIHhlbiBLQlVJTERfREVGQ09ORklHPWh2bV9vbmx5X2RlZmNvbmZpZyBYRU5fQ09ORklH
X0VYUEVSVD15IGRlZmNvbmZpZworICAgIG1ha2UgLWokKG5wcm9jKSAtQyB4ZW4gWEVOX0NPTkZJ
R19FWFBFUlQ9eQorCisgICAgIyBCYXJlIGJvbmUKKyAgICBybSAtZiB4ZW4vLmNvbmZpZworICAg
IG1ha2UgLUMgeGVuIEtCVUlMRF9ERUZDT05GSUc9bm9faHZtX3B2X2RlZmNvbmZpZyBYRU5fQ09O
RklHX0VYUEVSVD15IGRlZmNvbmZpZworICAgIG1ha2UgLWokKG5wcm9jKSAtQyB4ZW4gWEVOX0NP
TkZJR19FWFBFUlQ9eQorZmkKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
