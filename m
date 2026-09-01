Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A38FC61DD6
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 08:43:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404624.1638284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1K5L-0003fJ-V6; Tue, 01 Sep 2026 08:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404624.1638284; Tue, 01 Sep 2026 08:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1K5L-0003fC-SH; Tue, 01 Sep 2026 08:43:15 +0000
Received: by outflank-mailman (input) for mailman id 1404624;
 Tue, 01 Sep 2026 08:43:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1K5K-0003f6-Fb
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 08:43:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1K5J-00GH3a-Se
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 10:43:13 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a96901e-bab6-0a2a0a5309dd-0a2a450cdbd2-36
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 10:43:13 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a969021-f479-0a2a450c0019-d1558034e99b-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 10:43:13 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-49cd77e0f95so6617905e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 01:43:13 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce3e4e7sm49150395e9.9.2026.09.01.01.43.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 01:43:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788252193; x=1788856993; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/0USoLN8FVdd3lcOS3ojDFiLfFOLRJm00uoUVfJAOck=;
        b=AFaxUP2d93AhTlx0Cf2LiDTB+/l3Eh7PpNKB0fyKX8qyqzpfiXP2j/BOjRkk1SwUrA
         x1dNwcuslvhcUX9nkT/Gdfk+LFG+cC/IcClxzNkSRAu9zGa5nuTNVDxXM1YTZMddP5Wb
         /XEIqh9ba5QQ+tRDs5GPCtIMN7S809yIQFeWHjV7LU3+nCXsiraW9olNzQLk/AaBPnl4
         ML2MFYsTv/StrNn8szCB5ZfXuf/TvZtb5mSTY+tuPXrth55rjQGtzFdtK8qTq6vj7Brk
         eCsmQNYa+7mLx8QTms5HxhHzPh5caH76PHwgTHZDjaaTvmtLSbc1JdYtW8MZkT2tYmqq
         qoXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252193; x=1788856993;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/0USoLN8FVdd3lcOS3ojDFiLfFOLRJm00uoUVfJAOck=;
        b=T+s0fOh0IPMQ5wmTH2iZfttOS7WPmX92HhvWGbeCPRPUBUVmGrecUvhqUN4yGLj4ML
         Bsghkby7lF+6suBvDVlbzZaSeqQvTa7ZM+AxNYo41rmpvPgH16WLuEqP3H50vwEG/XtY
         mdgsDiDPJnCc6QGqgJG6MFqjqNECxJJOn9QnNFDyFRgZfYNpyz8kgnTPI02VyDA5jJgh
         fVsnjxkDXGqWi9U8XmqRIJ1/T3KNk32MlDNLx5cwsxsoZLCcKbmG+oFXnPLKlN4SXfDn
         em/G9DZ8ZcgR0yZPY3VGHNANLNyjK4Fj6k6tHEKKVnjKnBi12LHnJqvCMvwACvx0Acj6
         hOaw==
X-Gm-Message-State: AFuF++m8ClGH+HIT5cRcpJnZ1KM8Lv4sVp+W/E4c3X1pANwpVdbvG80d
	RjES0iYr2CJh1SoX8LpExU1WE1nhjg30Mx58t7KF3ggdDvhCYv2aFWRi
X-Gm-Gg: AR+sD1094xFTjPk41Mu9Alwb8HHzm2cYVg2hZEFrMuT179e1umYPza6cJfmT2PbjFU3
	8tRa/iVi1JQMRrwJg1YkRMyIRm2oaiVCx8HeiipGALj+4TWPXabHTwrENRu1fQNZ3zzOyChCRkc
	MQxXSdjrTLFCIUqpCOIjJAOIKJWO8bstuaACfgHb6d9Xea+S0qtPHKMCVLiyFXHrIPzc5FL5bFX
	MdiGYnLFj6QgmlaJl02iT0Tqq2wmImvJZShv8D23bZ9AKXeCspV3DnIjjPfEk+IDJKy8rQPN1e3
	M2Je27+HKL9gBGbDjh0LwVaiy78x7MBid/7YWdxMqxvJXgea9+zskdWlmHf5KJDCEVbREeHY+0G
	6Roef1lgTp4gqgY8V9Ix/feyUU1w2bTw0ylUZ3CEL3OyqaFCS4ewJuPlZ4bj+DbGtIG5+NONblN
	UFHvE80J4lO9sWeBtJRiTm/yyrFL4Xx7r401QEqudaMeaon6ZSN1j/YS/mZthyiwI6+vthK3ysa
	wtq4MJSJbxOKtF1oNPi4ALvobivlmNNdA5tiV4owa/LuvS3kiPy
X-Received: by 2002:a05:600c:870c:b0:499:dc34:bdc with SMTP id 5b1f17b1804b1-49b91c1c401mr577745495e9.1.1788252192846;
        Tue, 01 Sep 2026 01:43:12 -0700 (PDT)
Message-ID: <26d9af52-8c02-44d9-b475-1cbdc451be5f@gmail.com>
Date: Tue, 1 Sep 2026 10:43:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/39] xen/riscv: request a G-stage flush on vmenter
 when VMIDs are disabled
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <4274740481062ef92a76debd9c3f1e8371858735.1787838835.git.oleksii.kurochko@gmail.com>
 <1788180504.8631fc262581453bbf619ec5b2062170.1a057dd2094000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1788180504.8631fc262581453bbf619ec5b2062170.1a057dd2094000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1788252193-76ADCA5B-49D731DA/10/73395122804
X-purgate-type: spam
X-purgate-size: 1450



On 8/31/26 2:48 PM, Baptiste Le Duc wrote:
>> vmid_handle_vmenter() reports that no flush is needed when VMIDs are
>> unavailable (vmid=off, or hardware with no more than one VMID bit). Every
>> domain then runs under VMID 0 with nothing flushed in between, so as soon
>> as a hart runs more than one domain, a domain entered there can use the
>> G-stage translations left behind by the domain which ran before it.
>>
>> Adjust the comment in p2m_handle_vmenter() accordingly: skipping the
>> VS-stage flush no longer relies on an old VMID not being reused, which
>> doesn't hold when there are no VMIDs to begin with.
>>
>> While at it, spell the other early return as a bool literal.
>>
>> Fixes: bff3b9ea4696 ("xen/riscv: introduce VMID allocation and manegement")
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
> 
> FWIW this comment and p2m_handle_vmenter() itself get dropped a few
> patches later in "implement vCPU context switching", which folds the
> VMID claim into p2m_ctxt_switch_to(). The fix survives there via the
> need_flush check. Is this patch really needed?
> 

I think yes as it is fixing current implementation of what we have in 
staging.

We could back to this topic after the discussion of "implement vCPU 
context switching" in the case someone will suggest better way to handle 
p2m context switch (probably without dropping of p2m_handle_vmenter().

~ Oleksii




