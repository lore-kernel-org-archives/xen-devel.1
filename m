Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3000C606A31D
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D1yYJnTO
Received: from list by lists.xenproject.org with outflank-mailman.1460896.1671767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGeK-0003Lo-Nd; Mon, 26 Oct 2026 09:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460896.1671767; Mon, 26 Oct 2026 09:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGeK-0003Lh-Kq; Mon, 26 Oct 2026 09:05:48 +0000
Received: by outflank-mailman (input) for mailman id 1460896;
 Mon, 26 Oct 2026 09:05:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLGeK-0003LI-5J
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:05:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLGeJ-002SQf-IK
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:05:47 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf17e5-8faa-0a2a0a5109dd-0a2a450c8c6e-34
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:05:47 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf17eb-f479-0a2a450c0019-d155dd33ece9-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:05:47 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48e4831c028so1158334f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 02:05:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb8e0sm14649379f8f.29.2026.10.26.02.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 02:05:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1793005547; x=1793610347; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JcGUxa8bXH2iNtwlafKecMCddrq/yu2MDsWjfcGsfk=;
        b=D1yYJnTOtz0pofuUQ2skm7YrGo6dKAUlQr4wFMuxP6/j3iI5P0vyAyW3l1+7J+WsDn
         VJ7fTKt9AasUxlx/0jSScvH1uMArf5yWThSdK+janrmL5WD2iq/Ji9mCym82C7ldlTGq
         rO/l6EeoWWRBEYPPXrsTelmiZVT39yaxJ2v4mlz5fs8R8kIP1FMt2vdexkP/uTn98MZa
         MsWJi5H8xFzoTbEFFfLFseFmcH+6rFX7q7D/LSS8QLIsCR3KVKmUIvY0LhBYc5Au/xLO
         t+erwuYeC1q1XftbYDOaaaP7mErA6+SAnAL22ipxh3iF+Ts54IKJLCxWvoatLcu2E65J
         JdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005547; x=1793610347;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JcGUxa8bXH2iNtwlafKecMCddrq/yu2MDsWjfcGsfk=;
        b=ZK8q71BishVKNVcBz2x04FqFUW9JCR+jTxbLQVpcUKxe6dMmb+7jp8BnSq9DJqqnPO
         xcCe9NH9wSC40ua3xKmQI5088UqeyImCDmRWgmr8X4e3VIthNHq8cgVefEeflsgS9Ye/
         c81OObZfG9HWoAtO9qCYVoaZOAeyXnmhdBBUqasP8zjcRwqh3QpPI4xMkPCgkkZgw/Sy
         FIWNuRl7jFlhwiTFcC/UmrtZdX9zTib6RVRgKEm9Fb3XL64SNLMfHsWIAUcyGO3r31uT
         BsbUPiVzqFaZYDJguJGhBE6mRPVbRI1rHfAHy5MNSAD/9WUaETH/LqugZCoB9weDGR+O
         2y8Q==
X-Forwarded-Encrypted: i=1; AKwUvBygKKUaay4uUS9e0s6a7uEqLuUbZ+f0/xgP7D0H5ONW5E4yaG9cNp/nNXQ1dCyY1lHKxD3Jjsu9loE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYI37CFL4WULP4djC4TBcN5YGmltbXD+vgqkSpznMi+ODjkrA/1d
	SPoeXcja3oIdhKQMemo/9lpChwEnTQcwd+Bl/Fgme19fLX9wuG6yQeY0i6yilyVLvA==
X-Gm-Gg: AYBFou0tlKmGQS7B4G5u/9AxDtdEl8Tdwo05oa1irShs/U4NFllLKByjmz3HpsxobjZ
	4zGRssmBQGNHrcwzTN3oAMP5jZA3Fo4jCrIRue3XA/uikch+ITvoGcPrlpE0zc9iq2A0P7PXv31
	SJVvnXpYydKlU/daIKSec1xXvTEiUlfFscRgY9xQGCUxvbZYuQxys7KhwRvGO7x7wFgb/7Y3B+8
	5TgpZG6JSFRQqQfOEI9G2/poIaUzE5kbCjznPmykRgy7DsBSvI3+bbhRggoJGnacFpRCy4IiOo6
	2reuiEsMM0VBAh/bv7vVPboj06EfLtRYk952FSjAgj2YiESDngncsderj5q5wf5f650rVrTZITd
	PdRxBaZdDTHFaRY03rfbe4ydozdIrow/uHBZ3gGRh4SYvpWeElsVlcfA1LcW/ugmIQ5DrRLjYGy
	XgwE8snDjieW+R8CxGkgRrLZQ55EAgor2/zDc7L5rTENjPQl+ffdd1z9JOnpdK5SX2ISJKx/BsU
	P+hduZWH+D8K9Fh7Ui2NoPLaJufqyDmQVQMrhPd3icNvsFnixKBvTwlLAx8QH9HAmxWVB6QUn55
	IkOqSdRX7nhuZsALEiIAwiqeAnUR2HhKlESrG2LT1vE=
X-Received: by 2002:a5d:490c:0:b0:48d:c186:dcc6 with SMTP id ffacd0b85a97d-48e3eb8ea66mr7920142f8f.57.1793005546816;
        Mon, 26 Oct 2026 02:05:46 -0700 (PDT)
Message-ID: <0fc3eb31-1aac-4b0e-8f9a-ae947dabe81d@suse.com>
Date: Mon, 26 Oct 2026 10:05:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] Config.mk: record hash of SeaBIOS tag
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1792436534.git.ehem+xen@m5p.com>
 <9771fce7e080b2d64fd9535b6e38d70781eb2de3.1792436534.git.ehem+xen@m5p.com>
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
In-Reply-To: <9771fce7e080b2d64fd9535b6e38d70781eb2de3.1792436534.git.ehem+xen@m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1793005547-03AD4A5B-E0A8233B/10/78276251493
X-purgate-type: spam
X-purgate-size: 1072
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19.10.2026 21:02, Elliott Mitchell wrote:
> Date: Sun, 18 Oct 2026 14:12:43 -0700
> 
> Recording the tag as a comment, but directing git at the hash allows
> bypassing downloading tags (git does not selectively download tags).
> While remote branches get prefixed with the remote name.  The result is
> identical, the tag is simply a reference to the hash.

I don't quite get what the win is. The middle sentence also feels, to
me, unrelated to anything else here. The fact that ...

> --- a/Config.mk
> +++ b/Config.mk
> @@ -220,7 +220,8 @@ MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
>  MINIOS_UPSTREAM_REVISION ?= 26ceb2daf95dd9e7fed9c83d36be3aaf1a0fa8a1

... we use a hash here, for example, doesn't warrant ...

>  SEABIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/seabios.git
> -SEABIOS_UPSTREAM_REVISION ?= rel-1.17.0
> +# rel-1.17.0
> +SEABIOS_UPSTREAM_REVISION ?= b52ca86e094d19b58e2304417787e96b940e39c6

... the use here. IOW if this is to be pursued, more explanation is
going to be necessary.

Jan

