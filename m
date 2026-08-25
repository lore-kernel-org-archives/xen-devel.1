Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E58C61DB6
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 09:21:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399154.1635360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wynLX-0005Qt-3K; Tue, 25 Aug 2026 09:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399154.1635360; Tue, 25 Aug 2026 09:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wynLW-0005Qm-UQ; Tue, 25 Aug 2026 09:21:30 +0000
Received: by outflank-mailman (input) for mailman id 1399154;
 Tue, 25 Aug 2026 09:21:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wynLV-0005Qg-Jq
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 09:21:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wynLU-001uUQ-2D
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 11:21:28 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d5e8d-bab6-0a2a0a5309dd-0a2a450ad572-34
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 11:21:27 +0200
Received: from [209.85.208.41] (helo=mail-ed1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d5e97-f2d2-0a2a450a0019-d155d029c5d8-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 11:21:27 +0200
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-6a422090b14so6037617a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 02:21:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5d6499c0csm561812a12.25.2026.08.25.02.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 02:21:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1787649687; x=1788254487; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RHw1r7kmsfrd+VJzkoe5mR3jU5Bspag4uDuAfrhECes=;
        b=G4KOd5sS+0NdwenMgVSoGCY4uPNgmF51xEz7c9nMnANATmezto6nfmNJle16hDLVyU
         QKTAYjc45e+8xSOU8IhuxjT6c16dgE02GzpB6a8W6ZiaPPjUoGK6Cb23zT5jarqUMw+Q
         MHaZJAtNiVtAyCbPnasv6m2vRSDttdESOKb4C+ROexKFvZs6i51+kE87eG5FIozIUkbH
         nhPa5bcF1aTOJuZAnqXeeBVuU7pAhqPyTmYnhaC2/jArJBQUedzebKkSUPRywP8+6ZC/
         WjfzMH6XHDIPjuYElExJRDU6IiHkOzFmnz17Hp/XocnjJ9oqpClPPUMM9e/nqnHO3dmI
         ABpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787649687; x=1788254487;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RHw1r7kmsfrd+VJzkoe5mR3jU5Bspag4uDuAfrhECes=;
        b=aINC8vcDH88ni9csjq0aM6JXzinOthGulCbUDrLQR9qhZHS4gaRRWDYPzuT4X/Ri1B
         OVQPq+PmK3OYE/Xzl3facKoqOhBwAqlXeLXRaZ6WRlMGUhcwHSCdaJ1kX/XgkcuARorb
         +o6KTYj9eEiQV/Tsjw3zPPwkTEM2n0M08O8ADycrP73uxBQXkOHLM1DZnIm2kD0+h4Cj
         6iqHN1VCDHGwwq39mDxceXEeIkYR9nYp3Zt27P105iQh5oTxVxJODp6cW0zaSd1lFsl1
         eLz7rgvQWnWUE8BdExT/IeXsCEwV2jGcYE2MDctTFO0Q3xC0ScLdsAOaAJdDWgalgAoc
         LVSA==
X-Gm-Message-State: AFuF++kncimdGJA+OQe4sJ3GLln9nm4h/j7HNDeNn3SRTyWYb8oiXGZk
	d2+VS6Jz+uCSSAUmTKkWNSpQ1G1ULqjd2CgSOG2OEZChDL26fRrfCmHFft4MEPapDI2i9Q3Ox4Q
	f6PhuSw==
X-Gm-Gg: AR+sD13eocD+zenjrszWGk5WrF4+5EF68+A4U4DUpp5xwXZ+7+u6Is47rZN79wDrLw9
	L7wZQ2QsbZ3ZXCOy1QGDJ/3j6pNmSY8HwDnPNiwOdjVB4R1jhPiaXnrLZIpxMP9WYM7Ip0MpRPc
	ZCmaXzQ5FI20Y32L1WaI28EJBkjoS7+0MVXbcMupgIAFx1tcC2oeqH3qx38JJmLphS/+LYxMPtY
	SVBQ/i3FKH4dQjGvs1y+0fr9VmPfi7+L7t5SC1byg0OO6Y9gmRNrQ8XFVjdLATBkk9E0ozlbYKA
	k4YwWRCL1Mr1+3lDVLVGq6P8DM8j0iHvUiudqtXI9tuCueg1fmxKq4tjaAF4vKKNVzIZKbHBWYx
	LsSVtaIpk6K77l3SY68i6jVvQ5uWi7Ee7K4k8sRVMb/rJktRmao+Z00FmOsS02eI8BWKpQYoRg1
	iAK1XtxPtxSesj7OhDqZUOg8cHR2gSDI/HOWpP7OJGxMWQFV9E2G2C//q0CWnLZHgbUgnG03D3k
	GSQ8cPuMnUMRRW+7zMAG2zy5q7Q+xDh0AlDHpRDM92efK8dLUpsxpuB6b2H/Xo=
X-Received: by 2002:a05:6402:a0d0:b0:6a3:71fd:4083 with SMTP id 4fb4d7f45d1cf-6a582b7db5amr27205969a12.9.1787649687262;
        Tue, 25 Aug 2026 02:21:27 -0700 (PDT)
Message-ID: <27ca9f33-9354-451c-8f17-358511d6ee34@suse.com>
Date: Tue, 25 Aug 2026 11:21:25 +0200
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
In-Reply-To: <ccccc6f3-c16e-4988-9677-85d9ca6e30ce@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1787649687-585CBCFC-E9173B85/0/0
X-purgate-type: clean
X-purgate-size: 2495

On 25.08.2026 10:41, Jan Beulich wrote:
> --- /dev/null
> +++ b/xen/scripts/Makefile.link
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# ==========================================================================
> +# Helper rules for linking xen-syms
> +# ==========================================================================
> +
> +syms-warn-dup-y := --warn-dup
> +syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
> +syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup
> +
> +orphan-handling-$(call ld-option,--orphan-handling=warn) := --orphan-handling=warn
> +
> +final-image-check-y ?= true
> +
> +.$(TARGET)-syms.%.o: .$(TARGET)-syms.%.S FORCE
> +	$(call if_changed,cc_o_S)
> +
> +.$(TARGET)-syms.0.S:
> +	$(objtree)/tools/symbols $(all_symbols) --empty > $@
> +
> +.$(TARGET)-syms.1.S: .$(TARGET)-syms.0
> +.$(TARGET)-syms.2.S: .$(TARGET)-syms.1
> +.$(TARGET)-syms.3.S: .$(TARGET)-syms.2
> +
> +.$(TARGET)-syms.%.S:
> +	$(NM) -pa --format=sysv $< \
> +	  | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> +	    $(if $(filter $(LAST_LINKING_PASS),$*), $(syms-warn-dup-y)) \
> +	  > $@
> +
> +.$(TARGET)-syms.%: $(objtree)/prelink.o .$(TARGET)-syms.%.o $(obj)/xen.lds
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $(filter %.o,$^) \
> +	      $(build_id_linker) --strip-debug -o $@
> +
> +.$(TARGET)-syms.$(LAST_LINKING_PASS): $(objtree)/prelink.o \
> +                                      .$(TARGET)-syms.$(LAST_LINKING_PASS).o \
> +                                      $(obj)/xen.lds
> +	$(call compare-symbol-tables, \
> +	       .$(TARGET)-syms.$(shell expr $(LAST_LINKING_PASS) - 1).o, \
> +	       .$(TARGET)-syms.$(LAST_LINKING_PASS).o)
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $(filter %.o,$^) \
> +	      $(build_id_linker) $(orphan-handling-y) -o $@
> +
> +$(TARGET)-syms: .$(TARGET)-syms.$(LAST_LINKING_PASS)
> +	$(NM) -pa --format=sysv $< \
> +	  | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> +	  > $@.map
> +	$(final-image-check-y)
> +	mv $< $@
> +	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*

Noticing only after sending: We will need to limit what is removed here. Removing
all intermediate files means the full linking process will always be redone, even
during "make install-xen" as root. Alternatively we should consider explicitly
avoiding any rebuilding in that case, much like e.g. x86 Linux Makefile logic does.
Thoughts?

Jan

