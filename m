Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E433C43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 20:24:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CD1F206A3
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 20:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CD1F206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJkuz-0001J5-IW; Thu, 25 Apr 2019 20:24:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tBju=S3=citrix.com=prvs=011b478a6=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hJkuy-0001Im-Ta
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 20:24:28 +0000
X-Inumbo-ID: 1f8cc5d2-6798-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1f8cc5d2-6798-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 20:24:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,394,1549929600"; d="scan'208";a="84450975"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 25 Apr 2019 21:23:57 +0100
Message-ID: <1556223838-5176-3-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556223838-5176-1-git-send-email-igor.druzhinin@citrix.com>
References: <1556223838-5176-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 2/3] OvmfPkg/XenSupport: use a correct PCI
 host bridge aperture for BAR64
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, ard.biesheuvel@linaro.org,
 jordan.l.justen@intel.com, julien.grall@arm.com, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org, lersek@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425202357.wVS5SCi_spQVp4Ds_gWdoX5WnOcSG-7jyySY_mpGQ3g@z>

SW4gY2FzZSBCQVI2NCBpcyBwbGFjZWQgYmVsb3cgNEcgY2hvb3NlIHRoZSBjb3JyZWN0IGFwZXJ0
dXJlLgpUaGlzIGZpeGVzIGEgZmFpbGVkIGFzc2VydGlvbiBkb3duIHRoZSBjb2RlIHBhdGguCgpB
Y2tlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+ClNpZ25l
ZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgotLS0K
IE92bWZQa2cvTGlicmFyeS9QY2lIb3N0QnJpZGdlTGliL1hlblN1cHBvcnQuYyB8IDYgKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvT3ZtZlBrZy9MaWJyYXJ5L1BjaUhvc3RCcmlkZ2VMaWIvWGVuU3VwcG9ydC5jIGIvT3Zt
ZlBrZy9MaWJyYXJ5L1BjaUhvc3RCcmlkZ2VMaWIvWGVuU3VwcG9ydC5jCmluZGV4IDM1NGIwYTUu
Ljc2ZmNhNTMgMTAwNjQ0Ci0tLSBhL092bWZQa2cvTGlicmFyeS9QY2lIb3N0QnJpZGdlTGliL1hl
blN1cHBvcnQuYworKysgYi9Pdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBw
b3J0LmMKQEAgLTEzNyw3ICsxMzcsMTEgQEAgUGNhdFBjaVJvb3RCcmlkZ2VQYXJzZUJhcnMgKAog
ICAgICAgICAgIExlbmd0aCA9IExlbmd0aCB8IExTaGlmdFU2NCAoKFVJTlQ2NCkgVXBwZXJWYWx1
ZSwgMzIpOwogICAgICAgICAgIExlbmd0aCA9ICh+TGVuZ3RoKSArIDE7CiAKLSAgICAgICAgICBN
ZW1BcGVydHVyZSA9IE1lbUFib3ZlNEc7CisgICAgICAgICAgaWYgKEJhc2UgPCBCQVNFXzRHQikg
eworICAgICAgICAgICAgTWVtQXBlcnR1cmUgPSBNZW07CisgICAgICAgICAgfSBlbHNlIHsKKyAg
ICAgICAgICAgIE1lbUFwZXJ0dXJlID0gTWVtQWJvdmU0RzsKKyAgICAgICAgICB9CiAgICAgICAg
IH0KIAogICAgICAgICBMaW1pdCA9IEJhc2UgKyBMZW5ndGggLSAxOwotLSAKMi43LjQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
