Return-Path: <SRS0=TJt3=KC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B87FC433ED
	for <xen-devel@archiver.kernel.org>; Fri,  7 May 2021 06:23:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B78BC613DD
	for <xen-devel@archiver.kernel.org>; Fri,  7 May 2021 06:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B78BC613DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.123773.233514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1letso-0002nF-Ma; Fri, 07 May 2021 06:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123773.233514; Fri, 07 May 2021 06:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1letso-0002n8-Ix; Fri, 07 May 2021 06:22:42 +0000
Received: by outflank-mailman (input) for mailman id 123773;
 Fri, 07 May 2021 06:22:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rJTn=KC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1letsn-0002n2-Ay
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 06:22:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 474f3c92-fadc-4433-a115-e596de231dca;
 Fri, 07 May 2021 06:22:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D129DB136;
 Fri,  7 May 2021 06:22:37 +0000 (UTC)
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
X-Inumbo-ID: 474f3c92-fadc-4433-a115-e596de231dca
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620368557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+rPoFfwrDqquUA3/waQM7VjLnXiWggLIa79HlJ27+SQ=;
	b=KL7/+oMv5M6cLjmvv4B81jM2AmBppywBi/0t51iDq2ME69nr97J82QwFlFhLZhl7Ge6/Oa
	U6DopaIaae62xtndbi74kTgDtrgeBmQcy6YOIxqcJ7gugF/EoM771CSvEGLalQDREjdYe9
	NSS7RfXGRt+Iu1j3ZSx0ZT41jWL1NnA=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/shim: fix build when !PV32
Message-ID: <08ea57f0-732e-fe12-409c-5487fb493429@suse.com>
Date: Fri, 7 May 2021 08:22:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In this case compat headers don't get generated (and aren't needed).
The changes made by 527922008bce ("x86: slim down hypercall handling
when !PV32") also weren't quite sufficient for this case.

Try to limit #ifdef-ary by introducing two "fallback" #define-s.

Fixes: d23d792478db ("x86: avoid building COMPAT code when !HVM && !PV32")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -34,8 +34,6 @@
 #include <public/arch-x86/cpuid.h>
 #include <public/hvm/params.h>
 
-#include <compat/grant_table.h>
-
 #undef virt_to_mfn
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
 
@@ -300,8 +298,10 @@ static void write_start_info(struct doma
                                           &si->console.domU.mfn) )
         BUG();
 
+#ifdef CONFIG_PV32
     if ( compat )
         xlat_start_info(si, XLAT_start_info_console_domU);
+#endif
 
     unmap_domain_page(si);
 }
@@ -675,6 +675,13 @@ void pv_shim_inject_evtchn(unsigned int
     }
 }
 
+#ifdef CONFIG_PV32
+# include <compat/grant_table.h>
+#else
+# define compat_gnttab_setup_table gnttab_setup_table
+# define compat_handle_okay guest_handle_okay
+#endif
+
 static long pv_shim_grant_table_op(unsigned int cmd,
                                    XEN_GUEST_HANDLE_PARAM(void) uop,
                                    unsigned int count)
@@ -704,10 +711,13 @@ static long pv_shim_grant_table_op(unsig
             rc = -EFAULT;
             break;
         }
+
+#ifdef CONFIG_PV32
         if ( compat )
 #define XLAT_gnttab_setup_table_HNDL_frame_list(d, s)
             XLAT_gnttab_setup_table(&nat, &cmp);
 #undef XLAT_gnttab_setup_table_HNDL_frame_list
+#endif
 
         nat.status = GNTST_okay;
 
@@ -778,6 +788,7 @@ static long pv_shim_grant_table_op(unsig
             }
 
             ASSERT(grant_frames[i]);
+#ifdef CONFIG_PV32
             if ( compat )
             {
                 compat_pfn_t pfn = grant_frames[i];
@@ -789,8 +800,10 @@ static long pv_shim_grant_table_op(unsig
                     break;
                 }
             }
-            else if ( __copy_to_guest_offset(nat.frame_list, i,
-                                             &grant_frames[i], 1) )
+            else
+#endif
+            if ( __copy_to_guest_offset(nat.frame_list, i,
+                                        &grant_frames[i], 1) )
             {
                 nat.status = GNTST_bad_virt_addr;
                 rc = -EFAULT;
@@ -799,10 +812,12 @@ static long pv_shim_grant_table_op(unsig
         }
         spin_unlock(&grant_lock);
 
+#ifdef CONFIG_PV32
         if ( compat )
 #define XLAT_gnttab_setup_table_HNDL_frame_list(d, s)
             XLAT_gnttab_setup_table(&cmp, &nat);
 #undef XLAT_gnttab_setup_table_HNDL_frame_list
+#endif
 
         if ( unlikely(compat ? __copy_to_guest(uop, &cmp, 1)
                              : __copy_to_guest(uop, &nat, 1)) )

