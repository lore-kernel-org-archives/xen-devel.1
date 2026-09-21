Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA5AC982E1
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 11:07:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427328.1650035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8bre-0001PL-6u; Mon, 21 Sep 2026 11:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427328.1650035; Mon, 21 Sep 2026 11:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8bre-0001PE-4D; Mon, 21 Sep 2026 11:07:14 +0000
Received: by outflank-mailman (input) for mailman id 1427328;
 Mon, 21 Sep 2026 11:07:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8brc-0001P8-FF
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 11:07:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8brb-004Cjv-2L
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 13:07:11 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab10fc9-2eae-0a2a0a5409dd-0a2a45058a42-40
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 13:07:10 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab10fde-4cb1-0a2a45050019-4a7de14cf58e-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 13:07:10 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843cedd129so1681431f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 04:07:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48724562aebsm23719685f8f.14.2026.09.21.04.07.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 04:07:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1789988830; x=1790593630; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xw4VBxE983YnbFcLC0GprfU1PlpsmJOR3YiKLobcOzM=;
        b=cYBkooQUXnXxKj4wOV36XwR6FSYia6SRA4c9U6lIQjsEYcz5nccMnN/IT3l7odt2EF
         vs/JA343tjX/q1MK3p6TkErqr2LPCtAYAt2zOB9NW2keiUYZGPq5Zd/QZpW8s+vJkcMy
         KNpDs6gvXxpG/KcnF5ZE5IEB5UIYncxQpasvCaLQHOJ1dbSjaEqlcRgd2EqazDk55hH1
         hANp+vcVbfogE0gL9JsPpuxMtWUuQkoOLyfOeNnoSbYUzKwRQs6t0TXaOcBYXbeOfxlZ
         4RWjUOTmd33s0EizdJdrixzN/oGaPF5E1+WC1whUy/UOZK8CO4RBGQ34kDtB7ieLbyAC
         reQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988830; x=1790593630;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xw4VBxE983YnbFcLC0GprfU1PlpsmJOR3YiKLobcOzM=;
        b=JAD9SeL/FeVuJFTtiHZLzPSSryut9gOR4hUZM4iALh0yHKr8l3ClPhG4QaMCvpmJV6
         Q5xaAYN7trFHOTO65gI0wkyIFOX5Dz36JnQAuK9ZNUXGzdVYd3TQxN797tuKW95+g1v1
         /HnohIGGosWd9ZxXuwxmDo17hVIy7oywZheMKJJp0OoJT8Wtj6Cs8eLccHuobkUcBTpI
         FRjuMi9IcHlV6E7k5RPBOYOOA1EOgNnaPHQgGAFD1ImAp3d6K63xuXwUBFFfON03a+JS
         RiLfzjV1XHctbbFsdEfTobP/7c9eHKfJk2VICSrmzyIL5Z1Wvy6EWUFEqwq2ktAzbRxB
         6CKA==
X-Forwarded-Encrypted: i=1; AKwUvBwoNMX+zhypY9T6tkbjqZz5iil/Le2nrbQAAiQXQtEfgZR8G4mbSJnsyAOQuMw1Z3+xeC8XnDetgk8=@lists.xenproject.org
X-Gm-Message-State: AFuF++nV7LNzi4sUr4vjPmZ5gm/Qp8KGk6dI4VKz/9HnwWCiIvfWqrY5
	F6ZPM3zovN65awfQNXzFQtspSM+0kuG/y0vOz456aRM6si6kb1q8FZKBhafuB15qNw==
X-Gm-Gg: AYBFou0hU1nJ6/aJjO45HB6Ac6ryi8IBGxaN44+OPYuIskaLX7S0sP/UxH9dvGhCXT7
	Btog+Cf2Z3BetFL4nccAdJBFTuUs6s49zzhJgQ5jaPvjkcxhcYgcSmHbqS7a/nTTX4iazvF6nGR
	hLoxjMZW6i4SkeSzkV57UF/ngkjGtTOC74iEb1GxapFvoB/2GJw7XkWJ6DYvI/CtWGPr7FDheIQ
	XCBjM8caf8udgGn8D2oBrZZBKNhmhNT84Wkyh/H72bd6ibnRLjhXwyEV1eZgDbzZ0PAw11BTm+r
	whAQiqf3CBnGPa9WStXf0HgBG/CmMHOJsfszSDlUYW3eOH1lSXpAK8b6RCkqDkXUDVggqMBZ5OA
	r7luUxOaLAn3bS4VGXdO8o57ixI5OjZVqzLxXQsK/YVt3t0v/TYN8NrQwt1hmjVdwfxOU7qWqjp
	EpGZRH0FHvFPTUDBXxDGH8eOacQci4qYuJvhwlFvfNQJHHBpyhR4GQSMcnwKiCch7huXv7+gJMP
	NVpgH2X4kWDe4IfKAQde2x+RcgJ/JWOpkQamlwRFQn87v14LN1NbhjCY6N7FMw=
X-Received: by 2002:a05:6000:2c0a:b0:487:27f6:a4cf with SMTP id ffacd0b85a97d-48727f6a6d5mr10055095f8f.31.1789988830406;
        Mon, 21 Sep 2026 04:07:10 -0700 (PDT)
Message-ID: <f385481b-1137-4918-b2a4-6a086887a367@suse.com>
Date: Mon, 21 Sep 2026 13:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] vmx: Handle TDX instruction exit reasons
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1789049962.8631fc262581453bbf619ec5b2062170.1a08bb0014d000c4f3@vates.tech>
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
In-Reply-To: <1789049962.8631fc262581453bbf619ec5b2062170.1a08bb0014d000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1789988830-F7CB82A1-C1D262CB/0/0
X-purgate-type: clean
X-purgate-size: 568

On 10.09.2026 16:17, Teddy Astie wrote:
> On hardware that supports TDX, guests can cause VMEXIT related to
> TDX instructions (SEAMCALL and TDCALL) regardless of VMCS configuration.

Can they? SEAMCALL pseudocode has

ELSIF IA32_SEAMRR_MASK.VALID = 0 or events blocked by MOV SS
THEN #GP(0);
ELSIF SEAM is globally disabled
THEN VMFailInvalid;

For TDCALL I see

IF not in SEAM non-root operation and not in VMX non-root operation
THEN #UD;

which may indeed not be sufficient, but the SEAMCALL conditions shouldn't
be met under present Xen?

Jan

