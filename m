Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D56D606A32C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 11:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=wchtXxpr
Received: from list by lists.xenproject.org with outflank-mailman.1492247.1692971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTHnE-00074k-6v; Tue, 17 Nov 2026 11:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492247.1692971; Tue, 17 Nov 2026 11:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTHnE-00073K-2O; Tue, 17 Nov 2026 11:56:08 +0000
Received: by outflank-mailman (input) for mailman id 1492247;
 Tue, 17 Nov 2026 11:56:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTHnD-0006pt-3G
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 11:56:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTHnC-004Hl3-G1
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 12:56:06 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6afc40c7-2eae-0a2a0a5409dd-0a2a45029ba8-40
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 12:56:06 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6afc40d6-6ca4-0a2a45020019-d155dd33dc0a-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 12:56:06 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-491d1f66968so702165f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 03:56:06 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a43d41ec2dsm3659291f8f.14.2026.11.17.03.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 03:56:04 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1794916566; x=1795521366; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZcZFlSPMeBqZ2MpkJswiWBZkrHFWg/R7l+I92HVI3dE=;
        b=wchtXxprck/pPjcOLdeNoGdHeFHohk3HSodPH6wUZPtb2ezyFgbreK00HGkCq5Z11y
         B2Gj3XHMUkim1GiAudawhz7jojhefLJHygtzLxJuWhwTsjiwapavjZWxjqpkKo8aYhJ+
         BWxvAA0D6j7KciK5tyDW8pPX9wx3pPpvfRDBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916566; x=1795521366;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZcZFlSPMeBqZ2MpkJswiWBZkrHFWg/R7l+I92HVI3dE=;
        b=joKC2R4Np6dEK9CCLaUtqpJZzghgw0XYdMO7Oy/ySMNRbn2nw8yfiT0gKJQTvKVsPs
         mr17Rhxm7FA+gPNAi1QKqSNv2Mxi3aUOemSmfzA43AoXdfj0wLgIGMbmGB1TwDQ7Znfc
         y4cccOlxDvOCratcCb65PIorZXLHToqTlF+z4/OSlVPGOSLZ/OjV3BGf2TKwYyAPi1Qn
         7QvPCBAtcZDzvyvF4icOMGAF80071pRdwHUTuMsFqHdJh7bkPYR6Oe7xSO/F8bMRcMwb
         gU3ofcaE/04Il79NGqbpRSVyUMShShExtItMaigcwpFK6p/5945QA1kyOO6I/ryGush4
         BO1w==
X-Gm-Message-State: APuU4Z9D4ody10TQHdxWQhkA3jrC5u1g/MgVWHX9i+Tewp9kFeYwbwO4
	NelWWyBB1aps2fHodges3mZKPsBRhzC3Xd3HnyTvEtm0F04Z6yDtaBijV4pNEzgo4z6DMNag3CW
	v0j9ynYg=
X-Gm-Gg: AZFdTZfehBLOh8r8aIVN00+O/hT5421IEg/+qw0jYjXr2Hsao+YEvFohpnLtHd1d/Vq
	SiQp2trmfTr5bx5sOMomAdEaWVy0qhd8Q4nTQIrgTwDjRXRDl8LPBbOyMRTy+B6nVmGv4Gbzm9X
	NllA5EBuiKuKmK/+sGJeAqLM+Dxl42f0lpKECZMV2r1Wxj0cXeUl5Dx+YBgGyX1f2ISjh59PDUz
	A05lwxYAMn0tsifBclLSfHpLm6eJKueSmGKyWXBa5/3GDD2owBBqiSY4I3GigYhE72E3RzI7qdk
	Jq93m30IrHGXnRrt8hcJNNWEen33h03ZteRXtutG/1dP9eZLMgdMVn9Ypo1bto3c+tuDKMyfk69
	H4/OIvbb6+hqJ5uvjDy1Qt3n1gmUNuWZHztlqVml5aZK2+7fiipnuN1553XYt/s3Gwj7iqdXn12
	69ps4yrld6fVfMfGEASo6hJqvf5k3CJUbkuF63HZB7eeHBe8U1TxM83Uq873KSnY6f1/GsjIHsY
	8TX9R07suD7oL2CYP+ypQ+6Ac14hpRZqQCA0oPwBKXnXEreB3RYmU8jXhQDYPiANGSxWeIOPEN3
	9HZjm0b2z/7AxxXBIqM0g3X2JX6s1nTkso5B/9sHY+Rb7p7C5qwueuqVlR2ed2k3JwYIrY9MAfO
	QFsE=
X-Received: by 2002:a05:6000:188c:b0:48e:2448:ea23 with SMTP id ffacd0b85a97d-49c720279f1mr27526401f8f.55.1794916565368;
        Tue, 17 Nov 2026 03:56:05 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>
Subject: [PATCH 3/3] xen/config: Drop NDEBUG
Date: Tue, 17 Nov 2026 11:55:49 +0000
Message-Id: <20261117115549.3872611-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117115549.3872611-1-andrew.cooper3@citrix.com>
References: <20261117115549.3872611-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1794916566-F3CBA2AC-E5B341EA/10/78276251493
X-purgate-type: spam
X-purgate-size: 1111
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There are no remaining users.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 xen/include/xen/config.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
index dddc8e1920fe..3f91b2402cf3 100644
--- a/xen/include/xen/config.h
+++ b/xen/include/xen/config.h
@@ -85,10 +85,6 @@
 /* allow existing code to work with Kconfig variable */
 #define NR_CPUS CONFIG_NR_CPUS
 
-#ifndef CONFIG_DEBUG
-#define NDEBUG
-#endif
-
 #ifndef ZERO_BLOCK_PTR
 /* Return value for zero-size allocation, distinguished from NULL. */
 #define ZERO_BLOCK_PTR ((void *)-1L)
-- 
2.39.5


