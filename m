Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7B2C61DB6
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 08:44:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399131.1635340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wymlQ-0007XV-1u; Tue, 25 Aug 2026 08:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399131.1635340; Tue, 25 Aug 2026 08:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wymlP-0007XO-V1; Tue, 25 Aug 2026 08:44:11 +0000
Received: by outflank-mailman (input) for mailman id 1399131;
 Tue, 25 Aug 2026 08:44:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wymlO-0007X8-IJ
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 08:44:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wymlN-004RqC-V4
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 10:44:09 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d55b9-e002-0a2a0a5209dd-0a2a45058308-48
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 10:44:09 +0200
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d55d9-4cb1-0a2a45050019-d155da36b01e-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 10:44:09 +0200
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-c16794450aeso655651566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 01:44:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606a8edsm1644205166b.6.2026.08.25.01.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 01:44:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1787647449; x=1788252249; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FTgctcTu5XvkaEOJLrKjmgwxIb3vR/Qle8yZ7WKT+e4=;
        b=GBH6AC1jr9SK7HF1WM8zcrX6Zv2oNW+hnyNJ0A1vf7NJw7/G+MFOPJPHmnLUux7/XM
         168XXkck/E5GuNOmUNytqEZUF+F64QdLyz0dF/u2DF7DyOU1io5UdlXMYePAtJsXc5Gj
         NZq2Gt0NKWDuZmyXFTIJOMdIMu9n+RHzmHg0mp76Ct4o/435bY9gBeJeo6eEGRqKExyw
         OMiBXtv7Db7q5+ibnXxrdvCpVc8Jyx+BWLonnBTsFopP8Xhe8J3r1Uqo9UBD/qgjbSVV
         BD0eTxqwIaSmEI99OmZdkOcHYD3d6jpdSynLYPszHRnqGOnUGicHj4uhwYsvD9uX182e
         2GEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647449; x=1788252249;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FTgctcTu5XvkaEOJLrKjmgwxIb3vR/Qle8yZ7WKT+e4=;
        b=WEd85EFz9P1Z0hV7OZI1tRYECebIZlpoCuUXCcG/Eu2qTF8JwrNX/6nJRZGPDejBol
         epaneHFQd4yB8pQlEZU41nzstnqo3j3/aJ6t3MJh1li+cBMDHlO5gBR1NTuDsgx9vqES
         7BmzrE0HBMfh/eqoyi+gdM7ZaFvUJzqENWVblUrP8bamnvtpj9lx9a24Q7yQiMdfB2yv
         BEhXRR42upAnNFnV1ra0mnw6hO/0vXVOkRk6xxtfkPdGVZ4Nm6/T6iFmysaAI4UJrfE5
         qe4BYZRSDS436k5a+1e4IHJRXOcDPI/MMr9nv6huHsBYx4R98oOwS88GqVzrjC3q8MEs
         2nRA==
X-Gm-Message-State: AFuF++nCkrSKoduHiRa93opakOLzVd2vVKoq73g8Ruw1u93Bl2BEl2lc
	akDmsAl/s4GQJnpsy8MRvfDWSYa1OLxxlOGmdYVSUz1ltN6VXLZNDXE8Yvzz0xrPx0lOoH1BtQ6
	9gb9e6A==
X-Gm-Gg: AR+sD13wNr0dY6CZSwqvhbjX87ZSae9kCJnQwv67oMytJWDlZPzzGYaOr76J+WaJaqx
	KdX7s8ThgTZZR21pXdqyksrTWBIsdWzzvmJVOnL/sXv1S/igmL1y7I/UcVHgILFqrX/mtg8N/tB
	mOUZOyS6veYfE+n761cUiB3652DhqEYiW812aQgtUDCn1jbT2ivvBRHtAMl58WUd3HA8gv3Gion
	Yq9lQzkjGVErkyNYXQbN2BW7/JCUFKmSczDO2Uk+U25ni5a59zAJg7NUG7B38ZFebjARU127QWk
	XfartZEZECz3gRH0hpWByLdGxQsH0Ldc3CUuUue7EsBcu6sUlSZ6E+1fLvUL4EoUqW/MSM+7211
	OgoB72R/Asd7WOVef3p0U3LyxW2PXkHnTcdVgkwntl9/5yjEx8/vtYW7/tRzjjgiySPF6aWQ8gh
	xf8XiVuj9GV23jCgAiZdhbLTls1UYVp9fgiARAjqe7mEjJMcoGfyA8tWC2mCmIrdWhILrp/v+PC
	Wo6Ti4gH71OXm+I8SG8ds/WnAIo/T5War71j1WsQln/qDaCESUKcCIr9b0lp7I=
X-Received: by 2002:a17:906:f049:b0:c16:126b:98b4 with SMTP id a640c23a62f3a-c246a2ef584mr3520987366b.3.1787647449449;
        Tue, 25 Aug 2026 01:44:09 -0700 (PDT)
Message-ID: <09e481bc-b2ca-4480-93ad-1a45c7d45073@suse.com>
Date: Tue, 25 Aug 2026 10:44:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/6] build: move $(all-symbols-*)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
References: <fb75dbda-63a5-4ebd-abf6-5ce6b3b5ba3f@suse.com>
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
In-Reply-To: <fb75dbda-63a5-4ebd-abf6-5ce6b3b5ba3f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1787647449-247132A1-1681B5FC/0/0
X-purgate-type: clean
X-purgate-size: 2850

With the final linking logic now consolidated in scripts/Makefile.link,
$(all-symbols-*) also doesn't need setting anymore in (and passing down
from) the top level Makefile, 

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
@@ -179,14 +179,14 @@ ifeq ($(XEN_BUILD_PE),y)
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
@@ -15,7 +19,7 @@ final-image-check-y ?= true
 	$(call if_changed,cc_o_S)
 
 .$(TARGET)-syms.0.S:
-	$(objtree)/tools/symbols $(all_symbols) --empty > $@
+	$(objtree)/tools/symbols $(all-symbols-y) --empty > $@
 
 .$(TARGET)-syms.1.S: .$(TARGET)-syms.0
 .$(TARGET)-syms.2.S: .$(TARGET)-syms.1
@@ -23,7 +27,7 @@ final-image-check-y ?= true
 
 .$(TARGET)-syms.%.S:
 	$(NM) -pa --format=sysv $< \
-	  | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+	  | $(objtree)/tools/symbols $(all-symbols-y) --sysv --sort \
 	    $(if $(filter $(LAST_LINKING_PASS),$*), $(syms-warn-dup-y)) \
 	  > $@
 


