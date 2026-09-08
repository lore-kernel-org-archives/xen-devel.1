Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D58C79FA1
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 12:30:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411949.1642409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uy1-0008Jf-Ox; Tue, 08 Sep 2026 12:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411949.1642409; Tue, 08 Sep 2026 12:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uy1-0008JY-L5; Tue, 08 Sep 2026 12:30:25 +0000
Received: by outflank-mailman (input) for mailman id 1411949;
 Tue, 08 Sep 2026 12:30:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3uxz-0008J8-Ua
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 12:30:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3uxz-003vnT-9T
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 14:30:23 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9fffdb-bab6-0a2a0a5309dd-0a2a4506cd22-10
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:30:23 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9fffdf-195a-0a2a45060019-d1558033f099-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:30:23 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-49cf4f81d86so35926895e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 05:30:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7736132sm384330685e9.12.2026.09.08.05.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 05:30:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788870623; x=1789475423; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kiWbQw9EwIxXGXNqk4rZjP+K/qOOMDmRGIIFqlnYnvE=;
        b=AO1iReM59fFMpshHWr5GYE7CB96aGoUN+uNe+EA/Nd3PwhBnkUIHBjDE/p6XvRJGn0
         HJdvfc5bRCmyA2Ug38Fen1cRaeCRpEg2+Rov9KlsBWcdWRQhhs7/GBS3W0OF/K12G4m2
         rF0AOGLYFev6Rxyjwj82I+VF0ztIDvrlPayj82garGZSbicD+7n/kVMOVDyew9L+3bF2
         W5S7rSyw6U7BDFglopB1IxJldOAYKvlmKCrqcNFo6MDulHkfr3IKfIO4MpyT6IRZ/+fW
         004/OnpJSjV+LL+T7q+TpA3ZDmt3JYLCIDXV2njC5Y5jZQ1eSrJC5jc6i26MOH0QVVuY
         CYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788870623; x=1789475423;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kiWbQw9EwIxXGXNqk4rZjP+K/qOOMDmRGIIFqlnYnvE=;
        b=NNQtvzmBOijb0qI0OgtA8jbCyD8BblF26qd/AeaIKJNFzUJ0LvfY9xurZiRTEj9J5P
         iwiHUFxMsPasKjLiVBfOF0eJVgictSWf3jAUB4VyAgxUaUwMhj6nFJZa0+x0l8A9jM2E
         NIdvLbchGKW3j2wzC8dKaTUlEs0n7IV+E5Gpa6QpiC/dPdf9gmYXPpOjI8Ud7KXSEL3d
         ulFBYGZPVpIrQTvyI/HsYomB1nitZiS+REAtWVgler0xphNHgk+5NHxXm5BqJuiw5cuE
         vxT6HVX8uKsjVRZCY6sew1nlFNw3SehROD7bH9NjeimyYSCQBuSxbABAezTwiluUmss0
         /Gxw==
X-Gm-Message-State: AFuF++laEPrt5Pl1aHRi2S2wxcSlmQo5vpyCiAPN8IBR8AKWDvlJOhzx
	yzETAoKOkU+teJLi8h3PUB3YIP1CB2J6gFZ4X3gGV4BYlF82lCCwbcoAZPUW17t1d/LY927KEi9
	1NRp0eg==
X-Gm-Gg: AYBFou1PDXDcitfSQ/Fuf4lN/6WpHxk9LJpEdHyGXXU7iaUckX7BK6w7a7yUBkF3xOi
	jezP7pQInqVpVEUXdrjAFyaA8Ue1W3CX+LkrvZwGBtxFB/86LWy3DCcL2oj3tWNTv/C83RVINRf
	KYQQz9GLoB45yj3/MESVh2vnUJ0yoaFQxwtfxWl51NFnGDQefIgNHlvX13YWwsMPdBM+hWaREq+
	E1uUDeki5rQaYj6ZARZVODk9Tl3vFHHEiueZ9RtXM60JrBtwcuJaiI5PK6kzNt9liE5lwAAPPz+
	h8w0Vge3BOG3rk4Yq+Jaa3ivgJ9VLvX9BFHNd61woTvJW6/qsbT3L5GKMVbgm+8tEEPv5zdRUDD
	OetI1FQtgKJwClf3IiPtO5MwO09C9rolhWm7vKMlvduHR0bDbrkwaeFfbOQWbrdJcETqcy2Y5AX
	Jk4eL60kFtaJ4vRFqe7a4Swdu5d2NqGoFDoI9OjIw1khVMRFWVKiuGYptwiLgdsNcky77ZJsiXx
	nL39k5HHj9SxEO7+2fmmookwcgQHqOxFHmwh12R2NOmcj3qEEgx
X-Received: by 2002:a05:600c:3e06:b0:49c:fc6c:be1b with SMTP id 5b1f17b1804b1-49cfc6cc0e9mr231534555e9.33.1788870622577;
        Tue, 08 Sep 2026 05:30:22 -0700 (PDT)
Message-ID: <aa7db179-8865-486b-a5bb-270efb6f02a4@suse.com>
Date: Tue, 8 Sep 2026 14:30:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 5/6] build: move $(all-symbols-*)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
References: <153fd1b8-810a-4091-84d5-5395d83f2ee9@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <153fd1b8-810a-4091-84d5-5395d83f2ee9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1788870623-FDA0C77B-A0ACEED3/0/0
X-purgate-type: clean
X-purgate-size: 2927

With the final linking logic now consolidated in scripts/Makefile.link,
$(all-symbols-*) also doesn't need setting anymore in (and passing down
from) the top level Makefile.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -465,10 +465,6 @@ ALL_OBJS-$(CONFIG_CRYPTO) += crypto/buil
 ARCH_LIBS-y               :=
 ALL_LIBS-y                := lib/lib.a
 
-all-symbols-y :=
-all-symbols-$(CONFIG_LIVEPATCH) += --all-symbols
-all-symbols-$(CONFIG_FAST_SYMBOL_LOOKUP) += --sort-by-name
-
 include $(srctree)/arch/$(SRCARCH)/arch.mk
 
 # define new variables to avoid the ones defined in Config.mk
@@ -622,8 +618,7 @@ $(TARGET): outputmakefile asm-generic FO
 	$(Q)$(MAKE) $(build)=arch/$(SRCARCH) include
 	$(Q)$(MAKE) $(build)=. arch/$(SRCARCH)/include/asm/asm-offsets.h
 	$(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' \
-	            'ALL_LIBS=$(ARCH_LIBS-y) $(ALL_LIBS-y)' \
-	            'all_symbols=$(all-symbols-y)' $@
+	            'ALL_LIBS=$(ARCH_LIBS-y) $(ALL_LIBS-y)' $@
 
 SUBDIRS = xsm arch common crypto drivers lib test
 define all_sources
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -183,14 +183,14 @@ ifeq ($(XEN_BUILD_PE),y)
 	$(MKRELOC) $(filter .$(TARGET).efi.%, $^) > $@
 
 .$(TARGET).efi.0s.S:
-	$(objtree)/tools/symbols $(all_symbols) --empty > $@
+	$(objtree)/tools/symbols $(all-symbols-y) --empty > $@
 
 .$(TARGET).efi.1s.S: .$(TARGET).efi.0
 .$(TARGET).efi.2s.S: .$(TARGET).efi.1
 
 .$(TARGET).efi.%s.S:
 	$(NM) -pa --format=sysv $< \
-	  | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+	  | $(objtree)/tools/symbols $(all-symbols-y) --sysv --sort \
  	    --source-name=$(TARGET).efi.S \
 	  > $@
 
--- a/xen/scripts/Makefile.link
+++ b/xen/scripts/Makefile.link
@@ -3,6 +3,10 @@
 # Helper rules for linking xen-syms
 # ==========================================================================
 
+all-symbols-y :=
+all-symbols-$(CONFIG_LIVEPATCH) += --all-symbols
+all-symbols-$(CONFIG_FAST_SYMBOL_LOOKUP) += --sort-by-name
+
 syms-warn-dup-y := --warn-dup
 syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
 syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup
@@ -17,7 +21,7 @@ final-image-check-y ?= true
 	$(call cmd,cc_o_S)
 
 .$(TARGET)-syms.0.S:
-	$(objtree)/tools/symbols $(all_symbols) --empty > $@
+	$(objtree)/tools/symbols $(all-symbols-y) --empty > $@
 
 .$(TARGET)-syms.1.S: .$(TARGET)-syms.0
 .$(TARGET)-syms.2.S: .$(TARGET)-syms.1
@@ -25,7 +29,7 @@ final-image-check-y ?= true
 
 .$(TARGET)-syms.%.S:
 	$(NM) -pa --format=sysv $< \
-	  | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+	  | $(objtree)/tools/symbols $(all-symbols-y) --sysv --sort \
 	    $(if $(filter $(LAST_LINKING_PASS),$*), $(syms-warn-dup-y)) \
 	  > $@
 


