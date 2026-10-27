Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E809C606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 13:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Jr/vB8wB
Received: from list by lists.xenproject.org with outflank-mailman.1462145.1673194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLh0V-0000fy-OQ; Tue, 27 Oct 2026 13:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462145.1673194; Tue, 27 Oct 2026 13:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLh0V-0000fq-L7; Tue, 27 Oct 2026 13:14:27 +0000
Received: by outflank-mailman (input) for mailman id 1462145;
 Tue, 27 Oct 2026 13:14:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLh0U-0000fk-KR
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 13:14:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLh0T-00HNN6-MY
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 14:14:25 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae0a3b1-bab6-0a2a0a5309dd-0a2a45049b84-0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 14:14:25 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae0a3b1-b57f-0a2a45040019-d1558031b4ee-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 14:14:25 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a4dc547987so11679715e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 06:14:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a59d238sm255249985e9.14.2026.10.27.06.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 06:14:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1793106865; x=1793711665; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rC8YWz43OylJBksbuwH2nBU++iirUvgS87OVq8asVeo=;
        b=Jr/vB8wB3uMLKuP7wJ82SLL69RrJpZYKDmos1FiW0L6CWAFUHZ1FoYkGsywNWSs+VI
         XWceDWCHbYPhZIcwsWY6r0QQTB6Qk4whcGbkLTLhrVflw4j7YMDujAQr7JWiLGUGBVY9
         PqfG8SgV9kGRy39gjAyrsITUjLGle2H3CyRGN2qOl60+VZ9dKYmwfh14Sna3NI5sI7H+
         8CxRl7l27u2h0NxFW/4b40cYMXM1yzauVJSkJB7U5KP7ZggCgYLW6rQR7UZlGeqpPrZy
         5ukKGCsHrTJJFUU/Bu+pQcxH+rp/iCt1qgm7uSqu9VZbDxhrjBDnVnOq7m/5yWJMb0zy
         5DHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106865; x=1793711665;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rC8YWz43OylJBksbuwH2nBU++iirUvgS87OVq8asVeo=;
        b=BK2AOzU1ofzgk7cVwB9Nf9m58Uk3o5cdrW8zxN8bTbpumRTQlFnXvPJtZqkTsszLgi
         YU8+uVw1jrBUIbP66XMPGNT/o3DfA89L9gVWM861ux7QAjQef2Z47T+DCEOfiXLLJ1xQ
         8PRZr643rz59TmplcQgrxnDyXto6TU6XWo7iKs81likO4NrnVU8S5l+ZEdpQp+OkmxzQ
         +rgHnhcV9dyUTDYnI23HLiMKbOYoV2zSqEKCVArw8GdcmJAMd8zIij+TXnFgHY3HlCzx
         3yqhy3TWMhZj+YEuJwtZAnIxrr/1QZS36IdR/CabEdCj+S4R6B7cg9ro6yWshcOyf4dM
         JbSg==
X-Forwarded-Encrypted: i=1; AKwUvBx9UW2dylAv8q4fCu6qMrDqsuBjb07WQKjJGtqZebLL8OjdsFLo2IUYrIPKw4FTDNfsSIdBS8r0pzE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJVnAoDaVc7kXPe3jvkYNrqixnxaEHdFTyGPHOhiNNJCD02Ccvr
	RUffdb3IWKpRTU5sX9eONybr3jFckEDUf2+YBPmu/qcGkSnM0EZDMt/4frUDoW1jng==
X-Gm-Gg: AYBFou2gRRYF2qDTFakY8Ng9Mtgl/gcA4v7Wlw/0NvQRd2292EmEbiOZrWDkyLrJ3TU
	4jJl97nsxYzTKjp/T+WH01ZZCWVsuRcXrMABXikdugYWAuY++b7Q0R9amY8SExXFWNmUV37n9Ix
	TWckLMOcrTAvRdzZzcxz/OAQHFiqEFPQBXO/kPxoElZQCxg6KuJFeo1IgSZNat1fMRi6Ya3jnev
	j7EDwt0uLt8HRLcuzhSr+GskC4aItKolx7JCvTiZ52SZKAZIK98IxJEvWUf1z5JwYni1raY3c7P
	yQTnooU3KxWrzyRfsLzYf+xV3AXf2A/Qp08IYZD2woyXu9qh7O348GPYCXzen72EpbGCcrmKrsQ
	y2clUxjdg4KliOqYeV8mxVVoZB/nH8oN2z+WBBpBtifSDenQuVk7juV11E14KmXrpPxlrPgLkw4
	TRU6OUgIIQQzWhBoxbicVJOujk4AFo8RLScC5qis8mdeWgxdpEwqxgD2Gh63/Tzd6w/D5xcz6FI
	oNdyi5Qxmev6ygwvu7+IuIICKE7SkYLEw68NJak/8d86VP/muZWr0dgihHSytPMgS2TfJ7wKiLf
	5SnwCqyeB4C9zvi2/MNWOh91iA+qATuztTtCDOT0UPv1
X-Received: by 2002:a05:600c:8b6d:b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4a7669cc9d8mr73308985e9.23.1793106864613;
        Tue, 27 Oct 2026 06:14:24 -0700 (PDT)
Message-ID: <1d1d678b-dbcf-4d4d-be3f-aab973fbe0c6@suse.com>
Date: Tue, 27 Oct 2026 14:14:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mce: don't call an unregistered address check
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 xen-devel@lists.xenproject.org
References: <20261027004842.18508-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20261027004842.18508-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1793106865-516D2B50-574D34CD/10/78276251493
X-purgate-type: spam
X-purgate-size: 755
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27.10.2026 01:48, Stefano Stabellini wrote:
> Family 0Fh registers no check_addr callback, yet mca_init_bank() and
> mc_memerr_dhandler() call it unconditionally.  With altcall the NULL
> pointer is patched to ud2, so on such a CPU the first bank reporting a
> valid address traps inside the machine check path.
> 
> Treat a missing callback as the address not being physical.  The
> recoverable_scan callback, also not registered on family 0Fh, is
> already guarded through "recover".

With this mentioned, perhaps also mention .info_collect?

> Fixes: 9595ef77ab11 ("Implement page offline recovery action for AMD")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

