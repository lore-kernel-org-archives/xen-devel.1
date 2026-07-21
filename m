Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14110C4452F
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 13:01:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367794.1617468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmA5g-0006rP-1z; Tue, 21 Jul 2026 13:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367794.1617468; Tue, 21 Jul 2026 13:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmA5f-0006rI-UA; Tue, 21 Jul 2026 13:00:55 +0000
Received: by outflank-mailman (input) for mailman id 1367794;
 Tue, 21 Jul 2026 13:00:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wmA5e-0006r8-IQ
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 13:00:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmA5d-00DFvJ-9v
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 15:00:53 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5f6d80-5cb7-0a2a0a5109dd-0a2a4504d296-14
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 15:00:53 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5f6d84-b57f-0a2a45040019-d155dd33e9d4-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 15:00:53 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47f7027ca11so1888734f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 06:00:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63e49ce4sm39319639f8f.8.2026.07.21.06.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 06:00:50 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784638852; x=1785243652; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=69N38Aw2z0X5smYv/d32sZOgwX6sGna2y0OsrJNqOyc=;
        b=O22UMnii55dmBVJhle15AF0icpMKzlTpGqsy24U1IwZWOOthIarI7OQmOZ6L7h7x29
         lXlLPPKcaHU10RZQROSW6o4Uf8RB09eoaBMJN8NRIl6ExevsJV1d78sEtOH4uHr5DwgO
         eVDjSdCf2To9r5oJD91RdYuqjIy6ICHaYJ0tCXdrvE0L3OEP86HcWRnmkQGYSkMVW2ZE
         HTHZQDPrGvw0Zu+45PYejsB+qofBTfJPGhlrSsW9awgE6W9VNC0tzpgDGDBXxdWlh6bP
         2tXXN2sssAcziQjSokQa/F5MxmLbra5jPnsfZA8YhcNc27u+tntIl2QxZb7TgrwaJeBY
         NIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784638852; x=1785243652;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=69N38Aw2z0X5smYv/d32sZOgwX6sGna2y0OsrJNqOyc=;
        b=WjFJLHZ9pfGn2yTncXCLaA1xJhyCRzqkJ15vwFlanIxJ2NiOnn+KBJmrsBnhDFUadb
         A/+4uHDCZH+E9b6oJjQlG67mYkvXvAv//pup7PYpJR4kM92PO5D9QUpe6EnFJx5DTeph
         xIRNtcLUuzVyit3ti+OpO5fws9Yeo5/dDUzAcVUWdtZ1XhKvAnSUTLhjI+6v3sluG2Tx
         TaU8mQmN2chG4KUA2GfcY+815/4Y9BG3zZWj0gSWVuRQ/L/SzxrgbIWcnyU+AwFJ4Z6l
         QeOrY9U4ZBBXlx3SeKMUV2WwHY+1vwY0tipwts71swobSZ9ofB1Ra4jykSC1tfPfqwAb
         I/bg==
X-Forwarded-Encrypted: i=1; AHgh+RqKHqxmwu0dy/EjeogM+60HFDeqpd8+u9tqqG+gJYop2Y8ztpy/dfb+goRj6jELlMZMp4tZ/aW3cVY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzexYkyUVJIqtc4FEz45vD49io9CdepGUQbg+iiopu6cdBtHzY
	BycX36S8rMZjrMROKMXfhmc7jQmJyXHbw1VuC7+ZVbKGEWjA1hBHoIOq9b+oCDQYmQ==
X-Gm-Gg: AR+sD13VcyFsJFfTAB3xTCjoqqNVAqSooz2v/N63kpX7VJ0/vfIUYWtWU573i0NBRf9
	rk/ZQXjtYGHZ6qeAkXtdY96yAjF/RO+gPmWFsHMJ7zh5es8TMF5LzKJ3xx2UyrvF0+2/RLUrCXu
	CwSn7q3TH3kEsMwXeG9FagUTvGD7nwDdlWTyD0IOFBl490P03Pmfx0Wzh5hTyAbYYGr+xy6wEYJ
	eRdXPmgXLcAvnZiGbuDBTomF1N0dZD6oppmRyNhNQXg5gss9/H9nUnhwKmWKGOE0hWUYMy7K6qE
	MMkiZRD3aOQpTT3FgPoLJ5y2bnEvvnEcwGu+/bmw4PLV3TTWhWYWDZMf0IjEd85VkmSqYGRK1L4
	0C9Y6LToLrp9F2KCsyqwHtJH3qNlpgALQM347cm0po/35w24dyH+E1I832ToDE3EetNonAxJfcv
	O7Par+r8ACMWySaFTLFiNfUzrTnxHUWc0T6MgyE3qGk0zYG9YfPSvIFq/eKQMfPEa41LkuUzjPy
	mC5
X-Received: by 2002:a05:6000:2084:b0:475:f0f0:9ec9 with SMTP id ffacd0b85a97d-47f6233b524mr21485293f8f.52.1784638850775;
        Tue, 21 Jul 2026 06:00:50 -0700 (PDT)
Message-ID: <ed40f4f0-f26e-469f-95de-5077cb4218f0@suse.com>
Date: Tue, 21 Jul 2026 15:00:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 1/2] docs/fusa: add coverage_gap.rst tabulating
 vGICv3 LCOV exclusions
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>, matthew.l.weber3@boeing.com,
 harunobu.kurokawa.dn@renesas.com, xen-devel@lists.xenproject.org
References: <20260721124729.868630-1-ayan.kumar.halder@amd.com>
 <20260721124729.868630-2-ayan.kumar.halder@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20260721124729.868630-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1784638853-C34C3B50-E53D2007/0/0
X-purgate-type: clean
X-purgate-size: 1907

On 21.07.2026 14:47, Ayan Kumar Halder wrote:
> --- /dev/null
> +++ b/docs/fusa/coverage_gap.rst
> @@ -0,0 +1,41 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Coverage gaps
> +=============
> +
> +This table documents the ``LCOV_EXCL`` regions in the Xen source. Each excluded
> +region is tagged in the source with a ``COV-GAP-<COMPONENT>-NNN`` marker that
> +matches an entry below. A region is excluded from the coverage report only when
> +it is unreachable by design, so it can never be reported as covered.
> +
> +.. list-table::
> +   :header-rows: 1
> +   :widths: 15 25 10 12 38
> +
> +   * - coverage_gap_id
> +     - file
> +     - line numbers
> +     - SHA

What specific algorithm? Or wait, this isn't a hash of the file, but a commit
hash. This imo wants clarifying.

> +     - justification
> +   * - COV-GAP-VGICV3-001
> +     - xen/arch/arm/vgic-v3.c
> +     - L796-L800
> +     - 351d41e8aecc3f7566a0baa7b4066d06dedd7113
> +     - Both callers select the register offset with their own ``switch`` and
> +       forward only offsets the handler has an explicit ``case`` for, so no
> +       forwarded offset can fall through to ``default:``. (The SGI_base-frame
> +       ``GICR_*`` offsets one caller forwards are numerically equal to the
> +       ``GICD_*`` offsets the handler cases on.) The ``default:`` is kept as
> +       defensive programming; it becomes reachable only if a caller is
> +       modified to forward an offset the handler has no ``case`` for, at
> +       which point this exclusion must be removed.

All of this is liable to go stale. Once it has gone stale, this information
is pretty much useless aiui. And it may well be worse than that, if the
"must be removed" isn't actually followed (perhaps simply because there's
no link from the source to here). How's all of this going to be helpful
longer term?

Jan

