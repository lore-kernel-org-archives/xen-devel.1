Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A0D606EE82
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 12:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cXz5qgbB
Received: from list by lists.xenproject.org with outflank-mailman.1480002.1683926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQOoi-0003CE-1a; Mon, 09 Nov 2026 12:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480002.1683926; Mon, 09 Nov 2026 12:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQOoh-0003C7-Ub; Mon, 09 Nov 2026 12:49:43 +0000
Received: by outflank-mailman (input) for mailman id 1480002;
 Mon, 09 Nov 2026 12:49:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQOoh-0003Br-0j
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:49:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQOog-00EeAx-61
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:49:42 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af1c155-2eae-0a2a0a5409dd-0a2a450cb856-22
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 13:49:42 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af1c165-f479-0a2a450c0019-d155dd2ba44c-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 13:49:41 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-490f38e9688so668966f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 04:49:41 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49597e00d75sm9617856f8f.58.2026.11.09.04.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 04:49:40 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794228581; x=1794833381; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N841khkHhAPXfNTfzF7oSFOLBbW+P+AviUYYuCqufzU=;
        b=cXz5qgbBdKs5wdRWYx4jfuRlUR4MypUetogQFlOgNvf6SEim2lsFhVLA293S26G0k8
         Sa5BjzENMek/vK168xxLhLB592hH4+njGrLlpb0teXD3hX3/BQCjtbODgaLW3U+/cPFA
         IMJhjh2FytsQmWGpJk5cRNCbhggQr86ELVSxdMreorGgWfxMdl7ZmMUyB6bwSb5kY4WM
         m3CrQkPbISvkHSzus8WHUIfMcvuRbVqIics4qTJ/IIjF5dCpz5JhmZLWzdjZKWeSMuXv
         0VVTupiBGLcs4/DbNdEOr9MhNi4tSEgjYhGGLW6hHNHREC/blLaBYhrSltpTxQ1Wa/s2
         XAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228581; x=1794833381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N841khkHhAPXfNTfzF7oSFOLBbW+P+AviUYYuCqufzU=;
        b=XJTtUM/fQngP95hzgP1cncJFoiVMjQehv6JW61OHN6ZSl1iliPGmTiot7mR9LUS+fv
         kOv98nattul+9M6x7v9qiLTvkG4BIFi+g9jiLuOy8wrPyfnjpJNZwU1m8k72O57vT9f7
         +5APbZHrV6CwNEuMOKDnz/aD5myEGjSMUbW1jjPkCdyHab9tisviM8Uz23i1L5qxF2ei
         wll8dpdNKQzYAKAY5XUVaE+fBjr948QvoXLNw3+x1mNhkITjbUTVKIJ4w6wGq9hDbyBQ
         /Eah+VYzc9lXeZgn8rcpTJfN9seO/4ho9F1lRGLiNuZFy6AnsTDFjEAzv0E/Fued+VcK
         z0Kw==
X-Gm-Message-State: APuU4Z/sF051Er7Lzi1vgtOELmeGmv3ZJVfvURTkggrFjVX2GF33TqVZ
	dnhmpAFKIP98IYDUV7hcu76aA/AAb7bK5GUkBFc+i6vTq/sttNDU0AgdRq1X/Q==
X-Gm-Gg: AYBFou1OsYz5Ipj+Pg3GCNHRLFDhu/AQ2jmPWUxjh9PTQuQREzIcoaracOtxEcxkVY6
	p+OU1M4a6aHF0xgi5jhzmnnjjVOznX2/K5eIoDVzZ+W7/BxpZPW0DQwUhbtUpDhiOsJn6oMrNjF
	6uxLAE8gQBTX6c9IAKbR8cfqjVDQnQXKr9dfsQiZNDhSLW7+r4fGUenqPj/7n2kPNhBzCik5wDV
	TDhFW3msAZtI55lI0Q90E0WaXw2BGuH1pSemMRXAEQ2g1sYrK7aLKHA7nGYwdpo7ee1pdrqezOt
	lQO4WFF8HUTYtPyMJRICaCI3P596ZruPw3JR9i+2iwV9vxsyMDRh1pY6YCA+pmjQLuOlbwnRd7j
	HHESWsmjABuLZGpG5CSMV3KHpGnRIlQBliw7LBwc4xFYUg8hiOQgGHNj/U7KLCbnjdd87kbAb0L
	oVt14gquU65ZZdZ1efah0qFqf16anGehXgAz1YKjZB4HP+nCO1u8TsmynOr0vlZvBQhMMaXt9CT
	uWqGJSHlV/UszAbO0oTx5HVYg3YJFidj56o+KHeyn9xxCdd5XzgxWS3GSQBaQ9a7Cz5Nr9QzpdP
	+7d2SACRarsQVPoO3MdimcA7l+ubeABV9+EHtvAUUVR9x+ZsIARUa/mFbSEKmoT5QqsBLg==
X-Received: by 2002:a5d:588b:0:b0:492:3f98:5070 with SMTP id ffacd0b85a97d-49589c3e776mr7533906f8f.12.1794228580917;
        Mon, 09 Nov 2026 04:49:40 -0800 (PST)
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
Subject: [PATCH v1 1/2] xen/riscv: skip disabled CPU nodes when probing ISA extensions
Date: Mon,  9 Nov 2026 13:49:36 +0100
Message-ID: <20261109124937.78186-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1794228581-52132A5B-6FB5CC84/10/73395122804
X-purgate-type: spam
X-purgate-size: 1309
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

riscv_fill_hwcap_from_isa_string() intersects the riscv,isa of every CPU
node under /cpus, including the ones with status = "disabled". Such a
hart is never used by Xen, yet it can still remove extensions from the
host ISA: e.g. a disabled hart without the H extension makes Xen panic
with "Xen requires extension: h", even though every hart Xen runs on
implements it.

Skip CPU nodes which aren't available.

Fixes: f74ebf58b518 ("xen/riscv: identify specific ISA supported by cpu")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/cpufeature.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index dff590f68a30..c4983ccdf3da 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -477,6 +477,13 @@ static void __init riscv_fill_hwcap_from_isa_string(void)
         if ( !dt_device_type_is_equal(cpu, "cpu") )
             continue;
 
+        /*
+         * A disabled hart is never used by Xen, so it must not restrict
+         * the set of extensions available to it.
+         */
+        if ( !dt_device_is_available(cpu) )
+            continue;
+
         if ( dt_get_cpuid_from_node(cpu, &cpuid) < 0 )
             continue;
 
-- 
2.56.0


