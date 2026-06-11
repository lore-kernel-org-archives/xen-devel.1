Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247F8CD98D5
	for <xen-devel@archiver.kernel.org>; Thu, 11 Jun 2026 12:32:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1335444.1597664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXea3-0006uV-OA; Thu, 11 Jun 2026 12:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335444.1597664; Thu, 11 Jun 2026 12:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXea3-0006uO-LX; Thu, 11 Jun 2026 12:32:19 +0000
Received: by outflank-mailman (input) for mailman id 1335444;
 Thu, 11 Jun 2026 12:32:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <michael.bommarito@gmail.com>) id 1wXea1-0006uC-Rw
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 12:32:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXea1-002Uok-1n
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:32:17 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <michael.bommarito@gmail.com>)
 id 6a2aaacd-bab6-0a2a0a5309dd-0a2a4504c934-10
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 14:32:17 +0200
Received: from [209.85.222.52] (helo=mail-ua1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <michael.bommarito@gmail.com>)
 id 6a2aaad0-1dec-0a2a45040019-d155de34e958-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 14:32:16 +0200
Received: by mail-ua1-f52.google.com with SMTP id
 a1e0cc1a2514c-961556c15ceso2514169241.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 05:32:16 -0700 (PDT)
Received: from server0 (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9160b02f758sm171220685a.36.2026.06.11.05.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 05:32:14 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781181135; x=1781785935; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hGPUMpfdaDQCNkNjTMnCmLU/jdnRUY0BJXqb4atgwFI=;
        b=rydqUrDoo15CSfiGUIdjxR+2fWJ/4cuq/oP52v6Upu9/6wRrdpZUaZQjehS6gyPd8i
         7buV73GpBPdXsrGgGZ/43WGiktQkQbcFNpIgAqmPFEm6G04DUCtz2tfmnmndP7X1cV0E
         wLPYQ+7DV/3AJ3UxOsO2VSAGbgzbcidAJ1UjVAgPQ6J6nQVdoRunOfKOaWx5vPCR0IzX
         9Fvad/dM6tPUrk8Q0g85lPwxKxsvnb4hB4itHLZZPVEwdRX8yKw8qMYtYpvBYhQ2UbnC
         FzsZFLPeC/CNTPl1dDs3h+T6xBGJqOL/VXvBw/JWbmh4o7nc+yBoCgGRHODrboNaQtnb
         NClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781181135; x=1781785935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGPUMpfdaDQCNkNjTMnCmLU/jdnRUY0BJXqb4atgwFI=;
        b=NzAgOZtOj3NAsvxkkoyQsUmmNO385oC4G8QRBA0AJOP6E/h6u5jxJOSZHj4XpPiZ2Y
         c5VoEtw8+o+XVQnPD+HfjB2BFc5TxkizltDufsPekMw9KV7ivwi147x+maTMEp58D3q5
         XoTho14tw+y8fNQcea7zTvNKcxV+LbxFaxNDgGC/xnY7eJkpy0yp03XxxZuis+n8z4vx
         z3vmg2EJqQhV2af0rKgCFnkfCmlC1oSra1sFXdbgk6ywKBlZo8xTRCNrpgPGE6l/Ij32
         tSosQv8pomL+u9jn6qTp0Qt/JwqjS8WCP+WlY2refutcV+URq3Y20hp681YumXbtOgNG
         HG4w==
X-Gm-Message-State: AOJu0YzDFIxmzN2TB+lc7A1PKm4pxBKVlx7Ytiysw/xqKOfj6ago1DY8
	ghkcelUxeoZTIKsnBZ0RHlpeK5zhORfBWikjqCQLXYjvOYvbh+WvLZF/
X-Gm-Gg: Acq92OG3jdQIYpFuwUFnWD2QvuqIq7bvzfUZh0Jr5j1qIzkwJWkbNl98QxBhFtp8HVP
	Xp7XkMHtK4aG8APBzd8BvWhG0UQEwNY9eS8Kn+kYmL3d0StaeXWcOyzyrMQqws3ycBmkQFH7YDL
	XYaGCvf923PfwPQY3V+GCk1o5/3HS9/CRVcyZa9KX+k/O++A2CUYkE5oTEBrDsKZda7TgRu/cvS
	XbFLxqsa28zCqFBGNGsSnYJI1Kx3PwajmyADhiqHcGp7VMkIkSOW6IdKafZjjqDk9+x5pddm1Bi
	sdZKnWAa3LZVWeAn/ug44jv1abFhUpLBblitOL/jV+PNRqYSffjEM93b7o7RKnePFCQ3G0Os5pt
	0Is23I/KTIP4b6Adp7x+b4+6f+t9vojRB+ZoknV9aUnYGuUEYjng4VsH790V3nc/TFMQ1fXkmwR
	Scr+2ldhBNTsPZDOLwBBzJhA14fEeRCjZNR/dfeXvynQS4F2pXsxwjIi742f6jp+709o+xvoU7g
	LLlOmKaunCbOLnpYS+G85RmW0kIGTlQ9hsD1DjtQg==
X-Received: by 2002:a05:6102:442c:b0:6c2:e290:cc75 with SMTP id ada2fe7eead31-71d5989b9demr795299137.4.1781181135386;
        Thu, 11 Jun 2026 05:32:15 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] xen/scsiback: fix command-tag handling on pre-completion error paths
Date: Thu, 11 Jun 2026 08:30:44 -0400
Message-ID: <20260611123046.2323342-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1781181137-289723FF-F64FD054/0/0
X-purgate-type: clean
X-purgate-size: 1553

scsiback_get_pend_req() hands a pvSCSI frontend request a session tag and
a zeroed se_cmd.  Two error paths that run before the command completes
through the target core mishandle that command and leak (or, in one case,
underflow) the tag.

Impact: a pvSCSI guest can exhaust a LUN's per-session command tag pool,
stopping the LUN, via crafted ring requests; for the first case the
refcount underflow also panics the host under panic_on_warn.

Patch 1 fixes scsiback_do_cmd_fn(): on a failed grant map and on an
unknown request type the never-initialised command (cmd_kref == 0) is
freed with transport_generic_free_cmd(), which underflows the zero
refcount and leaks the tag.

Patch 2 fixes scsiback_device_action(): when target_submit_tmr() fails the
err: path frees nothing.  transport_generic_free_cmd() cannot be used there
either, since the command is initialised by then and se_tmr_req has already
been freed on one error sub-path.

Both paths go through one helper that returns just the tag.

Patch 1's underflow was reproduced on a Xen dom0 (guest to host, with a
panic_on_warn host panic); with the series applied the same request is
handled with no underflow.

Michael Bommarito (2):
  xen/scsiback: free unsubmitted command instead of double-putting it
  xen/scsiback: free the command tag on the TMR submit-failure path

 drivers/xen/xen-scsiback.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)


base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.53.0


