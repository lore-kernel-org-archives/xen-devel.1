Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480D9C9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:21:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430554.1653081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mum-00033T-Vw; Wed, 23 Sep 2026 13:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430554.1653081; Wed, 23 Sep 2026 13:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mum-00033H-Qs; Wed, 23 Sep 2026 13:21:36 +0000
Received: by outflank-mailman (input) for mailman id 1430554;
 Wed, 23 Sep 2026 13:21:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Mul-00031h-0h
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:21:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Muk-007x4B-Du
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:21:34 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d25e-2eae-0a2a0a5409dd-0a2a4504abd2-2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:21:34 +0200
Received: from [74.125.229.43] (helo=mail-dy2-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d25c-b57f-0a2a45040019-4a7de52b930e-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:21:34 +0200
Received: by mail-dy2-f43.google.com with SMTP id
 5a478bee46e88-33c3735125bso410509eec.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:21:33 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:21:29 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790169692; x=1790774492; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=huS4A6FsKFDWrrXfwa21/vS+oZaWC4wTWSJg3SCD6Do=;
        b=UOcW8haf4Xc6fjHt9QaOV5SDqcL4KM3mMxx8d9jU6s1gh/RlYhUxVmbKS6ESuSekW/
         cYRY08d1gLdDpEkCZZmJCYpbwVPTVbz9YIwlIm8InxSbzBehIr1TrwE0cCrOl2lrV4Za
         GzAQU7G6PbEelN6whRs8jAs1WQg1dEAjQSHNuZNrcj7QRddzK481K2cdRldhaxIzqNz2
         LROtoV1ZgOkPZF65KwgrAzwRRfYwyH8m4Spo1dlgd12TIKVd7Mv4l0GqN1KUZyVIeOuW
         bM73aBrF+SK1lTXeolhlicvs3OmBUzgLWcH2/SHaSErnl1nt9mvU88BYn249RlqW1dID
         Zong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169692; x=1790774492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=huS4A6FsKFDWrrXfwa21/vS+oZaWC4wTWSJg3SCD6Do=;
        b=n9NROeuIf8Nc+GB4mZrkSnW1hS3GRC8OpU9dcwE2JUSdLfRaytwLI9FhQ0HJMI9lc9
         hUzNVVZwPBpfGgmpIAQYh97SwQZv/U5EDpKaEQnFEfLd3V9RP692j3Z+MZ6G1QQnz1Cx
         3bdG3TWERu4a9B7vBUP5Ane8OHCJjv1h3umfk4rmVHwsAMl+tIdm4gVUj3CmC4d9/u1C
         Eb+iuHLC2OfCp6ok8gxH9VRqr6YVoa9tpDPH9Xb3RoGf3PehPAol5RjFjRtBA4US8PAu
         xXElK2VdfAFyUHH20Bx5CLOqj1ZjTlSmzh6sSf4T1P4E6cWYt6s3b5jBu+AikyM6AP0h
         q0+A==
X-Forwarded-Encrypted: i=1; AKwUvBz232/HUUkwNEFGtCgnnxVeMp8E2Sdj7LW38w/05s0h1xZy3jjI+U72PiFUa6S+PaKmF3F/ypyetXA=@lists.xenproject.org
X-Gm-Message-State: AFuF++ldifEdoJiTX6N1I4x4YYwXXlRVX3KEU+Gi70H1CBGC1SxEGego
	Xvb5xneGzXFNu3kCW0VBtTMkixdrQysxsSY1cuKt3qNQXHW6j0Lb5HfP
X-Gm-Gg: AYBFou0fjUS01L8t9lGaMMVAgmo67xgm9nE0ajWRqAmKJa0qKMqEHyuBVhhAugq+i9k
	vKPQoWf3V7N8gGGh3tR/wD+brvvT29Meowl9Gdyho3jur9oLKdWKQClMDYI9g8tT7tGUnHu/aRY
	XxIXQAqu3oOk0aPtNy3bMvviUfMYExjsdJHaOmqUac1Z1LGr7wD82iVoJdSv/FprCVzDjivqfBH
	9UB5yV/7dnnfPdUCdRctunfJU3lrmo5WsCjToXkpNElA5gIYy95jRdEcTcnXCBlu6rhh3PBdDNr
	V2VcUNJpZegWrZ1dee2NiZDKyLExnXsqFMio8eodTGut0cm27IGlzCmdXciuOFS1XuQ1wxUukkS
	/xo7GscNLMKHaADixVglC9rRjc42Wx/iSh7Q7kRgB+Z0TmHsS7ECPKiOc+0ZtqHmrAb3KPyCosq
	LA76847oAF2/hSCAFy0VJhIzsU1x+U8yLHFvirPfbwZJD06OYcu7cLjG5vHjp0Ua4VXUCEN+XCb
	o33s6gmTbAl59fzchyJnUmt3KWYuzaltptlJz2uAw==
X-Received: by 2002:a05:693c:42d9:b0:33b:e75b:cc42 with SMTP id 5a478bee46e88-33e8d7d8b7bmr2063395eec.19.1790169691801;
        Wed, 23 Sep 2026 06:21:31 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
	xen-devel@lists.xenproject.org,
	Chao Liu <chao.liu@processmission.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
	Peter Xu <peterx@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Fabiano Rosas <farosas@suse.de>,
	Xianglai Li <lixianglai@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bibo Mao <maobibo@loongson.cn>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	David Hildenbrand <david@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	qemu-riscv@nongnu.org,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stafford Horne <shorne@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Song Gao <17746591750@163.com>,
	qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 027/114] hw/misc/riscv_cmgcr: replace target_ulong with uint64_t
Date: Wed, 23 Sep 2026 21:15:01 +0800
Message-ID: <20260923131635.1894-28-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1790169694-53AC0B50-120FC315/0/0
X-purgate-type: clean
X-purgate-size: 785

- Change get_exception_base() to return uint64_t so the GCR model
  compiles in libsystem_riscv with -DCPU_DEFS_H.
- Match reset_base and cpu_set_exception_base(), which already use
  uint64_t.
---
 hw/misc/riscv_cmgcr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/riscv_cmgcr.c b/hw/misc/riscv_cmgcr.c
index 0390996f78b..2086a33f08e 100644
--- a/hw/misc/riscv_cmgcr.c
+++ b/hw/misc/riscv_cmgcr.c
@@ -110,7 +110,7 @@ static uint64_t gcr_read(void *opaque, hwaddr addr, unsigned size)
     return 0;
 }
 
-static inline target_ulong get_exception_base(RISCVGCRVPState *vps)
+static inline uint64_t get_exception_base(RISCVGCRVPState *vps)
 {
     return vps->reset_base & GCR_CL_RESET_BASE_RESETBASE_MSK;
 }
-- 
2.52.0.windows.1


