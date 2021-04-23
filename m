Return-Path: <SRS0=Kz/T=JU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811F2C43460
	for <xen-devel@archiver.kernel.org>; Fri, 23 Apr 2021 11:04:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2224A61469
	for <xen-devel@archiver.kernel.org>; Fri, 23 Apr 2021 11:04:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2224A61469
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.116199.221847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtbu-00060d-Nj; Fri, 23 Apr 2021 11:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116199.221847; Fri, 23 Apr 2021 11:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtbu-00060W-KT; Fri, 23 Apr 2021 11:04:34 +0000
Received: by outflank-mailman (input) for mailman id 116199;
 Fri, 23 Apr 2021 11:04:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZtbs-00060I-P6
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 11:04:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fa1e508-9a3e-4a93-a6d7-2854014ea655;
 Fri, 23 Apr 2021 11:04:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 50989B118;
 Fri, 23 Apr 2021 11:04:31 +0000 (UTC)
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
X-Inumbo-ID: 0fa1e508-9a3e-4a93-a6d7-2854014ea655
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619175871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PHtI+ZWAFKtMbksWLAGrO29iTTVDU3TNyeZGMIXneH8=;
	b=ZFBeNweJmgyabc5I5bXOoDJkRGRj3K4N/KPjMKnWSlXaQ5EberNE3ytXzDTetp2rb6MrDm
	B128mCIg7DCv8YFKiZzYVL62Ju1h3QZt84DQSpL0X3sOuQxRg1wS1Y7on2bUJJXSxnHorF
	PLX+EM9QCf3PgKnNiMFBthZGkCVWn0A=
Subject: [PATCH v2 3/3] x86/EFI: don't have an overly large image size
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <89e97459-28fd-704f-d424-88afa3a2a4a5@suse.com>
Message-ID: <0010bf45-ee8d-5518-9c17-6f8ef140185e@suse.com>
Date: Fri, 23 Apr 2021 13:04:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <89e97459-28fd-704f-d424-88afa3a2a4a5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

While without debug info the difference is benign (so far), since we pad
the image to 16Mb anyway, forcing the .reloc section to a 2Mb boundary
causes subsequent .debug_* sections to go farther beyond 16Mb than
needed. There's no reason to advance . for establishing __2M_rwdata_end,
as all data past _end is of no interest at runtime anymore anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
This makes more explicit a possible latent problem with the ELF image:
It ends at _end, not __2M_rwdata_end (advancing . as was done here does
not have the effect of increasing the image size). Interestingly the
conversion xen-syms => xen rounds up the program header specified size
suitably, as per the comment "Do not use p_memsz: it does not include
BSS alignment padding" in mkelf32.c. I do think this would instead want
taking care of in the linker script. Commit 7a95e0a2c572 ("x86: properly
calculate xen ELF end of image address") clearly only hacked an existing
hack rather than addressing the root cause. Thoughts?

--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -303,8 +303,7 @@ SECTIONS
   } PHDR(text)
   _end = . ;
 
-  . = ALIGN(SECTION_ALIGN);
-  __2M_rwdata_end = .;
+  __2M_rwdata_end = ALIGN(SECTION_ALIGN);
 
 #ifdef EFI
   .reloc ALIGN(4) : {


