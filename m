Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD1DC10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 422F620850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 422F620850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAa-00072d-2A; Wed, 10 Apr 2019 14:25:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAR-0006ie-Rs
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:35 +0000
X-Inumbo-ID: 8012c598-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8012c598-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227721"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:47 +0100
Message-ID: <20190410142408.22848-42-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 41/62] ts-debian-fixup: Use
 debian_overlays_fixup_cmd
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142347.lgEUUdP_mQF95GBZqayTA__s0E63LE242lTVRdX3y6k@z>

T3RoZXJ3aXNlIHdlIGdldCB0aGUgc2FtZSBlcnJvciBmb3IgZ3Vlc3RzIGFzIHdhcyBwcmV2ZW50
ZWQgZm9yIGhvc3RzCmJ5ICJwcmVzZWVkX2Jhc2U6IGNobW9kIHNzaCBob3N0IHByaXZhdGUga2V5
cyB0byBwbGFjYXRlIHNzaGQiLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMtZGViaWFuLWZpeHVwIHwgNSArKysrKwogMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3RzLWRlYmlhbi1maXh1cCBi
L3RzLWRlYmlhbi1maXh1cAppbmRleCAwZTU1M2Q0Ny4uN2Q5ZDAzOTggMTAwNzU1Ci0tLSBhL3Rz
LWRlYmlhbi1maXh1cAorKysgYi90cy1kZWJpYW4tZml4dXAKQEAgLTIwNiw3ICsyMDYsMTIgQEAg
c2F2ZWNmZygpOwogZXRoZXIoKTsKIHRhcmdldF9rZXJua2luZF9jaGVjaygkZ2hvKTsKIGFjY2Vz
cygpOworCiBkZWJpYW5fb3ZlcmxheXMoJGhvLCBcJm92ZXJsYXkpOwordGFyZ2V0X2NtZF9yb290
KCRobywgPDxFTkQuZGViaWFuX292ZXJsYXlzX2ZpeHVwX2NtZCgkaG8sICRtb3VudHBvaW50KSk7
CitzZXQgLWV4CitFTkQKKwogY29uc29sZSgpOwogZmlsZXN5c3RlbXMoKTsKIG90aGVyZml4dXBj
ZmcoKTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
