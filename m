Return-Path: <SRS0=J13s=EC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5044C388F9
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 13:44:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BE3821707
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 13:44:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="bdReNmeS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BE3821707
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.12854.33247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXPGh-0001bE-Nj; Tue, 27 Oct 2020 13:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12854.33247; Tue, 27 Oct 2020 13:44:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXPGh-0001b7-JP; Tue, 27 Oct 2020 13:44:07 +0000
Received: by outflank-mailman (input) for mailman id 12854;
 Tue, 27 Oct 2020 13:44:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=txzK=EC=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kXPGg-0001b2-Az
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:06 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8df44da4-c4c6-4015-899c-7111f422603c;
 Tue, 27 Oct 2020 13:44:03 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kXPGd-0007vu-NW
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:03 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kXPGd-00023F-MO
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:03 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kXPGb-0002Uo-Rf; Tue, 27 Oct 2020 13:44:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=txzK=EC=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kXPGg-0001b2-Az
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:06 +0000
X-Inumbo-ID: 8df44da4-c4c6-4015-899c-7111f422603c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8df44da4-c4c6-4015-899c-7111f422603c;
	Tue, 27 Oct 2020 13:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=W8kgjbVEV7/nGoVLukrqwqdL8zpPCmjDYWvWoU+BKAk=; b=bdReNmeSoCnBKRfDwUoTsyN34u
	RRGfoqiebkV4ULig7/g08T7mo5/wbAB6juGozae7rwBpjdgbmvIszTHjaq5hAzeOyZ7dZXkfYzb0q
	65elxdgA3K8NqnF+afNDJS9xYP1GmHAQ95++onQbt5FoKQr1+GX8bnWfmTEQqYFVUWGQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGd-0007vu-NW
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:03 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGd-00023F-MO
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:03 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGb-0002Uo-Rf; Tue, 27 Oct 2020 13:44:01 +0000
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 1/7] README: Fix a typo
Date: Tue, 27 Oct 2020 13:43:48 +0000
Message-Id: <20201027134354.25561-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201027134354.25561-1-iwj@xenproject.org>
References: <20201027134354.25561-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 1703e076..ef6c4e60 100644
--- a/README
+++ b/README
@@ -655,7 +655,7 @@ HostProp_<host>_PowerILOM
         unsupported     Fails whenever a power operation is needed
 
         msw [--apc6] <pdu> <port-name-regexp|port-num>
-             Control and APC masterswitch via SNMP.  The SNMP
+             Control an APC masterswitch via SNMP.  The SNMP
              community is `private'.  See the `pdu-msw' script.
 
         ipmi <mgmt> [<user> [<pass> [<ipmitool options...>]]]
-- 
2.20.1


