Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C8A606A31D
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 11:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCxhy1Sr
Received: from list by lists.xenproject.org with outflank-mailman.1464491.1675170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMOd0-0004Dv-Sn; Thu, 29 Oct 2026 11:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464491.1675170; Thu, 29 Oct 2026 11:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMOd0-0004Do-Q7; Thu, 29 Oct 2026 11:49:06 +0000
Received: by outflank-mailman (input) for mailman id 1464491;
 Thu, 29 Oct 2026 11:49:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMOcz-0004Di-Nk
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 11:49:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMOcz-005WxU-4U
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 12:49:05 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ae332a9-8faa-0a2a0a5109dd-0a2a4507a7ca-20
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 12:49:05 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ae332b0-b4ea-0a2a45070019-d155802ce973-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 12:49:05 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a2167bd087so20752905e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 04:49:05 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa7c1302f6sm67567015e9.0.2026.10.29.04.49.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 04:49:04 -0700 (PDT)
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
        d=gmail.com; s=20260707; t=1793274544; x=1793879344; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=639132pkPLJu3/vww6AhkK7GPJGA7ALyC+zuXl1Ajyg=;
        b=xCxhy1SrgztfQKTaowTze5thZKYHzjuHJdM1ZSz3sJ2faqmrPSnKTLby5B5MpsQCVx
         B2V6Ot+O6vXITMgPQj9wKsnzjE/EmaiJoEc+tydyipHf+czSNDzJf9FCnO/eh6GKCM0F
         VQ4GynQjc34cUDyNOLcv6d3EC/cXX9r96VkXdI2sITXmfbyZMes0slssT79H8Ph1xjDg
         rNT+grqUqpEoHgjuXTSvE2YhfiaknCGBW183ebHraZSDgjeAkvvyWLXZxPfA4h7nf471
         c+zZJNM9cy5/2CFmZeW9usfE9o9F0NSeprW/jCNvhSjdhrTFXxXONTpBu5pfeI6k02h0
         VSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274544; x=1793879344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=639132pkPLJu3/vww6AhkK7GPJGA7ALyC+zuXl1Ajyg=;
        b=ihXInxlf54BMGG5xpyjkknyFhcq77AyD74DPDAn5zFySsxEPS5xDzyBDJjd8EEFYR8
         Kx0lzc1J2CGSBtCb5tZ4tK2UjXWAUzD0SpKUndwT1DO3mfj/3m+9TYZGx4ZxB8iCTYnR
         ++2b9bEIvdTSvBlVTEq34tJ9yG96YAb1WLhbg5i9Qu49kCmcU12X9Elb/hO+Yqkxur50
         wqrjuA/mAuQeTWUxTZdByMxDlzQWfIBRcK80clRigFRkNNjdt43df8cxqmIwBJCWMQ/U
         nLC7PvybrC2L3ZwowxoJJtfPCQgrtipuEP34EGBJZqclWasFoSYvRGn60vZPijJJccMC
         iDCg==
X-Forwarded-Encrypted: i=1; AKwUvByswuxUEeZd/EKjx0mLSxkXmLjKVzi5/r/wxfF1Cq+oPpLmB6BGM7kOf0HSxZXnRuHocrBcn36sbUU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJTehQpWcbwALopArmY3Z+BeYiA7pwBBhIcZzj7z23Tgey/Csnt
	hhs4iHCN6j3JQwV5ttyvM/l5T4STAH8IcD9PTZTrdmDUN+jFQioU0AOV
X-Gm-Gg: AYBFou0t7/TqGf57wy1fCHThQqCsFH9C5YTCfxJ23XZIkweBiI+4P4AebSMmQMUxTRn
	tZ2G0g4eRp0auiORtdNOJCsZnvYXtTt49ZKijdO/zjPZT/xUcrTHsvc1KF05YVd8y5tjZT2P8CF
	vicwEoevhdyQ4sp48dB1vg+LfFiLrwpvsBDganP93jT6hMZZqDlPnYlDS1rs6yJce8JGjRIpqbU
	MzjA8nY2PBZoJQ2CGI6f1VUmFnmhreNZrI0rdpqsbNLiXvQYFIBlneDuolInN18hgacKF66SlVy
	oQqcXMOaFd7DZyBq6D2buyUo7qQ5MevHzRD5iA3ud/DaBDsKruTT7x7Mn9/iG2FYD6u8IDUaOJX
	JBPG7ADlV/iVsZMx9NnEVfk3fk6LsVK5a4fiuguzRGvZ4c4SpCa1wNPkzBqcLmsGi1MxkvK+ZSP
	amc/maYibnfw1YU0QZGsgApQ5ix2Wx9xUsG+2ro0naqxrXSs/VR/Vh/X1wWyUHN5+dTzK4VMY+o
	2fKE7PCBY5meG9GGgGqubd1gRg9+OOsZa6cH3/Q8NBiZ17oKGgx18MCqM+he31zkvxo/qZqOUXf
	eC3KOtwM1ZNAz0D538QGt9FC12mPrBH+qQzDPVcRboBDTMhs3XJmucRHzAX83DPSa3Rpv5OHUPJ
	M2Q==
X-Received: by 2002:a05:600c:1f93:b0:4a1:6517:ccf1 with SMTP id 5b1f17b1804b1-4a9663997dfmr113046155e9.9.1793274544417;
        Thu, 29 Oct 2026 04:49:04 -0700 (PDT)
Message-ID: <f4ef16bf-dfa2-405c-97c8-8b9f6c92cd28@gmail.com>
Date: Thu, 29 Oct 2026 12:49:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/dt: Don't advertise Xen static-heap region to hwdom
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20261029104305.169036-1-michal.orzel@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261029104305.169036-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1793274545-346CAAE4-C92B583A/10/73395122804
X-purgate-type: spam
X-purgate-size: 956
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/29/26 11:43 AM, Michal Orzel wrote:
> bootinfo.reserved_mem is used to store different types of memory that
> Xen considers as reserved: domU static mem, normal /reserved-memory,
> FDT memreserve and Xen static heap. make_memory_node(), invoked during
> FDT generation for a hwdom for reserved memory, only skips the domU
> static memory and FDT memreserve. This results in advertising Xen static
> heap (if used) to a hwdom as /memory. This memory is not mapped in P2M
> and guest attempt to access it fails. Interestingly, if the
> /reserved-memory node is placed after /chosen, there is no problem because
> of the check at the beginning of make_memory_node() that finds the first
> memory range using the correct type.>
> Fixes: 4596329291f5 ("docs, xen/arm: Introduce static heap memory")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

LGTM:

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


