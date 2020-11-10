Return-Path: <SRS0=BOky=EQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BD0C55ABD
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 19:23:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29BB9205CA
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 19:23:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BYj3pLZX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29BB9205CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.23887.50864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcZEs-0007Hq-Di; Tue, 10 Nov 2020 19:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23887.50864; Tue, 10 Nov 2020 19:23:34 +0000
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
	id 1kcZEs-0007Hh-Ab; Tue, 10 Nov 2020 19:23:34 +0000
Received: by outflank-mailman (input) for mailman id 23887;
 Tue, 10 Nov 2020 19:23:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bdNS=EQ=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kcZEr-0007Fc-3o
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 19:23:33 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4fc5809-74db-4bb1-8e36-1f8220cffab0;
 Tue, 10 Nov 2020 19:23:28 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id p8so13183696wrx.5
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 11:23:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p13sm18180232wrt.73.2020.11.10.11.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:23:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B762B1FF91;
 Tue, 10 Nov 2020 19:23:16 +0000 (GMT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bdNS=EQ=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
	id 1kcZEr-0007Fc-3o
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 19:23:33 +0000
X-Inumbo-ID: c4fc5809-74db-4bb1-8e36-1f8220cffab0
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c4fc5809-74db-4bb1-8e36-1f8220cffab0;
	Tue, 10 Nov 2020 19:23:28 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id p8so13183696wrx.5
        for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 11:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OhJqzhnruESxyQBsuUBkTpXlj1KG2mpYOvcyz9G88Zg=;
        b=BYj3pLZXVoexXGwdJoXo1ydbNurkgF3mKNmPDG3Is3roLOOYY61mRZaAeKYdfR2SjW
         KxSfs6RQULqqvPzSFB6PN1DtWt5qXqNyLLD5MZlJHlewRYGyEPll6BUdFyVkwmtctZHJ
         Yq6WfWMDUmfhzZXQGnMOV0Mr5xZQDi3gXQHPL86mry8dGE8K0QCsj+F2vDaaVgKpDWOv
         gYGBrfXitnqfpKOWTZERUH6IU7koDoj4/oQf2QIKlCNkjqh6I3A1nvV4K1mGZ50cEUSX
         5zNzMZi7Y2Y+0Kch7/mDjmE/EyZ5cDSI9Zd+nUqgSxMUxDW963aHU9n0xlCSohwJr2hQ
         DBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OhJqzhnruESxyQBsuUBkTpXlj1KG2mpYOvcyz9G88Zg=;
        b=X+laSz/4O1OvcQgI6sr/JpjttAIpfJqA/addNj5asxeGw5FUX49a54Fs5GRMTSGvrr
         oGNGTw0F2dbfpPl6XaOSP2yhtQmTwmFs0LnSbLXPVQAVZxufJ2WEb87p5SUwnGcv2d0h
         o3+RXgACnFD1Z3Dqwb3RDjftQrJffm1sp3fyDsFhdiuOYVkhX40OtJHxmudhO3434Awf
         WQW2w6GaYjNwxJ5Dvd0ZWi4mfMEp7FnCUbbY5zySABOYi4k+9U7faw2zVGRMfds39dsg
         5AbLQWAxpzU7XOVDrYSOyovH2NS+KKYBNu05R4dKIRr5VB5pHPkIY/4q4jGuJHWxmRw5
         NiFg==
X-Gm-Message-State: AOAM532nQHIK5dozZHa9FQZl0eoTAlwBwhsRY5/HKTwuO4s4kwLQdYav
	n6gdXQJ9oFoEFBQAAbUk7/2psw==
X-Google-Smtp-Source: ABdhPJzVSbE+5KXb+q3qWvL34oqGwQ/Ri7FBsgcn0thcQllMwFwg5o7MK5c47Opz1q4GH2WYIiwDzQ==
X-Received: by 2002:a5d:4d86:: with SMTP id b6mr25370577wru.369.1605036207888;
        Tue, 10 Nov 2020 11:23:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p13sm18180232wrt.73.2020.11.10.11.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 11:23:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B762B1FF91;
	Tue, 10 Nov 2020 19:23:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH  v1 05/10] stubs/xen-hw-stub: drop xenstore_store_pv_console_info stub
Date: Tue, 10 Nov 2020 19:23:11 +0000
Message-Id: <20201110192316.26397-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110192316.26397-1-alex.bennee@linaro.org>
References: <20201110192316.26397-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We should never build something that calls this without having it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201105175153.30489-13-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 stubs/xen-hw-stub.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 2ea8190921..15f3921a76 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -10,10 +10,6 @@
 #include "hw/xen/xen.h"
 #include "hw/xen/xen-x86.h"
 
-void xenstore_store_pv_console_info(int i, Chardev *chr)
-{
-}
-
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 {
     return -1;
-- 
2.20.1


