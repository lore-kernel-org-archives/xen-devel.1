Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FAACA5FCD
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:19:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437478.1656402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx25-0006n9-SI; Wed, 30 Sep 2026 16:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437478.1656402; Wed, 30 Sep 2026 16:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx25-0006kj-Iv; Wed, 30 Sep 2026 16:19:49 +0000
Received: by outflank-mailman (input) for mailman id 1437478;
 Wed, 30 Sep 2026 16:19:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx24-0006db-Iw
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:19:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx23-007398-H7
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:19:47 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd368b-e002-0a2a0a5209dd-0a2a4509baf2-44
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:19:47 +0200
Received: from [74.125.225.99] (helo=mail-wr2-f35.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd36a3-be1a-0a2a45090019-4a7de1639a24-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:19:47 +0200
Received: by mail-wr2-f35.google.com with SMTP id
 ffacd0b85a97d-4887840c529so1974070f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:19:47 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01eb60804sm2807245e9.1.2026.09.30.09.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:19:46 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785187; x=1791389987; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lHdTYGi1Jbmw7kNLK7RacNslgvIwjTWakn7E42QVdOk=;
        b=l06lCOSV7EynRL12EhazaF+x2ynb4OfZQJ6dlteZsRumTf/UXcjibkKOtymWrGi+Ko
         h+RKx50KC67Qgwr1X591XSCbutUoDKNr9AUlGY+Wavv0Voqth12T217AvSUlKDO1Lhoa
         IXf9KqT/PXEDGVgxjskG60IoE/mKwbNl64x77uv3i+GdVZhKHWccqXBHwfBihCzFYs+1
         wNrS+XAvUN0GtFRBZbuLhml1UVUEVWUuB1Sl8+xLoulb5WF03IjvbwDcFkFJIo+lFJiQ
         EqAq7pYyHwR/yKiLbPbR0NFXCr2sjW6DHqw/z1ONQF8G89y9ZIpJbP0QaRaVTVfKWglM
         GEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785187; x=1791389987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lHdTYGi1Jbmw7kNLK7RacNslgvIwjTWakn7E42QVdOk=;
        b=U9AjTDbidJK6IsrHH+82GQvaX4ta6QB1/E/bL2WdAnmLte2ENXtHfd0vwM4aPZ99US
         pJISPMnLM4rYNf6qX2ZR2mSLsvSVkdqTUE2lxdMcIVoHpt/szKJkVEgjKJnflrttG3Lv
         0J+VUNnjxlToqvK1GvOZfV6yoUD4kB5Wn49cS7SRV9ra0VMbxgSoNa1vA1FOnIlVv0Gi
         peNgAHTr45FQA9skpnHAYmz01AT7PudL1+wSwCTbATo7AwN4yUvx4zsRr4LlSFyR61CL
         pXsf5Y/AygQT7PIjwLXkpInCIUxJ5bqTHySK5mRF4nT4CG9rhp3Vk+h38J9qwUJKWeVs
         s61g==
X-Gm-Message-State: AFuF++nBnHGVVrXBA6esIcaPtLUyUdfyZYTOcgxu3hQhwTPkgrSerbj5
	CUBol8c8er85jOIn0fuCvjBWVa14jN/Ul1uBvd2JT4oGA47unZEsCosvKqus7A==
X-Gm-Gg: AYBFou2+uIUw251YUBvlka3ce99cIq5tbxFqJist2qatnVnER89fGsL40YueEDMDLET
	OsX9ynpc2N4H7vSQdMuqcFF1i+rfqxvo3PqyfPfyaobfHjkvNQ7jarLeXkzRKr6W1E7AtvGqCat
	YdIlPku+bygL7td/dAplttT2oQXDMYNYZOFl4cAGA6Fr0nvOxRlZHNf/mRHXB7nHDY6C+P2SrOx
	LClGT8ZNmHrmKaKkPR5JZybq7hNqwqKi2qYPbtRkZRPLzu89KFnq3mLb5MuHz9bFT6Z3uOS67PF
	9rqgiOjqLejJVL4d6/aLhc3MNJsOWnwiNKKlZF4ULKyqSMg+WcSC15P1eoUD0EGqB+metuoapA8
	Ny7YMfZHs4fGaESoe+Ss4+3n79Mv71LFYZt/9y8vvnHWkkhVqVJcls+bl9o8jwYkONmBtI9+9zX
	B1IJos0Kzypuvq/aD6b33OV8Lg9wRkXL2Jz9oLREB5QZJUDq2SUfxZB3sqSFdmx3tv61SCY0jKv
	LjuIdn8MH/Sus9PcPRIl7fOOYRIYOqbWoPLzekH
X-Received: by 2002:a05:600c:5d0:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-4a01eb12cecmr1590275e9.13.1790785186884;
        Wed, 30 Sep 2026 09:19:46 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 07/39] xen/riscv: introduce CPU_NONE
Date: Wed, 30 Sep 2026 18:18:49 +0200
Message-ID: <d35b280c0bf075a2a730f9cb69ced407e346ebd5.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1790785187-FD06B034-A5D6629D/10/73395122804
X-purgate-type: spam
X-purgate-size: 3395

Introduce CPU_NONE, a CPU number which doesn't identify any physical
CPU, to be used wherever a pCPU has to be recorded but there may be
none.

Its first user is vsfile_cpu in struct vimsic_state, which records the
pCPU whose h/w guest interrupt file backs the vCPU's IMSIC VS-file.
NR_CPUS has been used there as the value meaning that there is no such
pCPU, i.e. that the s/w VS-file is in use. NR_CPUS is however an upper
bound rather than a "no CPU" marker, and it already carries other
meanings: hartid_to_cpuid() returns it for a hart Xen doesn't know, and
pcpu_info[] uses it for an entry whose processor_id isn't valid yet.
Use CPU_NONE for vsfile_cpu instead, so that the s/w VS-file case can't
be mistaken for any of those.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
CPU_NONE is also used later in this series:
 - "xen/riscv: implement virtual APLIC MMIO emulation" checks vsfile_cpu
   against it to tell whether the target vCPU has a h/w guest interrupt
   file.
 - "xen/riscv: implement vCPU context switching" initialises the new
   arch_vcpu.last_cpu with it, and "xen/riscv: handle the case when no
   vCPU migration is needed" checks last_cpu against it.
 - "xen/riscv: remap interrupts to new IMSIC VS-file", "xen/riscv: save
   and clear the old IMSIC VS-file on vCPU migration" and "xen/riscv:
   introduce IMSIC h/w interrupt file attaching to vcpu" use it for
   vsfile_cpu of the s/w IMSIC VS-file.
---
Changes in v3:
 - New patch.
---
---
 xen/arch/riscv/imsic.c              | 4 ++--
 xen/arch/riscv/include/asm/config.h | 3 +++
 xen/arch/riscv/include/asm/imsic.h  | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 44b8640ea39a..402b2f14f591 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -357,9 +357,9 @@ int cf_check vcpu_imsic_init(struct vcpu *v)
     /*
      * xvzalloc() already cleared the context, so guest_file_id == 0, i.e. the
      * always-available s/w IMSIC VS-file. Only vsfile_cpu needs an explicit
-     * initializer as its s/w VS-file value is NR_CPUS rather than 0.
+     * initializer as its s/w VS-file value is CPU_NONE rather than 0.
      */
-    imsic_state->vsfile_cpu = NR_CPUS;
+    imsic_state->vsfile_cpu = CPU_NONE;
 
     v->arch.vimsic_state = imsic_state;
 
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index fd69057826e1..fb6203a7d502 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -136,6 +136,9 @@
 #define OPT_CONSOLE_STR "dtuart"
 #define INVALID_VCPU_ID MAX_VIRT_CPUS
 
+/* A CPU number which doesn't identify any physical CPU. */
+#define CPU_NONE (~0U)
+
 /* Linkage for RISCV */
 #ifdef __ASSEMBLER__
 #define CODE_FILL /* empty */
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 2425430ed116..6baadc008d81 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -71,7 +71,7 @@ struct vimsic_state {
      */
     unsigned int guest_file_id;
     /*
-     * s/w IMSIC VS-file -> vsfile_cpu == NR_CPUS
+     * s/w IMSIC VS-file -> vsfile_cpu == CPU_NONE
      * h/w IMSIC VS-file -> vsfile_cpu < NR_CPUS
      */
     unsigned int vsfile_cpu;
-- 
2.55.0


