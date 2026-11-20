Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF21606A320
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 10:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mU122x0S
Received: from list by lists.xenproject.org with outflank-mailman.1497992.1696010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xULlz-0007u4-K2; Fri, 20 Nov 2026 10:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497992.1696010; Fri, 20 Nov 2026 10:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xULlz-0007tx-HG; Fri, 20 Nov 2026 10:23:15 +0000
Received: by outflank-mailman (input) for mailman id 1497992;
 Fri, 20 Nov 2026 10:23:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xULlx-0007to-KS
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 10:23:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xULlw-00F0sw-IH
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 11:23:12 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b001f84-bab6-0a2a0a5309dd-0a2a45088d32-46
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 11:23:12 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b001f90-f659-0a2a45080019-d155802de9b7-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 11:23:12 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4bb6ba3b244so6027215e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 02:23:12 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853c9170sm114645445e9.14.2026.11.20.02.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2026 02:23:11 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795170192; x=1795774992; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x28Xy0+ypGVR1Zw9S5R+49vzuJ+Ze46561XBMNWt0to=;
        b=mU122x0SLsrAT/yZv6AwazvLjuyvsBzazZNcHO/RuAxFI/CrVDzh6AHkwtl/Qgpkk9
         5U9tkVoEDr+xMTnKuNKWLlBW+4pNh281XNvYuGWtQj8UDbSEBY0DiKTu1oJmTH85Pfdn
         p8iPxlUb3ihk2GDlJGznTvMllD4XfljIgxIYk9uSIpCQ1keu+iM+JSzD5+rR5gBSKkVQ
         WVURtZBgr4LcjcfeugAiqT6E2705/WUcTy3wrMYxW9zU35eXKr9buV1slN4IJ8xssh4X
         2u0jEdVwUzqEWjE1v6YbnThHxiNKqA1+PKr0jbuBWz3rezv2Wnj+eLxSXuTgCL8wJxwv
         hpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170192; x=1795774992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x28Xy0+ypGVR1Zw9S5R+49vzuJ+Ze46561XBMNWt0to=;
        b=ew05XmPLJiwTJcc63MKL5GlK8CkEIZJjABTUkszhxRgjA+COWRS/ST0TxfCaV5YsMi
         VjCm9lRrm7+/Q+derCNcEDP/R0dBJ2P8o6jpPUcVHIf3GteK5lQ+5b8KtoWXtF5NLwG/
         OXUuIZqP65P1FUOrQbaF7hX5MbM+l2lje6PUn8v6dF1qITrVnCqY0Z1BdukO6cdpgrw+
         jQdMmIYqrdae6qgWM6MgCDe7LYQNLEw7OY7JOVyKaCMf+DuxNjpXiMlkVrGK/MqEgJS5
         3RDwdSxqjTO858VS7/pPYmIPSayugp0SnJ3btzTeSEdeoeiXkSFsZP9pACH52+vdzQED
         LDVg==
X-Forwarded-Encrypted: i=1; AL+hErHt6KX7kYwNwCKKajpq5AX7lyZXgraQLmroafBUtWGj5mmjD/kNk4B+Yr1N4T+lFjMN7mc0o+4YNGw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8YH4SI+DKajjSpL8kJ5PMEJRrRV6iOUM2piJ7Id0ZEE+3NATaP
	7Qr+9ujGd4J/IG4mClIdBTzXe3iFQxXQuu7iDZ5fAOiV14yLACtGUwji
X-Gm-Gg: AYBFou1D1WusrTPdUowQK92+D54XJnywpvYZlnCX7eXVJsj5Z+qXj4MhOTZZ2nCEO2x
	BeHwvsoIBnhY9OYft1YFyi0l7wq258NZbWXbT79CjjT60jd1O8W6yN/qDAIKszMvOkl+9nUldem
	WgLtXKoTARZAp7bRQna3Q6sFSr8y7QrbgowtlWoBw+p5SEuUiTGq44e2nB3Gti7rkRLOOJ4M51e
	CsGD6oUpX3D5d2yAPnD82SVv0qtzOM0iC9CXFMhc0cvoXJJEGCGXXsP4bT/AvGqZl6stMi+ZNaG
	/p3rM01Cba+Xq0Q4d2IFjaBR5A2hUZcD/NpeyLmJWYy5oMAE4ygDid81lbD46Qm8ZkSRNTXhAs6
	EupD+rkW9LgRG+3B5GWDsTz0mZJKjxxOdqiQNk8IuLlToAcFPgj6bmGPPVNVgklqogs4YBrWkq0
	2JOwcDiaCtbeb7Jjc20YCe28mLyDjBDpcf7iXBg97LISpYQpKvh6Wwc8UC8KEopyhGPuO6ClGiM
	J08PKTUSP2+pRsAzu7HO/yIYtGgychz0SQZ0iSoQ6OJnE/jRn/D3G26g8FTvcTuAHZiNLhZhLLn
	GJGRvJw/R/WFmm2pLQllhzbc0n8nsPuEQqMLyIh0qth6654QujnQ0NP2ETXPhISU3J5LTiz/JmN
	pgQ==
X-Received: by 2002:a05:600c:1547:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb8880974amr61098885e9.8.1795170191720;
        Fri, 20 Nov 2026 02:23:11 -0800 (PST)
Message-ID: <87f0019d-e5f8-4a18-903f-0a0d117c100b@gmail.com>
Date: Fri, 20 Nov 2026 11:23:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 22/26] MAINTAINERS: add myself as vUART framework
 maintainer
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-23-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-23-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1795170192-D5D4887B-EFBBF4B5/10/73395122804
X-purgate-type: spam
X-purgate-size: 1206
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
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   MAINTAINERS | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b804434d52d6..327adf4641a1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -615,6 +615,14 @@ F:	stubdom/vtpm/
>   F:	stubdom/vtpmmgr/
>   F:	docs/misc/vtpm-platforms.txt
>   
> +VUART
> +M:	Denis Mukhin <dmukhin@ford.com>
> +S:	Maintained
> +F:	common/emul/vuart/ns16x50.c
> +F:	common/emul/vuart/vuart.c

These two lack the xen/ prefix, unlike every other F: entry (including
xen/include/xen/vuart.h below), so they don't match anything and
get_maintainer.pl won't pick them up. A directory entry would also
cover the Kconfig/Makefile and any future emulator:

F:	xen/common/emul/vuart/

> +F:	docs/misc/console.txt

That file is the general PV console document (xenstore layout,
xenconsoled, vpl011), not specific to the vUART framework, and the
series doesn't touch it. Unless the plan is to document vUART there,
I'd leave it out or a separate doc file will be needed to be introduced.

~ Oleksii

