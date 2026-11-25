Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B1E606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gv+Q0D14
Received: from list by lists.xenproject.org with outflank-mailman.1502248.1698233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBQR-0002Sz-U6; Wed, 25 Nov 2026 11:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502248.1698233; Wed, 25 Nov 2026 11:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBQR-0002Ss-R6; Wed, 25 Nov 2026 11:44:35 +0000
Received: by outflank-mailman (input) for mailman id 1502248;
 Wed, 25 Nov 2026 11:44:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWBQQ-0002Sk-JM
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:44:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWBQP-00CrTu-Ob
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:44:33 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06ca1a-bab6-0a2a0a5309dd-0a2a4505e39e-28
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:44:33 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c840-4cb1-0a2a45050019-d1558030cc3a-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:36:33 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a1fbd52ab6so38357935e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 03:36:33 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb85399d52sm498592465e9.6.2026.11.25.03.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:36:32 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606592; x=1796211392; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7fOIsGrjGNi6CskIGWATs2FBSxpHu/NcffK3/zRtoLs=;
        b=Gv+Q0D14BxhDa4LrLeVcoA46iKFJakpr/YVBsQLN0o+fRvILxP3MCknIkBljQIpYIo
         Bc8vo17zB4J1/AY6UVBcM9NXKPfOSnEy6T7BY7BHNDu+A8gDe5/nfmf3J6w+30tjjWD8
         3VBbPri5LhCGV0eMCXrE2QXzRj1jVw0csG5rjJLVN0icbHpUSyLrWo2FjgX4HVbxEchX
         DdHvKypZyCqDwTknjNqkTJriSQDIZrEB88L+AH0SDmcqq0QEtEd28Idl9dTKHFspvfxW
         3T9v7ox5+KtSWw7FmQlwghZLQ/dgbv3AZqf6jfgz87FI7CKBS5tdJiCEJVKMZzMVhNMU
         33fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606592; x=1796211392;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7fOIsGrjGNi6CskIGWATs2FBSxpHu/NcffK3/zRtoLs=;
        b=p21KLbVLDnmKT+ucclhJl75gpDzJfgdR2cveRyupyVihC+TpPIl32zljdz10jlMa+m
         otrKco4jU5KMk2q72j5K/FfYSWajp6Esbhtg5ibbLYxVkEu7y87X6/ZoESQslpDJ3qsL
         3sjt8M/prtmnq9u98eJn4ah9F8Fz6EGnz7TljBptuu9UVtzNC81ZFHuCLyEyjmgE+GPc
         sgdrLI+kSRE0nY1F7GEdwBafYtColBWyiijhZPbN9l/dEefL3xUtpJ0xKw+a3tV3CvjJ
         +rLrt6+f/W42CX+IXcDjJ8mXrsfQ1GR0C253Up+ffN55zXSqr2MZDPGoJ/j3DpcFqPVU
         kX6A==
X-Gm-Message-State: APuU4Z/9Xxzs+AfNmPesrqGpLcXlQDT2xZripmPN3YRG6zFLvkzoPgTc
	z4uHKbL+Ls+O8xddLmHLFGzwjWhSb0pMT2vO2WShc1TjqgkRET2LEkOy
X-Gm-Gg: AZFdTZdynfJ59/fpNDMj14UfzM9NYeKOXsSL/NozxMJvncvfGI7CXJ8R8Sd1ht576RQ
	3nbXnOCWudslwcmGcvrlnp+KwByKF1tFvjXoFxSjB+/pwfSLkWnT39lNgFVrbrWZ9/C/dVvepgH
	KAz3wi0/D8KGeXDRImlRowc+/4FYynwW3G8q1rM/uv4hauFiT8RUFtOTH8pj0lu95wBfSgk/+iR
	jkzb8dMktOI2i9QVl1nb17jrsNxX1I5jOgL8uz8goRg06B53jTP6s4z/YnyQVUmxfjPaeLVixcc
	hRnO90lYjinCXy8rHw7konxhxFkeyuusNEQEh8MCfUD9Zi3bZEGbsZ3Qa+jbJc/+18fnm3qcBsO
	HECLiF9cAN4tcrvF6QZfHihe3i0MTL5+3iJSGMsiBmU/lwYqdPAsKiVQqj8W4kbkYKMW+KP9Fnd
	MhMecDbvnWcgXBuKYH4tE7kkYZfUvmjGnBBeMk7Bt00xXGZAhiX1RopjWyLr+AEuruNjydlLE2k
	+iVO/iy7IpXZt3wshTElxF7kCDqgXQGWfltbGi6sxMMOx8xROw+sgcuETHsTTeonJrkX7rXlrG+
	PxIsA1vddQDuPWYNu4uw6YU2moXJkhF9xkc=
X-Received: by 2002:a05:600c:8b83:b0:4bb:60da:56af with SMTP id 5b1f17b1804b1-4bb8893053dmr316762505e9.25.1795606592489;
        Wed, 25 Nov 2026 03:36:32 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <bc0399a9-d768-4503-b499-157d5478fc69@xen.org>
Date: Wed, 25 Nov 2026 11:36:30 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 21/21] hw/i386/kvm/xen_evtchn: Allow unmapping an
 emulated MSI PIRQ
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, Hui Peng <benquike@gmail.com>,
 Mark Syms <mark.syms@citrix.com>, Feifan Qian <bea1e@proton.me>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20261124232247.23169-1-dwmw2@infradead.org>
 <20261124232247.23169-22-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-22-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1795606593-24F1F2A1-E800C125/0/0
X-purgate-type: clean
X-purgate-size: 953
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 16:22, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The "unmap GSI PIRQs only" check rejected every negative gsi, which
> includes IRQ_MSI_EMU, so the later IRQ_MSI_EMU branch that flushes the
> KVM MSI routes was unreachable and guests could never unmap an MSI
> PIRQ. Xen permits it: physdev_unmap_pirq() on a domain with HVM pirqs
> routes emulated-IRQ pirqs through unmap_domain_pirq_emuirq(), which
> succeeds for MSI emuirqs. Let IRQ_MSI_EMU through; the existing
> unreachable branch then does the route flush as originally intended.
> 
> Resolves: Coverity CID 1507603
> Fixes: 6096cf7877bc ("hw/xen: Support MSI mapping to PIRQ")
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
Reviewed-by: Paul Durrant <paul@xen.org>

