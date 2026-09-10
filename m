Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C07C79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 11:54:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414518.1644305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4dMa-0007i0-VF; Thu, 10 Sep 2026 11:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414518.1644305; Thu, 10 Sep 2026 11:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4dMa-0007ht-Qy; Thu, 10 Sep 2026 11:54:44 +0000
Received: by outflank-mailman (input) for mailman id 1414518;
 Thu, 10 Sep 2026 11:54:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4dMa-0007hl-9v
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 11:54:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4dMZ-000V9T-JG
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 13:54:43 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa29a7e-bab6-0a2a0a5309dd-0a2a4507edd6-8
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 13:54:43 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa29a83-b4ea-0a2a45070019-d1558035e134-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 13:54:43 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49d0da752ffso51170035e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 04:54:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885bbb51sm53045278f8f.30.2026.09.10.04.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 04:54:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1789041283; x=1789646083; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WgHqJBSNKKq530aCdODNT3BTPzgPhtzxVP4tGW7GpNA=;
        b=TDSrk4XbzJ74L2VGEhhWCw5A214JbSqJE6L5Vu2Vb7Yvm3utzq1PTb+EpPQvFSfr4x
         Q0b2SXFIt9k6Mnu0sFMqo1riZjiBliG0Q+pIVJDJ1lBaKDaJNTxpEe3n8/YDlzguNpy8
         NJ5j5cpNAHKTlcSxUL+YaT8DbCFOrUkDL/0z2JpAFCv1EEJvOZriG5D6PfdeoJBVX4El
         x6DEiNpIDGPKEY8tG0gszfE3DWLQIs1Ba6DstXGOqy3LU7fsCZB7QTMKYqSTrAJEKWSH
         BBR37WTf438BcwOmhOQW+eGzdCXtQrBDu2jZ+D+jFPdt+zIL4ximpzfWImwyjFoxbFfK
         rLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041283; x=1789646083;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WgHqJBSNKKq530aCdODNT3BTPzgPhtzxVP4tGW7GpNA=;
        b=HDepglFOUsj3nHgovuoIURJrGGO0GNoOaPL5U1fBfrm1c5RESuF23SWcy4FxcA9Vne
         NLmELWvqYsrMoQsG0oFS7j4cHlPoIIf+yLSvMsjaLlYB5Mb70sNqWKCZuMmJXBlfxXjX
         BFkoZq6Lbym03a+GvPwI1QyfGW4/jIGg51rnFxGfx5Z3e595kFiMmqOkFf4ol24Usu5W
         J2eJruNHXZWFvRFNXxWKpfUbZLowKP7QGREtnFyH8ouWJelt4eqCumX+syb2G9kZFsaf
         //336lJw++xysH89pjn5QfvpXG1tu3lizkN6IAX0HuDR0BCZpJv/p/Ifo8GxIqQwGEIe
         P8cA==
X-Forwarded-Encrypted: i=1; AKwUvBzajYnoQc5sNvW0cSPmyL1HHSJ73wZX53Tc8kmb0GUk3KjBpEOvNk3+UcKdmfK0P5xjRFuRKELPHcI=@lists.xenproject.org
X-Gm-Message-State: AFuF++kxniWv8O4K6bL/T71skrCgv6GDTSXxltMvt6RUcnZ9hPJiZaor
	zGXKd8so1x+af7GirJlHpxWzLNgCxAdQNWz87m2/ym41uqUaQQ3t0KMooRyht3hY6A==
X-Gm-Gg: AYBFou2qcAZuWwlmcAPXWU9YTv/lJ91k5BFfXpQAZUzpoAc4S0QfhkYIfOFGX4WF/3L
	jAdtNYTvO9T0/YpPf3IESM6XJFMBTNedhNioVzOlVe1O7fCWOrAfi03z1brVk5uYjIHLyFOoyJB
	z9I5HfQVj3L4iQMQ6Nr2yreUU5tbeSjN8lZEW1wiu3DX4NOqqzH+Bdz+Lupyz+mFka8KVP6cJAg
	xwfbKYZyJR82nbR6am1K6g3s806SEic5ZUDHDN4RaC8ruAd6KpDifIbJWwnR6EUxNUIPw5WYRA5
	6BEH38rxbdTRAl25r6DO8L3xk1h1i/rVJmlxMQW9FEL65llhqZGNiFenzLPZ8ocbqnp8iZUT+ho
	lknOnoruk3vp86NtVrHu8QHzRAut5g4prCzfy7hA+5fJVMqDu+YWd8+cOtzx3r8AeyE+yee9y2X
	i/Q50O8ej42e1rJKtOrPoee/eT49hZMeBhhzTwV+Zz7nbwbFJ8oC+T2bHtMPC72h9aZWb33vHdY
	Ssuc/1w9UDYUMl495t6/2QbTvuW/NzNMiiSXFzuH/QfJvvrPNICrb+3IVmXjTpwTHj41XBb+Q==
X-Received: by 2002:a05:6000:715:b0:485:8c16:5ef5 with SMTP id ffacd0b85a97d-4858f0b188fmr32130812f8f.47.1789041282921;
        Thu, 10 Sep 2026 04:54:42 -0700 (PDT)
Message-ID: <ec14c397-eb41-49a9-8221-4617d4a7785e@suse.com>
Date: Thu, 10 Sep 2026 13:54:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] x86/mm: prepare destroy_perdomain_mapping() for
 per-vCPU perdomain areas
To: George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-9-ecc269f268b7@xenproject.org>
 <97a420e4-87d3-4600-b169-8ec7e5f62a21@suse.com>
 <CAFLBxZY0pRUamfukXd5BewKbft_Rc=Z_y5YxyUqVq8wz-SAAOQ@mail.gmail.com>
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
In-Reply-To: <CAFLBxZY0pRUamfukXd5BewKbft_Rc=Z_y5YxyUqVq8wz-SAAOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1789041283-A68D9AE4-E8B3B5B7/0/0
X-purgate-type: clean
X-purgate-size: 251

On 10.09.2026 13:38, George Dunlap wrote:
> I'm inclined to drop the linear map use, and also drop
> pv_destroy_gdt_l1tab().  Any thoughts?

Doing so would follow the "start simple" principle you mentioned earlier.
So: Yes, perhaps best.

Jan

