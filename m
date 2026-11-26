Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB904606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 08:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Iu7wv576
Received: from list by lists.xenproject.org with outflank-mailman.1503182.1698997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWV4J-0004dz-Q6; Thu, 26 Nov 2026 08:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503182.1698997; Thu, 26 Nov 2026 08:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWV4J-0004ds-Lp; Thu, 26 Nov 2026 08:43:03 +0000
Received: by outflank-mailman (input) for mailman id 1503182;
 Thu, 26 Nov 2026 08:43:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWV4I-0004dm-Gr
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 08:43:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWV4H-005Wgk-Dn
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 09:43:01 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b07f100-e002-0a2a0a5209dd-0a2a4502b730-46
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 09:43:01 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b07f115-4900-0a2a45020019-d155802cc030-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 09:43:01 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a5b2be99a8so56301855e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 00:43:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4b70c05b9desm15122895f8f.54.2026.11.26.00.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 00:43:00 -0800 (PST)
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
        d=suse.com; s=google; t=1795682581; x=1796287381; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O6uDjC1fYhROmVjNPWUsIebVPoEQ/ip1rxjHDxg5Rbg=;
        b=Iu7wv576PnOH+W8BnBhUDuQBA7P/O5tX2Gpy0U1/hL2V5LYkJhgNbEn3+KKKhb2/X/
         VlgcCgEnjOu5JaAzBd90CrHicyDImYnuDLDuWZSivEjzXu7T9WAs6nkLoGjGErsGTqU9
         Q7hEUjwxPE5VD837Vkvc8SaKRXbHi6/6CwGmWSd2CokSl6wM8V1Rg1XB9aR0dI04C3X0
         zMVnYjigQL5YoshqGUja9MSc4BlIoChjMVbioX+c4xZyPiGljMWwTNnqdOUikOkdb3Gr
         OtUNcT9+cgetwIO2jlB6ITjdOo+Tbv1+sRgziJOe6dlAB7zNOwPXhI95uVrQVVAUPUiz
         nIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682581; x=1796287381;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6uDjC1fYhROmVjNPWUsIebVPoEQ/ip1rxjHDxg5Rbg=;
        b=O4QXAN8dEKTqiaigDDmYZf4C5x+75wbiLKWOzdk6qwQQK5dkSMPjEvjxhiwENQFD8s
         SQJxg2BPpDWENC9a/knOx1yBC37WhG1/jGQJUZ6aq8ZZVJtPjQnPRwyJcIzjuXz7dqy7
         iPwBVUyEgoWYhLRyIO9pgcAKZUVOlqCau9qBhv58BJMaHvUwXKj2qFGRXEqS6jxe1N6t
         OBx1XMcbPilAhN6efPuVXunKmF0VTkD30iaHjsKS5WBt98xdK0bluTgaCKcqvvolg6JI
         omtUgdokp9hcmfowCRLaYbZuixpjQ3xS+KDOO0NnJT/O8K1DQoJBjC1DFVTeWRYDHpZt
         HaYQ==
X-Forwarded-Encrypted: i=1; AL+hErHsmusrxzmT/yzanjgsTVJ4BTwEZ5Uv7hAC8eetr46rJ0Xa3ewCAUYyRnyAXrt32WxbscrRqnhxqek=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/MYvSi0JQcP8EBUesX/VLGVYaJryQknzUIkw4bAytofRXskK8t
	un2icTGJouPJhza1VeyWkGE/f8S+7SrOp2HSiwNFLviNCZefrpkzgas34BQ4cPK4IA==
X-Gm-Gg: AZFdTZeFCqur7aFwJtkJwri4dcgBEYRlec6IwRRrxFaFHQeaK49S4rpTjiuAIXOypkC
	3mDyWwoGo3X0IkDwoQhOt9jLZjpsOIpCpDWOqT1OqolyhRnDf24kOCt4plnsPdmKJ2Er4SpGgYM
	9PtDRRChbOZI46G4leTFFn7k/PdegZNFQ9i+gS6TXQSHC0PFX/VX3aMnX9dSo8bZy66kHWyP2F3
	JUFNUt7SnFk7xFjQfwIDv6mZEoavGHvJXmWU35B8Och2YiaEv7uEiexDn7suqBaheEKEvrezTS+
	clN9T67KWiTYgMsi+SugutGbcnVah2TyuG6tgv4eZveh7ww9c83+mBsh4vUDgNsB++KttSsyn/u
	Zsw78QlxEABYNU8pqzX1gHacwsfSq4cDQ13IuYVYiFb38D/n7MRedwUg3fzqPgiRGp57NUp/Mds
	winrNZY0Q/4yFWGfBaif1DdMfZdvzstJ5/Vyyh9555uQW/Ewqp54ndy9Zwx5LAjEzRBYZmYz7/D
	kfmNM24VfISjHfyrLmWxNkgGMDEruzYoxTZiHC3fAwIRmjMOdX98NGYP+ZBKY+juApxwQBIfmIl
	SVR8E6Waero03dl4FuC1atGR7pAfmLknEDJcbeJKPaIrRoTzuvf3dNpWnw4QEJtfZBHWWLwQJYd
	7MNkPyCG40Kof14/ftQ==
X-Received: by 2002:a05:600c:e549:10b0:4bb:a60a:fc8 with SMTP id 5b1f17b1804b1-4bba60a11d2mr55687775e9.35.1795682580837;
        Thu, 26 Nov 2026 00:43:00 -0800 (PST)
Message-ID: <11b62b2b-d2b8-4d79-8b0f-61473fcc29e4@suse.com>
Date: Thu, 26 Nov 2026 09:42:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: don't decrement total_pages on failed
 paging_alloc_page()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261126083130.32791-1-oleksii.kurochko@gmail.com>
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
In-Reply-To: <20261126083130.32791-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1795682581-3399E6C6-C8530FC7/10/78276251493
X-purgate-type: spam
X-purgate-size: 654
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26.11.2026 09:31, Oleksii Kurochko wrote:
> paging_alloc_page() unconditionally decrements d->arch.paging.total_pages,
> even when the freelist is empty and page_list_remove_head() returns NULL.
> In that case the counter underflows, so arch_get_paging_mempool_size()
> reports a bogus pool size and subsequent paging_freelist_adjust() calls
> operate on a wrong page count.
> 
> Only decrement the counter when a page was actually taken from the
> freelist.
> 
> Fixes: af87a609c79d ("xen/riscv: implement p2m_next_level()")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


