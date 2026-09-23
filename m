Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40A8C98311
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:18:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430381.1652851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MrG-00062o-NP; Wed, 23 Sep 2026 13:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430381.1652851; Wed, 23 Sep 2026 13:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MrG-00060x-Ev; Wed, 23 Sep 2026 13:17:58 +0000
Received: by outflank-mailman (input) for mailman id 1430381;
 Wed, 23 Sep 2026 13:17:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Mqd-0005gL-Ua
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:17:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Mqc-002EMY-Gf
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:17:18 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d155-bab6-0a2a0a5309dd-0a2a450aa10e-22
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:17:18 +0200
Received: from [74.125.229.170] (helo=mail-dl2-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d15c-f2d2-0a2a450a0019-4a7de5aa985e-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:17:18 +0200
Received: by mail-dl2-f42.google.com with SMTP id
 a92af1059eb24-144f089b1e3so805630c88.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:17:17 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:17:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169436; x=1790774236; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t43puSbRZc523NBj9nQXSYWDHrWaj0cvHGn4qE6n+xk=;
        b=Jlmi46C+QX33iA7Q4P9o/yrrb4JJ2DxukUmCrRMj2zRJ45vsuSMrWiL3uaBOd+xpS9
         PvJRE27tK3vzOs6IBkk3xpm5S/APSE4iGTkZ0HZ0CZpaDNU7DiF5Hl6/Gq0BjaS7cJf0
         /U7WE/U7JDSD5NFv/bL3agfgz3DnX5iPTmblgTAiCoqwxUoXgMY7+QrDyuZOXruCeD2r
         kBLysrBUf1y3WO3EsA2RMSTdqz2Vo/p5wnlnCPjs15/eN+LXw1+0HtB3fOpu4hl8oofj
         uZdfSZ7MTBf/vozsAh3PoDkacfHGxlJ3yPpuq1jgtXkIxjfjYn4PxDDNVgBJe2lsvWcF
         x0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169436; x=1790774236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t43puSbRZc523NBj9nQXSYWDHrWaj0cvHGn4qE6n+xk=;
        b=S9KCguvTccCyd5/eDbpFKSXWmfz/jYOpjQsLYmNrnZyg58uc2Ozo8Gi3wXZsQCTEl1
         Up1ULSiFt5BboTJyBWUtVgasjjbokFsu52KbjNVpNAS3x7bMJUxPnfegTKMMwdG3VDZ1
         E+htPi98/00ITSYEJH9pksYJEJVtJahYDLJWqZ+wtgrH+q1Ogj6OXh9O5u+F8beUGmaq
         oFcvPKlz+oCtSBHOLjsxXdaFhxei3td91XGlbv98Zz3SJY4+Vyy3U2m9PpFqJsAuZj3C
         +Vbi2FN3lyf/fWqVVd6k+Djnbf7V+PZWWzfFlLRjXhUtzDMp6wnaUnn0N1Gpmj9OzyAs
         nYIw==
X-Forwarded-Encrypted: i=1; AKwUvBwIvQynt5ukeme1KcfcFDVAIGrvGCqpexxWALjyxkuNehrggHFeERZRPGMr8LoIFRj8WYtZ9WO/kbI=@lists.xenproject.org
X-Gm-Message-State: AFuF++lElIB3coWsOGop4mXR3OuFNfY1vRtTqHXjEjPAJ2HTG6p9Gpo6
	IxVqa3td2Gc7fYqW/AD5C5Fo50V5BCFGptLViDDZzlrk/zvpDpcefFRh
X-Gm-Gg: AYBFou2IESWlTlrSmyOR3NBreRA4TFun0jkQLu2gZjRdfCF9nrbzx7RdSeFo3eFd4if
	yhNvHEJ7GnKCsPd5njafJz9wdUNrLoNYImj4VfRbmFy8eP8uiYqRp9VFglfVn1OqcX7qD3q2mcq
	hR+B3wejRBgh6ICJ4h8KmIXtV97J4hdMBV7a0i3yESUeWmEEJygKcsiI4YE65CjW9WYsX3w2Da6
	D2CipUfRkaJ/Jn/0r7GCjsgaCAasCL1xDrH9EzAb+1NqDjwHfihTz1OSid98MSiV1WmnYGHKf0g
	FfwrnPFiIJzyjj5U+OqyP0r34gBngcRrh6emWIt3Ks3NGS5aFNkYTU2sU7UcaMrH4+N9Qe7L/Bf
	LeEgJzjajisABQQqnddc87QyXjHubpkpjBMENHdlAEl/QfJ4GPLrvmBLJEAM4o/8IBNp2lnv5aQ
	BJcCDr24Q7qqEBp1/A3LBRFtX/3xy/QdJC5/abqzl4xOFNFwzVibgLcLN6lHu0L7Esn12VKT3YD
	27SVto7Z2phKnuJVyD5D8dwxifgK20=
X-Received: by 2002:a05:7300:8818:b0:338:2485:ad03 with SMTP id 5a478bee46e88-33e8c53c0d4mr2821124eec.16.1790169436068;
        Wed, 23 Sep 2026 06:17:16 -0700 (PDT)
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
Subject: [PATCH v3 003/114] target-info: rename target-info-stub.c in target-info-def.c
Date: Wed, 23 Sep 2026 21:14:37 +0800
Message-ID: <20260923131635.1894-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1790169438-585CBCFC-A8BD492B/0/0
X-purgate-type: clean
X-purgate-size: 1055

From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Now it's the only file left to define target info, we call it def to
make the intent more clear.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 meson.build                             | 2 +-
 target-info-stub.c => target-info-def.c | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename target-info-stub.c => target-info-def.c (100%)

diff --git a/meson.build b/meson.build
index f412d917d94..8bd2d725ca0 100644
--- a/meson.build
+++ b/meson.build
@@ -4330,7 +4330,7 @@ foreach target : target_dirs
     endif
   endif
 
-  arch_srcs += files('target-info-stub.c')
+  arch_srcs += files('target-info-def.c')
 
   if target_base_arch in target_arch
     t = target_arch[target_base_arch].apply(config_target, strict: false)
diff --git a/target-info-stub.c b/target-info-def.c
similarity index 100%
rename from target-info-stub.c
rename to target-info-def.c
-- 
2.52.0.windows.1


