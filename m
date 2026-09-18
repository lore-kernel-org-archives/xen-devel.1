Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3884C982DA
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 12:38:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425251.1649314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Xr0-0008SD-In; Fri, 18 Sep 2026 12:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425251.1649314; Fri, 18 Sep 2026 12:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Xr0-0008S6-Ev; Fri, 18 Sep 2026 12:38:10 +0000
Received: by outflank-mailman (input) for mailman id 1425251;
 Fri, 18 Sep 2026 12:38:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x7Xqy-0008S0-Qw
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 12:38:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7Xqy-005ael-7X
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 14:38:08 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aad30a7-2eae-0a2a0a5409dd-0a2a4502a246-20
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 14:38:08 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aad30af-6ca4-0a2a45020019-4a7de18cab94-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 14:38:08 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49e69b9e16aso7528735e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 05:38:08 -0700 (PDT)
Received: from [172.18.138.134] ([185.104.138.149])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc7cfd1dasm53323355e9.9.2026.09.18.05.38.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 05:38:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1789735087; x=1790339887; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMbZVRoEVv18/M/zoCZMGwivp/WJPkEWRsrNCnLDBuY=;
        b=TBm63X+HB1E6hZNgVdd04kLlIyrgRegk+nWeV3k/w3Ezh8cO2KZSuuZtMBKiz+Dh6i
         ghK6v6GWSVU/py+ZpSekJhaecQW95RYGKee7PVcoZa0ncktweZS2P3uwqWSqitdq5w50
         qkfxj92LFrY3dGlJ59Own+psDQ1ZEiGeDiXjAgiXur/Fl2guZGs5lz0FaAdlIGe6vFZA
         NQ+Rch+Zdbs6baPYpOr2ea4l14SyW/FsnyvPMADu8asg374WAHQNueU1ghLWL3LLCfnZ
         luYZx0wAvvwAdEhJkh5grbeQOtVUBxw9m6o93OQ6Sm9PCx8cgtKZ8tUzDRVr5IQClDWi
         6bgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789735087; x=1790339887;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMbZVRoEVv18/M/zoCZMGwivp/WJPkEWRsrNCnLDBuY=;
        b=P4O3gdbO7Iic+3dNg4ggOsXmjD3wIvwh4g6fisNdTlh8bEbCxm9MoRqqBuoOHxGy3L
         CVu4easkd5otq8PT2BwrH5UOiR1mE73xRx10lWNivCoYSeoITj1P5OrwQc6YLubaTk0s
         0caFYQa9rVOD5ux5eW8fRbOGBOY2Y+x6zsL01Y7rlYjhRApGaV2Hk66ZFdYQGKP/0eMX
         Fil88prnQ6NX8auoRPSHkpoY9nvTe19GWGEZNZmg5oZflo39BDVTK1ThPJWoPjuAMaEg
         lVE9WyjrhL4F/1C3fDdhMNxBAP2YoneomiM1U11hFC5pdAcBMBPGI1ybw1NfRE7XwB/2
         RddQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNDSoQK5IVYu2lt/3MyggN1O6Da0Qlz6xPr5NOYNS+G0oSi7c1eOqWd3EehwJDk88XY3LdPR/P7js=@lists.xenproject.org
X-Gm-Message-State: AFuF++kXcPzWuAUI3v2hGmAmehXgq+UTDoMgTdpyJCRHUXkdx+2mfNUw
	vgLo107RwuT+g73QzAl+FCiL9/6Ubd92ypgW9mRll8jbm9Ll8tlPNzjl1QFlelNB/A==
X-Gm-Gg: AYBFou2wvoYjFD4L8oAptZRMBj4MpvDya9jvlL+qDYQjr2tPgRgI6i482RgEO/sPm1m
	PkmMxPEeTuBsUiZunuCesQLnhSsgYv5WKl7eb5ThL/ef0sQMD+4WCg+sAqZs1z8LoypH0pZ2973
	iTOWLaKw4rViAjO89uTcoivNZ9lRFGe79HdqnA1d3Iu9dwF/1ybeFABvLg6P/J/qR/OXYhpbGLx
	7YvOw5qaDwouESo6Xka8g5bzVsIzK/hMKK0Vr2Zy7j4vF6rNvDAe9X4EYg8wk6cVkm0+OGCHUBB
	H+G9YFuQLmbFzFsS8Szj4Rx0ubDKlKJ4Z1vWxpAZngs+dVB1ILwqcTK8XdwyEx5IiGJMKeP3Uto
	Cq2cKIUQSf2XaGbJkYuPJwO9EllUj5udrvnDmh8MorwcgCa/9ZjFR8PMhFSZXH/ddKjbx5GGDCc
	qDHxCYJRn4u1AwZafymjIN7y5Ugvs8dDz2VGs+NQJKewTqbfDLfdIMtnNLl7/ByPNvN+CiAZhv2
	y+G6WBO9PYB0crL+pPgsg==
X-Received: by 2002:a05:600c:154b:b0:49c:fa21:1c89 with SMTP id 5b1f17b1804b1-49fc5748e61mr31680575e9.30.1789735087642;
        Fri, 18 Sep 2026 05:38:07 -0700 (PDT)
Message-ID: <7124bd3f-1479-4685-a090-e05251eff53f@suse.com>
Date: Fri, 18 Sep 2026 14:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 35/39] xen/riscv: add basic VGEIN management for AIA
 guests
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
 <b84c2624e2f49e99a5f29439f4f01608eb1e5825.1787838835.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b84c2624e2f49e99a5f29439f4f01608eb1e5825.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1789735088-30BC02AC-A92B8B85/10/73395122804
X-purgate-type: spam
X-purgate-size: 1086

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> It was decided to add support for IMSIC from the start instead of having APLIC
> operate in direct delivery mode, as it requires a trap-and-emulation approach,
> which is not optimal from a performance standpoint.
> 
> AIA provides a hardware-accelerated mechanism for delivering external
> interrupts to domains via "guest interrupt files" located in IMSIC.
> A single physical hart can implement multiple such files (up to GEILEN),
> allowing several virtual harts to receive interrupts directly from hardware.
> 
> Introduce per-CPU tracking of guest interrupt file identifiers (VGEIN)
> for systems implementing AIA specification. Each CPU maintains
> a bitmap describing which guest interrupt files are currently in use.
> 
> Implement helpers to initialize the bitmap based on the number of available
> guest interrupt files (GEILEN), assign a VGEIN to a vCPU, and release it
> when no longer needed.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


