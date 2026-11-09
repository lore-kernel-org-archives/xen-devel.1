Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31BF606A323
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 13:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PawTRnjX
Received: from list by lists.xenproject.org with outflank-mailman.1480069.1684007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQPDK-0004JY-Md; Mon, 09 Nov 2026 13:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480069.1684007; Mon, 09 Nov 2026 13:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQPDK-0004JR-JN; Mon, 09 Nov 2026 13:15:10 +0000
Received: by outflank-mailman (input) for mailman id 1480069;
 Mon, 09 Nov 2026 13:15:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQPDJ-0004J5-Tl
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:15:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQPDJ-00BLMg-AR
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:15:09 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c74b-e002-0a2a0a5209dd-0a2a4508abb6-34
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:15:09 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c75d-f659-0a2a45080019-d155802da4b9-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:15:09 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a549cd7fd2so8211445e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 05:15:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b90ee2b8c0sm153000975e9.9.2026.11.09.05.15.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 05:15:08 -0800 (PST)
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
        d=suse.com; s=google; t=1794230109; x=1794834909; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIkCufykn8diluHb5HdIQsqXWbdM1k5wsakH+PzPdHs=;
        b=PawTRnjXk/Db/VevlGHhhrmMEizGREK3GDP8HqCd2CqEWCOQDe/nMDhPXz/7ZykQLw
         SHBDpt6guq0hz+nxVHF381YeLu81VAWflY/FvUjgQ4/2ztT0KyGv3aeyoxe9O4GkqLvv
         j9XvSOdkI4Tjp+3ezksYAFfrgD9c0nnqk5IeSwJJd4LwzY+kFM5/+rpYpqWU4nbATRa9
         cVou9qcJNjm0/XoH/5IgsNybcuA8w9fpMG2lFtzXimk+Yv1mNox/a7PNszt6kEmyVmmi
         w17LkVJf1U9XMT/xI0xR7sobRs88+glswfHCPrdK45Ostv3x2ua7++W+jtxVV3SlbnMO
         iBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230109; x=1794834909;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIkCufykn8diluHb5HdIQsqXWbdM1k5wsakH+PzPdHs=;
        b=bzuxansGSvlATU2dp6TvGgGA6jL8MYJwOIF9cOHlUZeDQ0IOoNvvsPkN/5J/FHIyq7
         0Qlb9QX7IKlmhqWdUA/3+pEJY/p5mDlnbDOT0XNWfBvFdKoCCCYBrZLq0OMrMEc5iMS6
         TJCSasj/H4HuoKUhb30xyyhuDCCkkD78hd4VtMkxnz5mzwTD610dOe0ZEoJQ+kzc5Kaw
         ZrNz3RuR+eF1iTGVpOdMwOdmEj9CNIcEv2230cgYyBv2HN/FeetYfdCHHyNymAgi+Wu4
         ddWegR5ZSK6XEyYjZBz0HZpkg17xP8WfZm3rfScVDbxc6y9Xa9GhWKrmwhiy6UxdoQR0
         uTpw==
X-Forwarded-Encrypted: i=1; AL+hErFQfoffWa3IbU/wQ2LIXisywo8/BHgBODtgnuilIHUaH5EM75j6MXBEtTC2kXJVfJdexBqSHQUTGLQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z937XP6c+uGAxtWTdKrjsDAefod+7DGgdII55W1MrPiZnNlaWCb
	1ai+6tymz/L3FQZ3jKWpJ+zR8COLpQt2l6iKN1LVtEinPfWBR3vP2fDBGmdC+/Khdg==
X-Gm-Gg: AYBFou281NAzcfv6Lgt1jiocsO6onj6N29AqT4NcorTS87dAu6KJYgESP0/L6xKrwll
	FCH/BkUDyIp0LDOHFMKl96pc4BZytvvDfBkHMbYrgbp85tJPIWvQZPg1PXjdZ5iS4M+/oadDS8X
	f9Kh4g8IFLYlSqIg95Re0Cd8f73Yr4nYQkM0+BG4qSLhM3nQhBxOIYCdSwSIOML0a/pIYnufXuc
	Tjper/snm/k0BdO6Yp4qP8XNmSQrcv3SZj8j+TCmjDz/tEk/zhZbSedGjIP49lmicMdcCcUusmw
	QiCr3p7IWIurB49p6NE/v6Akno7XXt69eh7EMFeZKf3OWCeY6NkhPTqh68fCvqFsBkiJaRsa2P9
	Yj6ladugXOVvdpBNMW9oBnftdBPaFhSe+pOEUbonq9cK62cE0Efeptd8QmHOUsbLYl8Eaz5O+vw
	yjqXQkP1xLbV+Ge8khiTsgBOApmH7oxoE4p6Xd/yv4L4DonakWsZlIL+G4CNPOUh8uMbxElO8aL
	Llq34pmDVGCDhsSpU5hwDEFZqkOhl3PV94cZAqFIt0X0IxPHWluhWv5E8OD9543rKT+sH1aeB0W
	Cl566YTaVxRTTaHAbx8pEN3SaLUzs9PYpqB54kLcXV1Cn3XfFyWGqmOiaeCSAIjig33rrQBJPyi
	TxCHnismL75Q7RewJ
X-Received: by 2002:a05:600c:8705:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4b94d75ecbbmr78222165e9.2.1794230108535;
        Mon, 09 Nov 2026 05:15:08 -0800 (PST)
Message-ID: <a348cc62-8952-48cd-9185-991849360a02@suse.com>
Date: Mon, 9 Nov 2026 14:15:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: Rework VMCB comments
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Denis Mukhin <dmukhin@ford.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261109113745.2840610-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261109113745.2840610-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1794230109-CC77387B-D2C74F8D/10/78276251493
X-purgate-type: spam
X-purgate-size: 379
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09.11.2026 12:37, Andrew Cooper wrote:
> Identify the cleanbits by name as well as number.  For single reserved fields,
> use an anonymous bitfield to reduce the number of res names.  Use 3-diget
> offsets consistently for offsets.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


