Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8ECCD98CE
	for <xen-devel@archiver.kernel.org>; Thu, 11 Jun 2026 12:32:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1335446.1597682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXea6-0007K7-6g; Thu, 11 Jun 2026 12:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335446.1597682; Thu, 11 Jun 2026 12:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXea6-0007K0-3Y; Thu, 11 Jun 2026 12:32:22 +0000
Received: by outflank-mailman (input) for mailman id 1335446;
 Thu, 11 Jun 2026 12:32:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <michael.bommarito@gmail.com>) id 1wXea5-0007Cf-DT
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 12:32:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXea4-002Uok-QL
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:32:20 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <michael.bommarito@gmail.com>)
 id 6a2aaacd-bab6-0a2a0a5309dd-0a2a4504c934-22
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 14:32:20 +0200
Received: from [209.85.222.174] (helo=mail-qk1-f174.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <michael.bommarito@gmail.com>)
 id 6a2aaad3-1dec-0a2a45040019-d155deaeac03-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 14:32:20 +0200
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-9156ceb55ffso682753885a.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 05:32:19 -0700 (PDT)
Received: from server0 (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9160b02f758sm171220685a.36.2026.06.11.05.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 05:32:17 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781181138; x=1781785938; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGR23VQQ0KIak7ZD7YLq3Alex+Q6WU/vJpcU1WhhyY0=;
        b=SqYRJRjfAsuiK4VUJdw08i8ouV2H2KIYBcZqoX+JBuQIrj1RYMRrYXgSTh6vKMx8pd
         mjdLKJt0D7abDOmQnQrN4zbkqsxb5h9Y5RCwKqgly3tV1xgJGWm/UOuZKKmlI/VnHt56
         RqY9Fid30TE+2i259NOt94bulV6O8On/Y0tjf8KZHu4ETgCxj5uzfCtMjfLEa1yRyqdB
         HkPazyl1yXaIpD17fszyr5ypHn0tCEIVy8xnkITJDR1HGps5IfEpJUMM0lvYetuNA3e2
         tDKgLpKsMt8wwfp1wL0tCURqIyTkRl/ru9VqyH5T3iZ4eZpNArQd0gRJbvUOHMM5VKtW
         aU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781181138; x=1781785938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VGR23VQQ0KIak7ZD7YLq3Alex+Q6WU/vJpcU1WhhyY0=;
        b=J2KNEaW+9+59ZtS+ZjFuYEFUApy7gM8SbmJ9koi8d6sEzZwPs270jFYRdv6173u8Wf
         lo6nWisOwJ5zhvyzQ8U8pO7GKTal9qG7H5nRLqQTaxuKa0Gx4VxNyr043gbOkMv9287I
         eWl5UiCI/FbaSq983ZKTEk+czLTGoj12k1bqTMqx/TY760Txt5exr6HasqxkgVgMgjRG
         Ojm7GLtRFDCEO5mM9RnqXYsKUsrGKHwJPP6Lzp/1nx0N7bjkj34jbaribOdsV/k1E+/X
         ZOD7+/Z3r7OYO5BZhuADExIN7CnCvN8OYPTjtZTDaCnw3vURUIcA56j0nbQhtjFBOmwF
         bCuQ==
X-Gm-Message-State: AOJu0Yywcs/BEZJe62YxaVGciPGcF1EIHpT/4ebjLvhO/bdyaA5qMaTW
	PzjfDCER5TsmDH1k5raZp+kd+hnuU2XRiJzIUD2/7pJfrGHeHrE2lqnvKSetayijMx0=
X-Gm-Gg: Acq92OFhATUnkLtaSznvW7CmlVX4zWqDpUDecu+Dj6QnMBQ4SXOsM5T4XerlliiNC15
	GyuEivsMt8lC1AYQ5lerGjhHP1K5aRrnqs3iL/7gPAqkA2dy7aeXXAD8jRsLVuXPWZ493Ln0Sft
	7Pq0GfkU2edCjbMBUB2ICBD2WXOqCaUbwAmC0Xd+oFjiqMmcuAKRfW8zITDSXgxwQM832w5SMCE
	jCmbG9ime5HtDupldztciMZ3wGW6rY4vllxhjlCqeZJcJcfiuMebl64SYsquNN0yFLOflj7wN0+
	sXY1DxsjMdbdr9o8Ygfu8txLwNHhmgUfbCckGhzf7pSP8okEgI2Gje9EqAlgRQaS84vdfsVtKD6
	4eF/MmwMF4j5ASR6+tQuyKDVIiRh8VUDxXyGern2KcVFUdvk6XBzyiOmaL9FKQ6djXtSLOP6hl5
	ckAPeAvchplYgoJRufcShU1bOrG9Bb13RzBNyL1XXHR0L4ZfAO/4PaN5R0uhsnHbzqd7rtADjrq
	ZGPMO6PnkiZWaznWv8a+yerEy0WkYw=
X-Received: by 2002:a05:620a:17a2:b0:915:3542:ff72 with SMTP id af79cd13be357-9160acc37e6mr365473885a.22.1781181138395;
        Thu, 11 Jun 2026 05:32:18 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] xen/scsiback: free the command tag on the TMR submit-failure path
Date: Thu, 11 Jun 2026 08:30:46 -0400
Message-ID: <20260611123046.2323342-3-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260611123046.2323342-1-michael.bommarito@gmail.com>
References: <20260611123046.2323342-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1781181140-28F753FF-CCF362B0/0/0
X-purgate-type: clean
X-purgate-size: 1697

scsiback_device_action() obtains a command tag in
scsiback_get_pend_req() and submits a task-management request with
target_submit_tmr(). When target_submit_tmr() fails it returns < 0
and scsiback jumps to the err: label, which sends a response but
frees nothing, leaking the tag.

Impact: a pvSCSI guest can leak the command tags of a LUN's
session, stopping the LUN, by issuing VSCSIIF_ACT_SCSI_ABORT or
RESET requests whenever target_submit_tmr() fails.

transport_generic_free_cmd() cannot be used here. By the time
target_submit_tmr() returns an error it has already run
__target_init_cmd() (so se_cmd->cmd_kref is one, not zero), and on
its target_get_sess_cmd() error path it has freed se_cmd->se_tmr_req
via core_tmr_release_req() while leaving SCF_SCSI_TMR_CDB set and
the pointer dangling. Letting the command release run
target_free_cmd_mem() would then double-free se_tmr_req.

Use the same helper, which returns just the tag, on this path too.

Fixes: 2dbcdf33dbf6 ("xen-scsiback: Convert to percpu_ida tag allocation")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/xen/xen-scsiback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/xen-scsiback.c b/drivers/xen/xen-scsiback.c
index f324732eba7f8..c7036e0e41bda 100644
--- a/drivers/xen/xen-scsiback.c
+++ b/drivers/xen/xen-scsiback.c
@@ -658,7 +658,7 @@ static void scsiback_device_action(struct vscsibk_pend *pending_req,
 	return;
 
 err:
-	scsiback_do_resp_with_sense(NULL, err, 0, pending_req);
+	scsiback_resp_and_free(pending_req, err);
 }
 
 /*
-- 
2.53.0


