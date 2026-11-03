Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9B0606A333
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WzRbygeP
Received: from list by lists.xenproject.org with outflank-mailman.1470276.1679011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHsY-000816-En; Tue, 03 Nov 2026 17:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470276.1679011; Tue, 03 Nov 2026 17:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHsY-00080z-C8; Tue, 03 Nov 2026 17:00:58 +0000
Received: by outflank-mailman (input) for mailman id 1470276;
 Tue, 03 Nov 2026 17:00:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOHsX-00080n-7h
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:00:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOHsW-007Z5c-KR
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:00:56 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aea1343-8faa-0a2a0a5109dd-0a2a4501b428-10
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:00:56 +0100
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aea1348-5984-0a2a45010019-d155dd2fdd4d-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:00:56 +0100
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-48e20edd106so3389238f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 09:00:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71ba4ac6sm27964798f8f.52.2026.11.03.09.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 09:00:55 -0800 (PST)
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
        d=suse.com; s=google; t=1793725256; x=1794330056; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3bj7h5RAsQE89CNAW2SKedyVgu3o8P+AqCSDGxfBN2Q=;
        b=WzRbygePdZWMlosegZ/IOn5ZXqDTLdVYN5WV9wwr5goqOLBev1PP29c5+gISz/+LE+
         SueGyEnjfjtX26HUnOo4AWALABoGlFD+OYl5fSpDKuSHXX7DrnkTlJAlr4OufkuR/D5a
         DsSXeA/N0WGpbb9ciOqlNepA8qzP96ANIk42fLOMJMlTMjUjmK/vPVxj6thy4vcmlvBf
         VQXvZFBwOiii9lrWo4NgsWWiySgo54bVRCoLuHcU6v0z0KwJ9dY1elnXJ+VXGSL5OBFQ
         SkGwrsdV3aNkcw2Czf+G1kL2OFN/lgY+bogr9mX+thcDBtCwleZfbmVWm8esh1rKIeGw
         E/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793725256; x=1794330056;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3bj7h5RAsQE89CNAW2SKedyVgu3o8P+AqCSDGxfBN2Q=;
        b=KmhoF8K55eZr54cGu+Rzo3P9R1G81CyZbqpmfoJB5dkbCa3tzzOrWQVXdeTt4HC3F1
         UtvD5oPvqzWqCpvMIicd74YcUieVYwDPYpzVXSYRccajB1MwtuZb7z9Q0nfHOu0UnPXg
         hlEicghRezFU6d3lpgdJAvWbUqTPktM07ILFRGFrrHlhxMWjr5ovYcQRr9fByy3ZAzFr
         FgDdwUH0yGnk8+v/y9esH1WdFmsOerXMOlp7QFl/jvow90RTKPI9TsrArxxlCJ5r3Fko
         CUhKJ4Pnx0INBMRemUrAGPuzkJ7TGKcUwnOQTu1IktE4cPvb3OqWYh4csvT9NS6nUoxU
         e8xw==
X-Forwarded-Encrypted: i=1; AKwUvBw0bE0tH4nX5UkzFQXXaiC4w5xz9pJf3l4mcPAJqpyUu+4szeAJOSmsYkfqRLkWW7cyQYTJNIHAibw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8WXkt/i1FDNG82/FQRA03nh2FNEjMZBOZSTJOG2Yyk7AmqnNvE
	qspgh/NrCqU8RbLjFDUHDg4Az4PqplxyAcVoMJnQARvBleXth9MW77RlDdq45Dl5Fg==
X-Gm-Gg: AYBFou0jY2kqKW1EhG7BbQU7a718UxpOtSYP17lN8b3EU7hNaa2u874tX8GhA4ucuP6
	wvRITvK3m/akpl5gTyTgGpEzf61l7HVuF8WWG4H2NnkyxHM4899NOdKeavmNNpypa2kYOV2/hCj
	imzdOKWkZ42QwAUE/UXiZRsfeymhNFfEKU7GzadYemxaGOxhIilNYxfbFWfGe6KJ0ZhUT4a6s1c
	3geEUENyeS1ZRBI8c/fDSd65X/Efvb8K1FDoagv/Fbe0lZ89MCixBFY3+rZEUStF2VJOYFUX8Bh
	PuSu4ZNLmtxOSPIILmh9J9cVcpg4kWA3GNw/+JGkTJXS5YUXoNXoTcQ56OkDnbfv4/D+wSJ940X
	LG292E9sC+RBMiP35zY+jrZCo6oRHV8DXBTMEweJ6t9IzJ/bcEKO0xbReSLPI4bVW95O9UXcd3d
	bBFXLR+mKT2DrIxercLfTesNp+KhOu481LGEuJgDnm9QC5tmnTzXqI5gbOW8SjG5Xb7SdA6kPyJ
	vM4+6n5xyr1za60dyxw+F8/99lnj9rJTx/nPLeKlKieoTbIbfivXmOf0XAEB3pa8WAmUoESGnGz
	cGyprzdCLA33axCjF7Rtlk/asuAskt/7c/Tktq5nHu7x0PSGQlDIfFuMHT+jxefBMbsBaUYGFjp
	cZnwG7iZDqHaeKvc=
X-Received: by 2002:a05:6000:2587:b0:48e:5d63:a4e5 with SMTP id ffacd0b85a97d-48e6e26184emr30597813f8f.0.1793725255452;
        Tue, 03 Nov 2026 09:00:55 -0800 (PST)
Message-ID: <9a163ab4-a8ab-47a9-8e67-c283d3ca94ab@suse.com>
Date: Tue, 3 Nov 2026 18:00:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] xen/gnttab: Fold error handling in _cache_flush()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261103152928.2142176-1-andrew.cooper3@citrix.com>
 <20261103152928.2142176-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261103152928.2142176-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1793725256-1DA7E757-BB2D34ED/10/78276251493
X-purgate-type: spam
X-purgate-size: 952
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03.11.2026 16:29, Andrew Cooper wrote:
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> @@ -3683,13 +3682,15 @@ static int _cache_flush(gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref)
>      else
>          ret = 0;
>  
> +    unmap_domain_page(v);
> +
>      if ( d != owner )
>      {
>          active_entry_release(act);

I was first meaning to complain about the unnecessary new lock nesting here,
but the earlier map_domain_page() also is issued with the active entry lock
held. You move things to a more consistent pattern this way, which is good.
Yet at the same time avoiding that nesting might also be a good idea.
Something for a later change, I guess.

Jan

> +    gnt_unlock:
>          grant_read_unlock(owner->grant_table);
>      }
>  
> -    unmap_domain_page(v);
>      put_page(page);
>  
>      return ret;


