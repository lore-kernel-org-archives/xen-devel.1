Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C999CA5FD4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 09:34:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438978.1657500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCZei-0004OU-GR; Fri, 02 Oct 2026 09:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438978.1657500; Fri, 02 Oct 2026 09:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCZei-0004ON-DG; Fri, 02 Oct 2026 09:34:16 +0000
Received: by outflank-mailman (input) for mailman id 1438978;
 Fri, 02 Oct 2026 09:34:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCZeg-0004OH-Ql
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 09:34:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCZeg-000ulI-7e
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 11:34:14 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abf7a95-2eae-0a2a0a5409dd-0a2a45019d24-4
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 11:34:14 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abf7a95-5984-0a2a45010019-4a7de18c8cd3-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 11:34:14 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-4a006bb267eso30125695e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 02:34:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0280ceaf0sm70460885e9.12.2026.10.02.02.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2026 02:34:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1790933653; x=1791538453; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x8seD/btZiuLzI3+E4vrqlkh3gz/VjinHO1PlyRwkls=;
        b=MFAshPhRX9g+qbMRDpYidwcyqMS90fhWeEO2AGIDdGabxIMUaaTGBMyd2UVsgZPkC7
         btW1obm394LV5Ye6rdzfK1o4ekRXwI+xrPRdx3HlU9Y5s9Ov+CqK68pgV8sTAj7YBXVN
         4O0D7ExOv/to/4C32Eighq40nL8nK/0iPo8bmUvsIqVmVKszthAyIquKMR1R88OGMoZ3
         v1JG1e0KWXOj16thRxH8lk3JBluegw41ruBdDQCV24f2eplLfmZxiumuLLs099xJMwqX
         dcAK42yI+5n03mHa5x483EUv/BAMkNs1txAoPGOoNW1QkflVcj7vSCfRJF4wVyncCAfZ
         WZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933653; x=1791538453;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x8seD/btZiuLzI3+E4vrqlkh3gz/VjinHO1PlyRwkls=;
        b=ByKP5zu7OzkA3xQwY7eVKIFYqaWDgPzz/HcETISKruirU+TBszi0mCeh61iIHKV6Ct
         BtMFRKH2SqQkaOHLNArAMYS1MhSyyAmzMESvnwTTP8gbcyuv7BPQ5rb5BhYdxsht8c/x
         jJiGFuOhT7zdhWTEaWN2TrWrsnE+Yg4mNJdpHmp/XOaKFTtr3TFXXjdSGeAqTidmLbgK
         BWllWGmqoHtoc0unLHTJB5NlfZwxEdq+FR02URUxRFhusy9FofAb09khR0nftUOrJvyU
         LALl/GtymD+IBzqyP6kqeHEnfN/RF/sC+qq7R9zVkmqK33eRDG7zIq0cV72syGlKfKRw
         F3/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwsqcNGii066p6AtL5VgUS0wEjNuBRyCuBd8w7pXiyofa1osqzWmv/m4hFGvHi6RNTMRwn1L2tJpeM=@lists.xenproject.org
X-Gm-Message-State: AFuF++k8vB1nIzOr38nXqSJpabzHT0EjjbZxzlsPqS2pdMLYSiAJ8ZJE
	1+7TlNIwiSTWfAZtMcOI7bpX/FeNuyjJUMBZ8nONVv46MqrxEnteCI/bZXFqac+3nw==
X-Gm-Gg: AYBFou1zQ+S7HWrJFU93KHlsqo9xbmIfNed9y1jWD+Nxklw+jo1mXv6buSWnzBn0DCS
	DGbhyJfoPZ3rUk2loJHgOhUtkFjogGOfii8mXbq/cOG14d6eBZYn1sxreHpv2ih2z1wDNVpkYuP
	YU0AAXmdvBuj4p9xYOMySe1NXnPlf9D85xVkuULrcAHUqG6mgqJE3MMykYSGPtsU0kh+ZnW5Iuy
	t2/eF7M2+qKZSFT0+4tBUNzrEigSHt1KriZl1vAT757Zu5cRRUbOygC1cElxuy3Ma0vIvRtFtvx
	29s9eEy7xPCLqTDwaKUI5ArH6745F3xOipYuRP4BY8FQV96YgzLmbrO3oBZAFS+XodtpiU5ZHX2
	D8hsVYPlJvHmZCJ5WM5L/eEwGT8mvnn2+Vv1IUAJVu4Pa2eotMZ1iQ1uxezF2oIpkJ9q2kmLhVb
	RbwoiuzgnfO61GZZX7QCRcDB+2aTs960YIazzOGS8+eL8/gRvUobiKNpFAvrxM6qfDqcsMLmvak
	FPqfXVa+3Hlk5ZTkOM/zwiIsj2ulbdXwk+74mEd6/cGZrOx9SJga/8CpQTpQSc=
X-Received: by 2002:a05:600c:1908:b0:49f:fc13:18a5 with SMTP id 5b1f17b1804b1-4a0276a1f07mr35309715e9.6.1790933653192;
        Fri, 02 Oct 2026 02:34:13 -0700 (PDT)
Message-ID: <0787063a-ca04-437b-9bd9-307fa084007e@suse.com>
Date: Fri, 2 Oct 2026 11:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v1] xen/xsm: flask: restore sidtab state on policy
 load failure
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20261002092556.542986-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20261002092556.542986-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1790933654-BEC61757-3D985E22/10/78276251493
X-purgate-type: spam
X-purgate-size: 876

On 02.10.2026 11:26, Sergiy Kibrik wrote:
> Error path of failed sidtab_map() leaves global sidtab in shutdown state and
> from that point system is unable to allocate new SIDs in sidtab_context_to_sid().
> To restore sidtab state new function sidtab_activate() is introduced, which only
> resets shutdown flag, rewinding effect of sidtab_shutdown().
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
> New function is not strictly required, this also can be achieved just by
> doing sidtab_set(&sidtab, &sidtab), but this way we would rely on its
> undocumented internal behaviour.
> ---
>  xen/xsm/flask/ss/services.c | 1 +
>  xen/xsm/flask/ss/sidtab.c   | 7 +++++++
>  xen/xsm/flask/ss/sidtab.h   | 1 +
>  3 files changed, 9 insertions(+)

Nothing is being said as to the reason of this resend. Was this perhaps meant
to be a ping?

Jan

