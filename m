Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479EDC5516F
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 05:07:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381107.1624700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqktg-0003mE-6J; Mon, 03 Aug 2026 05:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381107.1624700; Mon, 03 Aug 2026 05:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqktg-0003m5-3J; Mon, 03 Aug 2026 05:07:32 +0000
Received: by outflank-mailman (input) for mailman id 1381107;
 Mon, 03 Aug 2026 05:07:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wqktf-0003fS-4Y
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 05:07:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqkte-00DMN1-Hk
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 07:07:30 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a702203-bab6-0a2a0a5309dd-0a2a450b8eae-44
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:07:30 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a702212-b7e8-0a2a450b0019-d1558034e9ac-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:07:30 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4955de8797cso9107745e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 22:07:30 -0700 (PDT)
Received: from notebook.. ([78.173.117.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b917efsm310345185e9.11.2026.08.02.22.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 22:07:29 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785733650; x=1786338450; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JMMpBw4vbiYd/isxZEkW0aMhzAaKpMobKqilYthaK3Q=;
        b=Wp06fp7foYAnABLEJc4NYwHmXkWBaExspDvCGo4STNyI6Tf8//6mewsVoCIMZn9bFm
         NQHJg/VFr2XVPQdKPrOclQrQIiqp7BixscQAS0eYURiFTv00ZGHrab/r3KJIbmVVlAFg
         wN5RTLVk6rhyGnvRjjkwZxeF2msgaAwHML3QWOQ+E+NmDVsiWr/a0J0q5maq2EfL0+XL
         HRdLLinvJPmowhPUt/Ixxu4Jgvqu97BD1RoG8qFDqGWgMh5B4cyO/QjC4mm4/n3KwMvN
         al5GvX0AnFc+A0xHN2alfvrEdCSz75Lc+ZshthfjmNxX85SEo4mTkHczDmdnbooy9Wr5
         9daQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785733650; x=1786338450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JMMpBw4vbiYd/isxZEkW0aMhzAaKpMobKqilYthaK3Q=;
        b=J2DHJ5nJNcsuQ7WPmDVjO3I1+/wi0ee5GmwNpC41pRUuIEmskffz+gMyLbzaL9JyFN
         /IYwqSrmyeUrOeklk2BYNd06xYaHKqdBwlAS9iSFohF1zSmEfpifXXyBGB1kXx3Fg6SO
         eiLSPXokXGgontFm8L8GUTwHHek6y+SE3ZYIJVMxhqGDg5lwkboOUYz5YgKkYmir+bNp
         DWZsoGcHkqDscG0jDjCpHu+56dHfvx4j3H6RP4DbEJUbETBxJaanDicuX6jGAVh4uic+
         ymETxyks/hdL3jawjxt7O4fHGVuHZIz5gbVfDHWcah/AmDWceIHe/uVrCvEEghuIuC3+
         Mhcw==
X-Gm-Message-State: AOJu0Ywftkr+24lSEORak2pvgnutdQOb0UILBO/THiyk6WH3vS93ZYfp
	6lLJtNfNOs+45O12X1MGrg1jS+EcLz3zxdUdPMRrsYofUDuyvg6T/5cgJcoQig==
X-Gm-Gg: AR+sD10d+tkzIz7FUfNLEyV+NgiNVZ3DgfuFrxUtv8btQDCXyvDWdfJYTUp/+rcffi8
	5AnNReXsa7Q4Oq2Bnhfh71np9omhVPoOhnWoNgAOhtvmcNR1/p3UhSAYEn7eG8uE8BXc2Mo/Xt/
	sL3Q62cU233aVS1HeU0iej5tDkXYr8eWA5VzCmdQp+MzjXnKxIiL34z7O1LD6DEXoqnU16DyOne
	IEkkjSpRCbbTVlhPgeW1Blclvm02y0+XuHcyZ90M9iDE3wud4fxjc4zVS6TXPxFvg2BiQ6xUswg
	Mb4Q0b/tX8fRy44Bgco+7S4dbOhYbiPnOsmvd/VV7TRHUHeCSko8SM4NNyN8mEAZUE/non9FX5S
	yXD17u+Bs2Pf4zWDcXgUazJe0Xd1TSgKA3GLxqS4VYMzLEqGkv8nd+Sxqxa5NgEK1W+2sNaxTMk
	w6Og8Th/Si64l7Slvb9XvDJxpdPsDgDn9k9zwrd/zFjKaueUtu8gApLfu76WYhRw==
X-Received: by 2002:a05:600c:3488:b0:493:e6f7:ad75 with SMTP id 5b1f17b1804b1-4980c653e15mr179910915e9.11.1785733649963;
        Sun, 02 Aug 2026 22:07:29 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	jgross@suse.com,
	gwd@xenproject.org,
	dfaggioli@suse.com,
	stewart.hildebrand@amd.com,
	nathan.studer@dornerworks.com,
	roger@xenproject.org,
	anthony.perard@vates.tech,
	julien@xen.org,
	sstabellini@kernel.org,
	michal.orzel@amd.com,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	teddy.astie@vates.tech,
	tpearson@raptorengineering.com,
	alistair.francis@wdc.com,
	connojdavis@gmail.com,
	oleksii.kurochko@gmail.com,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH 5/7] xen/sched: arinc653: migrate to new sched_ops
Date: Mon,  3 Aug 2026 08:06:12 +0300
Message-Id: <20260803050614.5222-6-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803050614.5222-1-frn1furkan10@gmail.com>
References: <20260803050614.5222-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1785733650-1B8D19EA-0CF7C641/0/0
X-purgate-type: clean
X-purgate-size: 1571

Declare sched_arinc653_def as a struct sched_ops instead of a struct
scheduler, dropping the .sched_data field, and register it with
REGISTER_SCHED_OPS() so it is found through sched_ops_array[]
instead of schedulers[].

This moves the arinc653 scheduler onto the new sched_ops
registration path.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/common/sched/arinc653.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 32c596a23c..efcaa44089 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -702,17 +702,10 @@ a653sched_adjust_global(const struct scheduler *ops,
 }
 #endif /* CONFIG_SYSCTL */
 
-/**
- * This structure defines our scheduler for Xen.
- * The entries tell Xen where to find our scheduler-specific
- * callback functions.
- * The symbol must be visible to the rest of Xen at link time.
- */
-static const struct scheduler sched_arinc653_def = {
+static const struct sched_ops sched_arinc653_def = {
     .name           = "ARINC 653 Scheduler",
     .opt_name       = "arinc653",
     .sched_id       = XEN_SCHEDULER_ARINC653,
-    .sched_data     = NULL,
 
     .init           = a653sched_init,
     .deinit         = a653sched_deinit,
@@ -743,7 +736,7 @@ static const struct scheduler sched_arinc653_def = {
     .dump_cpu_state = NULL,
 };
 
-REGISTER_SCHEDULER(sched_arinc653_def);
+REGISTER_SCHED_OPS(sched_arinc653_def);
 
 /*
  * Local variables:
-- 
2.34.1


