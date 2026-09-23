Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D4BC9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:22:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430583.1653117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MvL-0004t7-41; Wed, 23 Sep 2026 13:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430583.1653117; Wed, 23 Sep 2026 13:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MvK-0004sv-W6; Wed, 23 Sep 2026 13:22:10 +0000
Received: by outflank-mailman (input) for mailman id 1430583;
 Wed, 23 Sep 2026 13:22:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9MvJ-0004pO-AJ
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:22:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9MvI-00BQAt-NI
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:22:08 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d27c-8faa-0a2a0a5109dd-0a2a450bb9a2-12
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:22:08 +0200
Received: from [74.125.229.12] (helo=mail-dy2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d27f-b7e8-0a2a450b0019-4a7de50cd980-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:22:08 +0200
Received: by mail-dy2-f12.google.com with SMTP id
 5a478bee46e88-328664b7528so678738eec.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:22:08 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:22:04 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169726; x=1790774526; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4msTpp+vR3Q9A3d1BOVyjzK5nl0nVEODWOwLdHYYFFk=;
        b=ZwQ/Lt7f3AoWtgi4NNjO7nFFxgEbiuYzS6ub+UVQQcIPByryjTAK2MXxv+akjeEBa4
         hfLjwl/XJ6OAds2Vg7/Mk8EmNbLsbjc843rqwjb7skC8XSt5R9aN8whioEGbKVscWjnf
         l247w1PnzEwW+zp9drNq5W6/WlfYtUyHiZsvo8Ohs5rYjUMtVBJB5BOvXj0eDs2wBklr
         sKV+IZNjCPNk91MnppG1P2ca1xojV7s5QQNpOTk7NYRW90Ri8+hwBeIFXC6f26TujgCR
         rv/6f3mBtkOWAnpIjO3QxDUftlqupwiRlluiczTYgkVD6/4RaM5Zk/nSu1gMlecbC7XJ
         dWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169726; x=1790774526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4msTpp+vR3Q9A3d1BOVyjzK5nl0nVEODWOwLdHYYFFk=;
        b=15wPr4xKCT6AhrZ9Cjp2rWwtjo+mBbyvluddX1HGtSK1/ReGitKnFdidXzDXPrnCpF
         MQ1r+x4PlRRJdRMFZkoHV3PVwyCeD0GN5pnk7xwtRg14+1LrhE6y0o6GIGlkGfwHp/HG
         lCZDf1TKRNMDk9HL3BPYlOqQOg+W5/1TKxa47XvPLbsQZrqpKXJc20YIuNxHAXQeYrK3
         uMadeh1+sJNrBG1Y7a3VZ5MbJx3HqfPKnyGBAUmQcKWg/ZZ4jaB2Rl8hpilE8esVpO0w
         UlTf5Au4Ul/JFJ1g9WfkjhDi39ka+WW3N36En2hp92akXH9MCKKJtcOSVtyJYQxwbDKj
         M0QQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpHN4/UwJ/L4CdQtcQAhHfmLob18F0qBTNR/nnM7VUrGcZtm62ztvhfMUCKWEWxQo2I6da176YU9I=@lists.xenproject.org
X-Gm-Message-State: AFuF++lmkokxOSUFInXde6Ye8btmYAe8YhQ3ggNKiWQUYUZt0QpbXbIV
	mI8Y+1ndiNDW55gqaIwuxeqPAwdGSO1JhRK8hdf57f1mAacpcnAOwG6L
X-Gm-Gg: AYBFou0XCbvPF3y8pF5Dt1udnt7pET2YQ7Maw/5NDrhdlBw+MCjQVZlnIwOjejYBMTp
	BuB0EmkluG7arl+1vZjQsFo3BIrPP/xr2BMf8AYGiGKjylj9DHp8y6eXIuKTFcScAMaXuM7N+Ic
	Xl0v7zlXofhRukWNNJ5B5pj/Ba6G/aBFSaP54SZdNeLui4nmwZMW2/HzV71+cQc3YYaKzMJqWB9
	ozmdy+GpdW0Z9q0BgDo8wAxeFexJyli4Mmd6d0WCfPZcmrfTp/oF6Aw8JYaZHXnztJHTqKlRjmP
	D7+gKsc/P7fMyzDtjAohOX0VnO2GuG390HT3gicg5BmvltlD3xpHycZehk5AIztg2WorVJNE3w6
	jT9rPotUSx9w+xC+Z+NjAY82f9wcQwg7LE1Xhob74kiHTHdQtKp2nWMlWW4cxaKsaHbmk/e8IS6
	k3doTNwIxKgCVKR9GYp0Q16VPS8dtNbSsRtbHaSnj1V2q61tnSw0SpQ8aGxxFwyT0RmLEeEs8Iw
	EI0NmqH7XatnS5ZOUUDJMTffLebo58=
X-Received: by 2002:a05:7301:d595:b0:33b:e55f:68c8 with SMTP id 5a478bee46e88-33e8d8d21e3mr2659104eec.26.1790169725708;
        Wed, 23 Sep 2026 06:22:05 -0700 (PDT)
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
Subject: [PATCH v3 031/114] tcg: fix off-by-one in helper extend-free assert
Date: Wed, 23 Sep 2026 21:15:05 +0800
Message-ID: <20260923131635.1894-32-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1790169728-1A4DB9EA-B7EBDC82/0/0
X-purgate-type: clean
X-purgate-size: 746

- Allow n_extend == MAX_CALL_IARGS after filling extend_free.
- The old < check fired on a valid seven-argument extend.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 tcg/tcg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 489df0e7386..6d55cc284df 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2599,7 +2599,7 @@ static void tcg_gen_callN(void *func, TCGHelperInfo *info,
         QTAILQ_INSERT_TAIL(&tcg_ctx->ops, op, link);
     }
 
-    tcg_debug_assert(n_extend < ARRAY_SIZE(extend_free));
+    tcg_debug_assert(n_extend <= ARRAY_SIZE(extend_free));
     for (i = 0; i < n_extend; ++i) {
         tcg_temp_free_i64(extend_free[i]);
     }
-- 
2.52.0.windows.1


