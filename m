From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 16/26] ts-host-powercycle: Use a
 lighter-weight method if available
Date: Thu, 24 Jan 2019 18:46:03 +0000
Message-ID: <20190124184613.2720-17-ian.jackson@eu.citrix.com>
References: <20190124184613.2720-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Nn+=QA=citrix.com=prvs=9204ab04b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gmk1H-0003nR-MY
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 18:46:31 +0000
In-Reply-To: <20190124184613.2720-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogdHMtaG9zdC1wb3dlcmN5Y2xlIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdHMtaG9zdC1wb3dlcmN5Y2xl
IGIvdHMtaG9zdC1wb3dlcmN5Y2xlCmluZGV4IDVjMTY5OGM3Li43OWEzYjcxMSAxMDA3NTUKLS0t
IGEvdHMtaG9zdC1wb3dlcmN5Y2xlCisrKyBiL3RzLWhvc3QtcG93ZXJjeWNsZQpAQCAtMzMsOCAr
MzMsMTAgQEAgb3VyICgkd2hob3N0KSA9IEBBUkdWOwogJHdoaG9zdCB8fD0gJ2hvc3QnOwogb3Vy
ICRobz0gc2VsZWN0aG9zdCgkd2hob3N0KTsKIAorbXkgJGFwcHJvYWNoX3JlID0gcXJ7KD8hLipT
U0gpfTsKKwogaWYgKGRlZmluZWQgJG9ubHkpIHsKLSAgICBwb3dlcl9zdGF0ZSgkaG8sICRvbmx5
KTsKKyAgICBwb3dlcl9zdGF0ZSgkaG8sICRvbmx5LCAkYXBwcm9hY2hfcmUpOwogfSBlbHNlIHsK
LSAgICBwb3dlcl9jeWNsZSgkaG8pOworICAgIHBvd2VyX2N5Y2xlKCRobywgJGFwcHJvYWNoX3Jl
KTsKIH0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
