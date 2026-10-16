Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B9CCC6B38
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 15:49:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452286.1667109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkBP-0003kn-T4; Fri, 16 Oct 2026 15:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452286.1667109; Fri, 16 Oct 2026 15:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkBP-0003kg-QD; Fri, 16 Oct 2026 15:49:23 +0000
Received: by outflank-mailman (input) for mailman id 1452286;
 Fri, 16 Oct 2026 15:49:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHkBO-0003ka-K6
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 15:49:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHkBN-006NcC-TV
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:49:21 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad24770-e002-0a2a0a5209dd-0a2a4504b49e-26
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:49:21 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad24781-b57f-0a2a45040019-d155802bddda-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:49:21 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a1880e1bf1so1043185e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 08:49:21 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd409989sm6256682f8f.0.2026.10.16.08.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 08:49:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1792165761; x=1792770561; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YOUA7dgnOp6ZkpYFCtXmRE5oNWg55i1qEiDZZmT39lQ=;
        b=MJXX8FOF4998zp+yXUqxctgr9kyofyUxX4K5WaYuJ2EHz9GzVICTe2ip12Lvi0R/+k
         rae5lRVSNFf06mq27MM8f8rld+H941Gkny1X5JoQLnpVod4j7c9+5IDph9Uh5P0EV591
         DRIgbAuXkMAWGVOD0aHo78OWHoEagnpejbed4+MJyHkvJ3g9vpjEvyZpLi7H+b/E1m+I
         Q7z0wF8hDqtiaek6LqjdsVeX7XtYHK912l7hjdLH8XlmmY50eR/KeDm0pQRu4cOjtB8+
         AB6lHPFMhG2XSxYf6u2WvtKRq/mX/VsPsFbuCZ0LyOZRoEFtH5ELL5jzAUk3QpGaZ/C9
         4ncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792165761; x=1792770561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YOUA7dgnOp6ZkpYFCtXmRE5oNWg55i1qEiDZZmT39lQ=;
        b=TpHecEeDvKdwB8j2OwoOUGOKsbUXN+92l9hd/yDSDfWSeRk548QFiQ5wTgtCnxYMsA
         BmRnXKB08BnoFT6z9M8tG/EfK/ENZB3Ow9tKUaIvh2ZBOz76RFF5+1IRGsaviNDcoZT5
         ZF6N3TEGn/BdAtYRpbPT88dqTbhtHRAYvvKERDEexcUyaO8s+oGglrDK8XjD99JByh5S
         npf2B63p49dF5AibiGCpAttqmpTzi4oGZCHBrbAwbVfkm5I7y/phWbFqrmawQdV68EDi
         V8UtfmpQ+He3dzlgNEVwwdT97BVAidy5bPhD0E4b/cTL+07MPslbntQ3yjd4AIHhiuI0
         E7oQ==
X-Forwarded-Encrypted: i=1; AKwUvBy661O2nV33MAs7s8MQOmUFfOHQc/Gtnqov4x5OnAmsvAkLDNo2mYS6js+da7ehE89O/YfdsR8QR3U=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL28fU4cJB/mzT0ubJtksMLFDwUu8CVsci0r4LLoxVUC+K+Dpax
	KElpRqViFmLIAEH2NtFWdOY/QMA0pcVYQN7Fe6xhNTdn9OBL8jvkd0ag
X-Gm-Gg: AYBFou0NqhxViVDjVNvz3CAMJW9TEnwzwVr0noLJ2tLbT1qNHCk8E2WK/n90bI5CbXh
	a0fTofm3EdX0cOblcVzR2N8uEaSjDqlP1RHAbZDnbLZXR/pfYomyxdPoKTgx7Wo65APP0k21c0A
	3Of7LK4aWwe1ZVgQztdwl/NyVzSyLraOfqStu2Bi0zX9+JwpchFI8mEmyIgAUTpMf9j9Hb7dKOQ
	UXa+IzV8OZe9f7pxKnW0FJ+jfW2IRbWG+0J/DdaMDmHvdBgF5PVAE2+ifXZX/mwjvfXNtmT/wvO
	7zH5H99aC+FkkAs8whpDR7FfEWmlPoTxVcnmla0dOmNBRMW9F6kz4GPJpAjmcEqS/sbZywZ5bfX
	e2/TRwyVxIUvUe36Eyzv4Td47KMk3NV1MafuCyf4NlFBIHVkJAVGBBdlQzokEZDO1fPpKQHe9eQ
	0qQNhb+hX7ccqAclvCgvUkkwB/A6VaPD8gZwy5xXlG4BRLojE9DQZPW7JJi5Owgw0tiXrkFZ42X
	KLWJFgnH14DSYQufjddWUgX60rtwPhKzqYV3PtcahUEfig=
X-Received: by 2002:a05:600c:870b:b0:4a1:d0e4:2bc7 with SMTP id 5b1f17b1804b1-4a1d7608614mr4599435e9.15.1792165761231;
        Fri, 16 Oct 2026 08:49:21 -0700 (PDT)
Message-ID: <68fac39b-1af7-4790-99e9-673229b1032e@gmail.com>
Date: Fri, 16 Oct 2026 17:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] xen/riscv: use pte_is_valid() in pte_is_mapping()
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>
References: <1792164706.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@vates.tech>
 <1792164866.8631fc262581453bbf619ec5b2062170.1a14559a8f00008425@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1792164866.8631fc262581453bbf619ec5b2062170.1a14559a8f00008425@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1792165761-C10DDB50-DBCDCA32/10/73395122804
X-purgate-type: spam
X-purgate-size: 753



On 10/16/26 5:34 PM, Baptiste Le Duc wrote:
> Use pte_is_valid() instead of open-coding the PTE_VALID check.
> 
> No functional change.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes since v6:
> - no changes, already reviewed and waiting to be merged.
> ---
> Changes since v5:
> - no changes, already reviewed and waiting to be merged.

I don't know if it is useful but for such cases I'm using this way ...:

 > Changes since v5-6:
 > - no changes, already reviewed and waiting to be merged.

... instead of providing separate changelog items.

It is saving a little bit space.

~ Oleksii


