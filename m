Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E11DCD6E6B
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2026 13:51:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1327893.1592606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV8Tp-0004PT-Gx; Thu, 04 Jun 2026 13:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327893.1592606; Thu, 04 Jun 2026 13:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV8Tp-0004PM-E8; Thu, 04 Jun 2026 13:51:29 +0000
Received: by outflank-mailman (input) for mailman id 1327893;
 Thu, 04 Jun 2026 13:51:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wV8Tp-0004P9-3t
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 13:51:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV8To-00A7kK-Gx
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:51:28 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2182d9-bab6-0a2a0a5309dd-0a2a4503e99a-8
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 15:51:28 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2182e0-672d-0a2a45030019-d155dd2be5aa-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 15:51:28 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-45ee6d32402so420650f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 06:51:28 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344558sm16657209f8f.18.2026.06.04.06.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 06:51:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780581088; x=1781185888; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6cV/OkCq+wO7XFriYcUZuzONnaq62fDanSpEqmPtTuM=;
        b=Tz7M3Ctu334drVeFZe2tehCY4SB/zsIJvXNShAr9FdlA4WgOR+zqwJXd/pLqHrrl6C
         0VAkmKU/k0XLKPWy/j7hTYIRlaB1LpQR+5Fek2a4/Q5Ca6IFpPoJ9ooKuXdjvHILu1N+
         kWbLyaOIKGH3tP64VpG8vwLsgcyfIPsaV43uGdcZdXRJ9EEmvGBqCEAvoBrqamzBOAWo
         CwbtydohbaIBS9YANKpxfLcgvrQplfsqq9Zu+8bPO64pc1QfVO6rzczi2Cl3eoTAkntr
         AahzmbTy//w0xoIr3QyHGgEdYcEC/fsHTWpab7QjZR5gCrkVkON7qmGMbQekvZbsH2K3
         1gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581088; x=1781185888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cV/OkCq+wO7XFriYcUZuzONnaq62fDanSpEqmPtTuM=;
        b=h08t2Q0aBdPZhb7TxV9NxzZqgp8xn4caWk0gf0FXNhvmFKDdmVTdCsfX0rzHiULCNr
         0hN1l1rQToaCox095Pmw3jo2yaLl+OUF3arprkn3W3RBQWOwZQKKtI4ft6ILQkqqL/xj
         X3EOzU2xkmZR4KC/FTjZ3jqqSjF561l349HTlcV4cyc782JYWk27tpVsjFE+nAMTE5GZ
         lZ13RBALlQ9N2ZYQpf/9RO/ORsyinnxNWiDYL+N/vlXPm3LKv5MrdHQKrmOHp0ZBu/vg
         hFCDZSnE1E6vevWn5h/lC6xhZeCyYKiL5UnNbnTMYnJZojxj/2M7ACSYyvLtbgsi3eQO
         Rw2g==
X-Forwarded-Encrypted: i=1; AFNElJ/mvSelplqA93rcZlacWt+RHawHC2gefNae7h15WyHicxXuTI9tw5iIp2I0v44lzL4AcmDPca0W/XY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEPp21BREcPWmvedzwPs0rg1ILV0YtpWRG7mXYmPdDw/+kWJIL
	I9qdlpOoKHEqz/P/ETIuRajqaiO2en+9KdCJbmLwgoOrGUQ/EASmOzjO
X-Gm-Gg: Acq92OEYTtXQvLJl5M4pcy1HBjVpJmJ2RZCXb36sCKvsyfSrxIc5PN03rIIs/oF1LyU
	W3wKAypNTVq7edmTJO9nhm50Ww3k5Ug51192E8PPlMqDBh3C+nCXLdHe41VDbiEfFQM1YwStpgC
	67k/Y1ly1Fnbi6UnkMc3TyPj67Z0W4Gsjf4l+bn/QYGZ5WYFvxU1lrvtsIcOjUjM12T9tlradTv
	Dt75AriRaCrOoiIQkvFY6OEhIRMQnJph/JteHm7CIFKi2t1B49raWTzeIpq7fOckJoh139tuXnT
	RAUqMS4kpjBihIZ3m1dIQKVGcl0lDQB9HA5F6tTeBHl1hhXdaBq4uCOszxWtkGWE9rW80EP1Fz7
	zM1xWzfzZaS2604srPU4Jwk/h3bki92qfsYB1BhaGAIrhjkd4DMo+zHQrZqA9LTuH7+W/2TDwLK
	XgOJLVHi/xR90c8yR+c7F+jCUjo88s8+Pm9PHcixd8IAooKyJEz8HNh+a6AvjFjxg3irP7ups+j
	eeoU58Mp+sG3WhBIY8vuIcvXKg=
X-Received: by 2002:a5d:5989:0:b0:45e:eef5:b51e with SMTP id ffacd0b85a97d-4602181fafdmr12774960f8f.23.1780581087831;
        Thu, 04 Jun 2026 06:51:27 -0700 (PDT)
Message-ID: <f5cacd49-0647-4e92-8cbd-3ed058bebd70@gmail.com>
Date: Thu, 4 Jun 2026 15:51:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: Remove .cirrus.yml now that CirrusCI has shut down
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
References: <20260604125530.2718761-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260604125530.2718761-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1780581088-4066C938-C46D95A6/10/73395122804
X-purgate-type: spam
X-purgate-size: 196



On 6/4/26 2:55 PM, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

