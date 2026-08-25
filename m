Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED19C61DB6
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 08:43:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399125.1635332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wymkp-00075C-RS; Tue, 25 Aug 2026 08:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399125.1635332; Tue, 25 Aug 2026 08:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wymkp-000755-NS; Tue, 25 Aug 2026 08:43:35 +0000
Received: by outflank-mailman (input) for mailman id 1399125;
 Tue, 25 Aug 2026 08:43:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wymko-00074l-Ct
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 08:43:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wymkn-004RbY-Pf
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 10:43:33 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d55a9-8faa-0a2a0a5109dd-0a2a450a9400-40
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 10:43:33 +0200
Received: from [209.85.218.49] (helo=mail-ej1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d55b5-f2d2-0a2a450a0019-d155da31f0cb-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 10:43:33 +0200
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-c214e625259so673609466b.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 01:43:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606b4f1sm1688249766b.3.2026.08.25.01.43.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 01:43:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1787647413; x=1788252213; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z+XcKNuFMvLMilDPsUpM4PMWFJxDvjvamUF6fgbTnzs=;
        b=NnuT/sdZGQqeZVkOFh1LVk+2qFF+7WpAEqRpvunwTDnZH9toFkYcGQNSV985cvqyoE
         wL/wVGLnrK7WQHkqJLbo0ARP1wus/naYgBeg5PAZ7oUiUm4KPhX09+hybdIMHClB3YGr
         D6i3YaKt3DXcm+qaJbyk9/zwaIpj8kj/nilIgR1a0yHAzapHnPtF9wMVJc0pkE81FDgf
         rdutB6sIl3I6RastngTJ6tlmIDOeSfkt9qZKaDQb70gfZUZL/NUwVNeiBpUWwQ9LU6sq
         +DM1OArFJFGjrDaQLcmffxoSPHLggKcOZ+HSZu19kHeEWB+wBMyM1xVjXDvSY56z+2+s
         6Ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647413; x=1788252213;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z+XcKNuFMvLMilDPsUpM4PMWFJxDvjvamUF6fgbTnzs=;
        b=mFm25WG2lxrrhJ9JgUy0nFfv3nZCr5lzZEPHUO7P7Qs4DttUtbc2hZdV7QVDH5u2BU
         sOiDZzq8w/sv8F4pOGVaygCHpcBZK7jGXtuKX3L5qYeTMNEvHiEa+H5But3p8iASUYHK
         tmDruZKy4Oq0Xfo2eceJOOSMdFVPVivnbdBv1G/ot4TvOolvbjul6mm+PPQLNQ842ETX
         dUSJ75wNxc1NDXkgW/T54DHiU31T8unuUhEz5XxnyJhQKdkv8Q73JzQjUmpS//TfPBvP
         Zk8r82Z73skamUnvoHXBNVUdoFgfFGkdonwoIYPqub3+NSG07X263K/ljqp5ePvArD8Z
         /gsQ==
X-Gm-Message-State: AFuF++kdWRzTiyIZ0T+hL7wmBvgDJ0JPznaQO3g/De07pEEX8HQclLzj
	lKIKfoOY7XXSjH26Vg1mYUFeQJqakNt+u+z+iOn8q4J9E/t68lGXjg/yO8nkvVgA4Jznm7rtlHh
	JeYXUMQ==
X-Gm-Gg: AR+sD12u2D3Yvg9p9t+gOxMnJfZvi17qoSXxzxN3nowY8k2wPg6VVs5iRPWO4qIEVFR
	LUYIhhzT73+N5Xc4G0BuyyhCGOxjesN7ViTpcEZv/fpI4Z8e5sUnZdYyIKN+ACzlXMMzt58hjNq
	vPNcMjmy2g3dsmszZf/WMj21siyQL+bKzzrdYWF4K+qObq+Ua86gNDKnHrUb9btElt8AWVfGKTC
	+N9LYrux5sEmww8eD6WJkqOpJBnNGp+m3wl5W3mbNsmFDD4BfTRH91Vc1OrYDeTo7w0ioq9NaMq
	09w2N6MkWizPm92F9MF5ZVEAppU34mOGdvb76hBQiwJfctZARJkLn3DpWOPokKv9otpG/gwwc5C
	N5p9TpCkasc0qlp+UUfDfSB9hA93hE93RznVVJzRW0K/udpj2ent72GLdFKD4wdlI9t+yhu6+hQ
	2pZOpk74vOyqLJmy7WZrYQxitkj/saE2XT1cFth5vi5yzvpw8mM2c5mnX9hWj+dk2BilalRtNSg
	WRHlcwwUwOAylB5+Q2ydEdo1RhPaw7NpcxSE+XbXmDAlvaoKhc8
X-Received: by 2002:a17:907:9607:b0:c19:6d4a:425b with SMTP id a640c23a62f3a-c24e5b55311mr540507366b.18.1787647413233;
        Tue, 25 Aug 2026 01:43:33 -0700 (PDT)
Message-ID: <69413b7a-cf81-49c2-a975-f528412d5062@suse.com>
Date: Tue, 25 Aug 2026 10:43:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/6] PPC: split xen-syms linking rule
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Timothy Pearson <tpearson@raptorengineering.com>
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
X-purgate-ID: tlsNG-4011c0/1787647413-58DC7CFC-85F7E7E9/0/0
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


