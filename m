Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D532BC61DBD
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 12:03:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399876.1635851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzCLO-0005w9-NM; Wed, 26 Aug 2026 12:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399876.1635851; Wed, 26 Aug 2026 12:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzCLO-0005w2-JO; Wed, 26 Aug 2026 12:03:02 +0000
Received: by outflank-mailman (input) for mailman id 1399876;
 Wed, 26 Aug 2026 12:03:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzCLN-0005vl-BE
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 12:03:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzCLM-005gag-O8
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 14:03:00 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8ed5f0-bab6-0a2a0a5309dd-0a2a4505b254-26
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 14:03:00 +0200
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8ed5f4-4cb1-0a2a45050019-d155da36dd5e-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 14:03:00 +0200
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-c15b1da6b82so98913666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 05:03:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a6fda4fsm525644466b.16.2026.08.26.05.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 05:02:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1787745780; x=1788350580; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/YkZgeYdj2H9TEbe6ZemxBOWAqqSLB5TfcHMI7phaMk=;
        b=YMu/bwNAIX72vNbbQg76rUE2gD8L/kMqn1ngtkqKJIvLBhfsWdSSmks3NInit92Clt
         RkSD4btiaXj+I7UpKPyASy9xdkJ7vJxxxvifBSnj0y27S+RDPOWYW9Vef6R6dmEXQxbe
         cGM8ydTaxq5F/mbOMfhCouhTpYmtZrr6RTvo+q7YI6XMx+r29rrSptEJlyo148pUkDyW
         c88hIqXai0TrJAEBkyxAVn9xBytcwODAL/qV/+XzQVUkBR2b1Mc/ULJ4PmKMP+n/q6zY
         ydmrOgf/iO6Yn2gj9ywe1B+eBVEhbffDSnytREv+gEVRryhPgh3ipv5a7vb3Ov2vSjNn
         2gyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745780; x=1788350580;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/YkZgeYdj2H9TEbe6ZemxBOWAqqSLB5TfcHMI7phaMk=;
        b=rL/qhNQAMh9MLyT/1rHRQA3QyghumcHrairMWEZYktjZZFA2eGe5gEaShrhFQuSzVY
         Sq7JmQm/XMfrP+qbhY6ZOGwo2Zt4KFJq4PEj0Z3D068gKAGinrogO2J9WDJ0NLZcbe/P
         Hi9p7OVtgux7sZtP5/MxeUaQ2HfL5vUeMw6ofNiuDfoCgHYWScn+5tN7jup2RIPcoRUl
         IjqNDvPyB36Ylh/6LZv8o9iyYO5/LEH7YEPtRcAuuYy/ZhXuQBD2Wk1qtyverEKtHRHP
         +7HbKwtrIhEE6mxfHWb0s9On+29F13jOiT6fnvAjVQlPY1si9Dy4g8htFtgtFKLx6eXx
         21wQ==
X-Gm-Message-State: AFuF++kyaVlcbsKmjbA5BigLTuVFDgTdXgWCPtNaMOXCp8+48mfBz3ef
	vjBREf4CeeWfZHOZr3nm/W3ztAW2mAXksWHgQiQDyBsakJlnbH6IVl6Nlu/0BuGnJa88PMNlw3a
	J6bF+hQ==
X-Gm-Gg: AR+sD11blJ3nwkjBacoi2CU3E6J/zrhBRfOxNRoReW5bIvDz4WjU1k5mPuB+Bj+S+az
	iuW4bN9HrH5hZZ6XEWUkTkoRaoQZJ+VTYcKd4Dnl7XzqTBAgwnlf05Bp5/dtHIT5mCAzagN7oAW
	CPWBCY/24zUvkj13fwuwZiEivnf/VV5hEGFh5n8UmMmOabjbkX9rKP7NIR0uF3UUIkp+aTrSmYc
	r76vWxBbN1QTYgZcpn1XwQA+pyJ1QuzWzybEU28iAucTxrKHrLaBb09Nxf6CzSPmm90ubybfZk3
	OvDu/oKFxaLxmcG4Ro2pig3ciJfrUlruJx4PGtjUMHQPc5XloZF/0HvWHDyQE4cSOupsHUiwGQ6
	4FCg858Zrzpg5DO+098KhQzzqR/rgT7ufaZ7OVScorghHDGiLjZj9c8G+D39iSpIukvqYM5e7ql
	iFaalnWzja3hrnf+AUnqrvaMlvpg/czB78wyfWvGr9c68t4/msSq0S6RDnMPJCeQfyv+bgE49+N
	CLTQTcOGsZqFQRPtQQ3AmHBGVIKgUQCYbAQ3r+h6hSzO7gwCD7e
X-Received: by 2002:a17:907:6089:b0:c25:31b4:5f15 with SMTP id a640c23a62f3a-c2531b46428mr72923166b.1.1787745779652;
        Wed, 26 Aug 2026 05:02:59 -0700 (PDT)
Message-ID: <af402588-3a7d-4923-96e1-f5761b445889@suse.com>
Date: Wed, 26 Aug 2026 14:02:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 5/7] build: move $(all-symbols-*)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
References: <9a78fdea-08ba-4e04-bfa1-ba09730a300b@suse.com>
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
In-Reply-To: <9a78fdea-08ba-4e04-bfa1-ba09730a300b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1787745780-728B62A1-213CE5E7/0/0
X-purgate-type: clean
X-purgate-size: 2842

With the final linking logic now consolidated in scripts/Makefile.link,
$(all-symbols-*) also doesn't need setting anymore in (and passing down
from) the top level Makefile.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
 	$(MKRELOC) $^ > $@
 
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
 


