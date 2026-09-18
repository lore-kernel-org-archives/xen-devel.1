Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8738DC982D7
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 09:40:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425082.1649238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7V55-0007ct-GI; Fri, 18 Sep 2026 09:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425082.1649238; Fri, 18 Sep 2026 09:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7V55-0007cm-DO; Fri, 18 Sep 2026 09:40:31 +0000
Received: by outflank-mailman (input) for mailman id 1425082;
 Fri, 18 Sep 2026 09:40:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x7V54-0007cg-Cc
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 09:40:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7V53-00AmjB-5z
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 11:40:29 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aad0702-8faa-0a2a0a5109dd-0a2a4506be14-34
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 11:40:29 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aad070c-195a-0a2a45060019-4a7de18caf34-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 11:40:29 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912e2406so2717085e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 02:40:28 -0700 (PDT)
Received: from [172.18.138.134] ([185.104.138.149])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd1d0978sm140552405e9.2.2026.09.18.02.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 02:40:28 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789724428; x=1790329228; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JkNFZK8zTFrojIsmneiElLQx70lonjihw5v2IEa9ZLw=;
        b=g8oNRoTn15JQ/HpIqVh5yOLRhNhbJ2eGiTIGHktyxiRaFuwKTZuk7RR3imyNKhMuY+
         LR3Ejm3UGicJPWmXhmuBD87PuZ0DU0x1HLV2lf+9CtLqtsn4To+uZ+1BIP14+QsK14va
         ArFV8DQTaj8wrxbByZONVq6YPyCqL2s66QtiqW89Sa9+51oe7GWzlmuFvgrJbO8HLcw7
         JH+7O5uUuMF7/GwGCNcInlCvRl1D3uvdxjQ8CNkWrrBiXhyfx0Jt0BYa6fTbOuSksuVE
         Dc79HFPp1p6H0uUqYaWOpnj3ApL7wfzVnlacInX8sRSGBbOM6E5HF1on4+OaeE6m0CSU
         kApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789724428; x=1790329228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JkNFZK8zTFrojIsmneiElLQx70lonjihw5v2IEa9ZLw=;
        b=AzU7duVc4WQyLtJFx+9K2QkU6BF6HTX0BMcl2J9ZPu+5ozD0tEwDFLvKVIQiT3CxIJ
         4vfROmLp4PklojiVM0ILZja1fbP7rrDWfBT/a0oO0TnxExJeLmioXC7KlkfiTZ68pBtv
         OKY+33DzR9L0LOAaMPMSwi3Cqy5f5QeSDJxxBQ5NPJORV3tIYtRBgzjiY/HLJP/5NjLj
         8Ruzey1lSQ6AXj/BKkajMnIsK4r91eijdksZArj2WpfynnzQQNReQAwvOyuBXZLpx8R1
         FuqpH81NddEhcH2D51GpVJbWrkQwI8S/Yxf75hFUg14+M/1KH9cCQXpv59UM24DxBxBV
         O3Qw==
X-Forwarded-Encrypted: i=1; AKwUvBy1hLGAK5QRAoYi9CFCJVy67K1JbW7fYx78fSATxcTnzmMyBIuLhrHFTn0rOP04MzTOP7Oa5Y+MqtE=@lists.xenproject.org
X-Gm-Message-State: AFuF++kTalnOLiUTU+7TF90M/7jbInTiavRM2Ky8j5XvrDP/Nbyc5pvo
	PyGh61MY98+Uz2eamOdughKCqH9eMt3LrUO+hK1aHDWcyVCBaW13sWvZET4PXuxnQQ==
X-Gm-Gg: AYBFou2gJfgJr57JlZB9/tZSsLrVHhCw73DQ2qeEgyo/sBq101B3veQeBBWGm5yeL86
	vONFgKi7Y0ZWNwkDK8eFqDMq2twG2Xk/8nUX+2EicrQWNi3xbdhdUMkx2Jiod/t6EsyOiovnil7
	WUrnsZa3Rs+zR1I0G8Xy5MO3QMDCYXdnBkcFMDHfNfmnwhqt1Om+1u0lPJu83jzu1HUV0JPGO4A
	1744k9Pbll87K3QPimXsERoyWli5zAx9LTzgdilhio2G4TuEJVDb2D4cdWR50K2GvljI7Gv2lY6
	QtXFrFQfrwYXVHUVKppLxqd5RHF9+k8hJC9A3kZ+HMczGRYJ9+QJ04GEuUaqzcpNJBnh+Or05xw
	nNbbGX8xhj4ZBxTbawJsDi2DdrwzPXVtdolXsFOWPRA/Co5IGAFwBGtu8klPsHWHuQq8ywwdkvB
	bovp05i+9E+Uf+DtTv9lkw4BapujYGsjhGF2tByNJ4dqa59fc/OdX3B3U6kRHod//Xn7qvMdx6w
	z3kCiB/w80=
X-Received: by 2002:a05:600c:83c9:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49fc4ff402cmr26600375e9.10.1789724428452;
        Fri, 18 Sep 2026 02:40:28 -0700 (PDT)
Message-ID: <e0f7e2ed-c577-49a2-9640-a7865350a85d@suse.com>
Date: Fri, 18 Sep 2026 11:40:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] xen/sched: rtds: add global-EDF utilization
 admission control
To: Furkan Caliskan <frn1furkan10@gmail.com>
Cc: jgross@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 xen-devel@lists.xenproject.org
References: <20260918080935.35498-2-frn1furkan10@gmail.com>
 <20260918092433.42891-1-frn1furkan10@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20260918092433.42891-1-frn1furkan10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1789724429-FCE0677B-73ED34CB/0/0
X-purgate-type: clean
X-purgate-size: 2077

On 18.09.2026 11:24, Furkan Caliskan wrote:
> RTDS has no admission control: nothing stops the sum of all admitted
> units' (budget/period) reservations in a cpupool from exceeding
> what its pCPUs can actually provide. Once that happens, none of the
> EDF deadline guarantees this scheduler is built around still hold
> for the units sharing that pool.
> 
> Introduce admission control to prevent this: reject a reservation
> whenever admitting it would push a cpupool's units over its capacity.
> Track a running utilization total per cpupool, and enforce it in
> rt_alloc_udata()/rt_free_udata(), the paired lifecycle hooks for a
> unit's creation and destruction. This catches the default
> period/budget every new unit gets.
> 
> Utilization is represented as a fixed-point value: budget is
> left shifted by RTDS_UTIL_SHIFT (20 bits) and divided by period.
> A plain "(budget << RTDS_UTIL_SHIFT) / period" risks overflowing
> the multiply for large enough budgets. Rather than widen the
> arithmetic to tolerate any input, the input itself is bounded:
> rt_validate_params() rejects any budget above RTDS_MAX_BUDGET,
> chosen as the largest value that can be left-shifted by
> RTDS_UTIL_SHIFT without overflowing 64 bits, so the shift in
> rt_unit_utilization() can never overflow.
> 
> A cpupool's capacity rt_utilization_cap() scales with the number of
> scheduling resources in it. It is calculated as:
> (number of sched_resources * RTDS_UTIL_SCALE * RTDS_UTIL_CAP_PCT / 100),
> where RTDS_UTIL_CAP_PCT controls how much of that capacity can
> actually be reserved; at 100% (its current value), all of it can be.
> 
> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> ---
> v3:
>  - Fixed indentation.

Looks like you re-sent only this one patch as v3. Such can be a little
confusing. We tend to call such version 2.1 or 2.5 (using this example),
to better identify that it is not a while new version of a series. Just
for possible future situations like this one.

Jan

