Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EE8606A320
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 09:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s5UxANSn
Received: from list by lists.xenproject.org with outflank-mailman.1497967.1695992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xULIm-0001eI-7d; Fri, 20 Nov 2026 09:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497967.1695992; Fri, 20 Nov 2026 09:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xULIm-0001eB-4s; Fri, 20 Nov 2026 09:53:04 +0000
Received: by outflank-mailman (input) for mailman id 1497967;
 Fri, 20 Nov 2026 09:53:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xULIk-0001e2-Si
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 09:53:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xULIk-00EuTD-9I
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 10:53:02 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b001866-bab6-0a2a0a5309dd-0a2a4505d28a-36
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 10:53:02 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b00187d-4cb1-0a2a45050019-d155dd30f1b7-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 10:53:02 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-4ac08f4a0b2so384335f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 01:53:02 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b110c3csm4841700f8f.36.2026.11.20.01.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2026 01:53:01 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795168381; x=1795773181; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NwiF/DcN8jgxIWp00LCnStrkG/4M+ocEq6fMEZPB8Nk=;
        b=s5UxANSn87P+rJCXFMqHnlNqd9AFuj0Lk/tZk0xDqY45P/Jq7mXXkmTSwM6yJsdIQ7
         P1brjErNbWCnxJ6bu66QwKzmL7jS/jeO3BNXpYcHbEAEa3Vpwquyx9bx3q/JNcjZaV/+
         htoRNqYHy9i0DoY3MYypvtB9xeCaG3lOQv7l92UqcB5dBLEZEoNNUkK8Hmbs1i/xGTuF
         obB2SB+3R0hIXKIKdj3WwGf1h+ag9e+FoWFjiZMJzVMV0mz/nrpoUDYb/CnFRxpP6+jR
         A8AL6RnXQWzghTgV0jnmM0Lkygu8L7u3S3aTE/eDnaU7OvIuxSgKKRV6u7Gw7OReyKah
         G4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168381; x=1795773181;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NwiF/DcN8jgxIWp00LCnStrkG/4M+ocEq6fMEZPB8Nk=;
        b=hiUhmUnN+o0O1eiz9x1Qk/B86tLEbl13BhOlmVZJ4MQ3r8BKnsbrc24LITlPmomypC
         ma6s3ABlykA/CRrCVfWg4EegJ2pA3zlriPmkbLgvAfdl78ln4BUOKO7800ujeYAmZlTX
         0jQDHGGuH4tV+97RnRmwQnL36JYeJH3qlbpfGV6Mz8GiPUM8RtSoL+eRDY94F6MEG0aM
         etMnf/7mEoPCMEqPJiMkxJ4Poe7sHHY2V7/ycdEQV/UNTrE2BwgwaDAawvyv1Z1sdkob
         v43z7MZ9Muz016K5+DJN6ZhRXJuxhVsiUYJrbVrmgCnMMy3mSM3KBjXblH4mdc4yRP1e
         PXqw==
X-Forwarded-Encrypted: i=1; AL+hErGs0E2GTTUwMUOHJFZlXr2zy2DMO/IQqL2w1jjpSzndP3jzxvZDcT/nSZrGR7OgE78gVhMHBAeZy/o=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8DoPwsln4UpXbWhnpTjYPR2JNL1HcB8ZdObdtqr5KOeUJzeXaE
	mUxPzxWOwloHF6Wd5bGDI/PGd4VKTHkcZYldQhN52WOdEdQUEDmwi/Kc
X-Gm-Gg: AZFdTZdRAyIBuC1/Lkid0PtZaJgQ/dRT4yKZx3H/wXqSnIFrqWauunqjy396ynr5asv
	Sk9Y0AtnC5EFy3dDU6jTkAlhh1vly2AgPNhQa6KkamSycqPMAMgQmBcGlpi7Y+E5VYuRHySS1D8
	wFAW46T1fQ5Yexodw++rbicnRx6R3B0gOgLW1HPkhlq0QGFXSB42y3mRvZ/z+zuXCCdcOo2/lOh
	YUS8Zv6aMq/v4sGfX5hK7Qmp1MQreTRgjaCzFDYOPLf4R/VYlkON/Nxk5k5DSCyuyjk9S665kbw
	2Z0ZdWTVoSQqva0bEZKMP1Xk7sAosTtmrnIgH+tk0YprhCK2n2ZrAnNr7XcMgfw0Q8cvuwsEa0v
	zw2ofdYzYK2jAfWP139/jXV4APGmQiNQH3/4bnprsm5zjIe1sltCilBd8d5Kr5rknhT7bYs7dLs
	6vDv+Pdor1eV/KJ4fMv+7/S21xoK45B1jDenFOFgCz2z8TyJ7L7eD41dAMh/pdu1ZH3GhzpbXz1
	JnM1smXsnPcOUAgjsvRXEpEZgPumccrsVGNTKr+bSgGp5fx08Kxk/VPrd52TNOLBcElzGODUUoT
	67osTkCd1lWT3frsJtdiA0LU9V6jyPxQvLiiLxddkcrmf9iyDXe5Tf7dh0dVUyFh7dGKEQiEC2x
	TaNPIBaIZY9/1K9A74eEfsjg=
X-Received: by 2002:a05:6000:2986:10b0:491:ef0a:1f5d with SMTP id ffacd0b85a97d-4abb32a41f2mr3835109f8f.39.1795168381481;
        Fri, 20 Nov 2026 01:53:01 -0800 (PST)
Message-ID: <5756b903-4458-4e89-bb43-c383006e8916@gmail.com>
Date: Fri, 20 Nov 2026 10:53:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 16/26] emul/ns16x50: add Kconfig options
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-17-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-17-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1795168382-F56AD2A1-2F009CE9/10/73395122804
X-purgate-type: spam
X-purgate-size: 2307
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/11/26 8:47 PM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add initial Kconfig options configure NS16550-capable emulator.

Nit: "options to configure the NS16550-compatible emulator".

As said in my reply to the cover letter, 04/26 already makes ns16x50.o
depend on CONFIG_VUART_NS16X50, so nothing added by 04..15 is compiled
until this patch; that's how the build failure from 13/26 went
unnoticed. Introducing VUART_NS16X50 (default n) in 04/26 would avoid
that.

> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/common/emul/vuart/Kconfig | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/xen/common/emul/vuart/Kconfig b/xen/common/emul/vuart/Kconfig
> index ce1b976b7da7..353a6325180e 100644
> --- a/xen/common/emul/vuart/Kconfig
> +++ b/xen/common/emul/vuart/Kconfig
> @@ -3,4 +3,24 @@ config VUART_FRAMEWORK
>   
>   menu "UART Emulation"
>   
> +config VUART_NS16X50
> +	bool "NS16550-compatible UART Emulator" if EXPERT
> +	depends on X86 && HVM
> +	select VUART_FRAMEWORK
> +	help
> +	  In-hypervisor NS16550-compatible UART emulation.
> +
> +	  On x86, only one legacy PC COM port is emulated for domain with a
> +	  certain ID (set via 'vuart=<domid>:<compatible>[,com[1-4]]' command line
> +	  setting).

The syntax here doesn't match the parser in 14/26, which requires the
name once a compatible is given (see my reply there).

> +
> +	  This is strictly for testing purposes (such as early HVM guest console),
> +	  and not appropriate for use in production.
> +
> +config VUART_NS16X50_DEBUG
> +	bool "Development: NS16550-compatible UART Emulator Debugging"

Is it really useful to have "Development: " here?

> +	depends on VUART_NS16X50 && DEBUG
> +	help
> +	  Enable development debugging.

Please describe what it does. Besides enabling the emulator's
warning/info messages and the body of dump_state(), it prefixes every
line of guest output with "FROM GUEST ", i.e. it changes what the guest
console looks like. That's surprising for a debug option: anything
matching the "(dN) " output, such as test scripts, breaks once it's
enabled. Note also that ns16x50_debug() stays silent even with it (see
04/26).

> +
>   endmenu

~ Oleksii

