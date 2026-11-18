Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B15B606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 08:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cXlKTkyW
Received: from list by lists.xenproject.org with outflank-mailman.1494044.1693722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbLu-0007f7-Pb; Wed, 18 Nov 2026 08:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494044.1693722; Wed, 18 Nov 2026 08:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbLu-0007f0-N1; Wed, 18 Nov 2026 08:49:14 +0000
Received: by outflank-mailman (input) for mailman id 1494044;
 Wed, 18 Nov 2026 08:49:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTbLu-0007eu-91
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:49:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTbLt-001U7I-At
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 09:49:13 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd6685-e002-0a2a0a5209dd-0a2a4504be42-10
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:49:13 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd6689-b57f-0a2a45040019-d1558029b801-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:49:13 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a5177d78c7so6110175e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 00:49:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb7d2c3c93sm72764465e9.13.2026.11.18.00.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 00:49:12 -0800 (PST)
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
        d=suse.com; s=google; t=1794991753; x=1795596553; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0HXFRz6iVB7WEemsV96Ay+/DRMdyiN/AS4uagC0IaMY=;
        b=cXlKTkyWFUHamGtG6wznpH3aMwd3zRXz4yUcQgIQHzQVecZxkmCE6upp1VtyssS7DS
         qVf+1l4SsNoHIbZwtAh6SApZGbKZbhxfuQ/ysQOZpWzVelTmfqxgOWNs2rjFm6KNH6oz
         xMjHy2LIMO5wsUwlIGdNjn0SIrFJjAIerg/VK/sr4buNZwpktscOU7sS8YrAQWGni29q
         K7Ul08aPfW7xR+mQRzIbyvswkltcZaSLtDJTJslhNj+FX8plNbiqgZLI61cCqCvnLiNb
         8F4b3g6Fp80FFRJ2zqRu62jkKjAMjlcNuXV4Eb9ukYAZVE1DNzeVIoE6untJ+KDniMry
         +FyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991753; x=1795596553;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0HXFRz6iVB7WEemsV96Ay+/DRMdyiN/AS4uagC0IaMY=;
        b=zsD9V8dDZ7QSoLTPT6Jrqt6P1iNlILLDz+VlTd06vYKJUHti7qI6Z2ugn3ECCpPNRA
         1zETAkUANvuJcwrDKwEOVkLRDcD0M5EmN/j/0uzs7Zt+ZFTdW8GWfSCAgVjKKtLo1S27
         aYsLhnX6xgIHQfOcBgy8CMo62GvvkGjkONmFiocixS5HSiPupQcei7qqIHNzpNaEH0T6
         2IcfeqhpXeJDdLMtWqkqkG2NRb0If5kXCekw0Ca2URemU6JBuHmuYCShbFUl3XGvYJ9o
         HyX27ejZAbyI2tI5X8Gyope1JuSmJEqG1/XDU9P4b/HDnQ/e2c8scayrVQ5cMEYuCy4P
         WTGA==
X-Forwarded-Encrypted: i=1; AL+hErFk+sKdD2BFpCdLlh68J0uIIDXxP0eny9yOVSIHk69H+XEJ0rgDFA1kO6PqAAtoBIOSpDWaMQfFbk4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9ib2nNO+xKeeKj5Hvh9pduBg2AA7mTdHleb45XYNrIVCyblCQH
	ZwIHUMNdMdfBeRfhzZTUmnmsERiyuAeR1zkwcUhRbOJEw/EUx622NvtAVdL9pu4EGQ==
X-Gm-Gg: AYBFou2T7v8gIbkeiOij8PT/6+Mc66CjZSqrA7m0h4FZDbTH9UpqUk9yYLZ12LiOSib
	dMSaJDbPjK/PWf4fNYmHn6Goo7hmRWPDk1HmOhx28PPA4+CmiwufDndPRD4breqR07LTPRyw85a
	MqP6nwClYJsL6ogrb2HfozU1ZsROwhEJMpes4k2RoQlo8MURD5OXMlJ8CI/AIIKEtETiVSj3ttH
	xAwMPeEkO6qA2F+71k5tf4oBe9VwbeHJgb1cuPR3tbyNaVg4c0BqxJTnt770hyHtS0D4qhOOlIS
	+hdnflajd004kx41AbIu7urJGJYDrn48yAD5As1rybGVwY19EMExA1F6jTYheFDHi8BBKTLJRNK
	vET8IMxcofp/d0ray6xMBZGUuhEGl/9qkuRB8GRzyY44SXKMyEkwGr0jeU4SrzT+v7p0kxxmXIt
	3B/fgaOLk26KCkUAU8S22ffmByIH62Fv+nn5pU5kkuWp4DdZ0IhAudVau2psqEOtcKV6pMmE97J
	ksp/dtePbuoimjccP6IPneudVrq4zp8hv5Ab9fkXZCf64CC5FrPErrVKcTFWGGmNr/e00nLUgaq
	CPL7pZ6fH+va3v2pdNIifBMKjP8rg/1GzMX/q3qsMmOgfLR/eCxfl1Y/yexUt4HtrGrJ0kUtpTO
	jyCBPexnuGY1yVXDH
X-Received: by 2002:a05:600c:3509:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb7da03954mr33792285e9.9.1794991752731;
        Wed, 18 Nov 2026 00:49:12 -0800 (PST)
Message-ID: <c116db93-abe5-459b-aa89-45fc89f477c5@suse.com>
Date: Wed, 18 Nov 2026 09:49:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misra: deviate MISRA C Rule 10.1 for boolean operands
 of arithmetic
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d02a8b799661f9e58be3b39a31ec1c07eff3fcf4.1794939649.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <d02a8b799661f9e58be3b39a31ec1c07eff3fcf4.1794939649.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1794991753-510DDB50-8230CE1F/10/78276251493
X-purgate-type: spam
X-purgate-size: 1002
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17.11.2026 20:35, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 10.1 states: "Operands shall not be of an inappropriate
> essential type".
> 
> The result of relational, equality and logical negation operators has
> type int and value 0 or 1 (C99 6.5.8p6, 6.5.9p3, 6.5.3.3p5). An object
> or function result of type bool has value 0 or 1 too, and it is
> promoted to int (C99 6.3.1.2, 6.3.1.1p2). Using that value as an

Like in deviations.rst, s/that value/such a value/ ?

> operand of unary +, -, binary +, -, *, <<, >> and of +=, -=, *=,
> <<=, >>= is well-defined. Division, remainder, the relational
> operators, increment and decrement stay covered by the rule.
> 
> Update the ECLAIR configuration to tag the accepted uses as safe.
> Update deviations.rst and rules.rst accordingly.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Preferably with the adjustment (happy to carry out while committing):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

