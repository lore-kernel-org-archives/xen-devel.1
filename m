Return-Path: <SRS0=FkqA=62=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 093EAC2D0F7
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2020 17:52:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2ADC206A5
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2020 17:52:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=dornerworkssystem.onmicrosoft.us header.i=@dornerworkssystem.onmicrosoft.us header.b="NW72o35J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2ADC206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dornerworks.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYZ4n-0003mt-RT; Tue, 12 May 2020 17:52:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UHzJ=62=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1jYZ4m-0003mh-IL
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 17:52:20 +0000
X-Inumbo-ID: 531af214-9479-11ea-b07b-bc764e2007e4
Received: from USG02-BN3-obe.outbound.protection.office365.us (unknown
 [2001:489a:2202:c::61b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 531af214-9479-11ea-b07b-bc764e2007e4;
 Tue, 12 May 2020 17:52:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=QhD+wVeWCXsol2Vbpue4ZW8ysO1zciA0ZGqSU+6tJh+F1QFUVWLi9NBwBZU27utm1GdUJojmYpM5hKQYb036zZ6AVgMcfedL6dV0Qb6Ha+ccIlquYeB2/5SYMA7umoGqW1o+r593lR4Jj1L/2DrRLXsgg2XFR8qRJ5Xp0XsLSZirzShEWR6nYVBrpU2nTf9OCkfC30UsXWRkanfjQoGGPO7gT49jHnM9chkYURNRsd+HKSM0CanZ2CmCYhe1inYtvgmCXSpUin2TZMpxUSbSYTNFzamhYMzhKNwFlcjQi4dMZCHSSdCZXNAJTdgpvGHauCujRElClIW2Owegf4EoTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMD9YyguV+j7HzlGDJo06t45jT4o8cXWM5ebZCrfrrg=;
 b=OHLIAW951Md8WcBygIaLrK2hFQAmKR1hF0jd0XSCzjuabE4zcRusWMCBonzF1QvlJzcbIEOiYjIVTgNouQMVzmyPEB6Ly5Uy06BMj+dda+g7eUHI2Ipv0IIm+BmXYeeKEnGPpHDO/uUOLWmXp5VOaKfhTkT1FxC1Ebgm58s3dwOYM6QoT8c24kaXKpPetPaLvof9+8h6mM0qrDyz9o48a05EPGTdtF1htB/YUKIlP+LAVRA+Zj0K1Gio90vo/DgL1P4HJn733Bcj0UFL+CQ8s1DmkuGQrhq16/usa4pOrhKtZtw4Lw3E03h0OexurP0eq1Qi47jvRSTMo/xZPRN7Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 207.242.234.14) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=dornerworks.com; dmarc=none action=none
 header.from=dornerworks.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dornerworkssystem.onmicrosoft.us;
 s=selector1-dornerworkssystem-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMD9YyguV+j7HzlGDJo06t45jT4o8cXWM5ebZCrfrrg=;
 b=NW72o35JOLQd5BP3ug7JZUTuuSLkXrJRRU5T5mCDwPaJhv2bvwaRcX8lsIaR7LBcgZAasCuZPtluPhqFNGf9eYpEIUDFrf+9lZEvXKtLcohFEkVUcmbyYNvzeSvqYo5LNcGPgxCC5AfZusTwwZPcRHMqAlraDZXP0RT3C65Kdrw=
Received: from SN1P110CA0026.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:61::16)
 by CY1P110MB0504.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:403::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.25; Tue, 12 May
 2020 17:52:16 +0000
Received: from CY1USG02FT013.eop-usg02.itar.protection.office365.us
 (2001:489a:2202:d::631) by SN1P110CA0026.office365.us (2001:489a:200:61::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.35 via Frontend
 Transport; Tue, 12 May 2020 17:52:15 +0000
Authentication-Results: spf=fail (sender IP is 207.242.234.14)
 smtp.mailfrom=dornerworks.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=dornerworks.com;
Received-SPF: Fail (protection.outlook.com: domain of dornerworks.com does not
 designate 207.242.234.14 as permitted sender)
 receiver=protection.outlook.com; client-ip=207.242.234.14;
 helo=ubuntu.localdomain;
Received: from ubuntu.localdomain (207.242.234.14) by
 CY1USG02FT013.mail.protection.office365.us (10.97.26.98) with Microsoft SMTP
 Server id 15.20.2979.30 via Frontend Transport; Tue, 12 May 2020 17:52:14
 +0000
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: xen-devel@lists.xenproject.org
Subject: [XEN PATCH 2/2] xen/build: use the correct kconfig makefile
Date: Tue, 12 May 2020 13:52:06 -0400
Message-Id: <20200512175206.20314-3-stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512175206.20314-1-stewart.hildebrand@dornerworks.com>
References: <20200512175206.20314-1-stewart.hildebrand@dornerworks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:207.242.234.14; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ubuntu.localdomain; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(346002)(46966005)(33430700001)(6666004)(186003)(33440700001)(956004)(508600001)(36756003)(86362001)(70586007)(1076003)(82310400002)(44832011)(70206006)(2616005)(5660300002)(47076004)(26005)(8936002)(336012)(81166007)(33310700002)(6916009)(2906002)(8676002)(54906003)(4326008);
 DIR:OUT; SFP:1101; 
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 396e9b25-d712-4636-4890-08d7f69d3532
X-MS-TrafficTypeDiagnostic: CY1P110MB0504:
X-Microsoft-Antispam-PRVS: <CY1P110MB0504726D4C13176D353026A58CBE0@CY1P110MB0504.NAMP110.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 17:52:14.5987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 396e9b25-d712-4636-4890-08d7f69d3532
X-MS-Exchange-CrossTenant-Id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=097cf9aa-db69-4b12-aeab-ab5f513dbff9; Ip=[207.242.234.14];
 Helo=[ubuntu.localdomain]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1P110MB0504
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This resolves the following observed error:

#
# merged configuration written to .config (needs make)
#
make -f /path/to/xen/xen/../xen/Makefile olddefconfig
make[2]: Entering directory '/path/to/xen/xen'
make[2]: *** No rule to make target 'olddefconfig'.  Stop.
make[2]: Leaving directory '/path/to/xen/xen'
tools/kconfig/Makefile:95: recipe for target 'custom.config' failed

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>

---
It's possible there are other places where the Makefile path will need
to be changed. This just happened to be the one that failed for me.
---
 xen/tools/kconfig/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/tools/kconfig/Makefile b/xen/tools/kconfig/Makefile
index fd37f4386a..f39521a0ed 100644
--- a/xen/tools/kconfig/Makefile
+++ b/xen/tools/kconfig/Makefile
@@ -94,7 +94,7 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/c
 %.config: $(obj)/conf
 	$(if $(call configfiles),, $(error No configuration exists for this target on this architecture))
 	$(Q)$(CONFIG_SHELL) $(srctree)/tools/kconfig/merge_config.sh -m .config $(configfiles)
-	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
+	$(Q)$(MAKE) -f $(srctree)/tools/kconfig/Makefile.kconfig olddefconfig
 
 PHONY += kvmconfig
 kvmconfig: kvm_guest.config
-- 
2.26.2


