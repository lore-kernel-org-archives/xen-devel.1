Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497D7C79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 14:53:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413227.1643455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JgE-0006U5-11; Wed, 09 Sep 2026 14:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413227.1643455; Wed, 09 Sep 2026 14:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JgD-0006Ty-Ue; Wed, 09 Sep 2026 14:53:41 +0000
Received: by outflank-mailman (input) for mailman id 1413227;
 Wed, 09 Sep 2026 14:53:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4JgC-0006Tp-Ij
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:53:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4JgB-00HHl6-VL
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 16:53:39 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa172df-8faa-0a2a0a5109dd-0a2a4502aca8-44
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 16:53:39 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa172f3-6ca4-0a2a45020019-4a7de18c9b97-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 16:53:39 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ccfd61ecaso3993715e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 07:53:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d0af538d0sm353600305e9.8.2026.09.09.07.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 07:53:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1788965619; x=1789570419; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibtg7GRbj5aBCLz+vm7BKyUkJ0AR3wj9fM1b/8ldv1Q=;
        b=RACS2LklzdVcsDrLoxcRxtLad7fwg2LLtM9MLpw8aQYnLiQC7m3VzL4eI5y99SBiPi
         3AMVLAb3iNa+qYcfFpLQlyregF4RSE/hmrQ4rSJbbxnHOvq8W6KC/tTZV0kSFjFKHdzw
         YCXdILRT3EnK0/tvE5OaQcLNL6AtkasmcgfU/QaDlezYjJsxiy36CjhkM6TJMq7x+tbc
         QUOX0/r3hYFwwtIXCrbV433ylslxGqdGqpQ9isQiWyECGQV5ftFfiiKDc6VD/6RE/mGk
         FzMKgBjk6+55ugbgppHQ3W2itL7IsDXELErunmH42pNTxKTTOb87pQBcPjgK58W25Ilh
         Z8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965619; x=1789570419;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibtg7GRbj5aBCLz+vm7BKyUkJ0AR3wj9fM1b/8ldv1Q=;
        b=itU7ECdLFXbq6lMdnHdY1LRKm0zC2ddTmUk2P0QnQHU3hcmGXuYNyMyDeFcm5IkB+f
         ge4ruo/CC/+AEcvIC++MrrEVu/7si4naQKK2l28snAJhQEEESYIzRiqqPIld+9l60Oob
         nFnbVTb3+5vvbC4jSqvUCghtuqVEgSoILxGJ1yHcdeFXJJCxFXDAarfEcZkNb4fLCPkJ
         2Pkot0dB/rC3umJw9MGLaMwhdyQcpR4ParHEJSMlCTPVApbCt2AQxJdPv5HiJRTcgmjN
         I70V+84zmzHDHSN8ZjDpGwvZSaffB0v3KFq9ldhbGRMI8rWrbrrdS9o3ZkRB4/bq8UCJ
         +1QQ==
X-Gm-Message-State: AFuF++kkwVfBravukQGSBjkDwVRIAYbAyBK3b5Brjkn2a7xsiQRFIWRN
	/79rhBunvNN/5Ja2X7MQ5LckNbjDOnW2XhVJFGn0hT4Bcmwav7X+k7z2mSpZWey/hA==
X-Gm-Gg: AYBFou3q972VLGuI7+BfyFe7uN0wjJ7haHrXuLniuHhly3uupX84/D4dgrvdnnrcJiI
	DmkGC1CI9b7H4K7dtbrUr78jT53OsViWRAKyaT6uB4RVk6Gxs+j2kZl7m2heYz/tOKLyOUUD4ET
	bNcWXclx2UpBHi5OuYTirRv4ZWZFOcS86GPONCQbARCv4ukN7kHVHkAtFsBdZ1esjpzPDR7EKgQ
	IbJw1QpgvSwyATWStrWrIUcG9xmowRXrHlC5PvPodqiLo5z8WF5AvdHLbGPyHzqRTf9Zwmf85Zl
	9Y32MdJMpHUIMRV57ZEbrum0x1l0XiazmXrrPVbPK19h5pZ6eWqyggHx8ElTY8QH74fOm+gwkQE
	YnToYxvdi31DvlquhkehGDmGNN2fEy5vVIMBVafzIqI7MnxbsdXWs5slP8XkfIj6mkwgcaFtc1H
	kaXb/K2CkNN+cmIPmkKzuJ67XvKCFRKWYhKBNNL4pPt1w7TGXfITfp1nypVwkuTgsiAhlsow6oX
	Rf3nky2kMvaOOospLOUDnw+V4YPH3scIhZeSvjvjqcBBjG9sTAvX5q6XizgvRg=
X-Received: by 2002:a05:600c:46d5:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-49d258d8be2mr14718035e9.9.1788965619128;
        Wed, 09 Sep 2026 07:53:39 -0700 (PDT)
Message-ID: <7fe791b7-0a35-474b-924d-290595935621@suse.com>
Date: Wed, 9 Sep 2026 16:53:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/39] xen/riscv: add helper to check APLIC MSI mode
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
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <a36ddb794b06ec9b7c470d9e665126989f4db58a.1787838835.git.oleksii.kurochko@gmail.com>
 <1788510380.8631fc262581453bbf619ec5b2062170.1a06b86a1b8000c4f3@vates.tech>
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
In-Reply-To: <1788510380.8631fc262581453bbf619ec5b2062170.1a06b86a1b8000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1788965619-319CB2AC-E5AB16F5/10/73395122804
X-purgate-type: spam
X-purgate-size: 308

On 04.09.2026 10:26, Baptiste Le Duc wrote:
> On Thu, 27 Aug 2026 17:20:55 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
>> Use convient helper instead of open-coding the things.
> 
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>


