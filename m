Return-Path: <SRS0=vb+Z=HG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07946C433DB
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 13:38:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA61164F10
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 13:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA61164F10
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.81305.150039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7ept-0002Fm-Lh; Thu, 04 Feb 2021 13:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81305.150039; Thu, 04 Feb 2021 13:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7ept-0002Ff-I9; Thu, 04 Feb 2021 13:38:17 +0000
Received: by outflank-mailman (input) for mailman id 81305;
 Thu, 04 Feb 2021 13:38:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+S2h=HG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7eps-0002Fa-7A
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 13:38:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bbdb616-48cc-45ca-a194-06893fe0048a;
 Thu, 04 Feb 2021 13:38:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AB264ACB0;
 Thu,  4 Feb 2021 13:38:13 +0000 (UTC)
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
X-Inumbo-ID: 0bbdb616-48cc-45ca-a194-06893fe0048a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612445893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XGYTqHc3ows1m4ndaNUxi/WSzJmQDlGNgfX75xhENOU=;
	b=EJZ1VcGa41LPjN+RZSH51kAHgmeOgFCnKWJg56sB0ZpbWgZD6EaDN5vjZuDkp9a+VAodvH
	ZHR0Lnr7Ws5o09kdTXz4gqfhTRPUwpj1cwF2LTeEd2bZumyQB8Tmf+b6zx3uNI8VArG1j9
	KYSVAV8lkIcjCov78uzz1guCVgw8l70=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/EFI: work around GNU ld 2.36 issue
Message-ID: <e6d59277-35b2-e7df-0e68-a794c8855ac0@suse.com>
Date: Thu, 4 Feb 2021 14:38:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Our linker capability check fails with the recent binutils release's ld:

.../check.o:(.debug_aranges+0x6): relocation truncated to fit: R_X86_64_32 against `.debug_info'
.../check.o:(.debug_info+0x6): relocation truncated to fit: R_X86_64_32 against `.debug_abbrev'
.../check.o:(.debug_info+0xc): relocation truncated to fit: R_X86_64_32 against `.debug_str'+76
.../check.o:(.debug_info+0x11): relocation truncated to fit: R_X86_64_32 against `.debug_str'+d
.../check.o:(.debug_info+0x15): relocation truncated to fit: R_X86_64_32 against `.debug_str'+2b
.../check.o:(.debug_info+0x29): relocation truncated to fit: R_X86_64_32 against `.debug_line'
.../check.o:(.debug_info+0x30): relocation truncated to fit: R_X86_64_32 against `.debug_str'+19
.../check.o:(.debug_info+0x37): relocation truncated to fit: R_X86_64_32 against `.debug_str'+71
.../check.o:(.debug_info+0x3e): relocation truncated to fit: R_X86_64_32 against `.debug_str'
.../check.o:(.debug_info+0x45): relocation truncated to fit: R_X86_64_32 against `.debug_str'+5e
.../check.o:(.debug_info+0x4c): additional relocation overflows omitted from the output

Tell the linker to strip debug info as a workaround. Oddly enough debug
info has been getting stripped when linking the actual xen.efi, without
me being able to tell why this would be.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -123,7 +123,7 @@ ifneq ($(efi-y),)
 # Check if the compiler supports the MS ABI.
 export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
 # Check if the linker supports PE.
-XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) -mi386pep --subsystem=10 -o efi/check.efi efi/check.o 2>/dev/null && echo y))
+XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) -mi386pep --subsystem=10 -S -o efi/check.efi efi/check.o 2>/dev/null && echo y))
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 endif
 

