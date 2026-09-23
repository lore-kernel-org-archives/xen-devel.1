Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C496C9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:23:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430636.1653179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MwI-0008IE-4K; Wed, 23 Sep 2026 13:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430636.1653179; Wed, 23 Sep 2026 13:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MwI-0008I7-0Z; Wed, 23 Sep 2026 13:23:10 +0000
Received: by outflank-mailman (input) for mailman id 1430636;
 Wed, 23 Sep 2026 13:23:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9MwH-0008H9-F7
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:23:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9MwG-00DrQ8-S3
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:23:08 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d2ba-bab6-0a2a0a5309dd-0a2a450a888e-6
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:23:08 +0200
Received: from [74.125.229.167] (helo=mail-dl2-f39.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d2bb-f2d2-0a2a450a0019-4a7de5a78032-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:23:08 +0200
Received: by mail-dl2-f39.google.com with SMTP id
 a92af1059eb24-1438cb9b3a3so944124c88.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:23:08 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:23:04 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169786; x=1790774586; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9wmWDAGxCIEbiXb+JeTWZOg+WBaBPZDk+tkeJy0Fzg=;
        b=tD5Rchr/mzov+PXj/5Zm6oEa0yFtnPqS41tcwOWO8W1bZOIbic4DgfivDKOE5csVeN
         e54jEvRplXbhEK4/NndcwDEeoOBh3NIIGTHVbszfn8nJ4RbacbT0Ph+TjZEdYdMndOJU
         1Bck3pHQBAPllThBhXX7S1jnqyhxXEPh9Gu7TIjJDwHi/CCfxhrwtqyIlqwBcbN6mdVq
         6i9+2zOK+6sFNUc1ZRr7yzHyDsSnFqw3ScqSgNjIKGBoY51KpIX9IX5Y7m3kuC0+vSaA
         hbdTPrNziEpKQK6I9Mjb6f+sOUQkgbtmbbUDARN2bdmgLHzXJ33jrCt4aHYkkzMtEQeY
         zaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169787; x=1790774587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B9wmWDAGxCIEbiXb+JeTWZOg+WBaBPZDk+tkeJy0Fzg=;
        b=YAS/m+L/PlFfLdCNLx1xIdQzAwDd+qgujIB00ho44QJF124dIPyL0gUzXwwqvg9jYc
         onYVu9XgKdb4RRRkfR8n8lG2pjIc43rFmGJSr4I0lPm+iyDqRFL2RqsAxKyUu+30SmDa
         egrYsyhWUw/oDvPcS3cUYGmZHrHxdMtnkF0oQ7S+rJAIiSLa2hXsy7NIpuPHd3dyRkE7
         3WRcLCjsiA61aNf1W3ZgdHev8aDCK2lCrsvrU/vqGVAXeOpu19HOsHO/p3zlR8hHkKQZ
         9thVS/b/x79g/HvcvVIOK13QVSJ70bZJZ4KZUB4xm1moUrh+nm5+agQ6F4Q9yN/hKGNy
         oJeg==
X-Forwarded-Encrypted: i=1; AKwUvByj8F3+E1bw7mfE4HfhQ4WJ6mYHurQijjBQil+nWNDenLK3r6+Iofehn9CPjQXp1rRz+xfy2xsdGx4=@lists.xenproject.org
X-Gm-Message-State: AFuF++kLSdOp1TEN+Pma/sg2caQtCqIKNiwEabn0T3zOnViGgyNUEPjf
	s1SBLgsiSz14CxJ5cIAey0Z730lMyjiYWmaGsY5dZY72suOmMzy+XuJq
X-Gm-Gg: AYBFou2dvF29uYQ8zMJ5/2IbgPdodZVbzGJdr7dmJPM7tro6IL3Afm3cOQfSn3XgLDb
	BLSedxi13RzGhTAJUbLkyZXXBOR4R5cXtORHjbYX63YDkJbLZr4RYjJzV4rQV69LprEeMYIK7ax
	TMQsvHNvBFqJZASTfQPIv0wykAIYbsf2kSV0Ucdgtewa3ruNje4OIdV2AkgFGMqwrcvYtCgB1d8
	99uk4ot+3rIXQxPwCbEiFdiPovetDzsK7w42UlRqkV8oaFBtM+3xI1BDevM+amzMjXp6U5nLfRe
	njsoNDrxafZQ/xAse285TSB1AoFrWt/xPALY3qBbQf0vJ+2zWZox5e87bevFbWvNNzBFJpA/C/j
	Qv3sRUBXneuFW/Mv8rhVFfqnsIKO1nDHRmiBsalP7GdA2eH0N2jhIXmPoTI+6Eaen4RfvIHD0bJ
	5W+Dd85aZNIG1blGpqBA+NZa4wMA1G9EBGUBpGqF72JYTH9VKHxEI0z/yPHXL1grl6bcmCCKnq9
	WvVcdC8AcT9JSqlCJb649Qe2ACWfiCGeOH1wFz+hw==
X-Received: by 2002:a05:693c:88c6:10b0:33c:e93:764b with SMTP id 5a478bee46e88-33e8e3add75mr2436826eec.37.1790169785754;
        Wed, 23 Sep 2026 06:23:05 -0700 (PDT)
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
Subject: [PATCH v3 038/114] target/riscv: use target_long_bits in pmpaddr granule checks
Date: Wed, 23 Sep 2026 21:15:12 +0800
Message-ID: <20260923131635.1894-39-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1790169788-502F0CFC-DADF620E/0/0
X-purgate-type: clean
X-purgate-size: 1349

- Replace TARGET_LONG_BITS with target_long_bits() for TOR/NAPOT
  PMP address masking.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/tcg/pmp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
index 41b55519a8e..03ee7c74300 100644
--- a/target/riscv/tcg/pmp.c
+++ b/target/riscv/tcg/pmp.c
@@ -23,6 +23,7 @@
 #include "qemu/log.h"
 #include "qapi/error.h"
 #include "cpu.h"
+#include "qemu/target-info.h"
 #include "target/riscv/tcg/csr.h"
 #include "trace.h"
 #include "exec/cputlb.h"
@@ -643,14 +644,14 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
             /* fallthrough */
         case PMP_AMATCH_TOR:
             /* Bit [g-1:0] read all zero */
-            if (g >= 1 && g < TARGET_LONG_BITS) {
+            if (g >= 1 && g < target_long_bits()) {
                 uint64_t granule = 1ULL << g;
                 val = ROUND_DOWN(val, granule);
             }
             break;
         case PMP_AMATCH_NAPOT:
             /* Bit [g-2:0] read all one */
-            if (g >= 2 && g < TARGET_LONG_BITS) {
+            if (g >= 2 && g < target_long_bits()) {
                 val = deposit64(val, 0, g - 1, -1ULL);
             }
             break;
-- 
2.52.0.windows.1


