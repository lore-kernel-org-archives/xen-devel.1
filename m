Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A45C982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:22:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430572.1653107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MvB-0004J3-Kj; Wed, 23 Sep 2026 13:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430572.1653107; Wed, 23 Sep 2026 13:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MvB-0004Iw-HG; Wed, 23 Sep 2026 13:22:01 +0000
Received: by outflank-mailman (input) for mailman id 1430572;
 Wed, 23 Sep 2026 13:22:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9MvA-0004Ge-Ia
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:22:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Mv9-009DZj-VY
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:21:59 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d26f-e002-0a2a0a5209dd-0a2a45028604-32
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:21:59 +0200
Received: from [74.125.229.12] (helo=mail-dy2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d276-6ca4-0a2a45020019-4a7de50cc507-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:21:59 +0200
Received: by mail-dy2-f12.google.com with SMTP id
 5a478bee46e88-3346e75082eso423380eec.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:21:59 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:21:56 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169718; x=1790774518; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=20fmaOno77HQJxryAkVKJDwkjIsA6lPsyx3HFEs6GYM=;
        b=fg08DtR8zIgBo/fdkUSHRPVTs3tVdIZa1YkebjDzZk7+njQ1UMG3nw/NgAc0B1J9uY
         LSsKOw5E4n+XRc7NBoh4B4OEsTWw0saMWBsDLCGeyZFz50QCFXCLjJTzPEpx91VlshFy
         e9P8S6rusdl5bvK9KV5qaawP1FiMtUR9xKXWioUERaehEpVyxMog/1IXfkRLJSjygbms
         9DpobUahlPyFxAT9Cv/hV1Gh7Ot/EgJlnwworbLO7hatGZCvZyRbQBfVOFzxZLG8OVMM
         jIExSp0/haLta0Bz2+UuWhxLW8l7ocAKHGsYzM8p5j+MYvNiLpEQBCMRNkaH6NG7P9Z+
         XYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169718; x=1790774518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=20fmaOno77HQJxryAkVKJDwkjIsA6lPsyx3HFEs6GYM=;
        b=pwPuW2WQpKNoXkgsZdMbGKCcqY7Y051NA4KwY+5Y7dqoCGBqv+WiN8KlU2Hoeqfjwx
         9RS0wMpZFFU/O173p7/2ZvbkX6kh9MOptjJx8v2sIviO7ORRDVoXN+oGW5IS+R8bWSgH
         h7aQv3wW/2MUENreAmXzYasYCdHccZcG0nqaw9hznDoEHThs6nFR8Xx9v1Lu6ojTXVks
         NM0rho/9+Os5g/cSZOyTIkZX/ivbSQJclgoaSGuFSWg0ikdRyVFwy/Rlf/IXPzygn7lb
         EngOobY3kZNJcIHbQhO2jDVdy1LTOCxt1rAsEPyvPEUUlycPsvBHIyLugNaHPoBGeTT+
         LKbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpygtUSB0YgC0kJBqJXA6jlPXFKmXGXKo3UyeLKdaSdg88X8gGH6s5yjUw46gaHRJeeksIKXRxXDc=@lists.xenproject.org
X-Gm-Message-State: AFuF++n20euqJ05eoJ7B9RPxLr5Tsa2JP924ni3Dz6vzXDaw2U8iAgZh
	pH2YGqUHF3rKSJhG2XoCGE1RQIMo/PEZ/0GDjUaaXg4c2Yq4oH4RUv4q
X-Gm-Gg: AYBFou0IeKp0xdQN4I0bPzz/bJBK6kBog+0jVWhZybyNy/2Ow8DwzMAdXiTi284oQ9E
	cxbZfuJKvZUgmsEGmio2ybyAnB+doaKwoZCZQMYIqEJRuTD8MLn12secCFQJhRJysUV7mbiXHzQ
	+vEb1FJGxgfer57ZEqqwAI76+qGUD4vvaiQjtMNsMpmXRTYS9F2m/nzovb9rPz/aezHupzswJz9
	g1BB/TC8v7aBTMjauL5u6tX/CheWuf3PHhNIndYCPm3syLBcHoPD/RP1s+wrLArwg2bRySYqVab
	Jz/wicCkWYywWZ5VIC2j4abbsFTSiBYyfpU22i7itEQLoDUj2cSK8GkVDW3ReL84s2FBQ80PIOn
	h9bPPJi+t3qjL1okl03bzjvpms1Ubm0VjruX6nlVyM4AiElXSE1y+PXAhcl/rhvpd/+T/9VJLgg
	ZtYGqzJfM4AjC6buRDHh744GSjtarwGOr4agI8A8MG3/8eMWqfiTKaLzUwKbZdY0AfUbzum8bBi
	31th7KzhBDw8Mw4nV492k6SFz3KAsrQNLjgQ0rr1A==
X-Received: by 2002:a05:7301:db0c:b0:33b:96b8:3818 with SMTP id 5a478bee46e88-33e8ddbe14cmr1962518eec.32.1790169717553;
        Wed, 23 Sep 2026 06:21:57 -0700 (PDT)
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
Subject: [PATCH v3 030/114] target/riscv: add kvm stubs source set
Date: Wed, 23 Sep 2026 21:15:04 +0800
Message-ID: <20260923131635.1894-31-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1790169719-F30B02AC-81CC386F/0/0
X-purgate-type: clean
X-purgate-size: 1929

- Add riscv_stubs_ss and kvm-stub.c, matching the ARM target_stubs_arch
  pattern (has_mp_state returns false; other entry points are
  g_assert_not_reached).
- Register target_stubs_arch += {'riscv': riscv_stubs_ss}.
- Leave target_arch / target_system_arch in place; next change can
  move RISC-V onto target_common_system_arch.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/kvm/kvm-stub.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm/kvm-stub.c b/target/riscv/kvm/kvm-stub.c
index 64e39c96d89..1c8c324cd44 100644
--- a/target/riscv/kvm/kvm-stub.c
+++ b/target/riscv/kvm/kvm-stub.c
@@ -9,6 +9,37 @@
 #include "qemu/osdep.h"
 #include "target/riscv/kvm/kvm_riscv.h"
 
+/*
+ * Safe to call without KVM. Return "not supported".
+ */
+bool kvm_riscv_has_mp_state(void)
+{
+    return false;
+}
+
+/*
+ * These functions should never actually be called without KVM support.
+ */
+void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
+{
+    g_assert_not_reached();
+}
+
+void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
+{
+    g_assert_not_reached();
+}
+
+void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
+{
+    g_assert_not_reached();
+}
+
+uint64_t kvm_riscv_get_timebase_frequency(RISCVCPU *cpu)
+{
+    g_assert_not_reached();
+}
+
 void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
                           uint64_t aia_irq_num, uint64_t aia_msi_num,
                           uint64_t aplic_base, uint64_t imsic_base,
@@ -17,7 +48,7 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
     g_assert_not_reached();
 }
 
-uint64_t kvm_riscv_get_timebase_frequency(RISCVCPU *cpu)
+void riscv_kvm_aplic_request(void *opaque, int irq, int level)
 {
     g_assert_not_reached();
 }
-- 
2.52.0.windows.1


