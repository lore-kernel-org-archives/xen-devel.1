Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2452F606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IxX86S5a
Received: from list by lists.xenproject.org with outflank-mailman.1502081.1698072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAzA-00054F-6Z; Wed, 25 Nov 2026 11:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502081.1698072; Wed, 25 Nov 2026 11:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAzA-000548-3I; Wed, 25 Nov 2026 11:16:24 +0000
Received: by outflank-mailman (input) for mailman id 1502081;
 Wed, 25 Nov 2026 11:16:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWAz8-000541-J3
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:16:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWAz7-00Bt7W-Ot
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:16:21 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c378-2eae-0a2a0a5409dd-0a2a4502bd14-38
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:16:21 +0100
Received: from [209.85.208.53] (helo=mail-ed1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c385-4900-0a2a45020019-d155d035f043-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:16:21 +0100
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-6ba1e22ff4dso6641015a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 03:16:21 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.8]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6ba9b131d3bsm5256928a12.34.2026.11.25.03.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:16:20 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795605381; x=1796210181; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4iv8A6gqUfnNbo5/jmNa9lhvSF2xOy75Oyi24duA5IU=;
        b=IxX86S5aXXUz7GJI4dTVCvAe3y27uKmv5Ov1owXrcoMx4vZEdwifg+8ez9i9rihAZy
         7iFXE4cd7PK7CoSI8fZM1PyR6XnYcJkTWVIys+jaJVLDEfScazK1YhVb/hVv8OQV4eJ/
         Ove9R1XIJOFYvNwRBst5ORTIPB/VM1gIvZkaRTaZ3akWVizjxlAxBDkxqKJspdFSdQF/
         6Yz5YmXoPYKqbdrB59Fz5HC6ghJW0BtKjo4oodC7CHqVKrDE1qWX1PIQSw3XDUz74pmH
         IDdTMIpiDFDpvI/cvDl5YEFDA1kPpcaGX7o+S88ZX69ZSyIHg3E/AwuDbLLLgs+XF6cJ
         kCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605381; x=1796210181;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4iv8A6gqUfnNbo5/jmNa9lhvSF2xOy75Oyi24duA5IU=;
        b=JJRuy7JHjyaxkm3bjcpvNNEBYjO+ymj9omCd2/BBqA/x2oUH6mBHHjveEI23L2xR0Y
         1bS4DASSMV2TERbVA5OYIOEr5T2ZbUulgewqC5pFJzcg6rv0QhZ7Qac7QN0/Re4OnJQW
         XpnIfZvZnaFpYhOQxshpDZ8+GlVgNyd2UHMXEVBV9cUA4lUnFUn5hiFf9TF5gpy0tW4E
         NReAVOXLu7tWzIiH+Mg2MEVmBw0ofSHi92q08IpGKqvcWoLVkufOMpg9MwfyiETVVDQQ
         OjLLnzQ40rVJG0Gec1mLr+TRgFKEGYOAq2PNWrfTr/5O85hAeDdsnnU0zra8AASelCkp
         /D6w==
X-Gm-Message-State: APuU4Z+NHbh0b/QZVA1ge+2URFluJeaHhIBQoOh7vzanJ+W6P2AhZ4ms
	SuAJZgQ9oqAXuShV80PwvMzp8PyNXGxTm8N5r3ssu8h+9bvC0dx4isFb
X-Gm-Gg: AZFdTZds/2r+EToT8BS+MMlx1WkvDECc7O1Z7S3lVPjtqCwlMTv9K/3Re4fqdJZiebY
	9QL0Ixet2BZvZpSP/JjXSXoBBJMa8W9bG9be3UjJBozUAUaLwL1PMcatw7omQjoW7nrLdWi/GzI
	IksM0xABH6LvAhXWKnzhTSmHSASDO6mxIGsJc6PtMEDa70Wixd1deiPC2qCCRK5E5+IuHfqhrZp
	bk2knPLfbZ96sHfvrPxxz21SiUJSxyRV1YccPtH/UK9JLmkOwg4BJvCTAIAhKfyuxpEGYzmWnvW
	Va6i7Dp3EfRk8LEPw2RH56lMCgRXCQGNjFre1CHsj04H5yomX2GjT8DuXnLXa3aNrOyCAtZJqSM
	RnT8JoD3OVtbgdRqS+V2aj1WrbJ2hLjrJicXB27333M3VdjiOL2kIzH5iPQlAT3bW9g6yFuJpPr
	IcBm5aE40qO3FUrNvnXQVIsEuPuaQoCZ001EomUgc2OvNNAUcO1EZoRUzvmAsj1EA2sS/rSH/Dt
	4Q/nOVuM8RUKpkRbLdAFT8GDVz184J1lmK30ciXAk2hrgAPDy+QOXbL3iB4wggUlAN3/OtLGtFT
	cAiVPuZDyXUUWCXOWY5iU8vfAHGnpR1ovg==
X-Received: by 2002:aa7:d351:0:b0:6b4:86e1:cc67 with SMTP id 4fb4d7f45d1cf-6ba37ea0b91mr9087571a12.27.1795605380976;
        Wed, 25 Nov 2026 03:16:20 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <8e8fa5ae-f30a-4e38-8aa8-cd46e3b4ca31@xen.org>
Date: Wed, 25 Nov 2026 11:16:19 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/21] hw/i386/kvm/xen_evtchn: Fix off-by-one in
 do_remove_pci_vector()
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
 <20261124232247.23169-9-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-9-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1795605381-F05846C6-09D19D1F/0/0
X-purgate-type: clean
X-purgate-size: 1358
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 16:22, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The empty-word optimisation advanced pirq by 64 on top of the loop
> increment, so the first PIRQ of the following word was never examined
> and could retain a stale device binding after the device was removed.
> 
> Fixes: 6096cf7877bc ("hw/xen: Support MSI mapping to PIRQ")
> Reported-by: Hui Peng <benquike@gmail.com>
> Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4525
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
> index 3aff01b5d6c..d0807f5fece 100644
> --- a/hw/i386/kvm/xen_evtchn.c
> +++ b/hw/i386/kvm/xen_evtchn.c
> @@ -1701,7 +1701,7 @@ static void do_remove_pci_vector(XenEvtchnState *s, PCIDevice *dev, int vector,
>            * and cache lines).
>            */
>           if (!(pirq & 63) && !(pirq_inuse_word(s, pirq))) {
> -            pirq += 64;
> +            pirq += 63;

I guess I'm missing a subtlety here, but the test only fires if pirq is 
a multiple of 64... so why is advancing to the next word by adding 64 
not correct?

>               continue;
>           }
>           if (except_pirq && pirq == except_pirq) {


