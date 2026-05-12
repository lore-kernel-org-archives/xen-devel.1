Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97121CD4F24
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2026 15:33:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1306979.1578702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMp6J-0001ts-EK; Tue, 12 May 2026 15:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306979.1578702; Tue, 12 May 2026 15:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMp6J-0001tk-Av; Tue, 12 May 2026 15:32:51 +0000
Received: by outflank-mailman (input) for mailman id 1306979;
 Tue, 12 May 2026 15:32:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wMp6H-0001te-LA
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:32:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMp6H-00ALJ3-1x
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:32:49 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a03481b-e002-0a2a0a5209dd-0a2a4508e73a-8
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:32:49 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a034820-63b5-0a2a45080019-d155dd2eb916-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:32:49 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-453903ee4adso4957149f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 08:32:48 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548e4bbebdsm36820959f8f.5.2026.05.12.08.32.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 08:32:47 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778599968; x=1779204768; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=krkCfLdJTeqwM34LMyW5fkxOOAUpw436Q9/r8m7cEBs=;
        b=PiUTZawceiCxC4+PPVDXlszVHhFkvL5C6qd8BoYa77CruMArR0jR/31ZyLbMP42r+f
         NuFE9SfUhS1UOLWRpXZF5uzSEdYsnQoLFVMtgMmd0FRpPpquZqPqFjrbIovhmgUT2czt
         MbO6x31fzWDB/DHEGPny7L+LJ9MCiP7GcK4qq1Ra/UIjbTspEYFia1nnnM7oTrAzGbY3
         aLuXBpBq574/yqg6ZeiQ6Tg+hPq4T26wAhAx1tx/90mymarAPrCio9IRGPxe3eWqqjvK
         3vnw92yNazz82nzf+mHGeUdvSZLTgb5SRSPBAqmKHPXIwQUFGxP1hOLajh9Fgd+BqgOP
         UxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778599968; x=1779204768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krkCfLdJTeqwM34LMyW5fkxOOAUpw436Q9/r8m7cEBs=;
        b=rF5jgnH+wfWy5BzVStuOisHIDTesgMXyb5R4g/5xtRFfljubJlMpMtXwpylC6YW7n1
         rGHNakZWam8Vt/kcwmCL/eiR2nR5cIQm0E36cGWB/Uva56aE082ja5lZ2OlwdK9myecM
         nPxqr5+zHpuxQcGL1Db5mYEJS9ufya41LCnAYFpB5hkxfr5om6yrX5IavoCcdheaV0TJ
         3GeuitqfGd8KQWB6663vktKMZAYyzXUxVIZkFTcWgbVJJQ3H4gAymxIk8fKuZMHOmLiZ
         fVEi7uqbq9EwGS9n1pyC3WKxMBJxQRUMlTMFTBYXp5pNzt8gX17+zK7UM+FNnE+xrY6M
         0orQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/Ukan4UFnY59ENrgwVcB+ufJfytq2Vj4m0+Haqj5MsvftL7UcLNNor+7yOgfA4uxNIisc1APeRIw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmSm77MLg5UZUEDizpL1+X0cyGOklxII4ls9e6T1aiWEFzVG4l
	v1Ly2DzvF9c3fIyRLru8p2NQ1NVK0v5PINDT1yuBjeIZVrvhX9s/s6ra
X-Gm-Gg: Acq92OGkiU0FyoSrk89qNWAgda5hQONsa7FMiuuA1L45atiuXU44hZ+3/t0cdpECoDV
	GycgdjQjJTqm+WrFgZdrlxvVeMZf5hvarhmVCAzlFxP/Yt2wMnTBXbIytFmLssI94X0wVef2Fed
	l6dfFb/L9us6T0HOLqO2AGhjIR6LfvXESldGTRawLFKqzqdU/HDLNhdOxzoxJt42wgItYzLC6A5
	x6iHoGGeHyzH62fIDMnMwP3GS944fY9CYc+KmuQObevfECb533u5KRC52B2RxMNGpmQ1vJcuTCk
	bFZwyMGG1TKL0rOkJhHn5ylcxtcsnV8+aMunFRaiyNcDLlxjJqYB8AC3F8kW9Xab9xvbX1sxSW/
	82s1yP8H9Avq345Un6QfxQytvSzkaTZCEB8MhKnuKX1yUkmFvmp7aqo7sgIEJw9oATvaEoQd+5Y
	k1DcLA44G5wPoXFhg3g0+96xvJCvbgc63W8o9m028aIVf/gCpd3+wVl+CeJLKqw6Xhp+62radqw
	AeTv1WiKzLCUw==
X-Received: by 2002:a05:6000:2387:b0:43d:77e1:6a69 with SMTP id ffacd0b85a97d-456a4ac992fmr21377448f8f.38.1778599968449;
        Tue, 12 May 2026 08:32:48 -0700 (PDT)
Message-ID: <b39eb91c-c071-4f47-84e3-028f54c3f4eb@gmail.com>
Date: Tue, 12 May 2026 17:32:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22(?) v2] gnttab: simplify (really: drop)
 gnttab_set_frame_gfn()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Rafal Wojtczuk <rafal.wojtczuk@7bulls.com>
References: <6e3dbb4f-5849-4525-8f8b-a2818c39da2d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6e3dbb4f-5849-4525-8f8b-a2818c39da2d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1778599969-C5585DB1-A087730E/10/73395122804
X-purgate-type: spam
X-purgate-size: 829



On 5/12/26 4:46 PM, Jan Beulich wrote:
> It's not really doing anything for valid GFNs, which renders its one use
> site pretty pointless. The other isn't so much about setting anything, but
> rather about clearing.
> 
> The main point here, however, is about Rafal spotting the double
> fetching of the GFN (first in gnttab_unpopulate_status_frames(), then
> again in gnttab_set_frame_gfn()). Re-purpose the macro parameter to pass
> in the already fetched GFN, while dropping the no longer used parameters.
> 
> As the result is a mere wrapper around guest_physmap_remove_page(), drop
> the hook altogether.
> 
> Suggested-by: Rafal Wojtczuk <rafal.wojtczuk@7bulls.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

