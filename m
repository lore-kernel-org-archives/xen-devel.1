Return-Path: <SRS0=zvGf=KJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4095CC433ED
	for <xen-devel@archiver.kernel.org>; Fri, 14 May 2021 15:18:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6DA46145A
	for <xen-devel@archiver.kernel.org>; Fri, 14 May 2021 15:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6DA46145A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.127409.239467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhZa0-0000bu-Vo; Fri, 14 May 2021 15:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127409.239467; Fri, 14 May 2021 15:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhZa0-0000bn-Rp; Fri, 14 May 2021 15:18:20 +0000
Received: by outflank-mailman (input) for mailman id 127409;
 Fri, 14 May 2021 15:18:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRnq=KJ=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lhZa0-0000bh-9X
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 15:18:20 +0000
Received: from mail-qt1-x829.google.com (unknown [2607:f8b0:4864:20::829])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f5de20c-72b4-48a5-806e-fa33dd6974df;
 Fri, 14 May 2021 15:18:19 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id j11so22399683qtn.12
 for <xen-devel@lists.xenproject.org>; Fri, 14 May 2021 08:18:19 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 d84sm4665216qke.131.2021.05.14.08.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:18:17 -0700 (PDT)
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
X-Inumbo-ID: 8f5de20c-72b4-48a5-806e-fa33dd6974df
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t+535v201V6yOpH45NDGnYgfBVri8G9cr1TNn8Y5vxU=;
        b=aqGv2GnlndOQBWyVyD3ZsYDc7cry9v08kxCeP9FzXhBoxrkRcnboBS2hvCtxtf5q+b
         RWiAj9ttpPDaP8tcH0INQosU3lQo2Y1cSHQoprtpQVLNJlN6PYlkIZ/JK/rNAmeJUawe
         VIJU20tJL1kXjX4dr3fifYJTAEvgYEjot0Wib+gUn/U3od+9jCvwWDsvE5izagE4VM+C
         q5STODozGC75f5fRVZUcv93Z0toSvXSazMmriWRwJ8V1seaZfZkSnXjf7Jrbbn7pGeX+
         V1tagf1utMXwx4TOKGz+A0wb9VnbbyMcIo6xVcyygWXqNq5/4DoE7QxK/SzEWHF3h+ZT
         cJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t+535v201V6yOpH45NDGnYgfBVri8G9cr1TNn8Y5vxU=;
        b=Xa3I2Rr+QEeIK3CCRkTV8CzmAzxqGM3zaSLNJ6NxMcHw81wHOm5PC4VXmCPDEkoVLD
         C/5FE6P+n8379fBo3Lqm+oXU2HfeTFLy13CKbFIitqUaUaqz1UsmnblyB1VV/4yaAi92
         8sCEdZornsuY6JmGBB59/L+TSXcUbEEG3ueZbfZLblNkDE2pDmG9ai9lDP3+djV08SnI
         NdgatJEWM0Dz0e1z9fsiX0znXep7FKxPVBTBfC6ie6jG4zV+OGrzMn5NWx2KK56UI8R3
         Xe+dBTL/wBuKkd2pQbSNFG0PGg3Yv4gbeWnJQsZO/28nBoxts8iVrjNOBYZOXJ2ePsBA
         16eQ==
X-Gm-Message-State: AOAM531FsIZBtr94yIALC/KZRGL0EqVJt+tGCEixuEdo6AcJoSQmKLiV
	h/cFyIr0/wTtiuufgYk99o8=
X-Google-Smtp-Source: ABdhPJwNJGJf0niwJ7a/By1VXpPQr+BwLSKBfe2noB/9Y6LJbs2lPd8B50wNf9lLpl1gI7uZcAcc3A==
X-Received: by 2002:a05:622a:1005:: with SMTP id d5mr21548657qte.0.1621005499131;
        Fri, 14 May 2021 08:18:19 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: jandryuk@gmail.com,
	xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	julien@xen.org,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	wl@xen.org
Subject: [RFC PATCH 1/3] libelf: Introduce phys_kstart/end
Date: Fri, 14 May 2021 11:17:29 -0400
Message-Id: <20210514151731.19272-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <CAKf6xpsyzazbY_mA0QtAuAqpOPkpuhjrZ1wid0khWy1urh4iBg@mail.gmail.com>
References: <CAKf6xpsyzazbY_mA0QtAuAqpOPkpuhjrZ1wid0khWy1urh4iBg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The physical start and end matter for PVH.  These are only used by a PVH
dom0, but will help when separating the PV and PVH ELF checking in the
next patch.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 xen/arch/x86/hvm/dom0_build.c      | 4 ++--
 xen/common/libelf/libelf-dominfo.c | 3 +++
 xen/include/xen/libelf.h           | 2 ++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 878dc1d808..5b9192ecc6 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -574,8 +574,8 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
     }
 
     /* Copy the OS image and free temporary buffer. */
-    elf.dest_base = (void *)(parms.virt_kstart - parms.virt_base);
-    elf.dest_size = parms.virt_kend - parms.virt_kstart;
+    elf.dest_base = (void *)parms.phys_kstart - parms.elf_paddr_offset;
+    elf.dest_size = parms.phys_kend - parms.phys_kstart;
 
     elf_set_vcpu(&elf, v);
     rc = elf_load_binary(&elf);
diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
index 69c94b6f3b..b1f36866eb 100644
--- a/xen/common/libelf/libelf-dominfo.c
+++ b/xen/common/libelf/libelf-dominfo.c
@@ -453,6 +453,8 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
     }
 
     virt_offset = parms->virt_base - parms->elf_paddr_offset;
+    parms->phys_kstart = elf->pstart;
+    parms->phys_kend   = elf->pend;
     parms->virt_kstart = elf->pstart + virt_offset;
     parms->virt_kend   = elf->pend   + virt_offset;
 
@@ -464,6 +466,7 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
         elf_parse_bsdsyms(elf, elf->pend);
         if ( elf->bsd_symtab_pend )
             parms->virt_kend = elf->bsd_symtab_pend + virt_offset;
+            parms->phys_kend = elf->bsd_symtab_pend;
     }
 
     elf_msg(elf, "ELF: addresses:\n");
diff --git a/xen/include/xen/libelf.h b/xen/include/xen/libelf.h
index b73998150f..8d80d0812a 100644
--- a/xen/include/xen/libelf.h
+++ b/xen/include/xen/libelf.h
@@ -434,6 +434,8 @@ struct elf_dom_parms {
     /* calculated */
     uint64_t virt_kstart;
     uint64_t virt_kend;
+    uint64_t phys_kstart;
+    uint64_t phys_kend;
 };
 
 static inline void elf_xen_feature_set(int nr, uint32_t * addr)
-- 
2.31.1


