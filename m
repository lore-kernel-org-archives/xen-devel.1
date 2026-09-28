Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEAECA5FA2
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 16:03:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436127.1654888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBDoR-0007NN-02; Mon, 28 Sep 2026 16:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436127.1654888; Mon, 28 Sep 2026 16:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBDoQ-0007NG-TL; Mon, 28 Sep 2026 16:02:42 +0000
Received: by outflank-mailman (input) for mailman id 1436127;
 Mon, 28 Sep 2026 16:02:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1xBDoP-0007NA-Hp
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 16:02:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBDoO-000Nbh-GC
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 18:02:40 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aba8f9a-e002-0a2a0a5209dd-0a2a4506dbd6-22
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 18:02:40 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aba8fa0-195a-0a2a45060019-4a7de18cc2c0-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 18:02:40 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49d1fb0cf5eso30644415e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 09:02:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00d0e69e2sm770925e9.0.2026.09.28.09.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 09:02:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1790611360; x=1791216160; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=17n7mt4xJsvFk7/ZOW2EUWeZaZtbemDIdX4jU04CnLM=;
        b=fXcvGlqTI9kqbg++Up5gLzh+qkNkE27JwT8ikUQknxq0G/SYf/eSNXahKKX1YFpw9o
         afwdzBOT5V+Rz5kJsjl0mb1a3F325sqLqc0vBWXsxI+Hg4W6LvQGCllexdWBtvkdulVw
         +DC7J0aQsFyh59Lk6yKBinmiIClmiXKLJdZxIhMBT4UaxsJfYvHwhQrYnQ3s3FpA4YQX
         65Cs025aGpeUvUriZ35NvZp1YUpagPjPVOj0eTYusz46L9wavzKXCenbwS4nx3A2h4He
         4ebrvCElJ4KZS0Xw6OW+HWiNBr5Cz6oQMLxsyYFGWVSYvSFtSX0suNmQfWRsl9bcIKHX
         OQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611360; x=1791216160;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=17n7mt4xJsvFk7/ZOW2EUWeZaZtbemDIdX4jU04CnLM=;
        b=VhrCTn11iTpmv+19sqrA8V++ibgFlYR2ilfvv1ENmvF22gT+h94EiENwY/Z40cO5Au
         ku8cJ7xjsuXDl6k7yMRxTax9YdbVL16adN8AFSf7i+upe3gt7qeOKrDzazxluMjslekt
         B4nv39c8VakJMGGS00niss+v8jLUHdIoSmyYcSM7zn5klMjM6JCp3W0XuIRr3QAFWE9r
         D82y7aR7bqDQmHWEvak2aNCUxS0huw0jUvDzZNmY87tjVYoTN+v9kIlvBLwsj7AahHY4
         w3uDrgVqhNGd3OVZocXt8JQN1qddkJrjqNv0F/9gc1A6kELUAh4bAQLZ6VM17SZCCf0R
         5JJA==
X-Forwarded-Encrypted: i=1; AKwUvBy9WZDXlPWHFAUvauWnQGuphVNvM1t5ZgmUxdNaBTn0oM8Tj/H6I+XYzvNeGzeNOrh41Gkf0kwLgAg=@lists.xenproject.org
X-Gm-Message-State: AFuF++n4F9Qneeqy1grZkj7ymBWtOHxIf9QuzZfKn/q2fs1W6DuTbE9W
	tMO4U64d69S9XTnYvc65lC6YkcOqDLDJCZRSZIgRuF+Ncn+imCAPDxUGh6FNleIeag==
X-Gm-Gg: AYBFou1C5wHkgwcKo9C2G01S49cjGK1q0aXlFUibm5Y4b3gyzxbW3bZRh+xDUj60bNN
	fzLxlApUdcxIZtrbV+/ZfPNG/W9VME2AxhaA6bPcpdfIe9FglpujTvhySMCiS32HMdPiAg3DHmm
	X4cWtYjCg6yNUJ1V39T1CwlekeH3qa7PlborUStL7r0WGc+nJW05qWYyH9XGOuGwkZAMFkOpSEu
	bVE1CohyAtQC+w6dKXAaHYJSCkO5oU6zxOeAZ7TjW3VIOUiGYMtGU7+p2YqgtZTdjW1PksDjtRn
	l/uYhHIF3+fCgaN7CqFf8oRg3F8A1FZRxHpWoI/SpB+VLrEb7wLvp8RKy/ceC3cYvnsl3aiCwtx
	GhN1U06qQjmI1iyy32M0Amb2Ve0bAr7E7BXvP3gsCRseQa0JUD5I2R6ls9HKFtvBmtxAgXWhKRZ
	nV393s7z2TLRIS0pefBz2slkvAQRv+E8ehqGtZsW+kvNr1Eo3u7Bp8nT3b8soZpeQBhc0Qre/9v
	lPis+Bqpn0UfBk9a+hc5WUjucMp1TA8avYIWpr+ppdwZQ3fSz5sWaAkkmoPhg==
X-Received: by 2002:a05:600c:1c13:b0:4a0:35c:8953 with SMTP id 5b1f17b1804b1-4a0035c8ab4mr75731085e9.7.1790611359605;
        Mon, 28 Sep 2026 09:02:39 -0700 (PDT)
Message-ID: <9ef21fce-24a0-4ac4-a8f7-43211983fec7@suse.com>
Date: Mon, 28 Sep 2026 18:02:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/sched: fix scheduler callback verification on init
To: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Cc: dfaggioli@suse.com, jgross@suse.com, gwd@xenproject.org,
 Ruslan_Ruslichenko@epam.com, Mykyta Poturai <Mykyta_Poturai@epam.com>,
 xen-devel@lists.xenproject.org
References: <20260925213022.799625-1-ruslichenko.r@gmail.com>
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
In-Reply-To: <20260925213022.799625-1-ruslichenko.r@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1790611360-F647377B-550E91AB/0/0
X-purgate-type: clean
X-purgate-size: 1089

On 25.09.2026 23:30, Ruslan Ruslichenko wrote:
> From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> 
> During core scheduler initialization, each registered scheduler
> is sanity tested in two steps:
> 
> - it must provide required callbacks (e.g. init, do_schedule).
> - if global_init callback is present, it must succeed.
> 
> If any of the steps fail, scheduler entry is cleared in global
> 'schedulers' array.
> 
> However, in the current implementation, if verification fails during
> the first step, the scheduler entry is cleared but verification
> sequence is not interrupted. This lead to NULL pointer dereference
> when subsequent required callbacks verified, and possible during
> the second step.
> 
> The patch fixes the crashes by skipping consequent checks if one of
> the required callbacks are not present for the scheduler.
> 
> Fixes: ec25b3c0261c ("xen/sched: only allow schedulers with all mandatory functions available")
> Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


