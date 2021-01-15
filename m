Return-Path: <SRS0=GqSC=GS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7CAC433DB
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 22:29:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E294A2082D
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 22:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E294A2082D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.68656.122936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XbF-0005zO-VJ; Fri, 15 Jan 2021 22:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68656.122936; Fri, 15 Jan 2021 22:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XbF-0005zH-S9; Fri, 15 Jan 2021 22:29:45 +0000
Received: by outflank-mailman (input) for mailman id 68656;
 Fri, 15 Jan 2021 22:29:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0XbE-0005yt-Cc
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:29:44 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd079286-63f5-49b5-988f-056593f7e08d;
 Fri, 15 Jan 2021 22:29:42 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: bd079286-63f5-49b5-988f-056593f7e08d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610749782;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5pQM3lIU9VscMHgCPRTFeVHeDqTEdY/MaJ0UMyKuskM=;
  b=ez28wBQ3YQuDtDPCoo6E51KEmRj/bXqrpYofD/G53X8PydxKLfGEpapr
   5qzK6O69lpjnZnStfp/n8K8KgPvL3MVLaTHYfOxDvMy8M4rPGQbN3G5Kc
   YgrJBDJaRAvTlReG9tfZRhMvH0y1d9fFY7M94tH0FZeVEVNYQa8fPEoTm
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: v3T9mzOxFsM/w1SoMYxm4UeL1Y6fS8wq1xtP8i0zMbVU0QloCamS2eELQ60D1mjE81iKFaG/gj
 qhyp+tvb6IsgoHNRZ5hZseQ7AlBjyA7aFdccmIB6I6ZSklq68src79VmbHaB6yaDPkGxW+aJ8k
 +Xd1WPmo08SA3WQGM29bHfJl3inu/MAIoYOraOnt9bMj7dzPGDeEma/URNB4/fWRDGxhn3Fvep
 IvgiHC8xsX9wKbQxFullRFPW+EVLbVqDdAGXKDXhsbtBEWJ98ACpcNU3zlkURNRBlSaHwnIFni
 D+Y=
X-SBRS: 5.1
X-MesageID: 35262758
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35262758"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Doug
 Goldstein" <cardoe@cardoe.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Subject: [PATCH v2 0/2] oxenstored build enhancements
Date: Fri, 15 Jan 2021 22:28:39 +0000
Message-ID: <cover.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The patches were posted previously, this is a repost after the XSA series.

For convenience here is a tree with all patch series applied:
https://github.com/edwintorok/xen/pull/1

Edwin Török (2):
  automation/: add Ubuntu:focal container
  Makefile: add build-tools-oxenstored

 Makefile                                 |  6 +++
 automation/build/ubuntu/focal.dockerfile | 48 ++++++++++++++++++++++++
 automation/scripts/containerize          |  1 +
 tools/ocaml/Makefile                     |  8 ++++
 4 files changed, 63 insertions(+)
 create mode 100644 automation/build/ubuntu/focal.dockerfile

-- 
2.29.2


