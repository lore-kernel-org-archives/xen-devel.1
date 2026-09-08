Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FF6C79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 12:29:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411932.1642389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uwm-0006HT-4n; Tue, 08 Sep 2026 12:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411932.1642389; Tue, 08 Sep 2026 12:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uwm-0006HK-28; Tue, 08 Sep 2026 12:29:08 +0000
Received: by outflank-mailman (input) for mailman id 1411932;
 Tue, 08 Sep 2026 12:29:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x3uwl-0006HA-I5
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 12:29:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3uwk-001cW4-V1
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 14:29:06 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9fff8a-8faa-0a2a0a5109dd-0a2a450aa976-14
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:29:06 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9fff92-f2d2-0a2a450a0019-d1558035cda1-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:29:06 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-498028b3d5eso43792205e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 05:29:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d04fe7f9dsm290984285e9.0.2026.09.08.05.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 05:29:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1788870546; x=1789475346; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QquCSsjr9+yRZ78MRMZyhAJQGwjy2mQJD5ivmHA7k+Q=;
        b=LzdPEJUurq2/vhmczzFydOgHUPre4ooHZpKcyAWAqKYK7qrUA6E5FeIZ8Rje56V/Kj
         pdD24F0OpnFvN86gBPkdhenEpd1WO/Nzs6Oe0o/ARVBc2KcOjJCNi++2EpUT85Np7v2u
         SfUZ+/bVDfkOajRUn4/++z8CsYi2+MelO7Vxjv0IcFZDlykMfB4204sZHyphaV2Kn3xX
         W+qspNhslxoveTMlhHnEGzzhS2ZmFEFz+Ua+NJSzAH9yFhupdBllpNpyIiIQnuj0pE1h
         IO8kL2hE4h1hEh7xv0cTmb0l3pzz7rlFKBIC86GfXjyBzIf3tW/50wqFVH5VJYoWxAUC
         4kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788870546; x=1789475346;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QquCSsjr9+yRZ78MRMZyhAJQGwjy2mQJD5ivmHA7k+Q=;
        b=P0/ldCAwPIJGIReR5Sl73FmNb12pDnVzmh2ZihwF0KsT6DU5fUvMmKp435Au1/MAYu
         +x0Mh9kS1W08RFlQKEI8nClfiXw2U5nJOhnETMjgsLYa130vFXS2iJ+lSuy0kMGFJAgI
         3PgV0TgnpdU0eYckhYlwgilVtHb60tgKeygLwRyD5PWVv3+5RZl+Pi3miWKC1lTqgZWc
         27B+9dPkYnoXeuODM8jJ685LFV2Xels3XKjsgcx8AXiU8I8GFxl1MKAlJGRC+iVUz5FV
         iQsosF7vxHV1qVTJYq0/LET3Ta1+WZTEYNnPDtm5zj4GClPXPc/3uiB2HK/5+SlTtLAu
         UckA==
X-Gm-Message-State: AFuF++ljZhPFJbR9iWqTyU20Rjc1JqRRFOEwzoahTRC7CplB0KoBaFJ+
	DszeAol5snbivxJ4O4P/gEWOaazKVVUmEYxCiwKWXEdKkB+hgegCAGlX4tyWocpGpxVUBX5U+pa
	3KHQwHA==
X-Gm-Gg: AYBFou3fBWd47VTl4v5+Xo9gaQsAbEOAb7RoO3mTJ6Vwe1IYy2ufgoul+PKiVtGWHOq
	8kniptC51cQREx1USuJ/uflbbBhf97rDPk+PuhE0mU39iNS0Nm1050CbdgEx8O3LqnYHeuTkfT3
	FebjAfxoL++1z3Hf8p8gpOUzSEJt0WQLECCnUooz3u1GasQQFkIE0w88ReeI16O3rYcCMITKoxy
	XcsZTgcBkpdqd91wymar8NqWa5Ay9DqTomwjS6txiOT6xexIJ8D0bqeTdhujOoeXny0Q9xYtHG+
	iZ8cuAmbUdoTmT3pqAwmSWrhUz8xWOWL/vuPKo+6UDdau6gxuo0XQLs6Ekyr3qbml0sdL7yZi4Z
	SP4kw56F3nOfXO5iA7d1tygnKRlLatFf9U140jvPRTWe0p6gwGZFsh9sewnlDYKppMTz6WmIhPy
	sOudP1AC0JWPoffcG9Ne31nisye1uN2Kacg0pWqjL6IYJjXifxrjkoPxjjYGj/Qf3YAyrQi4F2m
	MdycDholY7nOtIjpfhwfWJYS4GIETAdxDbCnGWgmXjy2ucDS+I8
X-Received: by 2002:a05:600c:3b02:b0:49c:fa21:1c7d with SMTP id 5b1f17b1804b1-49cfa211d76mr269958855e9.18.1788870546243;
        Tue, 08 Sep 2026 05:29:06 -0700 (PDT)
Message-ID: <b3efc33d-17f9-4945-956c-06c174bd93f2@suse.com>
Date: Tue, 8 Sep 2026 14:29:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 3/6] RISC-V: split xen-syms linking rule
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
X-purgate-ID: tlsNG-4011c0/1788870546-4B8D5CFC-4FE45DCB/10/73395122804
X-purgate-type: spam
X-purgate-size: 2987

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
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -31,40 +31,12 @@ obj-y += vtimer.o
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
 
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
 
 $(obj)/xen.lds: $(src)/xen.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)


