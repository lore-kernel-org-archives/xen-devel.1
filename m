Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7ABC61DBD
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 12:03:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399880.1635859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzCLq-0006Mu-U3; Wed, 26 Aug 2026 12:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399880.1635859; Wed, 26 Aug 2026 12:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzCLq-0006Mn-Qw; Wed, 26 Aug 2026 12:03:30 +0000
Received: by outflank-mailman (input) for mailman id 1399880;
 Wed, 26 Aug 2026 12:03:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzCLp-0006LQ-SV
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 12:03:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzCLp-005gjq-9H
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 14:03:29 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8ed60a-bab6-0a2a0a5309dd-0a2a4503df2c-16
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 14:03:29 +0200
Received: from [209.85.208.41] (helo=mail-ed1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8ed611-fae8-0a2a45030019-d155d029e8d1-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 14:03:29 +0200
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-6a3efa2b38aso1560130a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 05:03:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a9ef382sm383284966b.58.2026.08.26.05.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 05:03:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1787745809; x=1788350609; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eso5Vy60QRY0iW7T/56aNIKLGvEodCAr0Gzsj7Z1ZWc=;
        b=gNWPHhPOxtKB2VsKod/QIJZGUiOYy6tRBBcyroD8BRBhy/mdqKQKb0FCukZrPo2EiJ
         DBOIAvBsi6o+xLNRbKUH8pwFE33VFRCRQozyNwiMxGsnuygNOjPaHSGi0hfl7S06KEch
         WnolD2j49+4S65kWVY6t9/+QHc4TUEd3ISp04lMO4pLDFdnDK3puoqFNtN6k+X145LbW
         mezmqoax6CxNeSPpObwkKvuR0MLC/gw+hBLVGhARR0pr/8UDaPDaOYRnBTatJAIh/Fe+
         7lWPD3iPeh4qoiljq4EtT55f1kegi+ZpGmopwhNuLRh4n5NHnuJWBi5KTWdG65N2e0k5
         0yuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745809; x=1788350609;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eso5Vy60QRY0iW7T/56aNIKLGvEodCAr0Gzsj7Z1ZWc=;
        b=mabWoP1RixgoOXrA9WRU6qEf+7KpW2O9mIEMX+eSPnvXpVWsjiG4JZuUpBCnl0e5Dx
         Q6B5kanZEbLVpQPLi1Md6on0Ctfy47kM0RmgeEVmdC6dftckLlrckDBdUkoptDzIYhjQ
         uecI36E0g/uOiz64IhNQ3nPJtzJc7ZET29oQjsSfdVHM934S28h/kXEK4BA+NBEuRD7T
         T7CNr6wIfsU31/YM8nOO3Mp+5WKUHAbQ1GiXyCUB7rw1qQxJ6s9qPfhC+BiFNQN+KAqf
         Up6RFOnSI2PdAtpGQq0euSasdRRrl1en2j2Y8TC1ZKC2SN8mSW0YK1TNpII6D3dAHUac
         y6Hg==
X-Gm-Message-State: AFuF++kY/OZ0fkmhvI5bJn1C/dRnvtk5y4/U3lrTFrRHIDoY2Q+MY3mg
	2/PSwxSnDEM3PUlFPJwKwUSUUgAzsF7J8FwJb003LkSa9mEVH369KxN4kaD2JlPvJEi8wVAkryV
	9syNOZg==
X-Gm-Gg: AR+sD13TggQZFM41bLP12WyYv9hAwclVjpTF1xbfu5B+OFz1DHt/PtFOsFzMRpuJ9jw
	hfSCs78bqx+CrO57Iti4mkG5d+ZyaVRZ9wKbBSSFLcr676GYNVEvWnl+Kz1UFXrx58guPN6GG2L
	MWPzLaU8Fuv8tar7pI0UaTTA1NuPivALEYfb9nwNBTFsHE/20F61dS+HqqDaDPfNqep0R1YxzHv
	hJhdkdH6rb2UF8c0tGu5M9pmgcVCyhE5FbLZy/8k10utjUyP+ecBwJZBAakFcLDgz7gYwsUhTbX
	5mvYhH6vCpz/jBRY0fbm8KgvSU6GkWwn0xfTgWPVuQwxdcOC7A2oKeB+Ct9jEhWOxRyFzYlpALG
	DxWYkLT/yaUxo8iQMiV6fYYPD6KQFuyoDY11oIZh9G23vAOr6MLnIFBrLqfUyVvzS3nBIl7QrH7
	rNQL/wfccvxomMOsxMsiUIkwF/H2W2En5zxkUQcszNvYyPXkk9ZvH4ap/bgZaEYQJnuoJ7/3SYZ
	WWwC4aW/Pq8xYrhJN59GFVxyRhoH5A2QzCL3KCXQQ/UxaWMqdO9vw==
X-Received: by 2002:a17:906:730e:b0:c1f:bda0:a771 with SMTP id a640c23a62f3a-c250c363aa9mr755151166b.13.1787745808567;
        Wed, 26 Aug 2026 05:03:28 -0700 (PDT)
Message-ID: <f569f2ea-cf1f-4e28-8097-f81397368e73@suse.com>
Date: Wed, 26 Aug 2026 14:03:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 6/7] build: move $(compare-symbol-tables)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
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
X-purgate-ID: tlsNG-33051d/1787745809-766FB4E9-64F4D46B/0/0
X-purgate-type: clean
X-purgate-size: 1830

With the final linking logic now consolidated in scripts/Makefile.link,
$(compare-symbol-tables) also doesn't need setting anymore in
Kbuild.include.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
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


