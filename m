Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6534E606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fdeuNBPJ
Received: from list by lists.xenproject.org with outflank-mailman.1494259.1693883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTdGk-0003WF-Oy; Wed, 18 Nov 2026 10:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494259.1693883; Wed, 18 Nov 2026 10:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTdGk-0003W8-ME; Wed, 18 Nov 2026 10:52:02 +0000
Received: by outflank-mailman (input) for mailman id 1494259;
 Wed, 18 Nov 2026 10:52:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTdGj-0003Vy-EU
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 10:52:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTdGi-00ECYv-O4
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 11:52:00 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd833c-2eae-0a2a0a5409dd-0a2a4501a9f2-44
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 11:52:00 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd8350-5bcc-0a2a45010019-d1558034c9f7-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 11:52:00 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4bb6057b333so3845965e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 02:52:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb7d2c31c6sm60389185e9.12.2026.11.18.02.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 02:51:59 -0800 (PST)
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
        d=suse.com; s=google; t=1794999120; x=1795603920; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqLaErFnNBxzAlTeUUluSAn405YKcmXrRsRfKWRwSvk=;
        b=fdeuNBPJvxMUkz5CfqE4vfWUlgPyDfRXvWKuYFjquxgDgAmju37XiQcOB808evlTTf
         asjgeavz0n8Lw7v5OFQYSjZVBKVYP2gy5dJEhHs4j+HPbn3Ctb5ZsbuOgrLqmkYn2WJf
         zL85nTAT66UsdbkdmfHXo7se6ozVEqKUZVzW0MaEi0vDjnshwPhAFvBsvh7LdzkmxaA7
         zvIcOIKwr/EoI4wxDS/K6c77dFvXRT2z7G/jBOy8v7KbYmB7YFmrqKT4WMLN4g2MyGFg
         3cch4v3hfupAzpG+oD4nJwq9jTzOrYdz6cvEPgsPv49VCSRTnCb8RTYAXZe/GyL9vIzV
         ycYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999120; x=1795603920;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqLaErFnNBxzAlTeUUluSAn405YKcmXrRsRfKWRwSvk=;
        b=Hdm+HrQYh7sqIckn9DNMXMb7ien5jAvtKQncsCBTZMq+Ny8p94xmTbxtzxmfZdXpyP
         SQ8bhVYJ5pWqE/tjId7jYXWilPei16OhshfU2OsG1EpnD1xveBFmKB23VxupMaSGpY9X
         zu0cJ0+QJnQoPu0x0oVZ0BAHSZGqUwyId3V2bbPUTt5kPD5iwih7B2NfWaKY4dIw7FrN
         o3eaXfnIyar0lbZydM1ThPs2/vYAyIAPM7x0qIuqnNAdvLmnVjmACTFy+5PaJewGC46I
         ht+nvkSB7UJ/Lh8brk+UVG7DONF/tbcRRgb4PZHIXOcOkSgsJFvB+wQ8dP2Ze43m/Nhg
         DMEw==
X-Gm-Message-State: APuU4Z+AHsFJ+3VZXjnTOQtj1kQV00h36StVpEsIrhKY1R3JTewnFHJr
	rEp/wLUgipnaZRMRxNbaRvfaFwG+wcUinKy3AvAU/K+QH4d0EGMiP2RAveuyQECYkQ==
X-Gm-Gg: AYBFou1eYRLDv5RpEwRx/gHPjRuK0MU2WsD/vxqgWtUJL6ej+o32OHpSErBDw4XLGQ/
	w3oBD3P4IbTHQUUqGj6eQxFBL8gkiB9s1QS4ypiCw/61vxmmjt78qI2PTQzXcDynnK+q7hGMPhF
	c6i8Gxs5931zYrGz+RAVwqpOEKtkfAQExFrRWANbSyBI0n9ljoXM2SiMHTQdJhEW3ZUnW2ZDAAO
	m5zxfhK9Yy98Y3UysramSukg08YjylRoGSDGJSngnIEhAtk9N3/v8UAwzKgRCZ99N+kvEujnBRI
	i3GYpJn2HteX6jCWS7pnIROMpy2g8+ctm+BueFBjP+oXhMXQcwbL1ZdhA3SM+6qBzMqigFF6fTy
	EjClVqv6IpRsl7zj3PWuNS0nEGjBopS0uhqnxOF80B08kOmWy/MvJ4g2NJqOC+Ts1jrNlqDxcGj
	2t4Ad8nAOxMvtmTeK/ugYGsfnk75Mqypd+aXh9dTrSQ1MnQlRUVptgexOhUvdpFolrA47m7HyrF
	qAhmIZTD0xLJvR/duo7mZ00Mu5Qjct9YbvUvTEJMUQvVmN3fSUUY3WdQHV/Azkm7SnNiH8cREdv
	Cz3KDUgRNTZSSWXVRITh/0Oh9Sv6lGL0OX1rdi6jsFnNucKF394CjDLva44ir2ReLkrlILSWk4b
	Gr2mpgJRrgY8RFIqIO3hnFyFVHU9/YwoG7qK2Lw==
X-Received: by 2002:a05:600c:3b94:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4bb7da440e4mr43572415e9.35.1794999119962;
        Wed, 18 Nov 2026 02:51:59 -0800 (PST)
Message-ID: <86bb8d63-c6d0-487a-9f23-0612e6f663ad@suse.com>
Date: Wed, 18 Nov 2026 11:51:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/42] xen/riscv: address violation of MISRA C Rule
 20.12 in csr_write64()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
 <b70baf080cda9faa9c825e5bb7cb538b5b9264bc.1794562488.git.oleksii.kurochko@gmail.com>
 <1794995418.8631fc262581453bbf619ec5b2062170.1a1ee10747d0006d3f@vates.tech>
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
In-Reply-To: <1794995418.8631fc262581453bbf619ec5b2062170.1a1ee10747d0006d3f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1794999120-CB94F5FD-FDF2C96B/10/78276251493
X-purgate-type: spam
X-purgate-size: 682
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18.11.2026 10:50, Baptiste Le Duc wrote:
> On Fri, 13 Nov 2026 16:48:23 +0100, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
>> csr_write64() uses its csr parameter both as an operand of ## (to form the
>> name of the CSR holding the upper half on RV32) and in ordinary,
>> macro-expanded context. As the CSR_* constants are macros themselves, this
>> violates MISRA C Rule 20.12.
>>
>> Make csr_write64() take the CSR name without the CSR_ prefix and paste the
>> prefix as well, so that the parameter is used as an operand of ## only.
>>
>> [...]
> 
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>


