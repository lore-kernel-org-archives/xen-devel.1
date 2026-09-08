Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD49FC79F9E
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 12:28:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411922.1642381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uwM-0005hz-TK; Tue, 08 Sep 2026 12:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411922.1642381; Tue, 08 Sep 2026 12:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uwM-0005hr-Q4; Tue, 08 Sep 2026 12:28:42 +0000
Received: by outflank-mailman (input) for mailman id 1411922;
 Tue, 08 Sep 2026 12:28:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3uwL-0005hU-2y
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 12:28:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3uwK-00DGpw-Fm
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 14:28:40 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9fff6e-e002-0a2a0a5209dd-0a2a450cde94-28
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:28:40 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9fff78-f479-0a2a450c0019-d1558033c9c2-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:28:40 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-49ccfbe062eso44019405e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 05:28:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce591f846sm229036025e9.1.2026.09.08.05.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 05:28:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1788870520; x=1789475320; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Iv2vMmZDDkUbtSsBC1iLfuXEsdGTvN+CdOPuJTT4q+M=;
        b=HjVMG4sv1rvGjemFV3CtWRum+vwydICFkqV+hZ2ZNUpk/yh5g3uwCllEGLXm5F0nAq
         9gzepqA9hkkoqjnjzOTyGQuBnRdGyYWEdQs8bzuzYrKPgLWzAseYdZs91NxDEAOer2xh
         rmV6qMudcA+SLl6wVsK40YnsdT3a83CF9vo0dQcKbxuNzG/dc8uQVo8ol4MqnENyFAJt
         DnVB8pR5pvJND8tV/M1Gl8Zpys66zn1k+JwEbU9KvPwL1l+3FHTqCNGNZIbSWg8E/roV
         Wn6joMHb4NFwCM9BS7FfnweYhqMY2xvhKrgcXLyV/xqMFoyFa1+t6xpxHDJs5c1meWn7
         lDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788870520; x=1789475320;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Iv2vMmZDDkUbtSsBC1iLfuXEsdGTvN+CdOPuJTT4q+M=;
        b=JbU1Tx75gAuVajT9KSQgCA4WA/efTz2n1B5di1fGrXUtSqe/XvMZkGwAOBLOuaLXmE
         4yzExDgGbGFmYpQd/gX8hllG6t48p066JO08gmJp3PhPksEFUyjeyB/wdLvpG5wzDZSh
         ZWIOwllzjDbSp3iVAguvWQ4hBOwWoykCh2rh6un0a/Ju+cPB2sDQBvRBR4uV2Vg9Uc7n
         yIPzcZ/xC0/6BkgjaiGIBAX9MqiJ/8S3PvsF+vO2wF8vGhPuheTM5ToFBtySscHOdoNM
         KFBX6V4cVLqC75PP/hpgPFgxCARYsWOXo3GDr7yd4ukOCqarBHP33Q0/ty96b18zF8AS
         hasQ==
X-Gm-Message-State: AFuF++kniu2O7S75IsAF0vzR4Z6LeeFLeYCVrm9ZiSdXAk3LDNsANMdt
	9/zU9hG6LJcbNDYKf2skDT01FmLWvuQofnCsewrlRjuRCwwG9pVkprfK3CP6jWCpnxgkdMkLHhS
	cu3TbKw==
X-Gm-Gg: AYBFou0NJlrSmLtvSzAxTQR5AFTYwFkDWqONt1hOp0t3QeK7q6OtUHp5i7WxJdYH/Nd
	JSK4gBgtIuiI6fCIPZ91a7UtVvxvcFeKOfW9nbwk3mXlNbRgxpGxobFBlY6RHGGmcaC7Ue3IBXD
	1YwKczs4l3M73f8YQCdBBkd45Am1YK2fkw8grambKP0O6azxgDucQrnWqZ7FjSRBLQgEyeu8VP+
	MgTszqGlM0Zoygyfe+ajfiCGTxBuZzaY33gq1qwRByiN+YctIKf3GDE5Dd0Ioh39KtceqFB4mQ2
	XnWBIBy8pjml0QwrNBhyzDzcWNSO60V50VsAD7NKxkuuIfrFk8bZh/xsLv3gKCObsckZ7N6XZRx
	znuiuEJbGEmH1IfEt4no87R622Hx4ihCixmE9qDL5k3sjP7/+zNoPQka6YOOk04CKi95yMssi5N
	WCqFSp02U09om+VBxwSJ2e8PjyTjWh1fHHI5PfmjoKYqdB4ZxYfUbLqADglgI4yobvPnsAvhpIi
	HnGBp14YfpPkoSwDnugq8tl4mfjgaOBwH1mAXHXPHB/PeBnKPCV
X-Received: by 2002:a05:600c:314f:b0:49c:ffde:45ff with SMTP id 5b1f17b1804b1-49cffde4629mr227184785e9.17.1788870519858;
        Tue, 08 Sep 2026 05:28:39 -0700 (PDT)
Message-ID: <ddb77049-3a85-42b0-aa96-ee9a8ce500de@suse.com>
Date: Tue, 8 Sep 2026 14:28:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/6] Arm: split xen-syms linking rule
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
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
X-purgate-ID: tlsNG-d25034/1788870520-03ED2A5B-48B8E538/0/0
X-purgate-type: clean
X-purgate-size: 3878

Doing so, besides (hopefully) adding clarity (not the least by way of
[re-]using pattern rules where possible), also avoids explicit recursive
$(MAKE) invocations.

By re-using the generic rules introduced when the respective x86 rule was
split,
- the .map file now isn't created after the final binary anymore,
- --strip-debug is passed to $(LD) during early linking passes (for
  consistency the option is also explicitly added to the optional linking
  pass rule),
- CONFIG_{SUPPRESS_DUPLICATE_SYMBOL_WARNINGS,ENFORCE_UNIQUE_SYMBOLS} are
  now properly respected.
Orphan section checking, otoh, is getting suppressed for now, until the
about a dozen warnings which would result have been taken care of.

While the 4th linking step continues to be avoided when possible, a
redundant invocation of $(NM) and tools/symbols (plus the assembling of
the resulting .S file) is hopefully deemed acceptable.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
As for the x86 patch, I'd like to keep the "beautification" part, i.e.
transforming to more use of Kbuild.include machinery, separate.

--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -84,40 +84,12 @@ ifeq ($(CONFIG_ARM_64),y)
 	ln -sf $(@F) $@.efi
 endif
 
-$(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
-	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
-	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	      $(dot-target).0.o -o $(dot-target).0
-	$(NM) -pa --format=sysv $(dot-target).0 \
-		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
-		> $(dot-target).1.S
-	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	    $(dot-target).1.o -o $(dot-target).1
-	$(NM) -pa --format=sysv $(dot-target).1 \
-		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
-		> $(dot-target).2.S
-	$(MAKE) $(build)=$(@D) $(dot-target).2.o
-	if ! { $(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o) >/dev/null; }; \
-	then \
-		set -e; \
-		$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-		    $(dot-target).2.o -o $(dot-target).2; \
-		$(NM) -pa --format=sysv $(dot-target).2 \
-			| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
-			> $(dot-target).3.S; \
-		$(MAKE) $(build)=$(@D) $(dot-target).3.o; \
-		$(call compare-symbol-tables, $(dot-target).2.o, $(dot-target).3.o); \
-	else \
-		ln -sf $(dot-target).2.o $(dot-target).3.o; \
-	fi
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	    $(dot-target).3.o -o $@
-	$(NM) -pa --format=sysv $@ \
-		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
-		> $@.map
-	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
+LAST_LINKING_PASS := 3
+
+include scripts/Makefile.link
+
+# Suppress orphan section checking for the time being.
+orphan-handling-y :=
 
 .PHONY: include
 include:
--- a/xen/scripts/Makefile.link
+++ b/xen/scripts/Makefile.link
@@ -33,6 +33,19 @@ final-image-check-y ?= true
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $(filter %.o,$^) \
 	      $(build_id_linker) --strip-debug -o $@
 
+ifneq ($(LAST_LINKING_PASS),2)
+
+.$(TARGET)-syms.2: $(objtree)/prelink.o .$(TARGET)-syms.2.o $(obj)/xen.lds
+	if ! { $(call compare-symbol-tables, .$(TARGET)-syms.1.o, .$(TARGET)-syms.2.o) >/dev/null; }; \
+	then \
+		$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $(filter %.o,$^) \
+		      $(build_id_linker) --strip-debug -o $@; \
+	else \
+		ln -sf .$(TARGET)-syms.1 $@; \
+	fi
+
+endif
+
 .$(TARGET)-syms.$(LAST_LINKING_PASS): $(objtree)/prelink.o \
                                       .$(TARGET)-syms.$(LAST_LINKING_PASS).o \
                                       $(obj)/xen.lds


