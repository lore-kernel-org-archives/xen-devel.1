Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BAEC79F9E
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 12:31:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411955.1642417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uyS-0000HR-03; Tue, 08 Sep 2026 12:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411955.1642417; Tue, 08 Sep 2026 12:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uyR-0000HK-T5; Tue, 08 Sep 2026 12:30:51 +0000
Received: by outflank-mailman (input) for mailman id 1411955;
 Tue, 08 Sep 2026 12:30:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3uyQ-0000Fk-Nk
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 12:30:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3uyQ-003w3D-43
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 14:30:50 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9ffffa-bab6-0a2a0a5309dd-0a2a450ca434-0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:30:50 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9ffff9-f479-0a2a450c0019-d155dd30c120-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:30:50 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-47fe89fb333so2994022f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 05:30:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885c5bbdsm34120922f8f.36.2026.09.08.05.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 05:30:48 -0700 (PDT)
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
        d=suse.com; s=google; t=1788870649; x=1789475449; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PlF7Jt2csGAhocWKbAzmDtcyIGA0UXGHP2uf+mocDok=;
        b=Rukwc760F112/pB7mVr4RlZaZAFSXZT8CCe+RvlGItC+x27hHBrXI+aiMI5BYTE1Ll
         GFXia76gp2xAPXoXj1kreQG7xn64UnAGGJZLHN/p/YPopClUDV617MRdFlkK6sdZFHB/
         0ry6n2HbzvHyclPhc2gZb1Pe8MnHuw4SfITaneZi+yzkL8CPRbkUtRou71hn921Hl6S+
         fNf77PhIqSVnRkPDwDXKsgQxqS6zvHiEyO8ZJN1R8aJ2crn7unf+R/ebO8ki2sooFy84
         LjsPOi9laioYsix3/J3gkCpcsf/i0z3Qjuco3A5osdH5kp7va+ptd578rI+pTL7j2GTK
         2+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788870649; x=1789475449;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PlF7Jt2csGAhocWKbAzmDtcyIGA0UXGHP2uf+mocDok=;
        b=qKYrqIfnF516mUeZsu8PWtgl3DVwpJp64VvjrbUWNrldvM+ZWeWKMQBbgjLu5ioBck
         4aQzKBfFJk/Rp/0JZpIhe9RJ6P9idBG+EtgMsFjz8NgedGrC4z3zafX7tOZg8Ay+zy0e
         Ex5vfvrtLKpLbyeHLqYZ+4Hu1mR1EpYIws3NttbYSQeIWwv9ToqdPTrVrIo2t0sLSZqT
         MtEnFGKgJ0AP6qEHkbZiRPlOzMes4x4/NadylptH+lI9ZqcgMSAcZOhfqu6+vGwJzrdy
         5xeJX43/UHx0QpROHzvF/b5KFtMKvlMHwSncxZRhnC9DGfPFvFZQrfIHZNyUOWkGGwmw
         S68w==
X-Gm-Message-State: AFuF++mEftARRRPzDIecj1ftVAt232gY+PBWdh4gnr7QD3oQDNowhZdx
	fPewZEo0Tr4hqdk6VTI8zIcpjZZWM1jbL6zRyfstxKjkoYuhRbEeUbLqQ2bEriR7e7lBJdx9r5j
	dWungpg==
X-Gm-Gg: AYBFou2/uI9NgklcewZTFm5zB18HedkNtb3Ce+bQyeDyICdgyqZmvRnpjxQCOLkIkGM
	TtqLmjMt8fJwoZfwESwLDn5kdCFoc9F0V725UQuh1lMypzQJKNU78iufE71wvWl92x9SmIOilOt
	refzURDRG/WPdLHS/is+z4fpk9vo1wId8BbPN10z+simsm3d9l9UjBoZGcspJMeVwdr7D1BAk6R
	EeTffaDJY6cQ7HfwoJUhXNu2lx0oY2k2VnDhVIwABTpsrA4ywde4fgzfZ87/+BpzDOPRaun4g4w
	1kGuguCXyb2owH5u/5OBnukLKWeEbT/tag+7siI7GgSCwHZBImBUJlA2IDYZr3vXiQ5Ug3V9ZXM
	jntEE1c8Xuf2ZTyqQEP5e8648AJ5DuyTDnjHaCLWm0XkQ6sXlbcvuiivODcysnw3zQlW3mMdiFe
	2w/XpcAtJMTFlaQ9ZTC4hE39/AvQV1foTcepkBs6tBFxqOLOcAjxMPm/gNbGdDVizLfUhJWsqd1
	eHPc6HazEc/gqrrNvSaXuBIJfgE6eyWOS/H6mc09qt8HKI9MOYj
X-Received: by 2002:a05:600c:3e0a:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49cf8267a36mr375734495e9.12.1788870649394;
        Tue, 08 Sep 2026 05:30:49 -0700 (PDT)
Message-ID: <f4f1977a-5df6-470a-aa16-96214726b9ce@suse.com>
Date: Tue, 8 Sep 2026 14:30:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 6/6] build: move $(compare-symbol-tables)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
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
X-purgate-ID: tlsNG-d25034/1788870650-76EDAA5B-43761154/0/0
X-purgate-type: clean
X-purgate-size: 1887

With the final linking logic now consolidated in scripts/Makefile.link,
$(compare-symbol-tables) also doesn't need setting anymore in
Kbuild.include.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
v2: New.

--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -56,19 +56,6 @@ define filechk
 	fi
 endef
 
-###
-# Compare the symbol tables of two object files.  As diff's -I option isn't
-# standardized, the name difference of the two object files needs abstracting
-# out.
-define compare-symbol-tables
-    ln -f $(1) $(@D)/.cst.$$$$; \
-    $(OBJDUMP) -t $(@D)/.cst.$$$$ > $(1).sym; \
-    ln -f $(2) $(@D)/.cst.$$$$; \
-    $(OBJDUMP) -t $(@D)/.cst.$$$$ > $(2).sym; \
-    rm -f $(@D)/.cst.$$$$; \
-    diff -u $(1).sym $(2).sym
-endef
-
 # as-insn: Check whether assembler supports an instruction.
 # Usage: cflags-y += $(call as-insn,CC FLAGS,"insn",option-yes,option-no)
 as-insn = $(if $(shell echo 'void _(void) { asm volatile ( $(2) ); }' \
--- a/xen/scripts/Makefile.link
+++ b/xen/scripts/Makefile.link
@@ -33,6 +33,18 @@ final-image-check-y ?= true
 	    $(if $(filter $(LAST_LINKING_PASS),$*), $(syms-warn-dup-y)) \
 	  > $@
 
+# Compare the symbol tables of two object files.  As diff's -I option isn't
+# standardized, the name difference of the two object files needs abstracting
+# out.
+define compare-symbol-tables
+    ln -f $(1) $(@D)/.cst.$$$$; \
+    $(OBJDUMP) -t $(@D)/.cst.$$$$ > $(1).sym; \
+    ln -f $(2) $(@D)/.cst.$$$$; \
+    $(OBJDUMP) -t $(@D)/.cst.$$$$ > $(2).sym; \
+    rm -f $(@D)/.cst.$$$$; \
+    diff -u $(1).sym $(2).sym
+endef
+
 .$(TARGET)-syms.%: $(objtree)/prelink.o .$(TARGET)-syms.%.o $(obj)/xen.lds
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $(filter %.o,$^) \
 	      $(build_id_linker) --strip-debug -o $@


