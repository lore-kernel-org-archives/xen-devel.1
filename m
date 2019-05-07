Return-Path: <SRS0=TnSW=TH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C21C004C9
	for <xen-devel@archiver.kernel.org>; Tue,  7 May 2019 16:11:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BABF20825
	for <xen-devel@archiver.kernel.org>; Tue,  7 May 2019 16:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BABF20825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO2gP-0006s5-HP; Tue, 07 May 2019 16:11:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M5sH=TH=citrix.com=prvs=0233d00f1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hO2gN-0006ry-WB
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 16:11:08 +0000
X-Inumbo-ID: b69327d2-70e2-11e9-92a3-b7811966b566
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b69327d2-70e2-11e9-92a3-b7811966b566;
 Tue, 07 May 2019 16:11:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,442,1549929600"; d="scan'208";a="85225628"
From: Wei Liu <wei.liu2@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 7 May 2019 17:11:01 +0100
Message-ID: <20190507161101.10232-1-wei.liu2@citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] gitlab-ci: avoid deleting
 build-each-commit-gcc.log
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
Message-ID: <20190507161101.IFrL-3t6oJhkzfXyFx3ek3-ubb4fZtXI1c3yAe309TA@z>

MDcyYTk2YzQ5MDEgdXNlZCBgZ2l0IGNsZWFuIC1mZmR4YCB3aGljaCBjYXVzZWQgdGhlIGxvZyB0
byBiZSBkZWxldGVkLgoKR2VuZXJhdGUgdGhlIGxvZyBpbiB0aGUgcGFyZW50IGRpcmVjdG9yeSB0
aGVuIG1vdmUgaXQgYmFjay4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+Ci0tLQogYXV0b21hdGlvbi9naXRsYWItY2kvdGVzdC55YW1sIHwgMyArKy0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9h
dXRvbWF0aW9uL2dpdGxhYi1jaS90ZXN0LnlhbWwgYi9hdXRvbWF0aW9uL2dpdGxhYi1jaS90ZXN0
LnlhbWwKaW5kZXggZDQ1NTZhZmUxMS4uN2JhMjBhNTFkYSAxMDA2NDQKLS0tIGEvYXV0b21hdGlv
bi9naXRsYWItY2kvdGVzdC55YW1sCisrKyBiL2F1dG9tYXRpb24vZ2l0bGFiLWNpL3Rlc3QueWFt
bApAQCAtNyw3ICs3LDggQEAgYnVpbGQtZWFjaC1jb21taXQtZ2NjOgogICAgIFhFTl9UQVJHRVRf
QVJDSDogeDg2XzY0CiAgICAgQ0M6IGdjYwogICBzY3JpcHQ6Ci0gICAgLSAuL2F1dG9tYXRpb24v
Z2l0bGFiLWNpL2J1aWxkLWVhY2gtY29tbWl0LnNoIDI+JjEgfCB0ZWUgYnVpbGQtZWFjaC1jb21t
aXQtZ2NjLmxvZworICAgIC0gLi9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC1lYWNoLWNvbW1p
dC5zaCAyPiYxIHwgdGVlIC4uL2J1aWxkLWVhY2gtY29tbWl0LWdjYy5sb2cKKyAgICAtIG12IC4u
L2J1aWxkLWVhY2gtY29tbWl0LWdjYy5sb2cgLgogICBhcnRpZmFjdHM6CiAgICAgcGF0aHM6CiAg
ICAgICAtICcqLmxvZycKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
