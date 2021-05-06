Return-Path: <SRS0=KcDw=KB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6E6C433B4
	for <xen-devel@archiver.kernel.org>; Thu,  6 May 2021 14:00:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E6DC610FC
	for <xen-devel@archiver.kernel.org>; Thu,  6 May 2021 14:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E6DC610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.123545.233060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeYF-0007kN-Nv; Thu, 06 May 2021 14:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123545.233060; Thu, 06 May 2021 14:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeYF-0007j2-H1; Thu, 06 May 2021 14:00:27 +0000
Received: by outflank-mailman (input) for mailman id 123545;
 Thu, 06 May 2021 14:00:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NmKg=KB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1leeYD-0003iB-Nt
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 14:00:25 +0000
Received: from mail-qt1-x833.google.com (unknown [2607:f8b0:4864:20::833])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10e26b75-1e83-45b8-9c17-a6a2f03adc2a;
 Thu, 06 May 2021 14:00:01 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id c11so3938904qth.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 May 2021 07:00:01 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:6095:81da:832e:3929])
 by smtp.gmail.com with ESMTPSA id
 189sm2069992qkh.99.2021.05.06.07.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 07:00:00 -0700 (PDT)
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
X-Inumbo-ID: 10e26b75-1e83-45b8-9c17-a6a2f03adc2a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jlN6pfqKDZP3Jzb3yYX+3eh3XU7QBQjlR000MozME8g=;
        b=olpNpbuLF3uupDB/Jnzg/BOqPZl3l1tFa8X5wgL8uGPhV+PEUVQmFfEAPwLTRmKseC
         lKHYkl+/+hRXM5y5vtL3IPop5/gM4SssGwRL7KAAS3peLOvVFqknK66658dkwnZ06Tkb
         p4qBWpN/bbXC+RVs9e+CXixT+xptECMK5q2DUGHE3BPi3SqgxJo5lVxBW2tWGhqQRkYs
         1lgQi7T0aI3dmrJD0o5vU4sJyw9wza5FkA4+WMb29ydenUjVybcH688U0EXbGT//7Bm2
         dJ38P8YAYDmXrKmKZUwr8MEazYjxrbMcWRwEOOedbCWcRZMKT33XY/HeQt8sMHmqun8j
         h8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jlN6pfqKDZP3Jzb3yYX+3eh3XU7QBQjlR000MozME8g=;
        b=t0a4ZfZSxjvgjH03qHeUtIpM4i1mnc7wwRTUtH4DxykfMIIIvxMhZ7DWHTmGqgkMjK
         PKct7ud5T2ahuj36E7f4fuXCjMi0CU2+kSj16wV3663r4ImpGwNUMXOELk38pY/8cXDt
         Jpysi0aOIsoeGBr6ilsSPiQSHxhcb1em55rS89RJCnXurXoKaa35ko7t0luswTvZn8Kw
         yvZ5tmNavCHN29UCu9PAsrJ9u7X8wUKoeAnUqLZYzCkPPUlHxjVjGF7RdRnFLje+ISsi
         LaLQ6puUHBgAg2feLPAEFrXquf4VLkTNJCo+fHTULSUNp2jnQs7veTkEDXOYBiBGZx3P
         O5ng==
X-Gm-Message-State: AOAM532EkoYO9FRqdkRFW9UpAPdtO7BjVXyePJA8QJf+1qw9Phl7nojm
	BOschGpfC9J/cHbnSFK5TBCPKeW1jFI=
X-Google-Smtp-Source: ABdhPJwNpmmBhCUN1SbJ1hejGCXJjDYOTk3/yub1eoBDphC5tpbqaqa9CF5zSno/mhIN93VXZAWRjQ==
X-Received: by 2002:ac8:5c14:: with SMTP id i20mr4477274qti.175.1620309601296;
        Thu, 06 May 2021 07:00:01 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 07/13] vtpmmgr: Flush all transient keys
Date: Thu,  6 May 2021 09:59:17 -0400
Message-Id: <20210506135923.161427-8-jandryuk@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506135923.161427-1-jandryuk@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We're only flushing 2 transients, but there are 3 handles.  Use <= to also
flush the third handle since TRANSIENT_LAST is inclusive

The number of transient handles/keys is hardware dependent, so this
should query for the limit.  And assignment of handles is assumed to be
sequential from the minimum.  That may not be guaranteed, but seems okay
with my tpm2.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
v2 add "since TRANSIENT_LAST is inclusive" to commit message.
---
 stubdom/vtpmmgr/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubdom/vtpmmgr/init.c b/stubdom/vtpmmgr/init.c
index 56b4be85b3..4ae34a4fcb 100644
--- a/stubdom/vtpmmgr/init.c
+++ b/stubdom/vtpmmgr/init.c
@@ -656,7 +656,7 @@ static TPM_RC flush_tpm2(void)
 {
     int i;
 
-    for (i = TRANSIENT_FIRST; i < TRANSIENT_LAST; i++)
+    for (i = TRANSIENT_FIRST; i <= TRANSIENT_LAST; i++)
          TPM2_FlushContext(i);
 
     return TPM_SUCCESS;
-- 
2.30.2


