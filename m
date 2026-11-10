Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A9860710C5
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=O/KK+xtG
Received: from list by lists.xenproject.org with outflank-mailman.1481474.1685356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQiyB-0007Qm-Lk; Tue, 10 Nov 2026 10:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481474.1685356; Tue, 10 Nov 2026 10:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQiyB-0007Qf-JD; Tue, 10 Nov 2026 10:20:51 +0000
Received: by outflank-mailman (input) for mailman id 1481474;
 Tue, 10 Nov 2026 10:20:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQiyA-0007QZ-DY
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:20:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQiy9-005c6R-N0
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 11:20:49 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2effe-e002-0a2a0a5209dd-0a2a4502d0a6-16
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 11:20:49 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2f001-6ca4-0a2a45020019-d155dd29ecad-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 11:20:49 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-498f5fa4f70so192240f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 02:20:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498362eb158sm4184391f8f.36.2026.11.10.02.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 02:20:48 -0800 (PST)
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
        d=suse.com; s=google; t=1794306049; x=1794910849; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4IARZkpVYLkyFh4VU5qTYN8gJUqWWMYrKK9AnH4iz0=;
        b=O/KK+xtGOE5gyGouBGlZ7N2hQmfYb4KNM+Cye0tcxN/MpZ5BkJS8eJoL3ZxRhtSb25
         488xXtSJGljvUGeD0sW1q/wuRyZWwEQ+WCDgyHOHSL/OjFprDeokR44PizAAIPA+zSeM
         yTOEsXRnxtDI2AoSZNW/gb1HV2XaIk0usLMuPGN/c+VDhucZ9a6qzfo9I853qVtZ0F1C
         AunjWL6FN/YpiKN9XNUDQMo9yw9ghNxY1biCUuTwgbUevsZfiPSArdvscI5bmcSUMQQQ
         6hUbts945OZBmsaiPghaflqNXAuLq61cUCXfnAVmfxY+mCumPJsvyDbyRgRx4LGAQ2cA
         YDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794306049; x=1794910849;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4IARZkpVYLkyFh4VU5qTYN8gJUqWWMYrKK9AnH4iz0=;
        b=Z/ULB0bYJu01nevUvaDNXAKlsuNvF0TAOdlLuPejtIgvzw9A3lV2t/+EO1qkoiHUpS
         pT7IrBcKAr2pRrzBWpiBe40a3GD66+rBBpjmD8YEg11HaaEmWHxvbTfyvMbIwWKiRkh3
         JBPJ8bQ9K2uIwApYBySrvWtPU1KsEv1Ays9GrpLOXJaOYAucuZWsqG9QJiJEBjxXUWRj
         IjJONToiOLp3QXdOV6wGepG66c8uFA3lJ/FSRNx965aRIuV3wTm+FWYpVoqc+9nFLP3N
         USVxirEyjx5Eq8UtrXzsrrZ1hXZ6N+RxyN1JOY91bsq+BUn0K100gjnC7peVkMWSMtU+
         +ooA==
X-Forwarded-Encrypted: i=1; AL+hErEmpeL3LbwKbeI+5zu+cYnHTzZ26ILPud9A/17e1H11uMWjMuPrbHt9OtJL9VA8MCKYlSTwXAYlc+c=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+wUyw9hPZZ3zAZ8JCcO6wHhu5tq5z9MNHc3dCZcDU+uY9sLS98
	O01y5Yw0C8je7KrrWiTZReRWGu5BXi9fWkSABz+Hp86LLPFYEw1BqAJsXrN1CIYLsQ==
X-Gm-Gg: AYBFou38IVtOq1NqM62JKZAmThC4MDSmbqCkP8J+1TY1tJecFdQ456xEHE2xi91nX+R
	pBeLVD0EFHoa7+ix4nlL+REEo3eW4NVktiR/YiRT/eqAHhPYbpOcISe73d20WW+IvRkhI34hFGV
	7ODdb4rVM3shHZBVBjdfHNr1wvklBbUPM8C2U+J7hXVr8QfjdoAvqra3pM/8q7Demtorc5W3xvd
	PEVX0fkhB7DLoAhKvxxm9RmojIw7tx1rAUcZF1GccNsGRDNZ15TiBsGjrZeHLesNQXjzK7tBKEO
	OGGcLwktPyPeljwBIpBkUeWrMqhktQ2Xw/3mpI6Fy8fV+ckJLfK4s0vknVCbdh9UWUfGstFZV6y
	f1nUOBm3MZmyU8WGuRpD7EGLHqYxKQT8n3Q39SvYjoMT8qMFEyd6RufISUb1GVCCu82DmUEaZw0
	nhQiX8uhHCFlaeNKN61FIilhnG+u1/DkNNibeXDJgneTnTkLw9ovlg660heeVTfkUgVTWWmA1Ql
	yc9Xy1vuff3eeUTEoB8vVI0BBq8CJNEtIpOm0N61Bst0o2Hjkpq2zjcjIzXdgdaSpUuM+HNGN0J
	mcdC4Ds5RWfaPGQm03WnJSsKjyU6DKzJWs01hgYx/u8pZ9FzSV6aggAu3lx4/DyRLXSC/PaDNTW
	HuX4PfE3+9TAdi1E6PDifULwuomSd6mDpEhWSmA==
X-Received: by 2002:a05:6000:2212:b0:48e:8882:6d91 with SMTP id ffacd0b85a97d-4982ba32847mr4400061f8f.1.1794306048833;
        Tue, 10 Nov 2026 02:20:48 -0800 (PST)
Message-ID: <924d8b0d-5dde-4616-bdca-3115e3adc3bd@suse.com>
Date: Tue, 10 Nov 2026 11:20:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Xen/gnttab: improve error handling in
 gnttab_dma_{alloc,free}_pages()
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20261110095605.369848-1-jgross@suse.com>
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
In-Reply-To: <20261110095605.369848-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1794306049-F3EBB2AC-985BB957/10/78276251493
X-purgate-type: spam
X-purgate-size: 697
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 10:56, Juergen Gross wrote:
> This small series is V2 of a patch Jan sent out early this year.
> I just added patch 1 due to some remarks Jan made when sending out
> his patch, and then removed some now stale parts of his patch.
> 
> Jan Beulich (1):
>   Xen/gnttab: improve error handling in gnttab_dma_{alloc,free}_pages()
> 
> Juergen Gross (1):
>   xen: don't allow gnttab_dma_[alloc|free]_pages() in PV guest
> 
>  drivers/xen/grant-table.c | 36 ++++++++++++++++++++++++++++++------
>  1 file changed, 30 insertions(+), 6 deletions(-)

Reviewed-by: Jan Beulich <jbeulich@suse.com>

(Whether that's meaningful in the Linux world on patch 1 I don't know.)

Jan

