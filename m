Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0F2C79F9E
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 12:29:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411939.1642398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uxA-0006j0-CA; Tue, 08 Sep 2026 12:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411939.1642398; Tue, 08 Sep 2026 12:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uxA-0006it-9V; Tue, 08 Sep 2026 12:29:32 +0000
Received: by outflank-mailman (input) for mailman id 1411939;
 Tue, 08 Sep 2026 12:29:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3ux9-0006ij-Hp
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 12:29:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3ux8-001cia-Us
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 14:29:30 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9fff9e-bab6-0a2a0a5309dd-0a2a4501b972-24
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:29:30 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9fffaa-5984-0a2a45010019-d1558036b479-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:29:30 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49b9320423cso51674495e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 05:29:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d00a5b19dsm324066855e9.2.2026.09.08.05.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 05:29:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1788870570; x=1789475370; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3Uv3x4F3bahJVd0v49025RLOSGv5M2Xej8rLk94QGpY=;
        b=gkTKy5dzWf7litWwAA2K1y+1s2J+xiQ01TKOHrH3XcEJzbAZHX65BhjDdY85iYBwZw
         gLVekH9+NMj96b6o3gc/D1uR3OrANW9GMaIOkyUfgIsj5SMFPvTGttatJA+v9+tMo4cb
         A7y+Zb7uG4tyhsLD+7iSIyS6JBckncOjc8k9Ua2s6GQ34zl7JL0HsprBPHgrLO/MjYYY
         mSlekZBoYu3fdHh7mMM6y/lVrZMkADODBDav6rrN3n/fe5WlvCF+2PvUTuXt75MustRd
         M2tSJTNeBvEz6gfdxyIrxpoTQcE66V3w/7ceEsTB1SegBuGEoDAmwF8HG0NwZl5zydC0
         itEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788870570; x=1789475370;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3Uv3x4F3bahJVd0v49025RLOSGv5M2Xej8rLk94QGpY=;
        b=fUkjdWDp/O1oBTGL2Fyc7mMpfobh2lN59bjgpu45HPW1DbWRATrpUl8tQGZhyoI5Wn
         MiFETXCAid/4R2ASoruYCQzsiJdJaMTP/tWFoNtcQ02ZMLULigYMtufhUoJ5bdJKiLrx
         t2ha1+sz+Tsql51i92AW2DfppXSaA8ltnxIE+12PUKktFhdqdSr13aGoKSrzoDIdGLLp
         CXvwL87DPYmrLx7r/aM04My/jbpBmqBGN3PqdFKS8UiDF2mTP2p9DeBJTkkbPlz++gEc
         +Au2PukY3c95YnadZ8+d060gQXF+R7/0V8usYeDFP1WSjRipW2EsM+eXfHFESDVkeRHE
         k9Eg==
X-Gm-Message-State: AFuF++khR+dSnK2LuSqqEm8zMeD3jJISD5nOSscjUp1V+nIMotGvXq7O
	rlrYQYk19XmTRWfEHV3QtMDuzLZ62GZo+aRu4f1ck0Uor/hyrXXLZa/9FfGL1PGJT1s5gLArhLM
	ms66nGg==
X-Gm-Gg: AYBFou2CXPRGNBgpAmjJJ95TOncEhAo2ehMAVnlcjeidRRf+8lADA7fKpX8IO2tWR5Q
	GDidX2qS3BLDOZip9neTnbVvS1dOfg0sgTl2i+g1bhmFCoiEjNWrmMSC/cNFXQ+070PxM1pb3xn
	gFeMPe44FXWao2FzSLx7Kx353Nc5XzwLTJFNN3fwZcsMmIQbKwed92ddyiFu811XqrqFyy8DdFS
	2gUMgLBoSHs52ljxgnXQCy9f4942VtSEjp468tdKtjf2FVyChSoISrfrYOquzO8iigOaJl6ZnKf
	poO+gIm1eTHMrVGuV4z/Owi2wbV8TbJKomwD8bcaY6P1RTcNpck9ssatYu1p2N8lnJ29ED2LQSA
	2l4R6otqHNF2jvYr2t8IEH9a9kHoB9tm6M3HbW+HqkQBUbDbRVbla1expKRYaptdwVd7hgVKc8R
	ooiFDn22dt9UarXLThTS1qk0UjSjlH3M3A6vCzKqoXj/5qZqVGjmuWai3mYUZ/lkYD0UJYIj13/
	RRcKP819dDhx/XDMJnBAy59DhAzbaakZtkdBzsi6D4zKEuQSHP2
X-Received: by 2002:a05:600c:4e94:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49cf81e368emr489093245e9.6.1788870570161;
        Tue, 08 Sep 2026 05:29:30 -0700 (PDT)
Message-ID: <6502b5fe-7127-4a5c-b16e-aa1525c54201@suse.com>
Date: Tue, 8 Sep 2026 14:29:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 4/6] PPC: split xen-syms linking rule
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Timothy Pearson <tpearson@raptorengineering.com>
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
X-purgate-ID: tlsNG-d62444/1788870570-BE867757-FB2D2EE4/0/0
X-purgate-type: clean
X-purgate-size: 2276

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
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

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


