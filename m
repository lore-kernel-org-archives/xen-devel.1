Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80891CA5FBA
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 10:43:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437035.1655729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBrmX-0000tn-Cb; Wed, 30 Sep 2026 10:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437035.1655729; Wed, 30 Sep 2026 10:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBrmX-0000tg-9O; Wed, 30 Sep 2026 10:43:25 +0000
Received: by outflank-mailman (input) for mailman id 1437035;
 Wed, 30 Sep 2026 10:43:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBrmW-0000ta-5X
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 10:43:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBrmS-005LHH-Jz
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 12:43:20 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abce7c5-bab6-0a2a0a5309dd-0a2a4508d1e2-10
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 12:43:20 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abce7c8-f659-0a2a45080019-4a7de18ce161-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 12:43:20 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49e69b9e16aso54214395e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 03:43:20 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b02a0d237sm2293384f8f.37.2026.09.30.03.43.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 03:43:19 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790765000; x=1791369800; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lb2UXvVjkNIEKrDX3wuNhOLpTYEIeOFh7Dz6suh0LC4=;
        b=m1udDAZlA/xqO1DvvIwAq7SdSY3iXjhQYV7FxM14qeIql0h0LH9kvJvy0nJ3HSEIq4
         3a5YT6cJHk/2fhpce6Gha/yK8iitBfmAY2uH6QUv60C+imVQ/D0XnOtarox4wfejbbg3
         l3KcNhY5rsxwSEnqv651OS1bb0l4SSmXyoU0XkKKXLNKI5B+O3L5TdIUaIURmDXF4XdX
         6G3hYcm9h0PkqEDikCUAYYj/x/UOHeex1CtiOfTVx4Mak40ZFHmT/O6wgyrpjtVhMciW
         Ip4HIbyzMzWPqqWqegN0Z4FrztTcX0Lrj6HLknMiwYpY23vSlscGE8IXvpt0zPhYgRYA
         uT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765000; x=1791369800;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lb2UXvVjkNIEKrDX3wuNhOLpTYEIeOFh7Dz6suh0LC4=;
        b=hYFYsq2LDla91pKo6HdEwdOrsnILnlYlb0BkNdn5JZsPCiqUO3fjYBUR7wpeu1nTIC
         cJ1uc8E7EmOr6II6YFPeU1VKfSMmoAkZ3ZFvREPwYmOAgszoIzyRntDHfXt+FuRAKpNc
         Fv/3BTwim2gIw8mIUxXITyGAqdiHHSuEL7BGHmKFu0+LXYFFboIgmdVgr4kBhD/+3Rm5
         y26Uaokr0+hHkU4Vxru9LnhQwswCjrd+NotFsck0C49SIC94cBdvNOsPd8UWP674+87P
         49jw1jlaolzMkI3+zFC5LpLL7YUBXK/7gnLBVKxWiesLDmCrsTqO5zmNsEjXN9kBWUbP
         CSvw==
X-Forwarded-Encrypted: i=1; AKwUvByGZEor0h2KzqvImFH4a6THSA8Pqm3z3dWOjtQTpwx7kig7RZ9f6o3qNPzmX6jr5v19O020KsOqYdg=@lists.xenproject.org
X-Gm-Message-State: AFuF++nkX6q040ebpxyT7wkRLGfMIJ8aYKkf0zS+cmsDtRfHxuPeuYeh
	t77FQ1TWLWMTEza6XY+nBqsBKKiwtLDABzfv0lD40VhyMLbMEojqjNXt
X-Gm-Gg: AYBFou2PciHNatrVU2LowKgOoXQpsWTzg+R70HmXTZ0zmbBrImnvSffm0Z53ndB339q
	QkYsvM1KuFVZZxdhDWf1J1+ORmRqrG32ko1ucUxp7WnMElJl63F5hFB3pHAD6scWBx5P9OyvdV7
	UoDGzqTahmYavevEPbLzyTLnYwDLHkiwP5qN8+JENO5+WggfjWHxoDkMiRKxtrEvXgCnX8CS/XN
	Xk10qxyAs/bSym1E1KQp00UWYGoJ+2XnozRbTOgGMk9qNSXZOTf6/xujuCPmqUCUnp/MwlhC7Of
	0SfnYhbo2Gaz0zD1VRpl9mxFpI5PAJM+jeiGBEb//qKl3/0lsBW8/e3Kco8Yzox6f5v5l2c66ZS
	k3sZejv5glenEiigj+FnyuljHddNsK4SMU5t9BHaWbTjNy9onIBltWQmSR0mdWWmhu1bvEYj4FD
	QGscSoxZA2kn5hLBsDEsBq89GCKsyPDK6boemmLqS5AFPtx5zZGW413r7ZjDYr9BxHfXJBN4iFf
	XLXo/jGrXar+O4Cb78egtJU/RcfQH0xWbFQZVXUo/9JwXh1zQ==
X-Received: by 2002:a05:600c:6094:b0:49f:e238:e7cb with SMTP id 5b1f17b1804b1-4a01b0052c6mr16262465e9.29.1790764999888;
        Wed, 30 Sep 2026 03:43:19 -0700 (PDT)
Message-ID: <08f1537c-f1c5-4839-99c2-e15e1729658f@gmail.com>
Date: Wed, 30 Sep 2026 12:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] xen/riscv: make Zihintpause no longer a required
 extension
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
 <1790699586.8631fc262581453bbf619ec5b2062170.1a0ee034479000b504@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790699586.8631fc262581453bbf619ec5b2062170.1a0ee034479000b504@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1790765000-CE74387B-986149AA/10/73395122804
X-purgate-type: spam
X-purgate-size: 1214



On 9/29/26 6:32 PM, Baptiste Le Duc wrote:
> Zihintpause is in required_extensions[] so Xen panics when it is missing,
> while it does not strictly require hardware support for it.
> 
> The PAUSE hint (Zihintpause extension) is encoded as FENCE W, 0
> (0x0100000F). In accordance with the RISC-V Unprivileged ISA, HINTs are
> encoded in the space of valid standard instructions. On platforms without
> Zihintpause support, executing 0x0100000F is treated as a standard FENCE
> with an empty successor set, which acts as a NOP and never generates an
> illegal instruction trap.
> 
> Zihintpause is therefore purely an optimization hint. Drop it from
> required_extensions[] so Xen can still boot on systems that don't advertise
> it, and print a warning in that case.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
> Changes since v2:
> - rewrite commit message
> - print a warning at boot when Zihintpause is unavailable
> - drop Zihintpause requirement from booting.txt
> ---
> Changes since v1:
> - rewrite commit message.
> ---
LGTM:

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

