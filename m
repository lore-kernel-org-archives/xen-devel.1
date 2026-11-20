Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5AC606A32A
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dtv0AqJm
Received: from list by lists.xenproject.org with outflank-mailman.1498001.1696020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xULpJ-00008h-5u; Fri, 20 Nov 2026 10:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498001.1696020; Fri, 20 Nov 2026 10:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xULpJ-00008a-3C; Fri, 20 Nov 2026 10:26:41 +0000
Received: by outflank-mailman (input) for mailman id 1498001;
 Fri, 20 Nov 2026 10:26:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xULpI-00008T-RF
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 10:26:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xULpI-008oIx-7T
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 11:26:40 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b00205a-e002-0a2a0a5209dd-0a2a450aeb20-20
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 11:26:40 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b002060-f2d2-0a2a450a0019-d1558036b0b2-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 11:26:40 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso4910425e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 02:26:40 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf630esm4820755f8f.16.2026.11.20.02.26.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2026 02:26:39 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795170400; x=1795775200; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGLJAGu1u5we+jSoL0PFmjZYAut3JpnQ+Rx7uQo/Q3k=;
        b=Dtv0AqJmfGCzPNJ17rBqapAsM3CLOPDDNZPhDZPyMr/yUcLsDu/iF9Ky+IflDKPLvS
         wIFAGMzCrD4/2yu/VSwqsGDl0uDCUH3nXtjWjsSEEAI5gSgEEhBp6gzp0rxuwLbxcscM
         ztRU2nfjYhG1hEvquULOTay+kmTLhmQkGRbtgTHaeXxFiUaGpPGbM1GlY8D/IlPUVUV+
         TMdGG/k9wyyd0wGkodHdRk5tp8w14SicBKQ1kTC5+dvaXt+Wr/3XDoJVT4gBKhyxvRq5
         4Hud0loINFBDpjniqhyDK8dpHHf8oCBLuZR3rDpvPG33o25Aiou/6z0zbNocRZFWaKQ2
         hMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170400; x=1795775200;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGLJAGu1u5we+jSoL0PFmjZYAut3JpnQ+Rx7uQo/Q3k=;
        b=WzUrnlBIzgwxuBvOqV7xEFOOE6vatVc2hEoRmgCKp+3djby4E3sG0NSGY/wEjO6cOI
         PAnyjFzzkT9UCayA5VuhnG78ieqO7fuybYuwiporpcZfGP0xuChezJd0Z1tcsuc6iObH
         WC6hHw8OHz/bU3sbHvHQB7fsMKJ4flGls9I6pNKmo4e3JwD27aNz9hUYGImXnZvToWBk
         uTxq3ZBZiMAa2AMKR3u7RRdan561t+ILYA6rVgO+dpz+w8gxgjbxGqXSyXbYZqJLzrT9
         wwyjd6ktJ8JRqzYg0s0+Fu+tjwqQE1wBZS3yiu/29gIzSv4aTCQ6QKPCyevyTKQgvhPL
         fvMA==
X-Forwarded-Encrypted: i=1; AL+hErEL4DNThiGIDBC9sZlucUK08WLzFmvFLlMnn0TqjT8XzcYTFsknCpwxPhFoocV5LbpC393E9Er9BqE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9cvzuZs5w8d+7xChoj3JOJ3rNkGo/4uK3CrjTm/a/lpmFeXDyE
	FCJUG3MfSSg12oA1F7JcoT2CiIfYvefqGfundhnsFpDlU5yEL84UZZL5
X-Gm-Gg: AYBFou2Q1OsIG8lulkoPGzmyy2xBHeX56rmiTFnUwrmau0XsTepZyKNbEJ96psU+USe
	Sykxuj6zHtbBzFrrUEAd5LbChzmQw2HQ0TEJHuiqMNH/eKsFr5Ejsbg2m/kyUTzTQCs+HIwzzmo
	VeTW5BRnDJrLy7VNJhQNmyT6qndwYVS4+ZC4XGvzZ4cxnPNp5euqMrlzRsuKbjBdyWVEtE2PXeR
	jAq2uh0B9vIT6ig/zZSg5l4uimIcApVYuvi6+UDWknRSbK7G7Itd+M+QRYRMx6bQ/LWlcl8xeLr
	UfEwH3WN2zGnsLr+Xa5d9Efm57vZcnjnoJPDxUmFDKRKZXWlu0W+cEzIBrn8kPe7PdjDLqBPu/U
	knlnemh/aLMlexJ8QPKCvNp9YCPlvSdltf5MjpAqbkivKqBgpTK3HyxHUbgfKJXonKy3INQtOJK
	s9oTtuY9Jog7AvVoxP6+8PhybSQm5eFHc2pf7DpgoKYsGYyC3Mio6yxkxesQ6BwkzmsgF7ziYrf
	jOnMoKVDCAiruT/OX8CFEgg85ZyM+1c3r12MrCTQHrnDwrDjiVUkVl+BgCepDe2gNt5CCSdsyh/
	yk0KFS+wWOYJn25b7zZoLedCUrpdYyq1cDv8qIl2HGb7ZvN3c5q1KGjLhlCuNC4ZYUfzheXvGgl
	G5w==
X-Received: by 2002:a05:600c:3b83:b0:4b7:6b96:e431 with SMTP id 5b1f17b1804b1-4bb88822242mr60888215e9.28.1795170399671;
        Fri, 20 Nov 2026 02:26:39 -0800 (PST)
Message-ID: <70fff78e-4f3e-4e39-a086-01265bb6a822@gmail.com>
Date: Fri, 20 Nov 2026 11:26:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 23/26] docs/fusa: add NS16x50 UART requirements for x86
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-24-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-24-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1795170400-59DDFCFC-3F43DE2C/10/73395122804
X-purgate-type: spam
X-purgate-size: 918
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/11/26 8:47 PM, dmukhin@ford.com wrote:
> From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

[...]

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 327adf4641a1..2c0eaaea2d24 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -335,6 +335,13 @@ F:	xen/arch/x86/include/asm/x86_*/efi*.h
>   F:	xen/common/efi/
>   F:	xen/include/efi/
>   
> +FUSA (x86)
> +M:	Denis Mukhin <dmukhin@ford.com>
> +R:	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> +S:	Supported
> +F:	docs/fusa/reqs/design-reqs/x86
> +F:	docs/fusa/reqs/product-reqs/x86
> +

Not something to do for this patch but I would like to ask (mostly 
maintainers) won't be better then also update ...

>   FUSA

... this name. It is a little bit unclear what is the difference between 
FUSA vs FUSA (x86).

>   M:	Stefano Stabellini <sstabellini@kernel.org>
>   M:	Bertrand Marquis <bertrand.marquis@arm.com>
~ Oleksii

