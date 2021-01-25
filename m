Return-Path: <SRS0=xPWR=G4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5586FC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 19:19:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCEE520E65
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 19:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCEE520E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.74337.133609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47O4-0001q8-Ln; Mon, 25 Jan 2021 19:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74337.133609; Mon, 25 Jan 2021 19:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47O4-0001q1-IA; Mon, 25 Jan 2021 19:18:56 +0000
Received: by outflank-mailman (input) for mailman id 74337;
 Mon, 25 Jan 2021 19:18:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTVL=G4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l47FV-0008N7-Ho
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:10:05 +0000
Received: from mail-wm1-x32f.google.com (unknown [2a00:1450:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79271237-14c8-4b31-ad35-d19f1539bb20;
 Mon, 25 Jan 2021 19:09:07 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id f16so366644wmq.5
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 11:09:07 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k6sm12991031wro.27.2021.01.25.11.09.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 11:09:06 -0800 (PST)
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
X-Inumbo-ID: 79271237-14c8-4b31-ad35-d19f1539bb20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VAsD+FeaZvy6J0TsxqgptDfccADq1PaOx6WnTwbiR+g=;
        b=Dlh9p5G57YHlcrwU8i/TTCx4reu0wzKDXrx4OabJDzpPyCEf95g2GRexZQUoLZXmRE
         Uo+gNL77F4QItzjb/V2BbJu4LVn/52dlal+b5rNxbnNt6cTPSjOE5SRPmCVYQHMpGPDL
         UKtOjCFwmnIF1iUoSkVNYCMtpI158FtB003xjCyOjcM6AoXShET2cr6VQOyfwI6c5lcK
         7L4yKvYo6oFIAER3i93FC0shfV5nfg0jrd1gQcfiJAj+eaaCbCJ18MYLnfRww7hLQjTm
         RhCdNUYbPuM5BZG5rDe4ZO7jmcjheJBPfOmIS0PpQlixIf6pAdSHYFFhnXXm2Hr6LD8R
         4iqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VAsD+FeaZvy6J0TsxqgptDfccADq1PaOx6WnTwbiR+g=;
        b=LIqYFnyXZGelv5anluWg+TAgzZfNNIQvoHSnD5OqtxLIbuX2rY3vFxFo+yX1IaLwJH
         MAJfLX1eh/bdACG3XYjSlwFZyFpx3AF77M+AmnJIvfhT9eW5hFnCJ9abzXK66v1nnPZT
         9m6h/I0iUS/bioglE7d6W4YlRKyl1PGfvePFQU3bt1KeZ4ttOuJkSts0K/bLHkTl5oEG
         6SYM6zA970YuvPKUtzB3jT97igkq7zIX/5wdQrivSoVAOPrDscPa5HrdoVCL3cy5yJpl
         xc8QqHmC0eYNY9B1xyfIJ2A4wTI+ditCEv5Iqp4QaPCtcb8bctyqtw0maJGjy7nueu0F
         6SnQ==
X-Gm-Message-State: AOAM5311R2k2Ay87+vXGC2hFv9IWpxlk6W/3v5dg/kzpT2Dz18qHaJBk
	8OaOU9JUIMQ+NvW2KF+9Q4l5elglahEf9g==
X-Google-Smtp-Source: ABdhPJxeEkAcuxneuHRgiPv7tP1j0g/ocU+Y0qchoFbVU7tSJ2sYYSGBuMxfBTx2ZyYurMqAGzsyOA==
X-Received: by 2002:a1c:2d8a:: with SMTP id t132mr1391415wmt.119.1611601746819;
        Mon, 25 Jan 2021 11:09:06 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V5 13/22] xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
Date: Mon, 25 Jan 2021 21:08:20 +0200
Message-Id: <1611601709-28361-14-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The cmpxchg() in ioreq_send_buffered() operates on memory shared
with the emulator domain (and the target domain if the legacy
interface is used).

In order to be on the safe side we need to switch
to guest_cmpxchg64() to prevent a domain to DoS Xen on Arm.
The point to use 64-bit version of helper is to support Arm32
since the IOREQ code uses cmpxchg() with 64-bit value.

As there is no plan to support the legacy interface on Arm,
we will have a page to be mapped in a single domain at the time,
so we can use s->emulator in guest_cmpxchg64() safely.

Thankfully the only user of the legacy interface is x86 so far
and there is not concern regarding the atomics operations.

Please note, that the legacy interface *must* not be used on Arm
without revisiting the code.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Paul Durrant <paul@xen.org>
CC: Julien Grall <julien.grall@arm.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch

Changes V1 -> V2:
   - move earlier to avoid breaking arm32 compilation
   - add an explanation to commit description and hvm_allow_set_param()
   - pass s->emulator

Changes V2 -> V3:
   - update patch description

Changes V3 -> V4:
   - add Stefano's A-b
   - drop comment from arm/hvm.c

Changes V4 -> V5:
   - update patch description
   - rebase
   - add Paul's R-b
---
---
 xen/common/ioreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index de3066a..07572a5 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -29,6 +29,7 @@
 #include <xen/trace.h>
 #include <xen/vpci.h>
 
+#include <asm/guest_atomics.h>
 #include <asm/ioreq.h>
 
 #include <public/hvm/ioreq.h>
@@ -1185,7 +1186,7 @@ static int ioreq_send_buffered(struct ioreq_server *s, ioreq_t *p)
 
         new.read_pointer = old.read_pointer - n * IOREQ_BUFFER_SLOT_NUM;
         new.write_pointer = old.write_pointer - n * IOREQ_BUFFER_SLOT_NUM;
-        cmpxchg(&pg->ptrs.full, old.full, new.full);
+        guest_cmpxchg64(s->emulator, &pg->ptrs.full, old.full, new.full);
     }
 
     notify_via_xen_event_channel(d, s->bufioreq_evtchn);
-- 
2.7.4


