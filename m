Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E0A606A337
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 13:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LB1ZebPs
Received: from list by lists.xenproject.org with outflank-mailman.1490947.1691870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSx3v-0001Bs-5k; Mon, 16 Nov 2026 13:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490947.1691870; Mon, 16 Nov 2026 13:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSx3v-0001Bl-39; Mon, 16 Nov 2026 13:47:59 +0000
Received: by outflank-mailman (input) for mailman id 1490947;
 Mon, 16 Nov 2026 13:47:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSx3u-0001Be-2b
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 13:47:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSx3t-006pBd-AS
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 14:47:57 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb097b-8faa-0a2a0a5109dd-0a2a4501ccca-28
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 14:47:57 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb098d-5984-0a2a45010019-d155dd30a4a5-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 14:47:57 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-490f38e9688so2490703f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 05:47:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f5972a7sm21286263f8f.21.2026.11.16.05.47.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 05:47:56 -0800 (PST)
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
        d=suse.com; s=google; t=1794836877; x=1795441677; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ansvjHnN+9e8+ZFijN1662g+PNCvNwIUZThcvysGXfE=;
        b=LB1ZebPsY54Q6bKV7516QLhKC61Sv1T3R/IkBHBe6vyo4YCIWjJEWLAnKwGHZYBb7D
         ncE4GIxTO5KcoaHlfC4IpNYxp1h5fD848cAUHklJr1cM/7Fu9UKZCR8yOAx1HU3+99nv
         X/IHsi7y/YYB+O85hQau3G2ZZ06soCRdFGFBLSpuYHeEk35Tpftw9K7F9bXFy596UCAq
         WbIrXVlNByhOylu7Zr/CO1H/VKZqVp75Io5lyK4MwNj3odxLA8ROGpGJdTaTMNFWRLkA
         LvIvlaut0OP1CzYPs6VOidb9TkxEEW3CF+X5TbhTeSP+NsJEBqSAF1Y+LyrkEmnZ4nPV
         0usA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836877; x=1795441677;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ansvjHnN+9e8+ZFijN1662g+PNCvNwIUZThcvysGXfE=;
        b=Frig6mSGlvA7EjdRQgLy3MSUwHQF1c5eTKG6vEnX0aUYOwODcaSike1rn9vWSCqHQJ
         yAUPNPliMFoOD/1hQfQakf9srFHqXnctPZbPJGL8yhPZAOpJAkYTGaxtWJ+ZJ042ks+x
         AvADora/B9tqwV12quy0yPEBjZ51vH08B/58KjPrRCYIqO4UIzQBng6uVrmtvNXMpnUG
         9QU5Mh1ZDpI1y0geAlaZWuw3fhlqipgWaMvdzz+4HVMeq3+czK0yaUEQt4HIjz+jyd7+
         gyM0JtUiP8+LzpnxnsQu8v7U9v6avSmm/Oaoyc/Erpok31OG1goEq0XVIykET8tfXfNn
         YGxw==
X-Forwarded-Encrypted: i=1; AL+hErFsevhVTg2QMYzvAWhkNcTsP15nqwqQx2O2I12XWT+NwlGiCtMCH7YIvtYRHXOHJt7eP3Nlf2OcHRg=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+kkuwdwOT1dfExy9vWaVVDAB0kgS5D+SqrASv8k0w+xwRtYhJg
	dT6a9KvGK66fGhZHhYL0iC4mBt40mp38dcjLyKdnPUTtE3Mhi5/1LPXQ9YWX0kX6CA==
X-Gm-Gg: AZFdTZdGb8dhnqtyhTKc/gVRJjw/oSCeaR0sLvd40xBAuyAY4eh9KbAaqNK2VvSfLyl
	HsC9UVofqp+g5dDBT6LkSRi5i7GkJybUC6lw579vO17rciOuS9VspQ2GWGhtu831mfsHPnTXrk7
	2GU4uE0hWjTODLbtk4ujucifr2q5ON9ODypPkZ/6xUs3wqPQLDc4C8TQH3ay6M5bJ8shGVtSWpS
	zunE+2j43BUaqb3hMMC/xCbkOjPardl8pkW46IsZGNwqV7UCFmFEkKMLRNpm1TZmAXEMA/N3VIo
	GkQkHVptzgIFRB8CA5HtCltENIKK1/xhkxhS0u9y9uAP3z8qFEffOrG3nF3yqVDvd6M5ysEf37M
	8HgIx6gqyIHDL6ejT0vaLWpxTON2Tyt/gga7P9yvCjF0mQh6JmV/HxQgORt7WGwVBAepuw9ZqXa
	ie4Zw9SLfz+6sdNYRFofg0uUF/s+S5XNgII+xyz3GW0xV/1iSlSXNDs56cOemHM3/L3eSYcPOHk
	Wg0qdhWEsEc9x0A868qCtb10GIlO1PpY/syFSA75w2av1tPUWUKo5PInFoFLMs3ssvoAM0PK96/
	wiwwvQorsd8K+w4D2jYia+jWHRTm5cNNq3rJYjU1a0Mcc/7HV5aIQoUyXR+jMcvFOf1Fyg07MhM
	7ZcWBhI6FcycT+DTL
X-Received: by 2002:a5d:5f05:0:b0:48e:76ab:78f3 with SMTP id ffacd0b85a97d-49c7026072fmr22277381f8f.15.1794836876496;
        Mon, 16 Nov 2026 05:47:56 -0800 (PST)
Message-ID: <56d77742-cccf-4326-99f0-442a8d728c9d@suse.com>
Date: Mon, 16 Nov 2026 14:47:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] xen/console: updates to rate-limiting
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger@xenproject.org, sstabellini@kernel.org,
 dmukhin@xen.org, xen-devel@lists.xenproject.org
References: <20261112182042.1104699-1-dmukhin@ford.com>
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
In-Reply-To: <20261112182042.1104699-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1794836877-BE867757-09C33A10/10/78276251493
X-purgate-type: spam
X-purgate-size: 726
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 19:20, dmukhin@ford.com wrote:
> The series introduces compile-configuration for diagnostic
> messages rate-limiting.
> 
> Patch 1 introduces compile-time rate-limiting controls.
> 
> Patch 2 is a fixup for the rate-limiter to adjust to new compile-time
> rate-limiting parameters.
> 
> v5: https://lore.kernel.org/xen-devel/20260811233824.1874525-1-dmukhin@ford.com/
> CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/3057631284
> 
> Denis Mukhin (2):
>   xen/console: add build-time rate-limiting controls
>   xen/console: re-calibrate rate-limiter based on compile-time options

Acked-by: Jan Beulich <jbeulich@suse.com>

I'll send one remark on patch 2 separately.

Jan

