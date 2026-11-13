Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E349606A323
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XzEI49dE
Received: from list by lists.xenproject.org with outflank-mailman.1487712.1689963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWc-0000yH-52; Fri, 13 Nov 2026 15:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487712.1689963; Fri, 13 Nov 2026 15:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWc-0000xl-1J; Fri, 13 Nov 2026 15:49:14 +0000
Received: by outflank-mailman (input) for mailman id 1487712;
 Fri, 13 Nov 2026 15:49:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWa-0000j8-6H
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWZ-00Gq2H-JJ
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:11 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73161-8faa-0a2a0a5109dd-0a2a4505dd8c-48
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:11 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73177-4cb1-0a2a45050019-d155dd2bc9c7-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:11 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4918c2d727fso548735f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:11 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:10 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584951; x=1795189751; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igAb6mu7EkgNDaYY7yC8JINlLVzRxi+/jvZostv5N2U=;
        b=XzEI49dExZ72gFmKxr7A+Kz3eS/47ZNTw4bn0hWv3jOERkNTAWvFSDQpAUx7kq86FJ
         LpwGqOLLwzBkV67KwSNIGOMZnfM5BCXpUxAzJBYkgk1ty44eLsncxtBhVlAcFgdSmID2
         NnuXY10y63mE8XOdtCqV40YIFKZX8OhL3ucsCekhncK2gdS+/vF0Af2YFFLOhNgYRUBv
         UAp0KPhWGkaj/wRu1D1A0VQBknu5JaiI5CaaL3EBLlfyF4svieam4owYlBGYEgrJvZup
         JD7MVdCRBSIZ854hflO55BoDSnu5QHZaDXLfrhPxoEVyTRvkucctBtMGkwCtV2bJxNFt
         DVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584951; x=1795189751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=igAb6mu7EkgNDaYY7yC8JINlLVzRxi+/jvZostv5N2U=;
        b=HZNbYH/sTL8H6KDT5o9a3Jq1z6MIG/BbKETlsn5yWbBWBtAeFhAELWR7J0warrP8Oh
         zUpSv/vKdIILoUE37SgdolgFpYvmiPa39aPtBWnw6T9Nzi8CGS9NsXmaDqJQr7zlgY/E
         wXpE7qjd7Hpj1oIfW/wQxbN60yNHxbjF0jupuVGy6BMrjPPc3YvlICfGIviPO9bYV5QG
         sMUeT0U5Jp88Ji8EwCBWPky0CmO+VV+gl4pDIbYdtinxMI1bhFra0XDCSsBoXkxw5WUh
         3OJbzh6Qi5eitL5aZ1JDwAFmosf/ILWc8hyk8rAhV2e1BQjNdcxD+XrPeZaEX5V+FfSE
         MxJA==
X-Gm-Message-State: APuU4Z//1b5UWyF/TGJZ1lN9PHtBBtiYRyB/FqL1wM0+TNM0ZsUvtCG0
	YbeemdRWPE41TVRaDlyNtBCdyroEFZoBhzwnH8mF1RizuDTWdxBMIFuYdnchwg==
X-Gm-Gg: AYBFou3MdWIs1jpvUQy10hURcrbY8ObCXVSWkEI2d1rciVCuzGnt7L3fDQXK9vgvh2e
	oZGQTIU5Ajq8gthYGpkpVSoe/PjX5IPShwH1foH1izbcY1jGQej3VNee8EQXfULsyqPblCqPMpH
	5+UxnDvkzbijRgau/SN0zXQwreR92XorphCLVqPVjxNGuxqK0Wbczlv3Yk0QN2R4yMUM4FLGtEq
	pnRk7qNe/NOC8xzC/8VZf8uhPzycfF4VC3Q9EmcgmQH7Huzh5ivmZ5oc1gv5Ynz7uDNRGXy3Qn4
	L6gf5YSaKSHW/f4alUon/zD3fbZsHDryPVoRgnZzz82QnMvB1W7iFfyYP6PGcfI4y89oxszCR1L
	6CEe1YnwjL/jetSmP8qVd/3m6o4rBYXdkL/WYN45zlonZyFM4jgBE8SPICGTelPyt56QLG8jWfE
	8jDoO+VZNlaNy1YB2lAuWydXDEk2P4rR2tcHclgzuSyuwNvIJQsowKYXYEPYWCqGXjp4/Ep/xbM
	ONmZIag+m/TSOWXUQrMH34USR+36NCsOGxUhYazcHN65Ozos4zaBlYUtQZXJ9xilEWiufYwg4oC
	idrHa0NscA5lPqIzIgS0NwOXtTGsz83laVSgTpDZwzSmQHwgHEBaLitf6XAZK8iVN/mW
X-Received: by 2002:a05:6000:2584:b0:49d:a36c:2d66 with SMTP id ffacd0b85a97d-49da38ab522mr836643f8f.27.1794584950836;
        Fri, 13 Nov 2026 07:49:10 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
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
Subject: [PATCH v4 04/42] xen/riscv: define the IPRIO field of the APLIC target register
Date: Fri, 13 Nov 2026 16:48:25 +0100
Message-ID: <1ea5498253b6b786edbc8f69d15f06f6daafa139.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1794584951-243112A1-3179FF11/10/73395122804
X-purgate-type: spam
X-purgate-size: 2830
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

aplic_init_hw_interrupts() initialises the IPRIO field of the target
registers with APLIC_DEFAULT_PRIORITY, a constant private to aplic.c,
whereas, since commit 60004aa6da75 ("xen/riscv: add missing APLIC
register offsets, masks to asm/aplic.h"), the fields of each APLIC
register and the values they take are defined in <asm/aplic.h>, right
below the register's offset, as described at the top of that header.

Define APLIC_TARGET_IPRIO and APLIC_TARGET_IPRIO_DEFAULT there
accordingly and use the latter instead of APLIC_DEFAULT_PRIORITY. As
the layout of the target register depends on the delivery mode, and
IPRIO overlaps with EIID, also note which fields exist in which mode.

No functional change.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - New patch, split out of "xen/riscv: implement virtual APLIC MMIO
   emulation".
---
---
 xen/arch/riscv/aplic.c             | 6 ++----
 xen/arch/riscv/include/asm/aplic.h | 4 ++++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 79bbc0e864d5..bffa29bb21ac 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -28,8 +28,6 @@
 #include <asm/io.h>
 #include <asm/riscv_encoding.h>
 
-#define APLIC_DEFAULT_PRIORITY  1
-
 static struct aplic_priv aplic = {
     .lock = SPIN_LOCK_UNLOCKED,
 };
@@ -58,9 +56,9 @@ static void __init aplic_init_hw_interrupts(void)
         /*
          * Low bits of target register contains Interrupt Priority bits which
          * can't be zero according to AIA spec.
-         * Thereby they are initialized to APLIC_DEFAULT_PRIORITY.
+         * Thereby they are initialized to APLIC_TARGET_IPRIO_DEFAULT.
          */
-        writel(APLIC_DEFAULT_PRIORITY, &aplic.regs->target[i]);
+        writel(APLIC_TARGET_IPRIO_DEFAULT, &aplic.regs->target[i]);
     }
 
     writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index 51be469b69e5..6afdb9cae7a2 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -86,9 +86,13 @@
 #define APLIC_TARGET_LAST               0x3ffc
 #define  APLIC_TARGET_HART_IDX          GENMASK(31, 18)
 #define  APLIC_TARGET_HART_IDX_SHIFT    18
+/* If target is in MSI delivery mode (domaincfg.DM = 1) */
 #define  APLIC_TARGET_GUEST_IDX         GENMASK(17, 12)
 /* Bit 11 is reserved and reads as zero */
 #define  APLIC_TARGET_EIID              GENMASK(10, 0)
+/* If target is in direct delivery mode (domaincfg.DM = 0) */
+#define  APLIC_TARGET_IPRIO             GENMASK(7, 0)
+#define   APLIC_TARGET_IPRIO_DEFAULT    1U
 
 #define APLIC_IDC_SIZE                  32
 
-- 
2.56.1


