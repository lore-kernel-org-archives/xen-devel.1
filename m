Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49A3C61DBD
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 12:01:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399854.1635822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzCJQ-0004Qy-RP; Wed, 26 Aug 2026 12:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399854.1635822; Wed, 26 Aug 2026 12:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzCJQ-0004Qr-Ot; Wed, 26 Aug 2026 12:01:00 +0000
Received: by outflank-mailman (input) for mailman id 1399854;
 Wed, 26 Aug 2026 12:00:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzCJP-0004Qf-Nw
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 12:00:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzCJO-007yRD-QD
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 14:00:58 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8ed573-8faa-0a2a0a5109dd-0a2a450bd9b6-38
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 14:00:58 +0200
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8ed57a-b7e8-0a2a450b0019-d155da36d8fc-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 14:00:58 +0200
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-c197e7e4e94so126656666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 05:00:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de8d1c80sm3194925a12.10.2026.08.26.05.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 05:00:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1787745658; x=1788350458; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q+1gClmmk9yATyoZyczF2GlL3Oy9KQPuz5fqFvtjMX0=;
        b=dVTuJhhBvxdBGBfYzXJRdhFiAZu0fEEh3y9nDc9LXsyjQHfJtLg66yqFBXzG/As4k6
         kgc/E7fp5co2uKAfQHdK6O2F4lhuxyxJmQlpPgjEiBYsZT0rXSThSxyECZvkSl5lVbub
         zxCj6b+7T25RDquguNZiB7F6LZ4FGCEjaSmeUhxxiK24WxHI/97OLnKUdz7qKPfVsWWU
         ruJoubYG0rOMw9JrlRfMqIwDIEYOX+wl/y9y9yhdG3m8f5pFvf68jHk9l/vxjl6QBaeT
         8IglTPDVh2jLEf3lEZlFOf8SRuhbdaW5UXX/JKMBDvCorCjIjrpNhwaciN4faWfIQSyS
         0oIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745658; x=1788350458;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q+1gClmmk9yATyoZyczF2GlL3Oy9KQPuz5fqFvtjMX0=;
        b=lhKc8Gh4bBBimLvmoaQTySiUy49whPabaaOdFHy2klcr02H+pmpIhcr6B4sVbs4iXS
         OBsAGwBtf/dUPK1B7lTY5hHaLiejf4V4NWfYSmd8fQkG1nhBo0Gp3odDQpPeRZ+VikhR
         EZEKP8i+/FXQkfnlrC2UBS8a9WzWHNaDLgzR6a+aaE0vYGHyYdze22ttiWuEr6V1gfBc
         +vLsEy8WcToVaJCNGT/iU0FXMNPq9rTqrrsAnt5Efo0kOfhzYpfejss4BdO5X8RX/JS0
         /07QPe53KA1o9csdtKgDO6kAVLp+/S1Ele21cNz/wlC4pirO3iNyK3n5saT6q9WYA1nf
         MF/g==
X-Gm-Message-State: AFuF++mOXGSeNbVVE+1QvcSuvI6PJFJYKKrZalDga//Y8X9FpqAZYOUo
	mR9y5pREANk8bAjKmGnjZTlKJr6uRzLGLxNFzjwc/BQlU9EbqzQVq5pgFJ9+USvsdWEz7izCcx2
	G1R+5dg==
X-Gm-Gg: AR+sD10XiWGqZBWAlh7kwH121tfJagDTvlbCwuTOvToVMi6+Lc1mCpmeQZgHnOAYRO5
	djmxDfVBkq/6FSBfk3nvtutaZpae+2ilWjFG1q8mLT5wKaz9MCU8dTU6NV5j+3M9AyLowmPU0kz
	9cK8zLcZLdBK9bHv54Bdx/UJzkiKzDUF5hsCQlLGLyAbhpRbHciBKb5jIyrBSvOgz87GmGewWSA
	gFd7Uuf9tF/brxWtIDXWZti2cUnSjjJu2vg3JDHOZTaozXVF2YVTd/fjomjPB3BCl1UdsXhCCXF
	jBKOrhTNmb9Ar5rRl/7acomMYVF+Yt8bBPy9wZhqUjK1wxRwUgT7Svo7xl6DhT+B7VRH9yzmnrd
	qOtDtdmJwiBYgLe0AD9C4udomhfC0uk6CBdGYDZIqYOrreLTxJPWoDxi4zFmQ4RekbaIJ2BP//N
	+/CamZpVH8uP4IPjIL9d0czSy/+0Rzi4N6dNoRj7rbGzEkwprir5/aaKKpgCneOQhJPoR0D9aMV
	lWfi4Cm5ZLaPfr7Ikk2Bf00jrLqEyqm/K7U+C6/Mr0mUfMg3G9kZA==
X-Received: by 2002:a17:907:d0e:b0:c1f:c7f0:b433 with SMTP id a640c23a62f3a-c250bc09ef9mr830455966b.9.1787745657993;
        Wed, 26 Aug 2026 05:00:57 -0700 (PDT)
Message-ID: <483052d4-b70e-4005-8b10-4ecf509bf40a@suse.com>
Date: Wed, 26 Aug 2026 14:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/7] Arm: split xen-syms linking rule
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
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
X-purgate-ID: tlsNG-42698a/1787745658-A9EC69EA-9C085975/0/0
X-purgate-type: clean
X-purgate-size: 3821

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


