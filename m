Return-Path: <SRS0=Kz/T=JU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA4AC433B4
	for <xen-devel@archiver.kernel.org>; Fri, 23 Apr 2021 11:03:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8CE061352
	for <xen-devel@archiver.kernel.org>; Fri, 23 Apr 2021 11:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8CE061352
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.116193.221823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtaz-0005oo-6X; Fri, 23 Apr 2021 11:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116193.221823; Fri, 23 Apr 2021 11:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtaz-0005oh-3P; Fri, 23 Apr 2021 11:03:37 +0000
Received: by outflank-mailman (input) for mailman id 116193;
 Fri, 23 Apr 2021 11:03:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZtay-0005oa-BQ
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 11:03:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b60d196c-89dd-4628-bd93-a871f5e31660;
 Fri, 23 Apr 2021 11:03:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B019FB10B;
 Fri, 23 Apr 2021 11:03:34 +0000 (UTC)
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
X-Inumbo-ID: b60d196c-89dd-4628-bd93-a871f5e31660
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619175814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gtsBQVM6fXHKsNwZadOnV9fPekSRbF3U9lRQ6dy2Lxs=;
	b=X83AGop41/LmzdecgL+3Urc1U4teWi+xBRqV307GrvJTMvUn+Jxz7YTADg3d4Y2Q0e4Esh
	r+JwJgBVUwp+4X/RwJHBjxeSVBEhsu3U98dE5R2cUtAuK7K46kGD3b6uCIhrJbh3IWqdV+
	+ieldNxlQBO+zCA7/SeJ1YdhAGwlee0=
Subject: [PATCH v2 1/3] x86/EFI: sections may not live at VA 0 in PE binaries
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <89e97459-28fd-704f-d424-88afa3a2a4a5@suse.com>
Message-ID: <748d35dc-5a2f-302f-d789-9797c6726810@suse.com>
Date: Fri, 23 Apr 2021 13:03:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <89e97459-28fd-704f-d424-88afa3a2a4a5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

PE binaries specify section addresses by (32-bit) RVA. GNU ld up to at
least 2.36 would silently truncate the (negative) difference when a
section is placed below the image base. Such sections would also be
wrongly placed ahead of all "normal" ones. Since, for the time being,
we build xen.efi with --strip-debug anyway, .stab* can't appear. And
.comment has an entry in /DISCARD/ already anyway in the EFI case.

Because of their unclear origin, keep the directives for the ELF case
though.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
It's certainly odd that we have stabs section entries in the script, but
no Dwarf ones.

--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -350,6 +350,7 @@ SECTIONS
 #endif
   }
 
+#ifndef EFI
   /* Stabs debugging sections.  */
   .stab 0 : { *(.stab) }
   .stabstr 0 : { *(.stabstr) }
@@ -358,6 +359,7 @@ SECTIONS
   .stab.index 0 : { *(.stab.index) }
   .stab.indexstr 0 : { *(.stab.indexstr) }
   .comment 0 : { *(.comment) }
+#endif
 }
 
 ASSERT(__2M_rwdata_end <= XEN_VIRT_END - XEN_VIRT_START + __XEN_VIRT_START -


