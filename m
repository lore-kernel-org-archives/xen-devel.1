Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57293C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 13:50:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383512.1626788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrc0N-0003q5-4i; Wed, 05 Aug 2026 13:49:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383512.1626788; Wed, 05 Aug 2026 13:49:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrc0M-0003px-W6; Wed, 05 Aug 2026 13:49:58 +0000
Received: by outflank-mailman (input) for mailman id 1383512;
 Wed, 05 Aug 2026 13:49:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrc0M-0003pp-0W
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 13:49:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrc0L-000mCf-De
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 15:49:57 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a733f76-5cb7-0a2a0a5109dd-0a2a4503dc02-42
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 15:49:57 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a733f85-fae8-0a2a45030019-d1558030ed8a-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 15:49:57 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49553515a8bso14793265e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 06:49:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994e041b4bsm92452265e9.12.2026.08.05.06.49.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 06:49:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1785937797; x=1786542597; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TvL2rOspMd85SySpoKUosK/j3GMuZB8mHcX/K39i1Kk=;
        b=MjjZ9+7m9htjO5pBkii5jLrAnSYf1JwGjv4L9vv61VnzT1t/vI3CcF4BU1GSfYhfUP
         Ko/Mn4664bFNLFlzfPyld042u+6zny8rmi4UgVrpZlGIDDoQ6ekBha4QuVBOgGMX2UBc
         EbgjwACcR1HjduwrY1KErOTD+r7rXzCRQDoSaXN+2xujZ4jcc03/9JyeUSQIlCLiTXCL
         MHc/3ntoJjP2qn98beAmZct9oTE+ggRe92raKgzr9wFPY0xOwVLiokIHI4bW1s1IoIO2
         pN1sMtgypdrj56CGWXEcJFnz1jZylF7u3Pu9bgxxhsHnDWfwbLOMtLB4tGqVNiKYrOs2
         X/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937797; x=1786542597;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TvL2rOspMd85SySpoKUosK/j3GMuZB8mHcX/K39i1Kk=;
        b=s3amUSQF2wslXzQNLK2gJolJiIlZd1c/+sOS2efcguNy4W3Gn2VZYlPEluL8lHBkvD
         oP0biA68qU+7sXiOpTfQLDcZS8zL5MkKMbfwGfnY6pBTgm4gjujcJ+4Ib1p/j4wwXSHu
         sZYQ6xDlJaGTM9vqdGVSTiEuud/iW7dvA20O7zzl4msCu2vW/QmLB5Yg688kcXXBQT1c
         4DOnNsGloskc3QfwUS/39gRprDglV65XLYqmRoJTl6rtabzZ0s1OC6omrTOUtNpkVLeF
         jUQ/cOkzNG264/UTGTUrzGgYXHTNV/02BWesaPA/WcKMVdFEZ2R8kbmA5Q0H0X5/Jrdw
         MJTw==
X-Forwarded-Encrypted: i=1; AHgh+RqHkp5jttNb2Piwg37dJfYYt8VOKs7Qn6Of1aYukVOaSPXZQrgPffEEP01xULXK+PmqOC+ijflRxFU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJQVB7d11FTJIywxjwbcKRSj4mSIH70BnN125sAqExaFeJ0xVA
	nq46dcb62Mr8l89IAi+MwNaoKdn8HCgioVUxLYHCKN666HT6eXiBX6PQhEnCOuTuag==
X-Gm-Gg: AR+sD10MZ99UJxhWUURZ8hT5rnvSg+GDBAJSxonZT0zOG8ED79PMcjD+zeCMLcotKFq
	qBR7JLpuhjEK859/CkYBpfc8t2i6N3koAbfNrjoiLGlpwv2l74OFwTqEoTXP9T0PN65nPzz/M56
	CMsbpW+dLYfAPWHrlmTUe0vs+RjtpxztqlnP8M5w6LYnD4xFYRiR3Vd8R24Uv1VWSTlXIbwbepN
	d6NK9h8t8JiBzHLDJXkpP4shZIOvCED9ABvUkOTC+6/5DbOMC5BwNBdeUaHmf1P3h7D7tQV++7e
	sNXrB4VF+10I7yTIIxKig9NIvJzv8Zg93X+Qf0H/3B6luD2qzhaFzD49XpbESDnSi0PbT6z7Npu
	Tftm92B48jCsS72DjafHl4DRPaYGPr776+ZQ3/puCTx/Ft4EvQBL3EAHZ91m6QJIu4ofmzuG2EM
	R4D7zKlb6c7mLtZwhyCuQAsoEIcjWQgX8yeT4NqnxP8BObuSEolm7BEPZiP5XoVk1ft6ag4577T
	cvYLILDSZxPpIklNQHLTrYw+4cue1RPIXAD3/qkntVh9ZtYgJj+
X-Received: by 2002:a05:600c:8b35:b0:499:518d:ebd6 with SMTP id 5b1f17b1804b1-499518decc7mr29528305e9.17.1785937796784;
        Wed, 05 Aug 2026 06:49:56 -0700 (PDT)
Message-ID: <243ac905-6949-414d-823c-f6e183637bda@suse.com>
Date: Wed, 5 Aug 2026 15:49:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86/nmi: Drop K7_NMI_EVENT
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260805124525.105457-1-andrew.cooper3@citrix.com>
 <20260805124525.105457-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260805124525.105457-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1785937797-758824E9-CC757DF9/0/0
X-purgate-type: clean
X-purgate-size: 516

On 05.08.2026 14:45, Andrew Cooper wrote:
> This name is misleading.
> 
> It's not possible to configure NMI or not from the event select register; that
> comes from the APIC configuration for performance events.
> 
> This name is "the thing we want to count for the NMI watchdog", but that's
> clearer to follow when it simply names the event.  Drop the indirection.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


