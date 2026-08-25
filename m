Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9310CC61DB9
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 13:03:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399215.1635386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyqoN-00087h-LE; Tue, 25 Aug 2026 13:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399215.1635386; Tue, 25 Aug 2026 13:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyqoN-00087a-Ih; Tue, 25 Aug 2026 13:03:31 +0000
Received: by outflank-mailman (input) for mailman id 1399215;
 Tue, 25 Aug 2026 13:03:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wyqoM-00087U-VK
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 13:03:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyqoL-00A0Ge-KH
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 15:03:29 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d9294-2eae-0a2a0a5409dd-0a2a450189aa-46
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 15:03:29 +0200
Received: from [209.85.218.53] (helo=mail-ej1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d92a1-5984-0a2a45010019-d155da35e47d-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 15:03:29 +0200
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-c197eaaab00so785061066b.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 06:03:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24966f8f08sm1767864666b.35.2026.08.25.06.03.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 06:03:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1787663009; x=1788267809; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3abfLYtbhqo3sPLXfuqbsLtONQCvD+Y+HQH1s9WWDbA=;
        b=azsN4Keg1LWnE1/2Q7x+Vf7TDDW+If1fObgyx9HP6NjwS5GcIfAZYR3SdbB3XMa1oE
         NgGXeVf0Uco28A+mfswN/mZPRLDGgvbZXyvRtxYGEe7KS1xpS+C7Gcne41+GvjIrHdSM
         2r8xvF1Y/qs4GnHr63prupkyC9Q3IT7MJQdhTb4KmwgqMC4pXxvr+nOLQEl7BwY6wKCw
         TZO3jMpsZRZRno6z7MoHOk3Q4iEGDSfRa07HSm8bDxqcJcEtiN/bAnVVzqHu7LMU/1pl
         D5qDJGZkPOGrwE7bBM9grw2QRFxPxpRGVyKyOw/sf7HA0CAqQYYbz4ra9P/RU/gJq5b5
         tMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787663009; x=1788267809;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3abfLYtbhqo3sPLXfuqbsLtONQCvD+Y+HQH1s9WWDbA=;
        b=bwzHI11QskYbVJi4RGdL0iTiQBm6BhWyDJWZDavepuDllj60sBUJP5gUaeJwTcOmRF
         JwCrsFihV2smEDZg0SxTB6IeDtzzsN8n6u+U3R9bk1guSchRzPn/vPc0LVBCM63tZIkX
         mb1wZ+nLcJH1HhlsNcYNbwC7nnaypnU77Trp6blWdC7QbbY778DPGIixwn+loKveAL+7
         /BHjvOWk9OFAkUjSUe5OdXTC6CyxIZJnPdKb7dZHAR8hqxlnG0FuItEk/aVTRvJ650AT
         XgzJo1Ed70zHVmPgP/ecIp8bRZMBZGIXQdhlbn1EYB9FKiDqB/7tJqyUWmgdXge+uQUc
         ic3Q==
X-Gm-Message-State: AFuF++ku0SpQwrx8NqVHETdH/HTpqwQItpH4+/6s9PvaIfT7yaJn0Y62
	SNRVN9d53wGjX+Xf+ipn5Jna/6b6A3ANhmOPnRSUEgrDPA3OPTXJf8IpcXm8r15ECtgym+oNZ5S
	II/DSfQ==
X-Gm-Gg: AR+sD13oMd1lr3jaxMt9iY6qRzee617UmRnxhBdcYq5PYipB1bn29C0XhlqHqKZ4dKj
	nrmt6mq03zfHCeBfRUlb0xUt89/79dMBSSnC415dPh5Vi4ol6P07BCyv6wsjDJ6CsREDSRHCXyG
	gSYX/MhZXjkb5mXHRG8yiJbZ84fUEphvBaP2IG/vDyPfEVeIlft8Wp9CTsX4OWhYLkuWm742lP4
	iYadsIJOvzYq+eOZulfrbJ25sWDK+oM2SxPDQYKX3uykF0hRVILdJ42UYoUuy/DKzfqLHga+QhL
	gRFvEIzNQMViUKWlio00Q2w1J03pV0ZGC64TsCpU/JU4Uuy7EbvuHjl1oxlZyCbEOZLB98CkDaT
	W1etLXLalQzd7Zr0XWGmC/FygxCs5h049eei3jExRi6fuUvo41T3gO2gPjRIGrOaBtNDXb8JJtI
	g12rtug3m16EmEy/q2qVr2rpLS/WmIWJ+eAjiBtmoETufJaoQMaYjNAUTTmdauWxSuX2IcHjQlq
	bg8x2aJR0oEAJ+G/hz8k3iPLvOnrYmGVl+si5TQMe/fedXoeOMI
X-Received: by 2002:a17:907:6d0c:b0:c19:fb6e:5fec with SMTP id a640c23a62f3a-c24e600d291mr687677366b.18.1787663008599;
        Tue, 25 Aug 2026 06:03:28 -0700 (PDT)
Message-ID: <d18c88ad-6688-4c01-bce8-681f68e04f5f@suse.com>
Date: Tue, 25 Aug 2026 15:03:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] x86: split xen-syms/xen.efi linking rules
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
References: <fb75dbda-63a5-4ebd-abf6-5ce6b3b5ba3f@suse.com>
 <ccccc6f3-c16e-4988-9677-85d9ca6e30ce@suse.com>
 <27ca9f33-9354-451c-8f17-358511d6ee34@suse.com>
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
In-Reply-To: <27ca9f33-9354-451c-8f17-358511d6ee34@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1787663009-BC359757-FE23A956/0/0
X-purgate-type: clean
X-purgate-size: 2610

On 25.08.2026 11:21, Jan Beulich wrote:
> On 25.08.2026 10:41, Jan Beulich wrote:
>> --- /dev/null
>> +++ b/xen/scripts/Makefile.link
>> @@ -0,0 +1,49 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +# ==========================================================================
>> +# Helper rules for linking xen-syms
>> +# ==========================================================================
>> +
>> +syms-warn-dup-y := --warn-dup
>> +syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
>> +syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup
>> +
>> +orphan-handling-$(call ld-option,--orphan-handling=warn) := --orphan-handling=warn
>> +
>> +final-image-check-y ?= true
>> +
>> +.$(TARGET)-syms.%.o: .$(TARGET)-syms.%.S FORCE
>> +	$(call if_changed,cc_o_S)
>> +
>> +.$(TARGET)-syms.0.S:
>> +	$(objtree)/tools/symbols $(all_symbols) --empty > $@
>> +
>> +.$(TARGET)-syms.1.S: .$(TARGET)-syms.0
>> +.$(TARGET)-syms.2.S: .$(TARGET)-syms.1
>> +.$(TARGET)-syms.3.S: .$(TARGET)-syms.2
>> +
>> +.$(TARGET)-syms.%.S:
>> +	$(NM) -pa --format=sysv $< \
>> +	  | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>> +	    $(if $(filter $(LAST_LINKING_PASS),$*), $(syms-warn-dup-y)) \
>> +	  > $@
>> +
>> +.$(TARGET)-syms.%: $(objtree)/prelink.o .$(TARGET)-syms.%.o $(obj)/xen.lds
>> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $(filter %.o,$^) \
>> +	      $(build_id_linker) --strip-debug -o $@
>> +
>> +.$(TARGET)-syms.$(LAST_LINKING_PASS): $(objtree)/prelink.o \
>> +                                      .$(TARGET)-syms.$(LAST_LINKING_PASS).o \
>> +                                      $(obj)/xen.lds
>> +	$(call compare-symbol-tables, \
>> +	       .$(TARGET)-syms.$(shell expr $(LAST_LINKING_PASS) - 1).o, \
>> +	       .$(TARGET)-syms.$(LAST_LINKING_PASS).o)
>> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $(filter %.o,$^) \
>> +	      $(build_id_linker) $(orphan-handling-y) -o $@
>> +
>> +$(TARGET)-syms: .$(TARGET)-syms.$(LAST_LINKING_PASS)
>> +	$(NM) -pa --format=sysv $< \
>> +	  | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>> +	  > $@.map
>> +	$(final-image-check-y)
>> +	mv $< $@
>> +	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
> 
> Noticing only after sending: We will need to limit what is removed here. Removing
> all intermediate files means the full linking process will always be redone, even
> during "make install-xen" as root.

Actually it can be kept like this, but intermediate files need marking
as such, and $(if_changed ...) shouldn't be used (at least for the
moment).

Jan

