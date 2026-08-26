Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC6DC61DBD
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 12:02:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399862.1635832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzCKR-0004xz-5S; Wed, 26 Aug 2026 12:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399862.1635832; Wed, 26 Aug 2026 12:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzCKR-0004xq-1v; Wed, 26 Aug 2026 12:02:03 +0000
Received: by outflank-mailman (input) for mailman id 1399862;
 Wed, 26 Aug 2026 12:02:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzCKP-0004xi-0f
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 12:02:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzCKO-007ypd-Dl
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 14:02:00 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8ed5b6-8faa-0a2a0a5109dd-0a2a450cc15e-12
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 14:02:00 +0200
Received: from [209.85.208.48] (helo=mail-ed1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8ed5b8-f479-0a2a450c0019-d155d030a904-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 14:02:00 +0200
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6a156627e22so3714199a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 05:02:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a6fd676sm480327466b.17.2026.08.26.05.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 05:01:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1787745719; x=1788350519; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JoSzWl9u/xDhO1ZqChlyScExhg2WyeKTzD6iriK6Voc=;
        b=e/g0LNKNCWo355GYtsuRfOvg6lvT9qmGn7BviBR86tGpyzlsgocFJZGwFQajsZXkbI
         g/PLGjcqqyIh4it6S2sQWvCKs3+KI7rnU+OzoAAixya7ovAxwSC5AtkLRUhUgobDLMZK
         r8c50g/4W1ViXfpUNeZJ2kS+rjz7fbl25UaGvdnaju2tNvK38LMMpoRjvFXmkJleDBf8
         x2P09Uxb2IiN2DirnxdCWC69s1uqy4Ty4jxlIr8ypAot5HmgJxFDD11ZalstdoHEsUX0
         GK/1St1AEYS1duafTPh/wJaZQ2/5Dg83vPlbdowF73lzZD+IUL7E7bs3dNUUl5JlDj5j
         6lLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745719; x=1788350519;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JoSzWl9u/xDhO1ZqChlyScExhg2WyeKTzD6iriK6Voc=;
        b=DOrxEPKhM7GTK2X5PH6lQSAAiboI1pvG1lHviUbFyjD0udgGMeEnvMU6WQSwCdh5sy
         nQGf9IdCqlqnjjiL2EGmBlP+A4OY+ATdTIx+cj1dKWkMyTzYEnfLXOCuOuxwAC1ysCoz
         BmE7G7iPLXuUTwhRaNeNeIjO7ltkDxWrXhnOKnrNzBd4pfd0WALELjyxu3hEoIc8lJbG
         Zxee0Okp+eR2vFBe2ee5SwiwGjaUzoIVy69T2fDYLTQwK9UJlB9yixH7VaFxkzzhqTpc
         tsPvcjH1Jmt4J7SsVl48RemHNIuewZzfl5mjRN24PZcjahMzpRzzeZGBFhBqK8+iUvV1
         4N9Q==
X-Gm-Message-State: AFuF++lh4mYNEPSjK5cOWaAIXjfpGlHzBZOEScW2Ga+saQl2/5m8zxsJ
	b5CC+FYm/LlJn0d/0/MZ0iJYvNaOqu1AXzYGPu2rCyN2dYn34d0uEYnqYPcPqiijT23NXBbgB+M
	VaHTTqA==
X-Gm-Gg: AR+sD135L4tCaR2nXDymVNBWAM2CvgLmDJHt4Fcjlhul1k0HqqMY8+cEYuH4QIeFx8n
	wPvVLzJ2zCf0Dhi/+ULv35psq+Ghy6C+5j8o4NDGPdJs/k5f2yaCLz0EWmSGoYVK/oEpUIVjXRg
	P8iQxWEQEE0XHCGV0QSdTtbeUipKnaW1YJCeOAkfJ179fIDtQILFuVrephIxwqpz2fAbOqOxnYK
	U5bEyUl5DiFNU65n2cTWPylxUGUnDibTcLZlLiubZmwoem0wyyvDXb8vJGW3DkZaHZo/Bt9PrAx
	kOPDy+F8KkvatndZvnUc9exVPwvgZ+9k65ib32XwmRgrZQytj8JMS3S4CA7Zc3ynQrgvtBZ+M6m
	FpvQfSnpzDzqufpyCwjexfSqvcuokazt5sRhw+4Z+jVXbT3KYvEwjwpAKDugogcaLxf6Y8TfehQ
	amUf519sdYXQf848c56vT+5vJb5Lx0PS89G01WCQqEyDpBbUHfYZSf2CmPZ5nh4NgR95tl7faIy
	iM+/IkBcp9LX+/W1YeaPGJC2/VodtzfHXFKxEZY4Ot6rhsFM5aU
X-Received: by 2002:a17:907:a0cf:b0:c1c:49d9:4c34 with SMTP id a640c23a62f3a-c24e2db3d7bmr1737380766b.11.1787745688069;
        Wed, 26 Aug 2026 05:01:28 -0700 (PDT)
Message-ID: <6f4b26ce-2797-4c17-bfdf-8effd2026a6a@suse.com>
Date: Wed, 26 Aug 2026 14:01:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/7] RISC-V: split xen-syms linking rule
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
X-purgate-ID: tlsNG-d25034/1787745720-014C7A5B-4E4DC9A0/0/0
X-purgate-type: clean
X-purgate-size: 2927

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


