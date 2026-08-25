Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDBCC61DB6
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 08:41:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399102.1635305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wymia-0005aT-0j; Tue, 25 Aug 2026 08:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399102.1635305; Tue, 25 Aug 2026 08:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wymiZ-0005aM-TM; Tue, 25 Aug 2026 08:41:15 +0000
Received: by outflank-mailman (input) for mailman id 1399102;
 Tue, 25 Aug 2026 08:41:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wymiY-0005Zr-Rn
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 08:41:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wymiY-00AYh7-8W
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 10:41:14 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d5522-e002-0a2a0a5209dd-0a2a450be558-26
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 10:41:14 +0200
Received: from [209.85.208.44] (helo=mail-ed1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d552a-b7e8-0a2a450b0019-d155d02ca471-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 10:41:14 +0200
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-6a3819e8be8so1206193a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 01:41:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5d82a283dsm200072a12.11.2026.08.25.01.41.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 01:41:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1787647274; x=1788252074; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5lrpRDANObULG+2e3IFRktVcA5tLIZikgbLUJ0GCgH0=;
        b=F5A7deQ+cP7iIzXnfjWxmJGyfbhB+mHA21TueYn5nP++r003yhNygrVwmoKQtCl3aK
         sfeTZRURZ7tAXkh1TTOpHGCS00gsaglHqWt9mrZzW5rclJWFOEjosX0qmLHxxTWiKXho
         ASzuuC+7lD9ikao3XinWSAE695nQl0xCOa5Y6+wnAlr0PwKPJFgdueUUNQM3UXwGr7f1
         UaRqEDj0ptdUV6Rihnhr2cFaUN8jNDoIFsQrYmXcEBjrLhTdZqY+MqjGuPPKJFE42zqj
         oexQwFPb8r1/krNwkAiJZqueF6u1WKPsOxDw8QYZ90NzW4zr8Yzwk2PGvHVBPHXalqnh
         M8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647274; x=1788252074;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5lrpRDANObULG+2e3IFRktVcA5tLIZikgbLUJ0GCgH0=;
        b=qIbNNc2RPzwAzUNhZtx7C2BCoEDx3UK6q4Iga5g33I2B9MC7NLo8VxE/sqCYJQEpOe
         9hgREzef0V/QAOdL5/6hzzfCCF4AXOFOWHeS5CUNMiQkQwlmowE+lW52RsIUgt67WQV7
         Kpq+L9azWXbp/FMLopHztzldfcEmaaomQXrZYfS0jDFJ7KLrL9smxdkiNe7t6WQew8RL
         GrzSHd6yn3wlv2Vvs4nkooiDVzJdlyRJzT8QtCT78/zSKJNWdsiOWef05NXih+A+YaVH
         X1k5w0vOMrfG5zyZ+1COWtVDBdPs669YcVZGbPKHpQJwqJxOUOz2kTP0CiIOhxDZ2WIi
         uDvw==
X-Gm-Message-State: AFuF++kJ3EJ/GffZN5ESrVYsdq7Yn3PmoFq6AEmryS/bY/PRr59LT0yH
	3Rb76k6i9tCJy5EFqpmJP2/WOGsEXOU9Jj8aeG89fIjyO530SonHEfNGUZIqIFuyhq/5n0S38a8
	6xP+o3w==
X-Gm-Gg: AR+sD124LYvBnvh1fIviRTozAdZKqk6l+KkuITSRKc5RYWmFvzgTLKLzCBnVoWJ/MOh
	hVukeXsXuAGusKw/+SLgIm18Kewm/J9biaxttAMYzmdzvJMaZ7vKL2iG0B/DMgrC04XDYpfFMp/
	wojtgh1FcHGDGxW+4YllLslAGaLqYHEg7zJND8i/8RHqZZfgDslxnLlCotZjcFMr9oysgI3zTZn
	aZg9JIqwrr2tZkCW0us5a/gpdsdj3lYFaX9rNYbuBXxjXE8Lwvzpy+ninecqijuuBJVJnadu76p
	GIGdbOFEJR92cazrwOU0L3z8Ou8ZE3XpwGb/aUANW8eN+TUNFoz5SnvR25/EhscJqqXJh3+iYy8
	IVxHor+XkiRvipP7vQ4KL/gr9dY7UwHRwTomaTtqKxpBO0Kb8qINwUg5tMCCZoYe72bLdAlmt86
	PlPpsQLQ0KWj19IHphJVLtS+5TtR107DQEIkhKy30lkhyTdRF/c4m6XWw4a/x2wcLfO36sJhqE7
	tMfOtkomn4qm7jlXdlckyFDLfw0cmfn1n/5cQJczHRB0XxGE/jy
X-Received: by 2002:aa7:df09:0:b0:6a3:ebc7:60b0 with SMTP id 4fb4d7f45d1cf-6a5c3e82496mr3727661a12.3.1787647273774;
        Tue, 25 Aug 2026 01:41:13 -0700 (PDT)
Message-ID: <ccccc6f3-c16e-4988-9677-85d9ca6e30ce@suse.com>
Date: Tue, 25 Aug 2026 10:41:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/6] x86: split xen-syms/xen.efi linking rules
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
X-purgate-ID: tlsNG-42698a/1787647274-ABAD09EA-2B4945A2/0/0
X-purgate-type: clean
X-purgate-size: 9827

Doing so, besides (hopefully) adding clarity (not the least by way of
using pattern rules where possible), also avoids explicit recursive
$(MAKE) invocations. For xen-syms move re-usable helper rules to a new
scripts/Makefile.link.

While doing so, re-order .map file creation (which can in principle fail)
and check-endbr.sh invocation ahead of putting in place the final image
(which is now the result of a simple rename).

Also drop --source-name= from the tools/symbols invocation which has
--empty passed, for being meaningless there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'd like to keep the "beautification" part, i.e. transforming to
$(if_changed ...) machinery, separate.

The check-endbr.sh invocation doesn't fit neatly into this model. I was
considering to move it into $(TARGET)'s rule, but that's not very nice
either (both because it'd be odd [strictly speaking: wrong] for xen.efi,
and because it would reduce parallelism).

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -102,12 +102,6 @@ notes_phdrs = --notes
 endif
 endif
 
-syms-warn-dup-y := --warn-dup
-syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
-syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup
-
-orphan-handling-$(call ld-option,--orphan-handling=warn) += --orphan-handling=warn
-
 $(TARGET): TMP = $(dot-target).elf32
 $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
 	$(obj)/boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET)
@@ -119,31 +113,11 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj
 
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 
-$(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
-	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
-	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) --strip-debug \
-	      $(dot-target).0.o -o $(dot-target).0
-	$(NM) -pa --format=sysv $(dot-target).0 \
-		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
-		> $(dot-target).1.S
-	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) --strip-debug \
-	    $(dot-target).1.o -o $(dot-target).1
-	$(NM) -pa --format=sysv $(dot-target).1 \
-		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
-		> $(dot-target).2.S
-	$(MAKE) $(build)=$(@D) $(dot-target).2.o
-	$(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	    $(orphan-handling-y) $(dot-target).2.o -o $@
-	$(NM) -pa --format=sysv $@ \
-		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
-		> $@.map
-	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
-ifeq ($(CONFIG_XEN_IBT),y)
-	$(SHELL) $(srctree)/tools/check-endbr.sh $@
-endif
+LAST_LINKING_PASS := 2
+
+final-image-check-$(CONFIG_XEN_IBT) = $(SHELL) $(srctree)/tools/check-endbr.sh $<
+
+include scripts/Makefile.link
 
 $(obj)/note.o: $(TARGET)-syms
 	$(OBJCOPY) -O binary --only-section=.note.gnu.build-id $< $@.bin
@@ -191,51 +165,65 @@ note_file_option ?= $(note_file)
 
 extra-$(XEN_BUILD_PE) += efi.lds
 ifeq ($(XEN_BUILD_PE),y)
-$(TARGET).efi: $(obj)/efi/relocs-dummy.o $(obj)/efi/relocs-empty.o $(obj)/efi/mkreloc
-$(TARGET).efi: $(objtree)/prelink.o $(note_file) $(obj)/efi.lds
+
+.$(TARGET).efi.%.o: .$(TARGET).efi.%.S FORCE
+	$(call if_changed,cc_o_S)
+
+.$(TARGET).efi.1r.S: .$(TARGET).efi.0 $(if $(relocs-dummy),.$(TARGET).efi.alt.0)
+.$(TARGET).efi.2r.S: .$(TARGET).efi.1 $(if $(relocs-dummy),.$(TARGET).efi.alt.1)
+
+.$(TARGET).efi.0r.o: $(obj)/efi/relocs-dummy.o $(obj)/efi/mkreloc
+	ln -sf $< $@
+
+.$(TARGET).efi.%r.S:
+	$(MKRELOC) $^ > $@
+
+.$(TARGET).efi.0s.S:
+	$(objtree)/tools/symbols $(all_symbols) --empty > $@
+
+.$(TARGET).efi.1s.S: .$(TARGET).efi.0
+.$(TARGET).efi.2s.S: .$(TARGET).efi.1
+
+.$(TARGET).efi.%s.S:
+	$(NM) -pa --format=sysv $< \
+	  | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+ 	    --source-name=$(TARGET).efi.S \
+	  > $@
+
+# See above for why $(note_file) needs removing here.
+efi-objs = $(filter-out $(note_file),$(filter %.o,$^))
+
+.$(TARGET).efi.%: $(objtree)/prelink.o .$(TARGET).efi.%r.o \
+                  .$(TARGET).efi.%s.o $(note_file) $(obj)/efi.lds
+	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $(efi-objs) \
+	      --strip-debug $(note_file_option) -o $@
+
+.$(TARGET).efi.alt.%: $(objtree)/prelink.o .$(TARGET).efi.%r.o \
+                      .$(TARGET).efi.%s.o $(note_file) $(obj)/efi.lds
+	$(LD) $(call EFI_LDFLAGS,$(ALT_BASE)) -T $(obj)/efi.lds $(efi-objs) \
+	      --strip-debug $(note_file_option) -o $@
+
+.$(TARGET).efi.2: $(objtree)/prelink.o $(obj)/efi/relocs-empty.o \
+                  .$(TARGET).efi.2r.o .$(TARGET).efi.2s.o $(note_file) \
+                  $(obj)/efi.lds
+	$(call compare-symbol-tables, .$(TARGET).efi.1r.o, .$(TARGET).efi.2r.o)
+	$(call compare-symbol-tables, .$(TARGET).efi.1s.o, .$(TARGET).efi.2s.o)
+	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $(efi-objs) \
+	      $(orphan-handling-y) $(note_file_option) -o $@
+
+$(TARGET).efi: .$(TARGET).efi.2
 ifeq ($(CONFIG_DEBUG_INFO),y)
-	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
+	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "No debug info in $(@F)"
 endif
-	$(objtree)/tools/symbols $(all_symbols) --source-name=$(@F).S --empty \
-		> $(dot-target).0s.S
-	$(MAKE) $(build)=$(@D) .$(@F).0s.o
-	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
-	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds $< $(relocs-dummy) \
-	                $(dot-target).0s.o $(note_file_option) --strip-debug \
-	                -o $(dot-target).$(base).0 &&) :
-	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(base).0) \
-		> $(dot-target).1r.S
-	$(NM) -pa --format=sysv $(dot-target).$(VIRT_BASE).0 \
-		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
-                  --source-name=$(@F).S \
-		> $(dot-target).1s.S
-	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
-	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
-	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds $<  --strip-debug \
-	                $(dot-target).1r.o $(dot-target).1s.o $(note_file_option) \
-	                -o $(dot-target).$(base).1 &&) :
-	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(base).1) \
-		> $(dot-target).2r.S
-	$(NM) -pa --format=sysv $(dot-target).$(VIRT_BASE).1 \
-		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
-                  --source-name=$(@F).S \
-		> $(dot-target).2s.S
-	$(MAKE) $(build)=$(@D) .$(@F).2r.o .$(@F).2s.o
-	$(call compare-symbol-tables, $(dot-target).1r.o, $(dot-target).2r.o)
-	$(call compare-symbol-tables, $(dot-target).1s.o, $(dot-target).2s.o)
-	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< $(obj)/efi/relocs-empty.o \
-	      $(dot-target).2r.o $(dot-target).2s.o $(orphan-handling-y) \
-	      $(note_file_option) -o $@
-	$(NM) -pa --format=sysv $@ \
-		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
-		> $@.map
+	$(NM) -pa --format=sysv $< \
+	  | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
+	  > $@.map
 ifeq ($(CONFIG_DEBUG_INFO),y)
-	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
+	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $< $@.elf
 endif
+	$(final-image-check-y)
+	mv $< $@
 	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
-ifeq ($(CONFIG_XEN_IBT),y)
-	$(SHELL) $(srctree)/tools/check-endbr.sh $@
-endif
 else
 $(TARGET).efi: FORCE
 	rm -f $@
--- /dev/null
+++ b/xen/scripts/Makefile.link
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0
+# ==========================================================================
+# Helper rules for linking xen-syms
+# ==========================================================================
+
+syms-warn-dup-y := --warn-dup
+syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
+syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup
+
+orphan-handling-$(call ld-option,--orphan-handling=warn) := --orphan-handling=warn
+
+final-image-check-y ?= true
+
+.$(TARGET)-syms.%.o: .$(TARGET)-syms.%.S FORCE
+	$(call if_changed,cc_o_S)
+
+.$(TARGET)-syms.0.S:
+	$(objtree)/tools/symbols $(all_symbols) --empty > $@
+
+.$(TARGET)-syms.1.S: .$(TARGET)-syms.0
+.$(TARGET)-syms.2.S: .$(TARGET)-syms.1
+.$(TARGET)-syms.3.S: .$(TARGET)-syms.2
+
+.$(TARGET)-syms.%.S:
+	$(NM) -pa --format=sysv $< \
+	  | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+	    $(if $(filter $(LAST_LINKING_PASS),$*), $(syms-warn-dup-y)) \
+	  > $@
+
+.$(TARGET)-syms.%: $(objtree)/prelink.o .$(TARGET)-syms.%.o $(obj)/xen.lds
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $(filter %.o,$^) \
+	      $(build_id_linker) --strip-debug -o $@
+
+.$(TARGET)-syms.$(LAST_LINKING_PASS): $(objtree)/prelink.o \
+                                      .$(TARGET)-syms.$(LAST_LINKING_PASS).o \
+                                      $(obj)/xen.lds
+	$(call compare-symbol-tables, \
+	       .$(TARGET)-syms.$(shell expr $(LAST_LINKING_PASS) - 1).o, \
+	       .$(TARGET)-syms.$(LAST_LINKING_PASS).o)
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $(filter %.o,$^) \
+	      $(build_id_linker) $(orphan-handling-y) -o $@
+
+$(TARGET)-syms: .$(TARGET)-syms.$(LAST_LINKING_PASS)
+	$(NM) -pa --format=sysv $< \
+	  | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
+	  > $@.map
+	$(final-image-check-y)
+	mv $< $@
+	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*


