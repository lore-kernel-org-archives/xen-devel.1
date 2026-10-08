Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7F6CA600B
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 14:53:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443447.1660758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEpV9-0007di-6U; Thu, 08 Oct 2026 14:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443447.1660758; Thu, 08 Oct 2026 14:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEpV9-0007da-30; Thu, 08 Oct 2026 14:53:43 +0000
Received: by outflank-mailman (input) for mailman id 1443447;
 Thu, 08 Oct 2026 14:53:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEpV7-0007dT-Gw
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 14:53:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEpV5-00GOI8-O0
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 16:53:39 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac7ae6c-bab6-0a2a0a5309dd-0a2a450b99a2-14
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 16:53:39 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac7ae73-b7e8-0a2a450b0019-d1558032e1f3-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 16:53:39 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49d0da752ffso49037125e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 07:53:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1843be1f4sm73302815e9.15.2026.10.08.07.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 07:53:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1791471219; x=1792076019; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vL8+v/52efkUmaCGszyTqSPmC4RbCwW0w1qqvG0WMFY=;
        b=HASLRJVyb81mpcz9WmRZgKmw/hLrPQFt4mbeS7WusDs69pCkiU7I6xGCqf4dx8tmsG
         TOYSo+eof7sYWmC1vmhFNsE22cKf6RkHCwcMFePynlkaHdgpkjthE/JpU4J+FraMlrWa
         TVqe+6E9isMZFjWQ07W7/ahU8gAxzVYOHThwOevn6VwcSiXh+VieEVmrvUIi/vZDx54r
         SZTOBaGimaaw9kqeqIHoPPQ37LUxB9CtN5eSKA4M7CSiENewKcMf5cP2CvKy+opJ8kEO
         GLNU7TUFYpeqUUvb6Z/las+ShDJx/EKjclnoBESxgubr8r02y/IOvk6xCf5f/vtitYL9
         PN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471219; x=1792076019;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vL8+v/52efkUmaCGszyTqSPmC4RbCwW0w1qqvG0WMFY=;
        b=Zl14qEzbSvHxm9WfIvwES4TAbuPJfBhW6Q2xkcfin7RGDiiRIJ6cP69YLprI/W2Amb
         AUaQUENYFq2DyxR+jRwA7UMez+zuew6HNXkZ6qMNgc/wZ1FTdUSSTbu78R2Xtf+ZJM52
         Ij1l8ei+7hg0uI7ro7l8ESDgUjak3nJN+gk8Nz9OY7lwLofy5Ly0g2dHZEySDqewsIw/
         vXVRDPzChgOqa9AwiPlsXuB/nRjxJ/UXuJdJCcEJkx8s7BGpB7Urcskr3J9vyDS9PF1b
         m911fiKeb/UFGI3I50vah1OGHDo4uNuIOPbBGN0x+4jiN92CpUbGhzqcw1br6uP9viQb
         usyA==
X-Gm-Message-State: AFuF++lsLeYwrfd24e5Qs96gBvxDji9+7ZAgfkQ5qOiVwsVo3AJlR2t1
	n7t357a5Fik9/eowjMYIGqndFe1CG79QWCrjZHgSQUkXFSZXlfZhZMgDU0qu3sYIew==
X-Gm-Gg: AYBFou2atV/rnkWdp/FNF8pTLZyVVwRga5Z9p7oGMCvwzVxlvwj9IAeuvoXueBhFKHl
	eev3r9GehN9G/UX98WUZaqClm07HW8EFs11TpZmjAqg8hcGd/EgeCDpW+0/cs8TeUjvNF1sUZ9r
	etKtdC57/y1nswJ9iJS22SVnDULS86YdVOaDaz/CN8ldGIlGRjgm0cr1ofjvEFuKE58nTdQgu6I
	57M1EUmOlfcZECldQcAkAyAcVdxh/oE4Z9OAUMINmgzpvHMwcs5PpyommHWrVd946m6LWmOFOJa
	adnpxPfFMIlMIWXTtdrw6b7aHxxOSRkXQGxvw7hDLWM2CeO7YqiKEnDbOui6JzcJ/AM8SNnDJ0x
	aOB0hv8G84qQNawR4hWeZXAG14pcfvZGgs6cJsSv9c9J7bsCBBkhRIMu/JHXSfxwHEsXV8zz2FC
	kAjAwmMKFk3ALKoz4rhbq5CWZmE6bMbI2EdRLMia99ta3q0qJpl2e6i1HHyOz+7ODx0LWPZ9N5d
	WQM0ohRdZ6bd80K376X7iUhfj+LjcWMPGIIsW/EvWKZVBW5+r4oyO9jy5aykUeM
X-Received: by 2002:a05:600c:821a:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a1803112f1mr103688245e9.14.1791471219128;
        Thu, 08 Oct 2026 07:53:39 -0700 (PDT)
Message-ID: <0e1557d7-6a90-4a6c-ac21-5e69d0c29e5f@suse.com>
Date: Thu, 8 Oct 2026 16:53:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/39] xen/riscv: request a G-stage flush on vmenter
 when VMIDs are disabled
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <7b3e9a486b348470b3c3b371b6a8d3f7afe0e53f.1790779209.git.oleksii.kurochko@gmail.com>
 <1791194530.8631fc262581453bbf619ec5b2062170.1a10b83837a0003f66@vates.tech>
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
In-Reply-To: <1791194530.8631fc262581453bbf619ec5b2062170.1a10b83837a0003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1791471219-A8AC89EA-50E01E8B/10/78276251493
X-purgate-type: spam
X-purgate-size: 707

On 05.10.2026 12:01, Baptiste Le Duc wrote:
> On Wed, 30 Sep 2026 18:18:46 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
>> vmid_handle_vmenter() reports that no flush is needed when VMIDs are
>> unavailable (e.g. vmid=off, or hardware with no more than one VMID bit).
>> Every domain then runs under VMID 0 with nothing flushed in between, so as
>> soon as a hart runs more than one domain, a domain entered there can use
>> the G-stage translations left behind by the domain which ran before it.
>>
>> Report that a flush is needed on every entry instead.
>>
>> [...]
> 
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>


