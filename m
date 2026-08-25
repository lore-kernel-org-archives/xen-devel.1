Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422A8C61DB6
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 08:42:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399111.1635315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wymjU-000652-8u; Tue, 25 Aug 2026 08:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399111.1635315; Tue, 25 Aug 2026 08:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wymjU-00064v-5M; Tue, 25 Aug 2026 08:42:12 +0000
Received: by outflank-mailman (input) for mailman id 1399111;
 Tue, 25 Aug 2026 08:42:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wymjS-00064i-Fj
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 08:42:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wymjR-0042i1-Sf
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 10:42:09 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d555a-e002-0a2a0a5209dd-0a2a4509cd9e-34
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 10:42:09 +0200
Received: from [209.85.208.48] (helo=mail-ed1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d5561-be1a-0a2a45090019-d155d030b9dc-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 10:42:09 +0200
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6a082b3671fso7263860a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 01:42:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5d3d75550sm853569a12.3.2026.08.25.01.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 01:42:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1787647329; x=1788252129; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F1cEm7rJzS56mS2/4sRHBA3+kz3xYZ64wP1egs+rTXc=;
        b=bk9JaJ2GWQVjNWd/fJzKuaTLxxjnJ6NdzUw+7bdAA1MPdlw7G6iAfSnVPyh3z2CFpI
         BD3V4p0CL6qNOWT/hcYg3/YIrSjP2iyIK0+d6kvx/vy98/NBCvK7vehuzEt0T+b1dtWt
         wea7RsLY7JB7wJD5mtsS9cyL3NhY3pttnzMW+hf490gel1gRik7oJyfs7sBQvnKzS8xJ
         +KZb6E6PdI6tHR7eK0gsOlbbWcJfMWMjwB8v0JiUqqICoINYOeowa7VWtMM9MpmHfCfQ
         5Y5bjqEAa2nXaopC911xX9kktpYCoeuKzp10vG4HuTkXX89ANNnhQG4LjqqV4hDGZwp8
         Da6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647329; x=1788252129;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F1cEm7rJzS56mS2/4sRHBA3+kz3xYZ64wP1egs+rTXc=;
        b=oKR//tYp3tyxAeWc07HP4mBAjkckimfWrw3IP9wUYjdp2tHJzJXlkfphUdwa9xhIXC
         pr/Z9Hnnpx0fwFLnkBqaW6OEOmd5TB0CP8v7mS7d2UD8PVWSgIY8cR0vFQwdkgczY0SW
         Yn+4iTAohezDKyrJM/rKzjmROWRaZaGoIIj8jXCfYQI8rWOp4KrybWi6CGbh8CQu6+JW
         TNfwI06fVHv6KdNz+wdPHrS516kBYvbR9lzrOsnZ5l1GaJuiZO0HEUio1KCEi/5mgM52
         8p7fjTEm1Hf/Ntcuw3jzeIZWWC4VyvQ7G2oJ/4UweZw0Q4lGDNuoI8DK2jHlDJ5PO7iN
         8ZNQ==
X-Gm-Message-State: AFuF++l3noMJwrkc11arb5U1rxHqL3RtXTrIiuJq56kF6hH9omzQmh3u
	4mc1dZUVWjtVO7iH3WQx6erg5hxxVVS3tKVXnpJ5iRtX4eh6I38kBrLNgsuN3wSHaLnleOf7anw
	XsOHEmA==
X-Gm-Gg: AR+sD11won+aOYUebDp2dioqR69ow+wFx0lUL5ou24Ckx61iAzDNyCz9znwS7DkUVGJ
	+SuwuMZ2H8vSWCvgMOnuDTclOajhTe1Ff6ETfHYXtbF/mPR2BVvU2ox3DwHN8B5+l0VUS9Cq+ZI
	Qzu5JZOz8RFU0t+1lGk8ZxL0fLY5J5+YHlSIalY2UTSkgAnYTgvKvodf6ArXt87xNzer9pYjVHM
	tJLiIhLNJnnssgk5UMReuswgrpXvlDWyr0FTREfJyktJcU1iO4TUnzL8K4fFpD5TJf1LTk9FeFg
	h7d3esUVths9HHBr8hLKCCh3WCzl0llx1OUzg/3PxipXrzK/mPr+rHE8jBEo+vVCWkQ4YR+2Qe5
	61eERj6M0YVPZT+ujJQ4bqCIIuD2ltIOPYo/NrZHmNx71oqD/I0E+5KkIkz+y0/b4HiubgV/E7k
	+iKIvR2o40oG9GqcUJQpjKWq0LLM3IuFXzo0Flz6Bcu0/Zh1x6g8hG60JQo4fLQoXa784Zs+zlK
	zWsk/XVtz6K24csA2VWgiI8MtDX18AGEtTRzLn3MALV9PBlrVOK
X-Received: by 2002:a05:6402:a214:10b0:6a5:d694:6e9 with SMTP id 4fb4d7f45d1cf-6a5d6940777mr645550a12.2.1787647329386;
        Tue, 25 Aug 2026 01:42:09 -0700 (PDT)
Message-ID: <0294ccd6-6a22-4cab-9654-56c18bbe37f8@suse.com>
Date: Tue, 25 Aug 2026 10:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/6] Arm: split xen-syms linking rule
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
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
X-purgate-ID: tlsNG-bad1c0/1787647329-FD469034-AAF50E60/0/0
X-purgate-type: clean
X-purgate-size: 3812

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
---
As for the x86 patch, I'd like to keep the "beautification" part, i.e.
transforming to $(if_changed ...) machinery, separate.

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
@@ -31,6 +31,19 @@ final-image-check-y ?= true
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


