Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C46C79FBF
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 15:31:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414907.1644577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4gkV-0005S3-0c; Thu, 10 Sep 2026 15:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414907.1644577; Thu, 10 Sep 2026 15:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4gkU-0005Rw-T7; Thu, 10 Sep 2026 15:31:38 +0000
Received: by outflank-mailman (input) for mailman id 1414907;
 Thu, 10 Sep 2026 15:31:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4gkT-0005Rq-Fm
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 15:31:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4gkS-00BQ39-Ah
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 17:31:36 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2cd54-2eae-0a2a0a5409dd-0a2a4508d1fc-18
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 17:31:36 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2cd58-f659-0a2a45080019-4a7de18c9b75-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 17:31:36 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ccfd61ecaso16734105e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 08:31:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e60acff8bsm2327695e9.9.2026.09.10.08.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 08:31:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1789054296; x=1789659096; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4SPLbzlCvwgwrhKUAWcpiIrjD9PKd3A7Z3K0mUUna0=;
        b=NaNXnuhM2b2iK6iMTI8JOi1TbswxAhRFPh0ZH10p0paQtCa4OU2zWTjwYSeVn3fPap
         8APWkYDdHeeWWxEUM94qeHNUO2ViLoGSusnXsSoCIHKKLbLGNiPSulZkC36HAtcnyHfg
         flehqC8kiuBecMgE7j5NYm2WwPCbkDTZCXQNjgvjyCBTAGvbrmibpzlTw/F1LK72BLq9
         KBpcu9lFVt0zgaOpp3eatbPdVj3pLeix6P3ufddPHCteLq3DuUz3GTYUbUk5nWpr7GJp
         OTqIxX6lwNvsYfgDRdNJmy3f6rXt/qRtKO2zNpiJh1tAtBUhwvXoTvULIOSs4HEwXkuC
         XboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054296; x=1789659096;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x4SPLbzlCvwgwrhKUAWcpiIrjD9PKd3A7Z3K0mUUna0=;
        b=cQvoPsNGQ4ebLQjMqfKgEnhEXpnJ/dx9UcQho75cgPRscY09hOYvURFsKhf+RA99xd
         aoSWK4hDlO57xCKEKOTudhcciz/564jhUadjd1if0JH21XC5oNS6N93B88dM/EPo0egR
         Ha9pOoWpy+sPikSLstCyB2tPxGgHdqumXOzwfx1uL7RDeCJ8Ttr3iXxMNccTcNe8HaIV
         opGqv7IsiRvSMR1UpOV1Tf7uNRozQAahb5gZeTJMqae1xDJepbI3S0MZGXjVKwY+m1b1
         e3dUtCSncwDPY4p+aNxUQUp1WwAq8HYywkD2lBVjcA42g8shEkJNYiBkyOd2GbukftGz
         s4zA==
X-Forwarded-Encrypted: i=1; AKwUvBzf2NJYgZrqm5VVj4qDKwlMgy71ybXla1EDnnEzqlSTTrijTfvFt1SfPGDU+CLM+UXpib3HJ4sgtUk=@lists.xenproject.org
X-Gm-Message-State: AFuF++lm0i8KtDNLpro7u0CArMIzUkgfrms8oFhuDL8CUnxtuUVtidih
	qOnbLyoUKcoQ9ph49BwujFXIyxoZ71hejrocEscPa+9i5kdfv1Xky3hh+DIrYDxivg==
X-Gm-Gg: AYBFou3doC8J7aK5oLo4MuX243ZJKeUUW7UE9EKnXkCJ8hbpWvwWx+cn8S5zAoQ4NH8
	y8vGZ7o3hpEDSylwffjvpjBhMvPqErwd8k3kshRsMIjiVs8Hg9enPSdcslMu14LhFxfgpIMNPqw
	1ACxG1MnFDOwhk4QUMU7LbE3M2RWcPeIHP4La0pjLGtVHXxrw9JK3C7Zw8WZEKUPAd8/llOBETC
	aelxd1OOizhX0YsVr0q14fGwlQXG05YO98sdsmQ+yBrxHJame2u9Gs80eZsMiP7fLnuAOu8pJYN
	uAvgr5CLCHsNcqlSrs2pWyL9Q32WolxPPOz8S/jFk2VbzFaBAKBxLey5ZXdGzV/kMM3F6+DrAhz
	2qoQoT5TrvEHSdGIwbz8IRuMrOQN+UfvOuB2ysGMEEhDax9V5gte0xIXUn7a4PUfY+PaVB1z0fX
	6xUMomfFqNhy/0ryKycsbSZeYUlevamL9vCUHBJMFaJsqMCQNg3fvnPST+GBqOzbERCSxKEuYPM
	8KFbwnjcEEtOxPpzbWj8far90Yk+5sCQU9tppNP1khlITqdrU6hsysfZd5JCw8=
X-Received: by 2002:a05:600c:c48f:b0:499:4e47:eaf2 with SMTP id 5b1f17b1804b1-49d258cda4emr80092025e9.6.1789054295628;
        Thu, 10 Sep 2026 08:31:35 -0700 (PDT)
Message-ID: <9d80640b-5e55-43b3-b4f5-fa91b1fd0bd8@suse.com>
Date: Thu, 10 Sep 2026 17:31:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/39] xen/riscv: look up the exception table for any
 trap taken in Xen context
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <c8c767e5932057e1fe3ca7756246ded691adad4f.1787838835.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c8c767e5932057e1fe3ca7756246ded691adad4f.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1789054296-CFED287B-08D6841E/10/73395122804
X-purgate-type: spam
X-purgate-size: 1572

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> do_trap() consulted the exception table only for CAUSE_ILLEGAL_INSTRUCTION,
> which covers csr_read_safe() but not the hlv/hlvx sequences reading guest
> memory: those fault with load/store (guest) page fault causes and would
> reach do_unexpected_trap() instead of their fixup.
> 
> Move the lookup ahead of the cause switch, and gate it on the trap having
> been taken in Xen context and not being an interrupt:
> 
> - sepc of a trap taken from the guest is a guest VA/PA, which the
>   guest can point at an address listed in the exception table; Xen would
>   then act on that entry and, for EX_TYPE_TRAP_INFO, write through a
>   pointer fully under guest control. Entries are matched by exact address,
>   so this needs no more than a numerical collision.
> 
> - an interrupt taken at an address listed in the table would otherwise be
>   "fixed up" as if the access itself had faulted, silently skipping it and
>   handing the caller the interrupt's scause as a fault cause.
> 
> Returning early skips check_for_pcpu_work(), which is correct: that only
> runs for traps taken from the guest.
> 
> With that in place a G-stage fault reaching the switch can no longer have
> been caused by an hlv/hlvx covered by an entry, so anything left must have
> come from the guest; assert as much.
> 
> Cache the "trap came from the guest" test in a local, it is now used four
> times.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


