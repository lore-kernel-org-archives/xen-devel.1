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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D3FC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 19:21:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41B0A224DF
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 19:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41B0A224DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.74378.133729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47QC-0003eb-4p; Mon, 25 Jan 2021 19:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74378.133729; Mon, 25 Jan 2021 19:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47QC-0003eT-1S; Mon, 25 Jan 2021 19:21:08 +0000
Received: by outflank-mailman (input) for mailman id 74378;
 Mon, 25 Jan 2021 19:21:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTVL=G4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l47G9-0008N7-JA
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:10:45 +0000
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b3dc2d8-998b-411b-a0ae-aec95ec0f12b;
 Mon, 25 Jan 2021 19:09:14 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id c12so14121099wrc.7
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 11:09:14 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k6sm12991031wro.27.2021.01.25.11.09.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 11:09:13 -0800 (PST)
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
X-Inumbo-ID: 0b3dc2d8-998b-411b-a0ae-aec95ec0f12b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Sk79uDPAYTcbZS3IWNRXkK9ttYsPF3BwQfUARr2zP5w=;
        b=S7bBHY2jX+8tT1AkkSi7NewjpnxqKyRltDTV6cKkz4Q1QjzsPrP9jFz8UNhlvabht5
         eAcvd6DtFO00KKwee+dks2tykDGiw7rW0VGEsReEdapj96QO11rrliP48DI+BBEsDywF
         feYjUInrg7UR54yKc/SKixnOw+v8g0R8wetkrOfIILD6FNImBFUsOpSzFuVXCzD9/3fF
         L5xxR7RDedjqmBkINiJWmMnT4bCAAYAFPv+9ijqUf05/RGW4si53m6RrUosSRauizC+G
         s1Nts/MJc34un8xUp8INbtDBu1uIDJVSb6z1yqmivDUgwS3Cmc0xATTX3Wq0Av2iEhpN
         kq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Sk79uDPAYTcbZS3IWNRXkK9ttYsPF3BwQfUARr2zP5w=;
        b=bM2TvVfLLSpaolbEhM5gV8E7IXBlugIdCM4qIuEOgiAnJ/M+aDX854aoHREpHk7Gix
         4leHm+K76qUFwYEgOoyHsVgqdWDfCS2aEGITukE4l0aXbadMo2Ghb6ubuCBBcfISCaXu
         yEI7OAhIcthPQTTps8Vs07BkJhju8wi3HR28EwkuOGVDbpUHewOLa/jwn2yRlVTAtvUE
         4WsTir7JZfIrlv3jCoIcjZeDDjPwG7cE1N0DWs9O2UyGg+qZ/eTcKLsd677yeAmW0436
         ZV4OwkUNlEQhqtq8h9ofcOBiBk5aRNihWdDqTqisDsjtCW8xrLmkd/mDFcEPeVLfq3Gg
         329g==
X-Gm-Message-State: AOAM530zaYe0ir2dNDdgaWIA/gQQL9BYN4YS/9NgfdSxm69z00JVz45x
	btt39H38J4PkipB/0Ao5eJ9JeFXq/ZMPIw==
X-Google-Smtp-Source: ABdhPJwg+fou6IhlCR6vpmF0nriE79P9MuJzT14u5Hxu9FJE+RZ/uJ8CEUoUfciGBDP7VPb8+haqCw==
X-Received: by 2002:a5d:6092:: with SMTP id w18mr2543200wrt.75.1611601753964;
        Mon, 25 Jan 2021 11:09:13 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V5 20/22] xen/arm: io: Harden sign extension check
Date: Mon, 25 Jan 2021 21:08:27 +0200
Message-Id: <1611601709-28361-21-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

In the ideal world we would never get an undefined behavior when
propagating the sign bit since that bit can only be set for access
size smaller than the register size (i.e byte/half-word for aarch32,
byte/half-word/word for aarch64).

In the real world we need to care for *possible* hardware bug such as
advertising a sign extension for either 64-bit (or 32-bit) on Arm64
(resp. Arm32).

So harden a bit more the code to prevent undefined behavior when
propagating the sign bit in case of buggy hardware.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V3 -> V4:
   - new patch

Changes V4 -> V5:
   - add Stefano's and Volodymyr's R-b
---
---
 xen/include/asm-arm/traps.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
index c6b3cc7..2ed2b85 100644
--- a/xen/include/asm-arm/traps.h
+++ b/xen/include/asm-arm/traps.h
@@ -94,7 +94,8 @@ static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
      * Note that we expect the read handler to have zeroed the bits
      * outside the requested access size.
      */
-    if ( dabt.sign && (r & (1UL << (size - 1))) )
+    if ( dabt.sign && (size < sizeof(register_t) * 8) &&
+         (r & (1UL << (size - 1))) )
     {
         /*
          * We are relying on register_t using the same as
-- 
2.7.4


