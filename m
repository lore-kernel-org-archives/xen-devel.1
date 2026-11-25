Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4268606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 17:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=edera.dev header.i=@edera.dev header.a=rsa-sha256 header.s=google header.b=Ao3Up+sX
Received: from list by lists.xenproject.org with outflank-mailman.1502667.1698639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWHEO-0006kM-2d; Wed, 25 Nov 2026 17:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502667.1698639; Wed, 25 Nov 2026 17:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWHEN-0006kF-Vl; Wed, 25 Nov 2026 17:56:31 +0000
Received: by outflank-mailman (input) for mailman id 1502667;
 Wed, 25 Nov 2026 17:56:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca@edera.dev>) id 1xWHEM-0006k9-79
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 17:56:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWHEL-009jsP-Ji
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 18:56:29 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca@edera.dev>)
 id 6b072143-8faa-0a2a0a5109dd-0a2a450995a2-4
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 18:56:29 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luca@edera.dev>)
 id 6b07214d-be1a-0a2a45090019-d155dd35ac73-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 18:56:29 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48e3b22e971so3223885f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 09:56:29 -0800 (PST)
Received: from framework13.home ([2a01:e11:3:1ff0:831:b00b:e409:f875])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6baa3c4dsm29953505f8f.46.2026.11.25.09.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 09:56:28 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=edera.dev header.i="@edera.dev" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.dev; s=google; t=1795629389; x=1796234189; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4gwqV4xsP/GDxRlasJB2bCsdhi+aTn0uPbUlgWXGpI0=;
        b=Ao3Up+sX4P02LzaFo0PlsUbunYLbcxT3VXmYA8XlrSpA9sR22attueNkv2WGSBmRFO
         0aiHOouydDdhf+aaC8qPrSAXrzZzebjyeRuxG7whl4uDtibWFZvJDh20cKDE8BL7UeZs
         SWS5ez4wV/YWCanGR0bQ+DIWzQF14MQVhDToxC1sKevHC/cdOjn9oE99IW5LxMTtiHvT
         X+jC62hsRksOr5tGvr5cwzHGgm3027+wciNLr8+9GNP247A8Re0lYwBfG2DmRHJwEYLE
         Wf/tzic7BuFTdaThcNUK0A5y8/UAvHl0DnClIzh60bL5rqJZkosLIr78PLiO7SPPs5l9
         O90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629389; x=1796234189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4gwqV4xsP/GDxRlasJB2bCsdhi+aTn0uPbUlgWXGpI0=;
        b=VuXC+RWY/5WxaM3Gaf9gYOXg/+IDQmteBGQi5R9bTY7HF3SkbLk6pv55xP9sGfIwJn
         sFsuAemKmaiP2cnsGr9zAnp47la321f77qLC6jD8sHhI+ITBnzZEZn6FnLWvEr1LslTN
         PUKzUtE9BnppAsbqjQTXVogtHkFYoiQp+6TX4zrFup0N0nOm0bA1PPJWol8tpI+YsuJq
         oPgMrOkdjdj44wbfyUyegzv74foefppx77FWXUcNJSy2ET+tUR0c8knv7nac/SBPvhpN
         bc1x0VuaJb/V0GLlitw9ztNtydA+wrvmKg+XHui/1e14EK2w/mbPhOZOC8agg8a9TdUg
         OGHQ==
X-Gm-Message-State: APuU4Z8MkEAOWIuB4kE9ca7JAi2VhIB/WfiZJ9X8gbXlxEPGS+DaSags
	bIYybEa0iNek+wE9ksDAgeAfgWmSn5i33aQHkieKrmLaPd6r0BYUjmnxducjNHGvgrM+lsaMawV
	vNgg6u+U=
X-Gm-Gg: AZFdTZfOdmrP9isypc1biRpdB7q+Kse7Jo2iJUS91ITg3G37fDOPq1tt5AAZwjbRJzU
	U8yfzKLV6g3BWwEnxT6lUDc8D6wPHOSR4UKakzvfczxeEHWJwWcJHZQ4UfCmloZJUUjLQYUh0T/
	M8GjjxO4G0vAUFqopXZqEZU8XcaYXf6BmtLvxXxG42E+ACPiDU+M+fbqtTTlpAnZ58YHFAb/xIZ
	2BMXphUiitGFuijGiZOV1+DEzExncOyEwjotkSR2yojsZ1fjeXtNjGotQkeV2uchsr0DXeB3FrL
	4inofksjDVvg23ooQzcTtgDByL4VEg5yuwCCmSHtM4YbSE0YAKqP8KlZmIHzZrql1Pq+s6WJpaq
	tci0tVzwEqIIuIByzia5HlGfSfG8VPiwlshX1bZMqmpLDsxvK+G6kaO6T3BKt6u/mSZ0beKLPC+
	OUT8gktwyK591Db42FvbxllxcQZ65mRaIPwOCt4C1urvEJ7XaMKVHym8Sgw6xPQk23+m0ht9rwV
	s6oEaZnSSW9DSI51Uxmt5bey/AecPjmkX13Pl4fA93ROUv0wBmqVlhbS1WCmzdeU3Dgu4VYxVWX
	20XkjOB66whth72L0A0hJJdzUQW8kEAqhj64cTfQz2mIxq4=
X-Received: by 2002:a05:6000:4916:b0:4a5:e50:ea5e with SMTP id ffacd0b85a97d-4abaf64bdfbmr29863298f8f.9.1795629388782;
        Wed, 25 Nov 2026 09:56:28 -0800 (PST)
From: Luca Di Maio <luca@edera.dev>
To: xen-devel@lists.xenproject.org
Cc: Luca Di Maio <luca@edera.dev>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alex Zenla <alex@edera.dev>,
	"Alexander M. Merritt" <alexander@edera.dev>,
	Andres Rodriguez <andres@edera.dev>,
	Simon Veith <simon@edera.dev>,
	Steven Noonan <steven@edera.dev>
Subject: [PATCH 0/5] xen/arm64: use LSE atomics when the CPU has them
Date: Wed, 25 Nov 2026 18:55:47 +0100
Message-ID: <20261125175555.2110163-1-luca@edera.dev>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1795629389-FDC6D034-812E73D7/0/0
X-purgate-type: clean
X-purgate-size: 1928
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On a two-socket Graviton4 (AWS c8g.metal-48xl, 192 Neoverse V2 cores),
dom0 hangs about two minutes into its boot. All 96 pCPUs of one socket
spin in the exclusive loop of atomic_add_return() on dom0's p2m rwlock:
nobody holds the lock, the increment itself never completes. The lock
is hot because every trapped-WFI block copies the vCPU's runstate to a
guest virtual address, and that translation takes the p2m read lock.

LSE atomics guarantee forward progress, and with them dom0 came up in
every boot I tried. Following Linux, the series detects LSE at boot and
puts a check patched by the alternatives in front of each existing
exclusive loop, so CPUs without LSE run the same code as today. Each
LSE sequence keeps the barriers of the loop it bypasses, so the
ordering is the same or stronger.

Tested on the 48xl with our 4.22-based tree, with guests running, and
on staging under QEMU with and without LSE (neoverse-n2, cortex-a57).

Luca Di Maio (5):
  xen/arm64: detect the LSE atomic instructions
  xen/arm64: use LSE in the atomic_t operations
  xen/arm64: use LSE in xchg() and cmpxchg()
  xen/arm64: use LSE in the bitops
  xen/arm64: use LSE for arch_fetch_and_add()

 xen/arch/arm/arch.mk                     |  3 ++
 xen/arch/arm/arm64/lib/bitops.c          | 47 ++++++++++++++++----
 xen/arch/arm/cpufeature.c                | 10 +++++
 xen/arch/arm/include/asm/arm64/atomic.h  | 55 ++++++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/cmpxchg.h | 41 ++++++++++++++++++
 xen/arch/arm/include/asm/arm64/lse.h     | 31 +++++++++++++
 xen/arch/arm/include/asm/arm64/system.h  | 20 +++++++++
 xen/arch/arm/include/asm/cpufeature.h    |  3 +-
 xen/arch/arm/include/asm/system.h        |  2 +
 9 files changed, 203 insertions(+), 9 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/arm64/lse.h


base-commit: f460efb764c694304573d1a555477638d8c34f25
-- 
2.47.3


