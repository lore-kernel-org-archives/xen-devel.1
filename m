Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9154ECD8C8E
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jun 2026 07:40:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1331415.1593980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWUaK-00033x-Fc; Mon, 08 Jun 2026 07:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331415.1593980; Mon, 08 Jun 2026 07:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWUaK-00033p-CT; Mon, 08 Jun 2026 07:39:48 +0000
Received: by outflank-mailman (input) for mailman id 1331415;
 Mon, 08 Jun 2026 07:39:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wWUaJ-00033h-GZ
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 07:39:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWUaI-001tLm-TR
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 09:39:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2671c0-bab6-0a2a0a5309dd-0a2a450bc538-6
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 09:39:46 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2671c2-212f-0a2a450b0019-d155dd2ce42d-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 09:39:46 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-45ef372c58aso2106961f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 00:39:46 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f35eae5sm50715486f8f.33.2026.06.08.00.39.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 00:39:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780904386; x=1781509186; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=23qm0d5KWCx6MFl1bXlqgbt7P2zuyGRtoJlUPBkMhKE=;
        b=hUURcQ2nXDi6DEG+dvGDdw3KiH3Cox/lqQiCl1f+hWIvgm9zSaCBM32nA11MqIsl3M
         BoQTkSFOPiTWnyT4oDgrpylx2MwZvmqaiaBSSZAd8vXt4kzTdHn7wyEhS18HTaAVWkjX
         DZK8k9P0TU3FANLHDPPqxgkezR/ivL6qGwgkNlXJXGB3nG4Z3SniwgKCTcD0zttx4nhA
         xYRm9xA6dhcaFih4zzXwBeKSEbP32dEXKN9R+b1MjYgva5zp8HnwLCdEyA8rK2inbqy1
         hZeR7wYjzl0BtCHBeT/bLziRtBiMfe+Q010GXwvLkFZd9JlFRWEBlsvOcxT12kx/Ns/L
         trfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780904386; x=1781509186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23qm0d5KWCx6MFl1bXlqgbt7P2zuyGRtoJlUPBkMhKE=;
        b=gbBidteC/x9ywwBVI6rmMuPMS/VXCCzpP3XLVL3lKNM/52joBG1/NrFbrWz+yBwwCq
         /cqOC1VvWYje1IWxbLfcdUeAzVA7VD8/VoUNRAW1VstEOBK5rTKTpSiyro9XvQ/6VvE0
         SGRrTXDgcct3ZUxT/rLcHVJ3e0fu9ONRTS1T+uNkFB854f8o5cVBLw70J3uqPuK3vQVg
         7DPxkAdqWUSV3/GjVSTS5OpFoyvgry5ecAHQUG+lX/GAowu7AR5J/A+Y3/n/VmkM0oOQ
         ntC6OS9lXG6PPLlqXXHUJK26Mxr5ZNjn6T3xn4aX4sSdZCa/HgxuJTZQEkawaiExt5E3
         FbJg==
X-Forwarded-Encrypted: i=1; AFNElJ9xk5MEbIHcc57kJnSURZGu5a/9ioI+87M+FIceOLX5MYUTg5lpKd6oBS0Woe5EzIrviq7ELfBj4Lg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjPFypGg9pngtrBQaMBiG2Hlk6GTZ4ksrf4hRsC5cutYevkDmH
	DNX6GsJ+JnRiz5OHVvI+YffmYCNOXZaBTp71b8w37srvOWz/2UL10TAw
X-Gm-Gg: Acq92OGDemI5wA6s7jvMWUxRLx8VE5UwbiX72WBfVgA40YDMmxpz7A/kwe3NJRAOY0L
	+CWrT01rNADaLT7l8ashLGmUmqtMSxDP1kVk5IeO0r+Q4RLrcEpd+Wg2/U8uqWMEqd5XSJkExC9
	nvDmt4le+9hr2cSFeIevw0pWSzKHK302m3yvoT/JG0/YRYM6dte1M48Oo+eFJb3AaMdBgAa6eYY
	nvNYoeIpruv03HNi+bBI1+GIUVcDJv7mSGvH1JGRMS3j9wsvbzQmf+6RzSUnJNGUYG9N0ede6++
	LAa/VGUZK8XgRYNllheEop+KPXMpv/qHMNe3IQgUdatR+VskMAAlbqyO4iGv3EuY02fA1rJynOB
	ppgaEEGnIqbLzbK+fhIh/ucLTHKfWnWlNPz7EOnwll9PQFv5Y00hENhWHi5dYQ+JJdtyxqE/DCt
	ALGP1FA7TaxnaBGzMQN/QV8tP83CtZYMJH0o28hk+Gh18uSWCCn15Ftb+2pJn4yL8ktTCXVL2JB
	zGV8PMQHa6sgeNG
X-Received: by 2002:adf:f250:0:b0:45e:f271:5019 with SMTP id ffacd0b85a97d-46030506f41mr16119794f8f.14.1780904385580;
        Mon, 08 Jun 2026 00:39:45 -0700 (PDT)
Message-ID: <3afc034e-f44f-4cb0-b915-ab0f846cde88@gmail.com>
Date: Mon, 8 Jun 2026 09:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] x86/hvm: Partially revert ("xen/mem_access: wrap
 memory access when VM_EVENT=n")
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Hady Azzam <hadyazzam@protonmail.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Penny Zheng <Penny.Zheng@amd.com>
References: <20260605194157.2762581-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260605194157.2762581-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1780904386-18F66F3B-0AF3F249/10/73395122804
X-purgate-type: spam
X-purgate-size: 971



On 6/5/26 9:41 PM, Andrew Cooper wrote:
> It is erroneous to check current like this.  e.g. Dom0 does not have VM_EVENT
> active when it's introspecting domUs.
> 
> The use of vm_event_is_enabled() is only for the IS_ENABLED(CONFIG_VM_EVENT)
> short circut, so just use that directly.
> 
> Reported-by: Hady Azzam <hadyazzam@protonmail.com>
> Fixes: b18e38e42da6 ("xen/mem_access: wrap memory access when VM_EVENT=n")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Hady Azzam <hadyazzam@protonmail.com>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
> CC: Jason Andryuk <jason.andryuk@amd.com>
> CC: Penny Zheng <Penny.Zheng@amd.com>
> 
> For 4.22.  This is a regression vs 4.21.
> 
> Only compile tested.

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

