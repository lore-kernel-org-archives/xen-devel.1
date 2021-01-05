Return-Path: <SRS0=UuSr=GI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF62C433DB
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 15:26:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB05D22BE9
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 15:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB05D22BE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.62041.109575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwoDw-00074S-02; Tue, 05 Jan 2021 15:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62041.109575; Tue, 05 Jan 2021 15:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwoDv-00074L-Sy; Tue, 05 Jan 2021 15:26:15 +0000
Received: by outflank-mailman (input) for mailman id 62041;
 Tue, 05 Jan 2021 15:26:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwoDu-00074G-Sv
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 15:26:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b053899-a02a-4e6c-a72d-2c0418a9ceac;
 Tue, 05 Jan 2021 15:26:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF4B2AA7C;
 Tue,  5 Jan 2021 15:26:12 +0000 (UTC)
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
X-Inumbo-ID: 3b053899-a02a-4e6c-a72d-2c0418a9ceac
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609860373; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u8M7EsLS0C5q1ckXSsQtk++ppLCHhtbbix3PAqLuLhA=;
	b=G6cdeZf0sX7/g1Zju7Vs6VisJS2yyqsDOqW6P9OIagOKOo5y8jwnwouDdDS0ujVFBJz9B2
	9l056adcRjXOpQUOItgcvpqtulkQwveDqFSBUWgI3BtVG+k3SZ8NAvJALM/X7Ws5MupmV8
	juUHdawZUkFV4MexB/xjj0BknVutv9g=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86: drop use of E801 memory "map" (and alike)
Message-ID: <d7b5bc83-7390-9b31-d44d-8ad371ee466b@suse.com>
Date: Tue, 5 Jan 2021 16:26:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

ACPI mandates use of E820 (or newer, e.g. EFI), and in fact firmware
has been observed to include E820_ACPI ranges in what E801 reports as
available (really "configured") memory. Since all 64-bit systems ought
to support ACPI, drop our use of older BIOS and boot loader interfaces.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Drop all use of E801 (and older).

--- a/xen/arch/x86/boot/mem.S
+++ b/xen/arch/x86/boot/mem.S
@@ -4,8 +4,6 @@
 #define E820_BIOS_MAX 128
 
 get_memory_map:
-
-.Lmeme820:
         xorl    %ebx, %ebx                      # continuation counter
         movw    $bootsym(bios_e820map), %di     # point into the whitelist
                                                 # so we can have the bios
@@ -17,14 +15,14 @@ get_memory_map:
         pushw   %ds                             # data record.
         popw    %es
         int     $0x15
-        jc      .Lmem88
+        jc      .Ldone
 
         cmpl    $SMAP,%eax                      # check the return is `SMAP'
-        jne     .Lmem88
+        jne     .Ldone
 
         incw    bootsym(bios_e820nr)
         cmpw    $E820_BIOS_MAX, bootsym(bios_e820nr) # up to this many entries
-        jae     .Lmem88
+        jae     .Ldone
 
         movw    %di,%ax
         addw    $20,%ax
@@ -32,38 +30,7 @@ get_memory_map:
         testl   %ebx,%ebx                       # check to see if
         jnz     1b                              # %ebx is set to EOF
 
-.Lmem88:
-        movb    $0x88, %ah
-        int     $0x15
-        movw    %ax,bootsym(highmem_kb)
-
-.Lmeme801:
-        stc                                     # fix to work around buggy
-        xorw    %cx,%cx                         # BIOSes which don't clear/set
-        xorw    %dx,%dx                         # carry on pass/error of
-                                                # e801h memory size call
-                                                # or merely pass cx,dx though
-                                                # without changing them.
-        movw    $0xe801, %ax
-        int     $0x15
-        jc      .Lint12
-
-        testw   %cx, %cx                        # Kludge to handle BIOSes
-        jnz     1f                              # which report their extended
-        testw   %dx, %dx                        # memory in AX/BX rather than
-        jnz     1f                              # CX/DX.  The spec I have read
-        movw    %ax, %cx                        # seems to indicate AX/BX 
-        movw    %bx, %dx                        # are more reasonable anyway...
-1:      movzwl  %dx, %edx
-        shll    $6,%edx                         # and go from 64k to 1k chunks
-        movzwl  %cx, %ecx
-        addl    %ecx, %edx                      # add in lower memory
-        movl    %edx,bootsym(highmem_kb)        # store extended memory size
-
-.Lint12:
-        int     $0x12
-        movw    %ax,bootsym(lowmem_kb)
-
+.Ldone:
         ret
 
         .align  4
@@ -71,7 +38,3 @@ GLOBAL(bios_e820map)
         .fill   E820_BIOS_MAX*20,1,0
 GLOBAL(bios_e820nr)
         .long   0
-GLOBAL(lowmem_kb)
-        .long   0
-GLOBAL(highmem_kb)
-        .long   0
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1059,28 +1059,6 @@ void __init noreturn __start_xen(unsigne
             bytes += map->size + 4;
         }
     }
-    else if ( bootsym(lowmem_kb) )
-    {
-        memmap_type = "Xen-e801";
-        e820_raw.map[0].addr = 0;
-        e820_raw.map[0].size = bootsym(lowmem_kb) << 10;
-        e820_raw.map[0].type = E820_RAM;
-        e820_raw.map[1].addr = 0x100000;
-        e820_raw.map[1].size = bootsym(highmem_kb) << 10;
-        e820_raw.map[1].type = E820_RAM;
-        e820_raw.nr_map = 2;
-    }
-    else if ( mbi->flags & MBI_MEMLIMITS )
-    {
-        memmap_type = "Multiboot-e801";
-        e820_raw.map[0].addr = 0;
-        e820_raw.map[0].size = mbi->mem_lower << 10;
-        e820_raw.map[0].type = E820_RAM;
-        e820_raw.map[1].addr = 0x100000;
-        e820_raw.map[1].size = mbi->mem_upper << 10;
-        e820_raw.map[1].type = E820_RAM;
-        e820_raw.nr_map = 2;
-    }
     else
         panic("Bootloader provided no memory information\n");
 
--- a/xen/include/asm-x86/e820.h
+++ b/xen/include/asm-x86/e820.h
@@ -36,7 +36,6 @@ extern struct e820map e820;
 extern struct e820map e820_raw;
 
 /* These symbols live in the boot trampoline. */
-extern unsigned int lowmem_kb, highmem_kb;
 extern struct e820map bios_e820map[];
 extern unsigned int bios_e820nr;
 

