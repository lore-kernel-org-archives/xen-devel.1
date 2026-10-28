Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC4C606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 14:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KafN/uUq
Received: from list by lists.xenproject.org with outflank-mailman.1463333.1674219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM4XJ-0003kQ-33; Wed, 28 Oct 2026 14:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463333.1674219; Wed, 28 Oct 2026 14:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM4XI-0003kJ-W0; Wed, 28 Oct 2026 14:21:52 +0000
Received: by outflank-mailman (input) for mailman id 1463333;
 Wed, 28 Oct 2026 14:21:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM4XH-0003kD-Co
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 14:21:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM4XG-00CsgK-PY
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 15:21:50 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ae204f5-e002-0a2a0a5209dd-0a2a4507edfe-32
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 15:21:50 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ae204fe-b4ea-0a2a45070019-d155dd2cb174-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 15:21:50 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48afbd2c386so628289f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 07:21:50 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecd37f4sm34217317f8f.44.2026.10.28.07.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 07:21:49 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197310; x=1793802110; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8WPmaxocSFLoWlGshpx6m4E6Y++C1Fna92wk+6234s=;
        b=KafN/uUq9BYhu7mAJH+lLxiyX+w/XGQZGIuIDzBl2eLlTCfK0zaEfrS3OVDDY3nN3a
         RvPxcd2U6AV/Q70k7tZcrLyezGGa4OjW59rjvpiDgc6cZChX8FwB4yGuiexWVbHtVL8w
         pwcjWMoYfzgTDElc+fVbDPXjfIyeeJncsk4pYxMJcmWIi1b+fIvXm/64IoaR2YU226Uz
         4L7yyuWodGngmQIk0/Getop4fo3TJsdeFiXQvcajRYShKLbxiqea5WIxLgZYConcf1ZW
         XCVyN7SNCDqsLJk1x0zFMriDViHPLW6IMk/ofc6BKsX8scqPrCC3Lw5eGOt7Yn/3hcwY
         4VgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197310; x=1793802110;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8WPmaxocSFLoWlGshpx6m4E6Y++C1Fna92wk+6234s=;
        b=2muUQqnhtA+pJWkOGIo/UTTQzA7dI6CGKjirRcdZSyxBisdq9lu4ck5mwiefHeADjc
         AaMWrus5szimDwJ9jgm/BxYN/OI3hIf7jFqN7FFEWls3hOBpBzIl9YpM2er8MghFawhO
         1KT5mLhPwcPW7Jk/gvLjQZFptxNzdlFu7ovU9Ag8fEDhqrWIlMiwCG0/rCeEULDu5ViM
         /JDEq0jf2PEO8kHmJPcGQ9MGfR+2Q1onmcoF68kGzrwjBFC6f15tbdUpjHXYoTJS3Jvm
         oC2KU9IDcQDrgIjh0v9xn+L9ejJn2Yb7y5Z7wYKB0W7/UQl5/xuodL5JZcuFuuCBQzjf
         Z3zQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+5MJkDcg1n9mtk1edxLUtPSz8XLIRAOZ+5KYnQURj8yGEgKkuLhZHlpKEvpQvroQWc6wzs5ZSr5s=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKAls/q9zJ7ZUdczsnLCEr/qL2qKf/ehoq7n3CHSWEFByoAVSR/
	QDrm/MJkkXKl27cnrWS49O2hOLtOH1+f+aLmhQJC0VwrYPNcKYmTKnp2
X-Gm-Gg: AYBFou3RR9Xh1KP++at2NagLqIFav5+kwHTAy9DW3ymBVkYoFRTJ0jz6MXV9yWoKBxH
	CBM0k+Vu0njSksusE+WCLNApnXKwCEUjS22wEwkpXZf9dHcPEEY8eo3esjqQ3gxXOxg20gysH0p
	ZNOATICuVuyd67ky2UFtt8H6X33b8u4HVJ7cYctsnZDztTnCcybCFiIAddB1mhELISd9IpT97Q9
	9ir/xy8JqDOMYDIB/Enh3NvFxiZFiWzV900hdcAWk2aaTRgJtZrzkWhHbvuHwCCJ+D2yRCOmyxk
	EK7sN2q333DVBBaTsCrZkbGJzFlukds+7q7Ppar0Mco+GeeSgIAogLMlzXfZntqXEoYcPgmKCKx
	PPjCoPVQlv+KZkid0NiCzRSZbXQ58403SIV+3lu6W2VTt9nlAtgYHSk3Rw5n8OmOcB2/iCpSqCE
	OPzK97k5/1FazXTs5m3uPymqJ9I3MW3co/JPpLpD4If2RgtRvKKVM/Ioco8iEk06OkqWlSsiM7u
	g1BTnQQ/wN9/DpZlQAS8Nu/Acb0VM8Wawyjdx4dJm0XfdINOrScleT5SSbM0paXVdEf5M8HtG6Y
	YbYvYoTBgeemomJoIHykul0kaWI2wr+R/TFDZ58NGQsVUxF0HxkSUvs33PLboM4OUH2P/HTI+iQ
	hgw==
X-Received: by 2002:a05:6000:41c8:b0:48d:faa6:cedf with SMTP id ffacd0b85a97d-48e5d5e01d4mr6431632f8f.56.1793197309868;
        Wed, 28 Oct 2026 07:21:49 -0700 (PDT)
Message-ID: <19bc2130-aa66-495e-8f43-b1ce263142fe@gmail.com>
Date: Wed, 28 Oct 2026 15:21:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/1] xen/riscv: probe the A/D update scheme if the DT
 advertises neither
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>
References: <1793192679.8631fc262581453bbf619ec5b2062170.1a1829cd6d5000f79f@vates.tech>
 <1793192757.8631fc262581453bbf619ec5b2062170.1a1829e0a63000f79f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1793192757.8631fc262581453bbf619ec5b2062170.1a1829e0a63000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1793197310-A64DBAE4-541D07A6/10/73395122804
X-purgate-type: spam
X-purgate-size: 2139
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/28/26 2:05 PM, Baptiste Le Duc wrote:
> p2m_set_pte_flags() presets the A/D bits of G-stage PTEs only when
> RISCV_ISA_EXT_svade is set, which is correct only if the device tree is.
> 
> The privileged spec allows exactly two schemes for updating the PTE A and D
> bits: hardware sets them on access and on write, or accessing a page whose
> A and/or D bit is clear raises a page fault so that software can set them
> (ratified as Svade). Every implementation uses one of them, but platforms
> designed before Svade and Svadu were ratified, such as the HiFive Premier
> P550, may advertise neither.
> 
> Trust the device tree when it advertises Svade and/or Svadu, as for any
> other extension. When it advertises neither, probe the scheme in effect
> and record the matching extension in riscv_isa, so that such device trees
> can be used as-is, and warn naming the extension to add to "riscv,isa".
> 
> Introduce probe_hw_ad_update(): alias the first page of the Xen image
> read-only through the FIX_MISC fixmap slot with its A and D bits clear,
> then load from it under an exception table fixup. Hardware updating is in
> effect if the load completes and the A bit is then set. The probe fails
> otherwise, whether the load faults or completes leaving the A bit clear.
> The A bit being set by a speculative access still implies Svadu, as Svade
> only allows A to be set by software.
> 
> Add Svadu to the known ISA extensions so it can be told apart from Svade.
> The comment above the enum asks for new extensions to go at the bottom to
> avoid shuffling, a leftover from Linux where the IDs were macros with
> explicit values. Nothing depends on the enum values, so have the comment
> say that multi-letter extensions follow the order of riscv_isa_ext[].
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
> Changes since v9:

Nit: something wrong with version numbering. (in the case of v11 would 
be nice to fix).

Changes itself LGTM:

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks!

~ Oleksii

