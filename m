Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB00CA5FD4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 05:45:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438859.1657400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCW51-0003dY-EA; Fri, 02 Oct 2026 05:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438859.1657400; Fri, 02 Oct 2026 05:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCW51-0003dR-BR; Fri, 02 Oct 2026 05:45:11 +0000
Received: by outflank-mailman (input) for mailman id 1438859;
 Fri, 02 Oct 2026 05:45:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCW50-0003dK-7R
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 05:45:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCW4z-00EzNl-1k
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 07:45:09 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abf44c5-8faa-0a2a0a5109dd-0a2a4507a8dc-44
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 07:45:09 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abf44e4-b4ea-0a2a45070019-4a7de18c929c-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 07:45:08 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-4a01ff8c098so9671355e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 22:45:08 -0700 (PDT)
Received: from ?IPV6:2003:ca:b707:3710:a919:1c08:7b2a:ed1?
 (p200300cab7073710a9191c087b2a0ed1.dip0.t-ipconnect.de.
 [2003:ca:b707:3710:a919:1c08:7b2a:ed1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0276fa954sm53651635e9.3.2026.10.01.22.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 22:45:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1790919908; x=1791524708; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACn9r8HxyG8IJLG/IYuoHYoHgQIbgGFD/y8nXUSn5Ls=;
        b=H5LBFYJ8Gl630Q5V3XyoskkiZE4Wv3M2IjHENVzgKkislhpJfuJ991cHeLYasQE6zF
         CI8bLVvOs9oPKq6hhRIWRz3dSzi2UTZ/dDuUd8Ggsjp4Vi3EHKestPBHJmf6gcCrbD8o
         8vLrBvErKrdNINK/H3j8wFZ+l3nCkSAO26jvkz9n3MkyE9MscjDMR49TEqIoQLUhbyzw
         jDhRXfZ4sAtccDR8E+LswEDheOPnP7cbNWti6ZppZnCe70BXluhKPN864gDO1HHKUneT
         /ckQqIP7m4jc1/9wFtYjekrbN2W8dZzp/vCoDkfYOl8zrBX9QTEvgNdgz5SXhqAYAvcs
         hwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790919908; x=1791524708;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACn9r8HxyG8IJLG/IYuoHYoHgQIbgGFD/y8nXUSn5Ls=;
        b=CrKnmRJG5TA5hw/RDGe2Hxdf0ejTtx9DZwOxs638/voDsgqhBKieu5IUEdKXfolPea
         HRPYvT1paJeYf9ZIroAC07wctYBAbHo0qb0JmYuR4juNfAeTTKIyziS/Zbd0XjTDjTrd
         94K7EYt1i9SkZWAmNm43JQOUGAi2eVKn3XpIEe4IfPkRCqC1LP7DlWB5qUOhyvq1nSJ4
         XUWmE7xJFbaING8AOwTT5xDOX/VC4epyRVW5tP/f414PJ41Sc97/1YYalbcZ0XLEAAwD
         6Tn0vAHiQhACTmuh/JYHdzC/9ediU6wS1XzCFrX+3D6J+SNyiXNlG/fOKQDrvgdr1CiB
         DT3Q==
X-Forwarded-Encrypted: i=1; AKwUvByBi5opzku6eZyQFVinhiO6htEF2sLgrnYhY4Dii8n87DQkDSTiZPP1nJFNMuntJrbkUqk9ZiLOnaQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++mW9Pua0fEwpwqSVY6lY9hMR2EOxF8cqOga6vnOEnJ9HMhwliQR
	bsOeB81Uyf1AVYfmVa4fwZzmCrHzoVTbbmzBGFlUVSMZ3y+qPGQyt+V9bY4JRmkjOA==
X-Gm-Gg: AYBFou047qsyan5unp7xkl8urpNfO1/H0EiyVK5vioj836yJvVpGdIrbfqUCUNjczen
	zlYkeuQWCEEiCl/nWN68Spyk76glLfhhHNQ/TAJ3aesR+5R/XRO1I1G2MKR7udFHg/VzOQaYZWG
	YYZYxZmsd9u+SPbmdYWLqrtd7BPHq+1Tw5D8owCqZxItbgEN0sDyjJDheulSP7e3HVv9XDkr1gB
	4pAFXBUuROEsQLI8n3AKLKZ10aQyAEwKrRKLuiB0NROGcFwLERoNqkaneMmTFvofjwu904XHVtq
	gurVap8bz9DFKNAhUD+9SfOhRmh1aTYhKwTXmhmL5HfrPqAsxGN55Qfh9A03YqvHn9EpU/gYLe9
	MbqL3xLwauu7MDOARQ9uentzYYuEbAMF3LBSH+MvVUq97C94TRv+p7PacX5dRTCLUQUSWLmmqRU
	Z/MRUy/c7pd1EGN8ztai0EcSwYUpI9W7Q0VMAYFZjGaYjx22+2o4nNQE01os2i84pTlZUQj0Y/h
	p9gl4jRGdZwOSg6Mu3zWzrlqGWhGpZgBhoiPYTKUwWCeyE1GKtM+OMNTZrwvyYQ/3B6hprOR7FM
	YnvyG57dOmrBm5MxprGiWXtMEDgPBCBNcuJOxNfp
X-Received: by 2002:a05:600c:8b6c:b0:49f:ec98:f030 with SMTP id 5b1f17b1804b1-4a0276b3e15mr29462505e9.33.1790919908521;
        Thu, 01 Oct 2026 22:45:08 -0700 (PDT)
Message-ID: <f3754c45-7899-4e76-bb29-dc8deca0903b@suse.com>
Date: Fri, 2 Oct 2026 07:45:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/domain: restrict context switch hooks for the idle
 domain
To: Roger Pau Monne <roger@xenproject.org>
Cc: Grygorii Strashko <grygorii_strashko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261001142757.98255-1-roger@xenproject.org>
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
In-Reply-To: <20261001142757.98255-1-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1790919909-A78D1AE4-229265AA/10/78276251493
X-purgate-type: spam
X-purgate-size: 569

On 01.10.2026 16:27, Roger Pau Monne wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -813,8 +813,6 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>  void __init arch_init_idle_domain(struct domain *d)
>  {
>      static const struct arch_csw idle_csw = {
> -        .from = paravirt_ctxt_switch_from,
> -        .to   = paravirt_ctxt_switch_to,
>          .tail = idle_loop,
>      };

Leaving NULL pointers around isn't a good thing, though. May I suggest to
at least poison the pointers then?

Jan

