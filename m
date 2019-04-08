Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE41C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:11:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3E9C20883
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3E9C20883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDRFA-0003RQ-Ot; Mon, 08 Apr 2019 10:11:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PEQb=SK=citrix.com=prvs=994fb90f6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDRFA-0003RL-56
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 10:11:12 +0000
X-Inumbo-ID: a1de1359-59e6-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a1de1359-59e6-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 10:11:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,324,1549929600"; d="scan'208";a="82985571"
From: Wei Liu <wei.liu2@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 8 Apr 2019 11:11:08 +0100
Message-ID: <20190408101108.27976-1-wei.liu2@citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] gitlab-ci: log commit range in build test
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
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408101108.E0FOYvPkGDaq7YawMybBG4RIAhhvmv3R87jYwDprV3Q@z>

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
