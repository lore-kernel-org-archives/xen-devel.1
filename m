Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC382606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 10:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cA0tY+7s
Received: from list by lists.xenproject.org with outflank-mailman.1474365.1681493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOuba-0005k1-SZ; Thu, 05 Nov 2026 10:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474365.1681493; Thu, 05 Nov 2026 10:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOuba-0005js-Nx; Thu, 05 Nov 2026 10:22:02 +0000
Received: by outflank-mailman (input) for mailman id 1474365;
 Thu, 05 Nov 2026 10:22:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOubZ-0005je-6J
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 10:22:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOubY-009Fdl-Iq
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 11:22:00 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec58bc-8faa-0a2a0a5109dd-0a2a4509894e-6
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 11:22:00 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec58c8-be1a-0a2a45090019-d155802bc903-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 11:22:00 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a20bde60a0so15058815e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:22:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b56e58fcb8sm52808725e9.1.2026.11.05.02.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 02:21:59 -0800 (PST)
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
        d=suse.com; s=google; t=1793874120; x=1794478920; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BjG7LuvX9ZE4HKw6o3iCk0fIR9SRMamvRG/fyFwKQsg=;
        b=cA0tY+7s6Zxy7PXjMBExsUJesgnN319gGkOJDAbQrNjUYccQauBHvAIE0rRdegds86
         KY98dMkbiCe1YF/An8EfnJLOv7n0oHkERmhx89+5Myhw6iOQSSaWMvb4Eje8gLNjAvtG
         maHG0QBKJoJr+7UvOec/hhYUTS0zd1QV4UZWzaYcJec0T+FdScmI35rmtsck0srEfgWI
         1A7a/oTyW6tlzYq1new8NZuQvJfd7sB3X1xKvdLG3UpdAYbVLvbWOxsaylQGMu8Butz7
         ewprlObwV9UmKduuB6NSzRMnyXGI4aBxrH9nSFMesKllEk1GZeWlC8JYFTKochmILzNz
         0NBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874120; x=1794478920;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BjG7LuvX9ZE4HKw6o3iCk0fIR9SRMamvRG/fyFwKQsg=;
        b=SNCRkt3eOhOMrYMFj/zoOCeTTq7T+IdDlfek9v80LYMn4RDr3GhzrwLMnLCI27VgkR
         9xViYKuJ/pudcEqSODiufS1hmAHYKsHjNeocjyZG+CEnhcSkhHpel+X/qRJwKX0026gO
         CKUnSKG/toc/HX/uGuAY2neaVaO6ConMCSjvChxlrdbR0/jYu+W/3rCYPymHUU+TjlH5
         l1Zu2rVwx7kYBsxj3Z4mdTktVSAu1Yf3jYwi3W1V2dyZ5ZtFd4U9NE4HMMacZI9OzXTw
         4701olwqNg8M0si3EGz3YGFg56pz0nnzGvFq2A0VkogZvmbfeIqMUofuPU+FED8zPLAL
         xY3A==
X-Forwarded-Encrypted: i=1; AKwUvByCqHZTaMhdpWT7dlgW7NfAFM8dKpUM/f0rD1UFcm3BAt1Mztzqkaj1bsQX9x1Mm2iSnzZXQOmj0A4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8D7xyL5Ac3FMstdZDHhiy+WZtLwgrJ6vGDZMIzUCktaoKN1lAn
	Zs0tjCPI8Vj1aOnhHR3zF4S1dMreyr+W9Z9wjuljIIpOwnQkZICyJI9IEBkOZ+xedw==
X-Gm-Gg: AYBFou3J6qwDL8m4rgGWweYRTYqQdS7JF8z4wzid0FCZsWzYF7i9A572uoTlzXaPCpM
	Vj8NQr7pEdudM4LT6D9F7f1IbVjfJt19F17khnhBZg2f+GAxqBi4ssol65mwFgpwbop8EHMJnXQ
	meN3VYFGy8T9d21CMFXyp7NPVAF+mX+Ngaio0bob+iljzHaZQ+QNJm8D0tYqq8oIJRqoZ16FDwo
	PYz6rxZ8/V0Yc8YwtVN73B+ZDAGg9aD7y3cox7xsQDekNlsb0inQfitqlqADZJcvH/wWsJLVUSW
	qbgDc1euGoepkPO1E6WrHaHhGTXtsWdBNxsSrmST2EiaIEV1txeNrxGikzHfS6m2EA9sgGnT+sy
	Be7YkYt571su4uqVptnD4kqQtQudYhMxOSmgFTZv1NCP5maojLeVljn0UTkqYA/8dA6rOritlbx
	PfqTTcb7YECzjzko5AVgtCGl0QdarK2CuQCVD9XgGDIuJq5/7J+mXn5SR8TCb8TnHYMSTABz0nr
	/zqqtpCA3w1HrPCXQtXug+sB/iFSh0EguGhygNwJCe35gm86H/peRJ05IDMXhbJcZaPD1fqXP/k
	nB8vg1tAlptj5re1KhfNUREblDeRjq33Sl/rCV0Rg53grB4nnvk4AsPIiSBKf1vM6WuMS1Naw3o
	OR+WIbG+mjlkwqRlf
X-Received: by 2002:a05:600c:6212:b0:4b0:a7aa:843 with SMTP id 5b1f17b1804b1-4b0a7aa0a54mr245153115e9.25.1793874119823;
        Thu, 05 Nov 2026 02:21:59 -0800 (PST)
Message-ID: <109f3308-ff73-4bb0-9ec8-b9b76cbbe93b@suse.com>
Date: Thu, 5 Nov 2026 11:21:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/28] x86: apic: use APIC_EIO_ACK instead of
 open-coded 0
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: jason.andryuk@amd.com, roger@xenproject.org, teddy.astie@vates.tech,
 dmukhin@xen.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-13-dmukhin@ford.com>
 <63f7b986-b5d4-4d64-9d16-8326cb8534da@citrix.com>
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
In-Reply-To: <63f7b986-b5d4-4d64-9d16-8326cb8534da@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1793874120-3AAD8034-0C5427F7/10/78276251493
X-purgate-type: spam
X-purgate-size: 924
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05.11.2026 11:20, Andrew Cooper wrote:
> On 05/11/2026 1:33 am, dmukhin@ford.com wrote:
>> --- a/xen/arch/x86/include/asm/apicdef.h
>> +++ b/xen/arch/x86/include/asm/apicdef.h
>> @@ -25,7 +25,7 @@
>>  #define			APIC_ARBPRI_MASK	0xFF
>>  #define		APIC_PROCPRI	0xA0
>>  #define		APIC_EOI	0xB0
>> -#define			APIC_EIO_ACK		0x0		/* Write this to the EOI register */
>> +#define			APIC_EOI_ACK		0x0		/* Docs say use 0 for future compatibility */
>>  #define		APIC_RRR	0xC0
>>  #define		APIC_LDR	0xD0
>>  #define			APIC_LDR_MASK		(0xFFu<<24)
> 
> Honestly, I'd prefer to delete this constant rather than to make use of
> it.  The typo in the name shows it's not being used at all.
> 
> AMD have a feature called Selective EOI where you can write a vector in
> and have it EOI something which isn't the currently in-service one.

Makes it even more not to use plain 0 for the present write, I'd say.

Jan

