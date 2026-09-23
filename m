Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8204C9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:21:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430544.1653071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mub-0002X7-HC; Wed, 23 Sep 2026 13:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430544.1653071; Wed, 23 Sep 2026 13:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mub-0002Wz-E3; Wed, 23 Sep 2026 13:21:25 +0000
Received: by outflank-mailman (input) for mailman id 1430544;
 Wed, 23 Sep 2026 13:21:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Mua-0002V1-KZ
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:21:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Mua-007x0m-1S
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:21:24 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d248-2eae-0a2a0a5409dd-0a2a45019c7c-20
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:21:24 +0200
Received: from [74.125.229.22] (helo=mail-dy2-f22.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d252-5984-0a2a45010019-4a7de516806c-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:21:23 +0200
Received: by mail-dy2-f22.google.com with SMTP id
 5a478bee46e88-33bf5a1c4d9so901848eec.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:21:23 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:21:19 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169682; x=1790774482; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xe2eD+AiZP/2qt9dfiB6B/fVlOtPvZaEy5H5CusisPI=;
        b=JngE89EcHuzonfcInxuRbWhL35cJiiz/3a27eYOepiozbOGtfrZ1ydEYqeLAJJ/EsB
         2SrLWanBG8Xm8lnyqc+aUvaTImWATPLGb+UoItNNe0slvSDjR+hPOQjq36jhjRhqAb63
         hqMg4bMp7/IYCKNNNXxo6cLEuGOFWUrc0qimnv49sJ0HTXQfQDo4NU9mV3LnoqCbrYb1
         eVveMiDgvA//gr7rCq7CaCsjXcJrcMeTw260YRsJVythQRlCT3VCezpKqTdGtPpIqSfU
         9qrMPpU7IODfY3FmxIN7DKhRes/r2GWd44yGjQK4RyGUIYiFHhzU2uitZPlhJz8epbI9
         x6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169682; x=1790774482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xe2eD+AiZP/2qt9dfiB6B/fVlOtPvZaEy5H5CusisPI=;
        b=086TGH+pwtGuVvaa9WQUL+hzBt7Uut6fLambEZbaKDz4dCdLB9RGjbKqEpSN873bm0
         G/tTBdwhQi1dffhZcKG3SUB26SO6j6IVDx2aOyKLSQerh888nnBwIm5Vt1vCVa3eTf4X
         yXWkKcRvxD9kvIJWr0KsZNm3jwhomjNr7oQDIyYB9BOyEppQnIdGwZU3Y6wH8h64F/g9
         xoB3BLkXp2piJAKNYiE7vbkYwDe/dpiFp/U0UKSpb/ZV+fE0Lx0hNozEpo1s5PgVSqF4
         Lvfe+8rS/pFXRjOXWKIo80O2cFLCWEtilWEKlziJbWGQGsWecJoZVHig1G7ksJznff7R
         ho9w==
X-Forwarded-Encrypted: i=1; AKwUvBzsJbqi8YqVAdlsmukOiJ72KxwL8C0AyDTGOSXro8si33BzMwwcIstu9GdZJVvPZTcRe0oYwGhxG1U=@lists.xenproject.org
X-Gm-Message-State: AFuF++m82K6KYz6PZpbnZhsNPWH733VyUjAi5a+pWV6kx4uf/F2w3VkY
	LMq52kGNgUYoPSqtQqAqBKzZETwRBzxmYs/1W+koq6/kvmHGpt3enJBD
X-Gm-Gg: AYBFou1rKPgcaLWiGP+CrHA+GBE3u7q+iZuble5HjIl0ACZldmlyXn3v+v5xF0unwAF
	jcC4Q3mE9H5gDLiSH1yAsWpZXdMIxoMLLU2jhn6J1jqXbw3s31iL9q68OzOrXhbvnyi/O1v9/Gz
	wMzW655ERn403XUgJO0jt5xe/WJDs/GQz2gu7XS38fXbrneKfLmAae57ZBg898fQ/rM1LoQu+uW
	472gsQc526Bl4/AMhedo0PexUu7ZkozG1mid1NxMCYAEywhbdh/7YQoEuxMmRT6y7dJ2SCQIEmv
	wObKUssNlMuBt9GUDD9nvDdH3uzGn4Hr0jkG2bfIxNw1dqL4TtWXnRaxCKuxjLqiT5yS5gzpbvQ
	x1ostjml5FdaubwApqjwLDc7ETMmXNO6lQ0H7BwrAgzJP8PMyt8FZ2TqauVoDn8CtLnjPY9Hbuu
	WjiIK8c4xTexLSUa6/fZdfvkWDHTaQntNo/Y5ihTzwh2cjBfHcnnoMkLddLNIKTZmPFDy9JFfdg
	6D2QY0oZvozmtls5WzRGPQaDv80r7ECLxAk6yLDgg==
X-Received: by 2002:a05:7300:8242:b0:339:7909:9782 with SMTP id 5a478bee46e88-33e8d9ce7f9mr2561360eec.21.1790169681656;
        Wed, 23 Sep 2026 06:21:21 -0700 (PDT)
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
Subject: [PATCH v3 026/114] hw/intc: use target_long_bits in IMSIC geilen
Date: Wed, 23 Sep 2026 21:15:00 +0800
Message-ID: <20260923131635.1894-27-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1790169684-BD341757-46695DE3/0/0
X-purgate-type: clean
X-purgate-size: 623

- Compare geilen to target_long_bits() instead of TARGET_LONG_BITS so
  the check works when TARGET_* is poisoned.
---
 hw/intc/riscv_imsic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index bf0434e96fd..30fb60cc312 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -52,7 +52,7 @@ static void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen)
         return;
     }
 
-    if (geilen > (TARGET_LONG_BITS - 1)) {
+    if (geilen > (target_long_bits() - 1)) {
         return;
     }
 
-- 
2.52.0.windows.1


