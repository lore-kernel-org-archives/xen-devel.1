Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B910EC982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:22:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430620.1653161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mw1-0007I3-H0; Wed, 23 Sep 2026 13:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430620.1653161; Wed, 23 Sep 2026 13:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mw1-0007Ht-DH; Wed, 23 Sep 2026 13:22:53 +0000
Received: by outflank-mailman (input) for mailman id 1430620;
 Wed, 23 Sep 2026 13:22:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Mvz-0007Eh-KZ
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:22:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Mvz-007xKs-17
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:22:51 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d2a0-bab6-0a2a0a5309dd-0a2a4505baa4-36
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:22:51 +0200
Received: from [74.125.229.12] (helo=mail-dy2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d2a9-4cb1-0a2a45050019-4a7de50cb49c-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:22:50 +0200
Received: by mail-dy2-f12.google.com with SMTP id
 5a478bee46e88-328664e050bso1176303eec.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:22:50 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:22:47 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169769; x=1790774569; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFqvsxy7L8PH7M6DU9x+2jtR9XBAWYnvWHhVICE/SQI=;
        b=S8Ael6cPBLVfggLp0obVwsiHL19HFc5WAQsy9qj32jWbdJuefowzZIU+Syx9ycrEBD
         sVRZhwAGfAi9TH08TYLvdA/DaibKp0AJJYkcyih2j+mSNiu96WjuGgcRxdyIDn19veGU
         moxRl5IJjcrPH++01Mgq24a56JgLpSWaRhFcJbuUs8400+VlXJ++eVJr8QfQnGV24vFL
         riGcntDGpzvmZGObbuLSVoMDNnusTp1ueWFneNFqewLp1qjXnKdM/Hb9crov79T9TWu5
         1qDG99odaOJP/GDfPjEK0/9ZSII8y5W3fkgoaM1FtyYSzD3xxI9LOupqDmM/fH9q0WIE
         7dnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169769; x=1790774569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qFqvsxy7L8PH7M6DU9x+2jtR9XBAWYnvWHhVICE/SQI=;
        b=GjCbV0khZ23uf7T50hK82Ml4CvX27sQwSSJoZvLa1oUoHqlpMqggTki9zl+BwM9Tzl
         z8mcoK3WXNVzCqPd6uXqaqLdl1pRl5UcgD+q5IC8gJu3tpuLr7FaHVAdadThtuLWde2s
         2M66Ng/Z/agvJEBJVS1g9PeVlj/n2toFJBid3aYFZdie3lJylK89dhWDt0OMHFBqVucR
         G1BRJCXcnxelHwpiljAv2NGwcNwpv+fXJ3wvOhLlgLRPF6hdYTRQTX3NPC4AOzdh9s6/
         sAL7WlZ9WuKa212LUDoBw1YhDPvckRDHq1eAKp2JXauD4y+Oqg6vWBbseazHjtun6Ixy
         QoAA==
X-Forwarded-Encrypted: i=1; AKwUvByJmSnL16ShUE0jfx4lmDk+5QdrRhDaDJQGpvpQqnfRjI3mArmn4WRibTRKNZufiutifcuXqF3BBT0=@lists.xenproject.org
X-Gm-Message-State: AFuF++kD3qUBE8YPosfm3IniWE2gjgCdWydA5eAIiLEFNfTO+Fm59TMi
	IPMF9u3lPx6xGEOsan+7Pb2LkA6BeteJwA3auGIZAVZI98PtcUUDS6R8
X-Gm-Gg: AYBFou1V8BHtlrJBuW6fC7uCPD2tZcfxIBfrD0Lz4SY7DTRjNqXIwzIf5mQcCAqnsgw
	zTHnb45El8rIzFfwvistpd4ArHlQ+uAX/QtNBf/n8qhfGxW7wYD7F4PKp2ddW6Sv7F84srxEOiN
	dlwSgUI6xLtCb0+QdRV5UBKCzoThDXqlEepKmFtb6R+V2co82frMXD//BvOUzlOsviG1KiMOzfo
	YL+S5aYaoXrH4kaKey++Pp5gJYXZQ30GcpchKPrZTGFvr+KOhIaW+JP/IgkpofzBKCx1G7QhkcO
	fUjG0sUN5dR4AhlmqpLuk5lTGnhgqPbGWB8H0xL5+0HT56vxw5WXTY5TZGcT7bXXw8/+7+IBHLL
	D3SC8iFrWc8GrZJ5SzFc3xLrF7w6ciclQCx6fx1oJtCNtCaNQYoDUqhRMhTVt18R65sQJEl1FaR
	F54Umd2p3HGJuslxKj6IOARzDWIvQPe/+J6uIUVcNpM8/VSWBs/h5oAE0xMUbm+JoGL/9ZD9cDM
	cuvlRY0wAOc19cPTy3A+TsBiRvWF34=
X-Received: by 2002:a05:7300:59a1:b0:33b:e842:d272 with SMTP id 5a478bee46e88-33e8be6c06bmr2642017eec.5.1790169767812;
        Wed, 23 Sep 2026 06:22:47 -0700 (PDT)
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
Subject: [PATCH v3 036/114] target/riscv: select ELF dump class from target_riscv64
Date: Wed, 23 Sep 2026 21:15:10 +0800
Message-ID: <20260923131635.1894-37-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1790169771-F5EA92A1-8F223EC7/0/0
X-purgate-type: clean
X-purgate-size: 921

- Replace TARGET_RISCV64 with target_riscv64() so dump class still
  follows the QEMU target, not guest MXL.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/arch_dump.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c
index 12b68799070..2704bd8d94e 100644
--- a/target/riscv/arch_dump.c
+++ b/target/riscv/arch_dump.c
@@ -175,11 +175,11 @@ int cpu_get_dump_info(ArchDumpInfo *info,
 
     info->d_machine = EM_RISCV;
 
-#if defined(TARGET_RISCV64)
-    info->d_class = ELFCLASS64;
-#else
-    info->d_class = ELFCLASS32;
-#endif
+    if (target_riscv64()) {
+        info->d_class = ELFCLASS64;
+    } else {
+        info->d_class = ELFCLASS32;
+    }
 
     info->d_endian = (env->mstatus & MSTATUS_UBE) != 0 ?
                      ELFDATA2MSB : ELFDATA2LSB;
-- 
2.52.0.windows.1


