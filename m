Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38C2C61DBE
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 14:29:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399276.1635431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wys9Z-0003OZ-BS; Tue, 25 Aug 2026 14:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399276.1635431; Tue, 25 Aug 2026 14:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wys9Z-0003OQ-8M; Tue, 25 Aug 2026 14:29:29 +0000
Received: by outflank-mailman (input) for mailman id 1399276;
 Tue, 25 Aug 2026 14:29:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wys9Y-0003OI-IB
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 14:29:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wys9X-002uBq-VD
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 16:29:27 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8da6bc-8faa-0a2a0a5109dd-0a2a4501d396-22
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 16:29:27 +0200
Received: from [209.85.208.54] (helo=mail-ed1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8da6c7-5984-0a2a45010019-d155d036f132-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 16:29:27 +0200
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-6a3fda88184so7391946a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 07:29:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24968d5f59sm1785070966b.63.2026.08.25.07.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 07:29:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1787668167; x=1788272967; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LwGdXU8fMsj4QrOOPPW6ftweTPADKeSV8stRdnz5RIQ=;
        b=L1oCRw9/ROYhxJrMXqNnTjOGfLM2hZd0g30uhjXLvchkTPMS8vARz34ylFYRwVq9Vr
         /HE8jwGP1q8q47VH6Cglx2/xJstVPSOpic/MS36JpXfQbGMGLVAsgGZWhkaimRQNV/7r
         f5hnrB6cx96Yy1+9nwEUkh5R+yGG2j+XpjBcUutBHsxU8NgmOYRmtXLWCBtKrr/xC9fb
         27BAPB/+7pzmuU5szy/79DPn4go7K+kbdi3zKSbEyprGDbkJZSHe+0sq5dIkOzfinKJp
         1Gwc69qoTtuhgQOK13U0z+vi9ZZRqBNqDpfiUIDG8bnC4ljoQdX4csJTy21QP+USxqD3
         /PCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787668167; x=1788272967;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LwGdXU8fMsj4QrOOPPW6ftweTPADKeSV8stRdnz5RIQ=;
        b=GkgjQCOo9jTbRKC9ZkVrn3uIkKcrzZO+GRPk/ySA2qN9SD5foOcdZV0gwxLFpSiNjs
         kWPa/B2LCD6e5mSCxtw0xsh5yWmV071K+mU2F/Q6se8PwQyaee52hpsQF6yLr1Xv7JW+
         XpcWgwvJ7wbRp+Ndt1zctLKuhqnJw1F2z+WaJ7rlzdwQ5lqpu8J0eJ1IxKz/qVlo/p6+
         1j0UgH131AhZCVFFnRjngKfv02OrxMtQhNzEc62vg6NzytqjugOfThBWrJQSP54WPqHl
         IU9YyjQZtCP8el1Cchas1z+Pai8Ri71e0mRLhbrGvxxQFTp6fu/IGANbloBeqT0SA6z1
         ItMw==
X-Gm-Message-State: AFuF++kOAqAiA1ULW9icHka3oYiKEpXDUyqP0dgXwn+pafJbfuZg4GVG
	XRW0GJtghNjCLFcwLz19k261RJRIILxKjLA1wr5zMyCymVD2/a36SIVvLdZwJ5FnerDQNSEsJ48
	ZPyI7GA==
X-Gm-Gg: AR+sD13bEiSObXxwyVrVX6fyk+ukyEFY6A+R9gMm2Y1bauXsumC9MX7JRo93KdLEw7/
	PFX0M3NApL/aINHWw3FE6v7Ywl1T0DoFJIrEciKK3TDV710iMUmcbH8f3OesJLq+uVCQaVmjSBf
	lqSSR3J+lJS7vj60D1nh/3Jl72Itb9dX4j/akIsERscu4UovhIAmdDER5X+petd1YJsFxWGhjgI
	Os4mJIhzFRLlpSsEizwWX6SgOoiLqqZO6vElbDvlKfZAWkFUpTA/C0OKo56rLGVN3P/Lh0cHd9E
	VNYBYVR3AC3Oc8639dWTz1Zwx642URhFv8m4Ds4ZJlDv74huSMcE8ob40Myq7DTsesFdIeo8/Fl
	GQrIdxbEoBxlGvgLggW2lfaLX5JFRAZ/RjYjN/O17E1gU9G56KIBm/r5JhbQ8h7eKyuFlWd6IZd
	zag5tFoU+wAlCfwHQoOYycSacceJAuNCn3I22eGd5cj7m09eCbZ9pJkiWf+q3AgjUHU5MlzIoYn
	m9wWrS0q7SiHUMSCMn0zHYdKaoGOsFHmNhshhrvopPznmVOVClp
X-Received: by 2002:a05:6938:a089:20b0:c25:379:f37b with SMTP id a640c23a62f3a-c250379fa26mr237718966b.13.1787668167330;
        Tue, 25 Aug 2026 07:29:27 -0700 (PDT)
Message-ID: <fd7dc2f7-6505-42e2-8eaf-fb8e9af21bd4@suse.com>
Date: Tue, 25 Aug 2026 16:29:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/2] symbols: also special-case symbols aliasing _sinittext
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <bd5ed50e-e537-4033-b5b9-98167886690a@suse.com>
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
In-Reply-To: <bd5ed50e-e537-4033-b5b9-98167886690a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1787668167-BE27A757-4EC6F454/0/0
X-purgate-type: clean
X-purgate-size: 1190

A recent 4.22 randconfig build job hit a situation where (LIVEPATCH=n,
i.e. --all-symbols not specified) both __note_gnu_build_id_end and
_erodata aliased _sinittext on the 1st linking pass, but they didn't on
the 2nd one. As a result two fewer symbols were emitted on the 2nd pass,
causing $(call compare-symbol-tables, ...) to fail.

Extend the existing "corner case" by also considering aliases with
_sinittext (_stext really shouldn't have anything ahead of it), but
discard only non-text symbols.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base over _{s,e}extratext removal. Add const to cast.

--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -217,6 +217,11 @@ static int symbol_valid(struct sym_entry
 		if ((s->addr == _etext && strcmp((char*)s->sym + offset, "_etext")) ||
 		    (s->addr == _einittext && strcmp((char*)s->sym + offset, "_einittext")))
 			return 0;
+		/* Same for non-text aliases of _sinittext or _sextratext. */
+		if (toupper(*s->sym) != 'T'
+		    && s->addr == _sinittext
+		    && strcmp((const char *)s->sym + offset, "_sinittext"))
+			return 0;
 	}
 
 	/* Exclude symbols which vary between passes. */


