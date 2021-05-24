Return-Path: <SRS0=hLJu=KT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D4AC2B9F7
	for <xen-devel@archiver.kernel.org>; Mon, 24 May 2021 20:43:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCCA76140B
	for <xen-devel@archiver.kernel.org>; Mon, 24 May 2021 20:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCCA76140B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.131957.246388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHQ0-0000h9-Na; Mon, 24 May 2021 20:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131957.246388; Mon, 24 May 2021 20:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHQ0-0000g7-GY; Mon, 24 May 2021 20:43:20 +0000
Received: by outflank-mailman (input) for mailman id 131957;
 Mon, 24 May 2021 20:43:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+P1=KT=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1llHLK-0001ey-TK
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 20:38:30 +0000
Received: from mail-qt1-x830.google.com (unknown [2607:f8b0:4864:20::830])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78775fdc-6b0a-4a6a-bd06-66fc0f96909c;
 Mon, 24 May 2021 20:37:50 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id t17so3827254qta.11
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 13:37:50 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id t25sm5142847qkt.62.2021.05.24.13.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 13:37:49 -0700 (PDT)
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
X-Inumbo-ID: 78775fdc-6b0a-4a6a-bd06-66fc0f96909c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=Bztafs77V0wo2Yc5MZ62RAYiSnYmIu905Zy3uFkoAyc=;
        b=cdXgCVQ+7s6+xPZNj+r8PDZUWI1D+Vftou8HktB14FbDErTgnUErpGU4xv4Nd2u1gs
         ynZuviK53q1aM6RIaNFdfgGodt8Nou1pzDOFUnma5aoZ3GEh65gTRozhdUT7s9uLqARo
         XqMRljIvrUxuT1fWiAklcU3tHmG3Sdf/xHtVkrhxV4tOKThioNzjcT+5gQmo2cSAsJjk
         FISwHGqNCoSHsonhqt3SF655BVjXNTtTD+bBPcwe8tgpPk2F7IAFumqBTfdoReYOspa3
         YbifWz2w+OVqpvysiNBOiWEjFKzy1bGEMojWIdVSfoY+PKPYG+5xBClqGS8D7WwqBrNw
         qtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=Bztafs77V0wo2Yc5MZ62RAYiSnYmIu905Zy3uFkoAyc=;
        b=LXFPA7M78iw53fSnm0z+VOP0cRaZfcZXm3zp0CCzn7pj9Hj6jMm0kKIiqc6tIACtEf
         2ZoM3Wk3VIENoq45l7mwxnHrdxTBvfJ2LH9RJ7w2mjbt8XwQYjdh4HshtXiJKNzBkk+c
         a0e2W77xF5hVhRWyZmene9PkLraHrd1sCDzEloMoW6eDAFpVuZxEj98tDie3SyOr0djj
         AdXAf9d7VZ9SHQRlU5Td0VZ+6s6/uI2hrRK+XfVYnkF27G9GdOHigDDovFsuM73ArlPr
         BFHbYnsxNBiXBGoPvoe41SvW5zRspEQ4KhjVdIqKEubHRl4dM89wkF8dxjyEIv73Rgpp
         VoZQ==
X-Gm-Message-State: AOAM5329e8gQDBE8PO4APTPVAFldMIk1QjdIkXZ0vmGcULjjxPkJuBoj
	1Ic4ulrsgnyLrw0ngKH3mDs=
X-Google-Smtp-Source: ABdhPJyxooUFZcWV9TBoDhn+5+SpABivWW2mrNmvKSUR2/ceaeSNRpOwPHMdcSvtO7JEmUQ9xrGoYg==
X-Received: by 2002:ac8:4252:: with SMTP id r18mr25958491qtm.82.1621888669896;
        Mon, 24 May 2021 13:37:49 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.prg,
	xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [RESEND PATCH 10/12] golang/xenlight: add SendTrigger wrapper
Date: Mon, 24 May 2021 16:36:51 -0400
Message-Id: <7788e3f5f1af622782ede1b879f4f02ec63fa546.1621887506.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>

Add a warpper around libxl_send_trigger.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/xenlight.go | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index 1e0ed109e4..d153feb851 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -1367,3 +1367,14 @@ func (ctx *Context) DomainDestroy(domid Domid) error {
 
 	return nil
 }
+
+// SendTrigger sends a Trigger to the domain specified by domid.
+func (ctx *Context) SendTrigger(domid Domid, trigger Trigger, vcpuid int) error {
+	ret := C.libxl_send_trigger(ctx.ctx, C.uint32_t(domid),
+		C.libxl_trigger(trigger), C.uint32_t(vcpuid), nil)
+	if ret != 0 {
+		return Error(ret)
+	}
+
+	return nil
+}
-- 
2.17.1


