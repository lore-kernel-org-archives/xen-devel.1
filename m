Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1673606A32D
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 18:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=auDk2fWJ
Received: from list by lists.xenproject.org with outflank-mailman.1501384.1697483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVvA5-0005mj-M2; Tue, 24 Nov 2026 18:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501384.1697483; Tue, 24 Nov 2026 18:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVvA5-0005ma-HG; Tue, 24 Nov 2026 18:22:37 +0000
Received: by outflank-mailman (input) for mailman id 1501384;
 Tue, 24 Nov 2026 17:31:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <rnunez@baylibre.com>) id 1xVuMq-00050W-HY
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:31:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVuMp-004J4Q-JE
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 18:31:43 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <rnunez@baylibre.com>)
 id 6b05c9f2-bab6-0a2a0a5309dd-0a2a4504e6cc-26
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 18:31:43 +0100
Received: from [209.85.222.52] (helo=mail-ua1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <rnunez@baylibre.com>)
 id 6b05c9fe-b57f-0a2a45040019-d155de34d097-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 18:31:42 +0100
Received: by mail-ua1-f52.google.com with SMTP id
 a1e0cc1a2514c-980c4f5c921so1275957241.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 09:31:42 -0800 (PST)
Received: from [127.0.0.1] ([2804:7f0:7543:4532:5471:ddc9:4fc9:5])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5ee8b6641d6sm14760703e0c.17.2026.11.24.09.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 09:31:41 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=baylibre.com header.i="@baylibre.com" header.h="Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795541501; x=1796146301; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AFV2c8I1TVuH2yvSOBg4WMVBNzUQn6uYoXCilL3SPvs=;
        b=auDk2fWJHXeE0UKkjffgyjgWD7eXw70sbiUXuKTiKz18nyxokF5WPM/zFcWn0K1gVD
         lEpdYxZuwSM5xJeQ6Mhc6T5APMJOohf50WoRRXl02ZsDBBEyzUg/SCdXeJTBX9A5YZWW
         1wYGLvuPQdOgTFS9Hy9vd7UQGcw1s7A4OuhnXpNuqOig3F4DkFOvr4IVHhJ1FvellcYj
         uBK/T3SKt1t24KmRCkiI7DTCRVoRiwOANDuZOCSUhBa+Xz80XAslQI3IfV1ddoD/2EBT
         nbWc4/HKNAPxcdKuDV7yZih7Yro5JnBdqA56ncmhVahp7ks/jMSwIkos2bW57RrIiRhG
         BuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541501; x=1796146301;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AFV2c8I1TVuH2yvSOBg4WMVBNzUQn6uYoXCilL3SPvs=;
        b=b89PFdzQCRMtepwZaT8XsP4J+lPkk8Fs7Mpn2fZsx/T7N4bjeEAj4xd6bEcWEF4QCS
         JX2flRe40Cebyhu421bB+By/ZO0t+N0T+TqDsoBifJm18x/J23IrkocYzNB/8XbpqgnD
         mlf0ONZTQguRtYZAeUvXck73UcyzCvZIz8bzGWVu/bLU7wQXFoeHsgaL+0CqKjDb/8i1
         1uK/6lqqTA1I8P1RikQg6cg8NBcr/fl8Me4/4AVo5hFJ18tqrzebtCyNy/YCERo5iaa5
         CBiOf8xhwMFU74l3i7zNWnZUyYMNCWfv25CyutxuKgr7oUfcMXw/Bc5o1pk3kWaf+TUl
         8umg==
X-Gm-Message-State: APuU4Z8havJCu39fSXArtWgcWG8VerDjd8OHB3elubdvCIesOSCnV0fp
	p+yfu+PMmHOlkopyaavKLp/lm2y0ichKAp34IYyq9ukOxag3v8M+pxGCHzgZFbSv0i4=
X-Gm-Gg: AZFdTZd45wTOvTtIqiwCW9LerICLnCXw064KWtkX/jBl7OLGX22GciNilWqIiQ7BtHW
	q2c8mky5PQgqahs7Cv7gfb87JyswC4jfSc0lqom1HvsbmPAYn16+dA6njo9oLoVGkMf0OUKTHpN
	xUoDA7ybHPDpluvJ+lgVejxwBoK04rR/gyVb7k3afUosIDfLsc4+T2OL3p7RKnS/JbFSU3sJ2bR
	i9TzkUysGEpz/HM1AbLunu9ttXDTG66sQzAygR/DrOIcMRl5GqObSDGHoqnXVkHIXN88ztfA1kL
	sjdtxcMfYzFNqPGRMOcf9bbTk8AjJmIcp37yGIj7Kb+3C9Y7xDFHx/E+x5Ju/i5s4k50+7klJaH
	HMg2/hnHw0LLq9By6cP5ByeGv9BdlP8fm2ukT8XumAOT6S9jyyReN7u+WyZDGvMpPhp17NSfyoq
	Oft5D8TFnqf9bubxIS57gV5EYU+eZ6LkZK3CFxNC0bm67RhdenASspeOE8FVanYYxriJ0LYXt1f
	tbXXGmj9LDA1xpx6QNNpWDwSdVyXHoDwCVaD9QW1OtiXvtetAiZcv6mvL+na5jIprJaMlXdJ7yU
	5G8UPv3+QvbZgSM73dA983uhfg==
X-Received: by 2002:a05:6122:6e0e:b0:5d7:2918:c648 with SMTP id 71dfb90a1353d-5ee8aeb7facmr6990758e0c.8.1795541501411;
        Tue, 24 Nov 2026 09:31:41 -0800 (PST)
From: Ronaldo Nunez <rnunez@baylibre.com>
Subject: [PATCH v4 0/2] xen/ns16550: preserve UART operation across
 firmware handover
Date: Tue, 24 Nov 2026 14:30:53 -0300
Message-Id: <20261124-v4-uart-harndover-v4-0-90c4412cb95e@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM3JBWsC/x2NQQ6CMBAAv0L2bBu3rRA88Q/joZaF7sFitkgMh
 L9bOM5hZjbIJEwZ7tUGQgtnnlIBd6kgRJ9GUtwXBnM1NaJxanHq62VW0Uvqp4VE4c1a7yy27Qu
 heB+hgX9n8/EsPMj0VnMU8mcpHJLGpjWubhq0euRZr8drjZTGjnPwWfugQ4J9/wP7bTWCoQAAA
 A==
X-Change-ID: 20261124-v4-uart-harndover-1533a43199b1
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Zhang Zheng <zhangzheng@iscas.ac.cn>, Ronaldo Nunez <rnunez@baylibre.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-ebf023/1795541503-C3EC6B50-824F3226/0/0
X-purgate-type: clean
X-purgate-size: 1742
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series identifies XScale-compatible UARTs from device tree and
keeps UUE set when updating IER. Pending output is drained before the
FIFOs are reset during ns16550 initialization.

This continues the series started by Zhang Zheng, with his agreement.
Thanks to Zhang Zheng for the original work.

Changes in v4:
- Drop RTOIE setting, since its side-effects are unclear
- In ns_write_ier(), make ier parameter uint8_t instead of u8
- Reduce timeout ticks to 50 million and improve the comment with
  reasoning
- Squash the XScale identification patch into the UUE patch and retitle
  it "xen/ns16550: preserve XScale UUE bit in IER writes"
- Leave the check_existence() IER accesses as raw register writes
- Improve commit messages

Tested on a SpacemiT K3 Pico-ITX board with the series applied on top of
staging, compared against unpatched staging. Both configurations boot, but
only the series survives the firmware-to-Xen handover; unpatched staging
does not.

v3: https://lore.kernel.org/xen-devel/cover.1792467713.git.zhangzheng@iscas.ac.cn/
v2: https://lore.kernel.org/xen-devel/20261010031406.2057735-1-zhangzheng@iscas.ac.cn/
v1: https://lore.kernel.org/xen-devel/20260928023857.1030884-1-zhangzheng@iscas.ac.cn/

--
2.54.0

---
Zhang Zheng (2):
      xen/ns16550: preserve XScale UUE bit in IER writes
      xen/ns16550: drain TX before reinitializing UART

 xen/drivers/char/ns16550.c  | 38 +++++++++++++++++++++++++++++++++-----
 xen/include/xen/8250-uart.h |  1 +
 2 files changed, 34 insertions(+), 5 deletions(-)
---
base-commit: 7e020a4dd6ed30eb6c91a9abe2767034e2bb270a
change-id: 20261124-v4-uart-harndover-1533a43199b1

Best regards,
-- 
Ronaldo Nunez <rnunez@baylibre.com>


