Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8975C61DBD
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 12:02:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399863.1635841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzCKW-0005Cg-Eb; Wed, 26 Aug 2026 12:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399863.1635841; Wed, 26 Aug 2026 12:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzCKW-0005CZ-BO; Wed, 26 Aug 2026 12:02:08 +0000
Received: by outflank-mailman (input) for mailman id 1399863;
 Wed, 26 Aug 2026 12:02:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzCKV-0005C4-0n
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 12:02:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzCKU-008IR5-Dg
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 14:02:06 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8ed5b5-e002-0a2a0a5209dd-0a2a450bc60c-36
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 14:02:06 +0200
Received: from [209.85.218.53] (helo=mail-ej1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8ed5be-b7e8-0a2a450b0019-d155da35b574-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 14:02:06 +0200
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-c15f020a223so120064466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 05:02:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a9ef92csm466088866b.63.2026.08.26.05.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 05:01:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1787745726; x=1788350526; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z+XcKNuFMvLMilDPsUpM4PMWFJxDvjvamUF6fgbTnzs=;
        b=C9hmPpoxI9AlTed9Xf+JSawc5A6n9bvRgg8l6eMnmbCSh9ROchlGqu2ZUhXSTGTJgp
         DKKQL9UheUFiJTc98R3ccNFhmYkLnVoDnz1DFJPgOg5KRt4mw3qcZ1l7ZGlpNehI44US
         6CyETH9km4ogkp65fbBJNU3gsIJZK0O1bkwTmhHRUDNn1ExCAG0HWBCqLP70utKUqSf3
         47dTfffBsIH5reOczd0mF552VdpsKvoU5PTn/P47pGV/QHoH+m1G6rpOOoKtTezpm0b3
         Eir0SQG4vju/QblKcgZzYWFELSoiYv+YjMQJCg/ODqof5UxElr7H9EgYrAU1bR5koBLq
         NvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745726; x=1788350526;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z+XcKNuFMvLMilDPsUpM4PMWFJxDvjvamUF6fgbTnzs=;
        b=a8bwdnFJo9BEqOZMPVaNjN+JdBR0Q0oHxzcXRnrwTKVXuaBug+FKqhpIDiB7eUZKUC
         qia1wPK3DwrZaJVv/q7o4G3M5ON2zjRWPK3ZFn9M3oJcJOY37WOVyZKndEq48kwn3/Mz
         EAX7nev7mOf6IF16dML5ArE2IJ6RXQ8e0ALisTn65kOwfZWUsoKogArtJgZx+klMXHfM
         oWnY1M2LFV2YDexVugUtCXUW7jg+5AbG13EV7fetQPCXXiCPKVmMRVNEIC8ujmH5ZRL6
         I0xIQ6t1eQunxpBRHqqsvva8oKr3zbROYzyd2TgbYATBp6Mn7//akFMgteKfEPJf5hB4
         w/rA==
X-Gm-Message-State: AFuF++l+p6qRjnQGyPgAlkIDCfyGti+RsSV2wg65c2HMOJ1cGRjScU3h
	2cy6wxtCAfne7Rg2n8zYLMo1gsr9mawMHjHyuNqv9tx+xyjqJCdzq5UOVPeXj7XFFBuBYYe+TN1
	rcZ3cZg==
X-Gm-Gg: AR+sD100UlYY/kVQ6eVbtJgUqJedOjOmEyJLxs+LLeG/kcGjQKD03kSLxNsLvinev+k
	gwcBTva9JTnIEEGAuNUfeQktBd7ZcHai4fQEQVc5HYyWzq8/NybHDi5DzNCLWrDSs2xD5Bt3M4c
	lfr3fSKk3NdJh3ISluuoElVN8GTnMBYdZClJhE2XfsCEAXnE5VQjoh3pACgl3odcjS5UuqN2aK3
	VtzWkgyrTFRbpUcNnP24sC/x2ZNVDI4otq6FUhiCkyfEQMmf3DVnAuFPSjCBMBY1lOiCQfqdUtr
	VAR//E/hz7m2CXOMfOiJFYdWh7P1YV0WA398xL+I8SsSewZzLORjhLAr0kYVKmKkqYkSizYJSAk
	1lS5FDC1/dnCRaET7kbvkhEsQToh+ceG6905xdvSQmCtlXskpt7IcuW2YjQQORcRdGgE/5uIOh5
	2B3lxn7WWIVHD4rZv9Xh4wek6oAwQU3b7a1RWIdzeUwWRlSpkBiAlfej9r+WTEM1If3saVUpYpZ
	jK27Yavtpi2a7Fi/ZuR3q6n056YV/r+eiw3PbttU59zIjBVlc8rguhCFR+87iY=
X-Received: by 2002:a17:907:6093:b0:c08:417e:3696 with SMTP id a640c23a62f3a-c250c318ec5mr740932566b.20.1787745723171;
        Wed, 26 Aug 2026 05:02:03 -0700 (PDT)
Message-ID: <85bc5cc5-285e-481f-bacd-8421abae169c@suse.com>
Date: Wed, 26 Aug 2026 14:01:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 4/7] PPC: split xen-syms linking rule
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Timothy Pearson <tpearson@raptorengineering.com>
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
X-purgate-ID: tlsNG-42698a/1787745726-196C29EA-0485E033/0/0
X-purgate-type: clean
X-purgate-size: 2219

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

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -11,28 +11,12 @@ obj-y += tlb-radix.o
 $(TARGET): $(TARGET)-syms
 	cp -f $< $@
 
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
-	$(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	    $(dot-target).2.o -o $@
-	$(NM) -pa --format=sysv $@ \
-		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
-		> $@.map
-	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
+LAST_LINKING_PASS := 2
+
+include scripts/Makefile.link
+
+# Suppress orphan section checking for the time being.
+orphan-handling-y :=
 
 $(obj)/xen.lds: $(src)/xen.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)


