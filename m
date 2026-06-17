Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2763ECD98E4
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2026 11:30:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1340291.1601337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoTL-0001Gz-Qn; Wed, 17 Jun 2026 11:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340291.1601337; Wed, 17 Jun 2026 11:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoTL-0001Gs-O6; Wed, 17 Jun 2026 11:30:19 +0000
Received: by outflank-mailman (input) for mailman id 1340291;
 Wed, 17 Jun 2026 11:30:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoTK-0001Gk-6P
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:30:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoTJ-00DKEh-6n
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:30:17 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a328543-2eae-0a2a0a5409dd-0a2a45048c34-22
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:30:17 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a328548-1dec-0a2a45040019-d155dd2cddc5-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:30:17 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-45ef779c1c2so4225305f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:30:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f4f6sm56763392f8f.16.2026.06.17.04.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 04:30:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781695816; x=1782300616; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ez8FrkamDyBjKiPnWX/H4gLQGwCKaR4KFMy7/d0KO2U=;
        b=NapAQ82iNcFLWHEooZ8ciauh2Rteug78VbN2PjlpeJLzxbSje3DAcQCYTuLjBo/xV+
         q4AhBfVowzs9aek6CPnGz/7ciOQCoDbSH7vU3Urp+55FFXA61YRqlnUgHxxsE/d7PDp0
         HCopgy3Rww4YQyzInpcHT00KZTQhsUhkLFZk8A9LY3jgyASvgzPeJCle+tLTwMkCXsDX
         a4yNP6jEC3v4/xwBThrnQPEsmCWpETVs3Em9xRASxGtFdoRFfCeh3mndh3Z/SFfaVG+2
         u6oqhtS61SwdxyWenIDRosvi2WJXjRF6n/JNOpLvpsirB+dIU6IySSgSrhqcA/4IAwHg
         Qsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695816; x=1782300616;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ez8FrkamDyBjKiPnWX/H4gLQGwCKaR4KFMy7/d0KO2U=;
        b=HygofFeDL499YjQMzqVH5cZtYnLJWx4W89oQV+d2dCcaM74fcPXzL51My7x1yOjCNg
         WXdenxn35ZYbupyCaryjUeDg5qQNz0lobamLNraJGKRe7lFOTUFs6chClrB13DeW+fNm
         qDpbFYpq1dDMkIM6SEE1CRy627nbiP4DMCZwX7k+ANmY4ttkjFxRgzscIMqE0JP6tuYD
         YF2yYMMJsAAl7i/fuN40DcN3hjzFKdJkKogJ7aiZfKpcyGODJyMrwsGieC1jYaVqwcUN
         zu9F5F/sngHs8cjrUNWYSvp0Drigw7GbyMuDG1S7hDxc72Udbqaxz3IN7ir+kKJAqMkJ
         zhKg==
X-Forwarded-Encrypted: i=1; AFNElJ/N3xdt9qj96xe94VzQaoWLBP2Sqj9mJHetNFPPcvWkMyp73rQ0LNng74nJq4UX3nn9RbTcjQUAQ4c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyygPW/0AxuhSqpuJmbUeBCIVUBz4a0yNefcn4Ztl5oXSLtp+8J
	dpeIyQtARFxgjHrhbgA33AvXrC7nZocpFZVFkRIJFXYvFt/LDiNtG3dywnQs7wefYg==
X-Gm-Gg: AfdE7cm7N6nyb/zd3BM2+cx4n5tLSdIhYoYYyZQQvaWH6sExnBjKRMA63p4VqJtVs4y
	G4aF3uY2LBIOqKRdoGMoqizYOPWajYnRt6E7swnZLeNFcpqJIJS72mQhaWdhb6Ij+uN+5w0DMBu
	H7oQ8OLGizmPwmPpkVjOYO8QEqeMG+pzo5OqNRwKfE8BlbfQziNOiYlMetXUNkVps1brPrUeb9P
	BSJCEwbA+gNP+net4AUWOPIzOaUY8QQSnsM7DrXHEJ9o4ShUnFjnhjpn78qOuMLAGvMTFlhqsnQ
	cadOT6jRumePnSDCbvN7E5uzMkcgfD9vSTJpnuFxltqiTdNyGktbT/tev87ZY7ZYvx95PyfRnLH
	GCBZR13ww76LjruGmBwIREcUZFUfP1Z/AYakBcH6MmKgP3BaeolVfR7xGCv8/xtyfi+D0nfmPuO
	q+WosnvVYfDGJB/r0kjAm+yQEz0mMKQ8uoOobLJdcgf3MhZawlQ61dQz/SVAFoBWiifymKOzDAL
	tUR
X-Received: by 2002:a05:6000:ed0:b0:44f:da54:da6c with SMTP id ffacd0b85a97d-46237e510dfmr4427277f8f.26.1781695816598;
        Wed, 17 Jun 2026 04:30:16 -0700 (PDT)
Message-ID: <d55f0b2b-3352-4d05-85dd-9c89b73bd338@suse.com>
Date: Wed, 17 Jun 2026 13:30:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/23] xen/riscv: implement make_arch_nodes()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <738f97f8ea8bb588742c3f03d3cb2d24f399b602.1781693963.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <738f97f8ea8bb588742c3f03d3cb2d24f399b602.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1781695817-29D7C3FF-AE3F3BB6/10/73395122804
X-purgate-type: spam
X-purgate-size: 502

On 17.06.2026 13:17, Oleksii Kurochko wrote:
> No RISC-V-specific nodes need to be created at the moment,
> so make_arch_nodes() is implemented to simply return 0.
> 
> It is placed in dom0less-build.c as make_arch_nodes() is
> only used in the dom0less code path. In the future, it will
> be extended to create an emulated UART node.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v3:
>  - Add Acked-by: Jan Beulich <jbeulich@suse.com>.

???

Jan

