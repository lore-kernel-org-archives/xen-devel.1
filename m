Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8680FC5DF94
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 08:42:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399116.1635322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wymk4-0006WV-Ey; Tue, 25 Aug 2026 08:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399116.1635322; Tue, 25 Aug 2026 08:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wymk4-0006WO-CO; Tue, 25 Aug 2026 08:42:48 +0000
Received: by outflank-mailman (input) for mailman id 1399116;
 Tue, 25 Aug 2026 08:42:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wymk2-0006W6-EJ
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 08:42:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wymk1-0042qT-RK
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 10:42:45 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d5582-e002-0a2a0a5209dd-0a2a450bce72-20
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 10:42:45 +0200
Received: from [209.85.208.47] (helo=mail-ed1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d5585-b7e8-0a2a450b0019-d155d02faca4-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 10:42:45 +0200
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6a10d02ff43so8741943a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 01:42:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59e02a8fbsm18170188a12.13.2026.08.25.01.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 01:42:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1787647365; x=1788252165; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JoSzWl9u/xDhO1ZqChlyScExhg2WyeKTzD6iriK6Voc=;
        b=J1nXtJffqqp0xVvaSg5M45MRqo7cCbuYtDYf/XI91gYJe5hkuYQ3EBwghQNZ3jiGzt
         OV1/nSMjEJurIaYpaekkdizaCZMaSCOzTYT4s64k7Y0HHSmmg1OK97HjFE5V5yqWiBHz
         lF5TUeFUF32kmqhTuBOgwvlBcH8vZt8g3R0VZ3jB7H1aeOIt/0UIasnPqmosNYnKv2Wd
         NtJ9iMD2hk5hGHQFFtPnfJuHZXApwFFJinaASemWMfvk76D/1DQ8dFIl0qN+BOvJDG/H
         Qgfzm9FAQZCtOeH94q+y/0i+0BBorxHNGrEsIcK3kHId/DQtO0V+gkSS0FUrG9mgLvpM
         +yUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647365; x=1788252165;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JoSzWl9u/xDhO1ZqChlyScExhg2WyeKTzD6iriK6Voc=;
        b=cAclz8jaLQFQuMNz+IjHiYbd1j4Aicez9luV58CGJi4dXtMg4RoBPhLtTeXiFDRIeK
         GS1GeCpTcbXM8Jm2zP9N5+HztUAX7OTVF2myHHZSCxu4L7aCtbmR7VSvHzVxXFhsJDa1
         0UJthtu5/4AObBVRxHvQrQQjEfkog0GXuT01wn8/1jsFAlPyh32JzFwlPPReUT08s+hu
         SQPf4QUcsKfWx1dZlugtJ2rPpJ6D4ofWsuX4GWUhsNyYEmYrp50zpixKGhFGf1WBGWRu
         2Ehlf1rpBmQQLVuLYdP+zguRAR6hKKbJ/bIGE12gfOzfGPEg+Mi2812F6L3zDPW9iM86
         5JgA==
X-Gm-Message-State: AFuF++l5KLyxHHEfFv9q/u1jbC1ACaG9oNZOXwzIAiQ/0OiQWI6ug8tU
	IjSseu7fEHdGWEEdLj6m0YFRFoRNIiKoG6uBVm0LYrH8RntGaY9O5iou1wTP19L/M1LfGqjWsd3
	Kvf5gLw==
X-Gm-Gg: AR+sD12n/rqoJByCq1u7NvTvhP7KuBNaknTzxzL9ZOilpakoyQRBBByNBDiRPL07/dL
	91cO1vDtsIVcGIsQoIgVMQ7GPA8kpM+f5ClpeyeTquOjFwNrg85A9aWKGoD/3ka7Cs+zzaaXigJ
	jOwUKUG6lz7lui/F3mSjAH/ogGNL4419SQBQKLTrZGqKWBpUmj93iWkP+/kgEZZy6pNmPjw4ljR
	EEZyVq1EgsqS/wMwAVyx2xaTD/1VJRm15i3/fYq47vu0lzlpV5gftW9I6W3ct72I/RcZ6mcWDPc
	dEi+Z24YnWUnjZzyQGHwYQJr8yHscSX7as49hJFJlIixi1Vm2YUX9/XjIFcVb0T5LnKKqTNjJ37
	5XduCOVA0mv39SQLQNNZojrysSVVlD1N3lQ1TfL+5zdMzAc5Ahve65z+AWgex3x/aei+ry3Jx4x
	7YREt7H32t3VPeXHfTPccfKEZb1UgElYkhL+/Bmie/H1Q70IknKXxJiU4CcC8jtrGvbwyxIitCG
	Q6BPdsxQ2FJH5lTzi/W2Z0FQVIHERY8X14poqvztOx8f3yCxzwFe8c3uNKYSiA=
X-Received: by 2002:a05:6402:428e:b0:6a1:fd14:8835 with SMTP id 4fb4d7f45d1cf-6a42eea5ed7mr36418894a12.0.1787647365372;
        Tue, 25 Aug 2026 01:42:45 -0700 (PDT)
Message-ID: <f5ee642c-967f-444f-885a-fbbae6445020@suse.com>
Date: Tue, 25 Aug 2026 10:42:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/6] RISC-V: split xen-syms linking rule
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
X-purgate-ID: tlsNG-42698a/1787647365-AB6D29EA-35DFF45C/0/0
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


