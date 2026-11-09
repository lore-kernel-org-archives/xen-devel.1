Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE641606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 12:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NXdzfbxX
Received: from list by lists.xenproject.org with outflank-mailman.1480003.1683935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQOoj-0003Oh-8o; Mon, 09 Nov 2026 12:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480003.1683935; Mon, 09 Nov 2026 12:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQOoj-0003Oa-55; Mon, 09 Nov 2026 12:49:45 +0000
Received: by outflank-mailman (input) for mailman id 1480003;
 Mon, 09 Nov 2026 12:49:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQOoh-0003Bs-5f
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:49:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQOog-00EeAx-I6
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:49:42 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af1c155-2eae-0a2a0a5409dd-0a2a450cb856-26
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 13:49:42 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af1c166-f479-0a2a450c0019-d155dd29d072-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 13:49:42 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso726002f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 04:49:42 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49597e00d75sm9617856f8f.58.2026.11.09.04.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 04:49:41 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794228582; x=1794833382; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bwF9Dj8giABPcMeVhSJdbQUe4yVDcsmUQnbwOfJ5mWs=;
        b=NXdzfbxX/bB0AbkX/Hv51+ekRe17DX3tHlZjXzA5W0t8NaOazB2EyzOaM80L/waGcW
         FNU1Do3uYu4iIgBNeWravwO4Q2WdlPGOvMAeADk6DBE4NGON66GjtErBcIzshH+7uVN0
         JTuHjHROpHANBL04WzEj+iW2FfAQGzwJkLfBtuoYfDyHGcw3tN7RuzVYXIQwwTZXgxIP
         8YDt1qxZ3Jk5RcM4zwQkE0bfknoBgNiKKQGlJOMLygWthZHEx8MUcBlodHoGyzPdt5gD
         X0LQFnbXyxeswyEULJZoVA6CP7RmtbmES6S7tCAHkVv5bZJoVEfUjOvANdttMwi1zsi6
         tf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228582; x=1794833382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bwF9Dj8giABPcMeVhSJdbQUe4yVDcsmUQnbwOfJ5mWs=;
        b=ltbSExN0t600ZRi08AvNARvd03KcfC1ZCZKfMoACdVKE6HbJQdGt/nS5hevZA7fQAH
         ydhSo4tSLI1fFV21XgXqTstq09wMv2BvPPoI0dM/7xTOjoW12hPjqsLdhP/RU7PRczq/
         /+Z+95KpmfnagzrCbUOysCcEV1kVw3ifhNXYNHJj+yJ6ZFVGwHW0A3A5ThbWeOHVPYi3
         NMyREzI96L7aNFMihOUQwmiBom5+M5Ji/t65dqgX7psgRLm8kZSvG54KRY3+MBZ9Qnb2
         pFnU5ka3J9MvsSv0kGKZqDsB8zgeWydPo414MSFrtX78V49NuiZrr3+6NQ8WXG0qYgc0
         LMpA==
X-Gm-Message-State: APuU4Z/Ag1u8ZGoCstvAwO7TO7sMCsVeFUR2wwr5yIR06jj9bPbHUCHY
	9X0qzM6wsPm8Pal06PrKGZVXfsdsnYTGh6RBEMFrAUHliswZhksDfbC3kCDjEA==
X-Gm-Gg: AYBFou214gEjwANIypJGP/QRVx1icBXHmiRonwzqzTM+p3gwUHEUNNNiFN4SzmY0K1H
	ZrCiQIFpZOh9zr/3c5KyUoeQxsyyB8sKAQDyNwuxG4NfyrxKz6+SZDp/7lN6xP8yj1Z1PurfwDi
	JcP61MlJqVI5ue5NBGMrIziYM6n3EHkbLuf8BLdhrRb4a44JjDyIjtwuksX7H93OfJJvNtuHo4j
	n8w3bFTW3VLaC3ZIOvSwpI/oNVUyg8FQf9MjUdbptHiVgewegjyP68Gis5JhkLbONow8E5csBSl
	RVsqidvzdcqzKwz89BiiHkglAX9VO8BVsz6P/IB8ecE4gabPkJP7V8qFR+uBiWjaY0lpIfh5xAv
	J8Kb/g196ahqs6zrP8WXPa0T/PJTNDwL2fljJobXHutX9fFD7dSeFtXAEfj7fDWOXoNSpdxHGI2
	+6gybBo37hdCt5fY2PTbjhKDSarnaLpn2XbyX9HVy0wzhJ9O2cKlqqnh6uYx9/Um47/smyzAv77
	4llT+6ypeCmoMKbMpssAVNcxKQD2kz9jWBfzOQQoGKHpof2uEqZ1sVvxZK/2ZI+3E5en0wA8mG/
	+TyTpYmtWlvKu9alxbCR6oxDwUy7kcM0Gbs8Q82U5s6skbOoHdXLPQTjWGlAMCwEOPlU
X-Received: by 2002:a05:6000:41dc:b0:48d:f996:1814 with SMTP id ffacd0b85a97d-4958d5e4e2fmr7387934f8f.57.1794228581910;
        Mon, 09 Nov 2026 04:49:41 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 2/2] xen/riscv: fix the base ISA checks in riscv_isa_parse_string()
Date: Mon,  9 Nov 2026 13:49:37 +0100
Message-ID: <20261109124937.78186-2-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109124937.78186-1-oleksii.kurochko@gmail.com>
References: <20261109124937.78186-1-oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1794228582-030D9A5B-92A429C3/10/73395122804
X-purgate-type: spam
X-purgate-size: 1580
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

riscv_isa_parse_string() is meant to reject a riscv,isa string which
doesn't start with "rv32" or "rv64" (depending on Xen's bitness), but
the checks are written with && instead of ||, so a string is rejected
only when both characters of a pair are wrong. As a result, e.g.
"xv64i" or "rv62i" is accepted on RV64. Also, for a string as short as
"rv", isa[3] is read past the terminating NUL.

Use || so that each character is checked.

Fixes: f74ebf58b518 ("xen/riscv: identify specific ISA supported by cpu")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/cpufeature.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index c4983ccdf3da..495cf3f655ba 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -261,14 +261,14 @@ static void __init match_isa_ext(const char *name, const char *name_end,
 static int __init riscv_isa_parse_string(const char *isa,
                                          unsigned long *out_bitmap)
 {
-    if ( (isa[0] != 'r') && (isa[1] != 'v') )
+    if ( (isa[0] != 'r') || (isa[1] != 'v') )
         return -EINVAL;
 
 #if defined(CONFIG_RISCV_32)
-    if ( isa[2] != '3' && isa[3] != '2' )
+    if ( (isa[2] != '3') || (isa[3] != '2') )
         return -EINVAL;
 #elif defined(CONFIG_RISCV_64)
-    if ( isa[2] != '6' && isa[3] != '4' )
+    if ( (isa[2] != '6') || (isa[3] != '4') )
         return -EINVAL;
 #else
 # error "unsupported RISC-V bitness"
-- 
2.56.0


