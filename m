Return-Path: <SRS0=ZsuC=B5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85181C433DF
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2020 16:02:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A0B72078D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2020 16:02:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="VtpLcTTq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A0B72078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8QXA-0006xf-RH; Wed, 19 Aug 2020 16:01:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7ZT=B5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k8QX9-0006xV-C7
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 16:01:51 +0000
X-Inumbo-ID: 536dd229-3010-4b17-a465-de0cd6a17819
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 536dd229-3010-4b17-a465-de0cd6a17819;
 Wed, 19 Aug 2020 16:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597852909;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=tXliQfKEqR2KQnWLoHxYo3qwWsX+Tu3uXd33VvUFv6U=;
 b=VtpLcTTqyfcXKbVJHuJh/JqkwTjl6H3vaQCSDbrGMJtPgfh9KKWZ6zZl
 OpCQfrwsL1tJl4URNIQ3Y2vvHA8wHWQwaNtCvq85tDv/Elbn1T8GYDY/M
 dB3ObVxRWq0gNZJjtWRY1Mr5RnTIeZmE+il6ft2aFjrtw4iJdVy1gTf4M w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 5dPl25QwrSdiMAGUJxq61YY2NbqeliYERbfDD+Ylvd0xsqHsjLNdisQO2KDfE7mcVW6UJG6Zcd
 PhXosRJ85krl+nG1NrF/5/zNFxFS32aG28To7yYlrx0dLV5ki2/omUGji2rmoXwfdFOdD0kfCW
 8ZXKnV0/RsBmmFFqtzYuhLxBdmQJ9WXcQ25L6Hg38/rqhDBD6dVylogq23nm3G85FjbsCvh2h+
 C/ClJoMdfaFjgXq38UaenDzEUtPoYL2HQvPrHpKVp7yCGyLCs7avwS+Kb/LJzC4IPAODmAX23b
 ZB8=
X-SBRS: 2.7
X-MesageID: 25801619
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,331,1592884800"; d="scan'208";a="25801619"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 0/7] host allocation: Performance improvements
Date: Wed, 19 Aug 2020 17:01:36 +0100
Message-ID: <20200819160143.11178-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ian Jackson (7):
  ts-hosts-allocate-Executive: Fix broken call to $duration_estimator
  resource allocation: Provide OSSTEST_ALLOC_FAKE_PLAN test facility
  ts-hosts-allocate-Executive: Do a pre-check
  duration estimates: Memoise results
  host allocation: Memoise duration estimates
  host allocation: Memoise $equivstatus query results
  schema: Provide index on flights by start time

 Osstest/Executive.pm             | 40 +++++++++++++++++++++++++++++++++++++---
 schema/flights-started-index.sql |  7 +++++++
 ts-hosts-allocate-Executive      | 26 ++++++++++++++++++--------
 3 files changed, 62 insertions(+), 11 deletions(-)
 create mode 100644 schema/flights-started-index.sql

-- 
2.11.0


