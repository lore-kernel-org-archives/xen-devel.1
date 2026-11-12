Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C5A606A323
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gdSUGGRZ
Received: from list by lists.xenproject.org with outflank-mailman.1486131.1689027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRXCh-0000Ke-BZ; Thu, 12 Nov 2026 15:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486131.1689027; Thu, 12 Nov 2026 15:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRXCh-0000KX-7o; Thu, 12 Nov 2026 15:59:11 +0000
Received: by outflank-mailman (input) for mailman id 1486131;
 Thu, 12 Nov 2026 15:59:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRXCg-0000KR-Ba
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 15:59:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRXCf-003kTk-Gj
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 16:59:09 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5e24d-8faa-0a2a0a5109dd-0a2a4502defa-0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 16:59:09 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5e24c-6ca4-0a2a45020019-d1558036bd07-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 16:59:08 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so41988145e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 07:59:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e2593e4sm88229395e9.5.2026.11.12.07.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 07:59:07 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794499148; x=1795103948; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yW5x7Rg+m1gd5QM5heh1fTNl6frrEXCPJkGXO6KXV2U=;
        b=gdSUGGRZCvSk0gUYmiMDR3fedqfmkougRjrD7dVBCuMnddKtc6HQZyTX65LQ7lw7C4
         c3nDDrWGgwKHjN05Qvp+2ncUQ8h2sUvtu8Rbt8MYFuQa6wZZyvarKKD5rXcCRyPnCBq9
         +rMksd/I27wVSFhwcAnP29VxlXRl2lYPeqwU75yjgjnUAdzstHRP9dybB9Myi4j1PZsE
         RZsm5xlf6bxNpT5ReVJLUwZH+g7xDHAz8KgIbPbK6L4WVJ+xsyxj9s/KY6Uw+Yr3hiow
         ulE7KzosfDPGwDQntok/BmDqBVBIKdOw3K53h3jS3EQEw7OeLhru/E3m0rMzbIg78Ufd
         uGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499148; x=1795103948;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yW5x7Rg+m1gd5QM5heh1fTNl6frrEXCPJkGXO6KXV2U=;
        b=y2peaJReH4VsYgugHEyDhdk2+A5640uWB68JFdZ1Bz2YNTlV+VeHk02wAPudAE9N+L
         pBYIkqdFCcuw62AsRigP1pgdF9TOEcnDqGhtrAAAPK/1On2NacSuyvqeKtxGxSHhHJwD
         szM2n45gmh8Fj3sd39tuzL/4+CK4AA8H1iShia8D/BIRVX06iLhr6QwgtVftRe1JDIBO
         AYnRVIlR7jeeIIKpnIfmlexOXS6TIbQIIWbPR9Sotusip6aI0CC1M6+41MrtQUXg/Mue
         Eipq5edmxFz6s0F9YqPQO+6FH5/8wav92XFpxWRtaifqCyGQt7MA21YKcSXkWZdCJqgT
         XoIQ==
X-Forwarded-Encrypted: i=1; AL+hErFxNjIZUWs3M2GDmW+OCWAnyP4dr0ViytUYtCiEf6BPE8pnI8Q8MdM3wcWcq33jJUAUjaAvagkqogs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+nwdi1vOhs5/4v8fTmMW78BKncWgdfqgHx9Yxl8PgPzXwG2Tl0
	FsxjrGp3YzrTK3cI2+ovHaCXIDCzdyBruyyYxzGBzrdzuQsIAcLvatwTuU/hvIWXhw==
X-Gm-Gg: AYBFou2VAZvOY4WHMELvvpAEr8UWey8yJ87pyTeKIucYTtfeAxUhE6zO3c7mA7gFL0U
	28cm2+bh3hrLoA4OKWWQ7/fA4xSb28omP6AIj3rihhxeVou2WQ84ubJ0gN24qUow0FBKC2zpiBJ
	fKOp/oiBV6ahcotEB96QMJHqHLL9ktP/sA3taNELaorV6YTgGpIB4+ey3FOB12EiooNFr6VDoo0
	m6S0K/yGIQ9Bs1aZG+cZ5KEjdCrzJpNqYajn965D5xUTo3fR+TX0d77OHDceiuIOuM/XAPBqOYs
	WYB0vnVbS186VyK+oalI9nCZ6ikuRRDJn5yT4HSg0R7dxuOCbSNWj4+lgd6THvEGwlzp7xtyAno
	1mw+cJumVgp92hmiK39mUeFa5KizNySRwV4dmR2q1S0ktj7i+odqiyiTthkaD7L4XXBKanDaa/X
	J39KaPhoAO2YM7sCN4Y4zOSrpHW9uZPZAPrRmyWWecsPahIpj6IDP8iMK/NVDa0ogGCJLTgNdf7
	luPS0pX9IRrUGlecOpY7dJBpjNQC5aL+CrpcPCZwlvHf1F7tk46LMg7g3AOXJapI43E72uONf1a
	nIrzJiyMp1Z+PnfkT6cLsgqhiWMsmIRK/9KcN+sM+/4JRlOk2/6dCA1kRy9BqpcRTUKuBXEimx/
	du5FOfjPG7hsxDh69
X-Received: by 2002:a05:600c:8b31:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4ba0937bd0amr102937735e9.27.1794499147745;
        Thu, 12 Nov 2026 07:59:07 -0800 (PST)
Message-ID: <d66faefe-3278-48eb-a8c9-fe58c9fade35@suse.com>
Date: Thu, 12 Nov 2026 16:59:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: Promote FLASK XSM Module to Supported in SUPPORT.md
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <51ed28b0-1c41-4e6b-95a9-786e59d4cd9f@apertussolutions.com>
 <cf3e44aa-f48a-443b-991d-665caded21da@suse.com>
 <13cd6f79-8831-48c4-9096-82ab105b3adf@apertussolutions.com>
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
In-Reply-To: <13cd6f79-8831-48c4-9096-82ab105b3adf@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1794499148-31DC92AC-E49CCCDB/10/78276251493
X-purgate-type: spam
X-purgate-size: 2819
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 16:37, Daniel P. Smith wrote:
> On the idea of a full code audit: I’m not aware of other in-tree
> subsystems that have been held at Experimental status pending a complete
> audit after bugs were found and fixed in part of the code. Normally
> those issues are either fixed or, when appropriate, handled via the
> security process. Style differences themselves don’t create functional
> defects; they mainly affect readability and review consistency. If the
> historical concern was driven largely by style, that feels like a
> relatively weak reason to keep the module Experimental.
> 
> On the specific issues from that earlier period: the memory-leak fixes
> that went in around XSA-84 (and the related work for XSA-85) were
> public. If there had been additional material problems at the time that
> the security team felt required a broader audit, I would have expected
> them to be mentioned alongside those advisories. In the absence of that,
> it is hard for me to treat the need for an audit as still open.
> 
>  From a practical standpoint, I am not claiming the code is bug-free. I
> can say that we have run FLASK in production at scale, on devices that
> stay up continuously for long periods, without seeing the kind of
> stability or resource issues that significant leaks or similar defects
> would typically produce. That experience makes me question whether a
> full audit is still a necessary gate for moving the module to Supported,
> especially given that the proposed text keeps the XSA-77 limitations
> explicit.
> 
> On style more generally: my recollection was that code brought in from
> Linux (as the FLASK security server largely was) would not be required
> to match the Xen coding style, so that later updates from Linux would
> remain easier to integrate. MISRA compliance is an understandable
> exception; pure stylistic divergence is less so. There is still a fair
> amount of code elsewhere in the hypervisor that does not fully follow
> the current style guidelines and is nonetheless Supported. I would
> prefer we not treat style as a blocking issue for an already-in-tree
> component.

I don't uniformly agree with all you said, but rather than responding
right away I'm going to suggest this as a topic for discussion among
the committers first. I hope that's okay with you.

> That said, I saw your recent patch that removes some of the remaining
> Linux-origin style artifacts. If the changes look reasonable and do not
> make a future import of newer Linux FLASK code more difficult, I am
> happy to provide an Ack on it.

Please do. It's not so much a style change anyway. May I also remind you
that the tail 6 (or so) patches of "XSM: follow-on to XSAs 492 and 499"
are still awaiting an ack of yours?

Jan

