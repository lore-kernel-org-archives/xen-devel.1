Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1CE606A321
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 11:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=iejqbENq
Received: from list by lists.xenproject.org with outflank-mailman.1487281.1689736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRp8b-0000Ys-Fv; Fri, 13 Nov 2026 11:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487281.1689736; Fri, 13 Nov 2026 11:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRp8b-0000Yl-Cm; Fri, 13 Nov 2026 11:08:09 +0000
Received: by outflank-mailman (input) for mailman id 1487281;
 Fri, 13 Nov 2026 11:08:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1xRp8a-0000Yd-K4
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:08:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRp8a-0068p9-0c
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 12:08:08 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af6ef97-bab6-0a2a0a5309dd-0a2a4507ee10-2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 12:08:07 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af6ef97-b4ea-0a2a45070019-d155802bd8f5-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 12:08:07 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so6163755e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 03:08:07 -0800 (PST)
Received: from [192.168.1.51] (host-78-146-248-75.as13285.net. [78.146.248.75])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb566cec2esm35351575e9.1.2026.11.13.03.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2026 03:08:06 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:To:Subject:Cc:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1794568087; x=1795172887; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QS9bf1IobbOIotKh3VTuTbeh7Hn+DqKh/HcGHkOex68=;
        b=iejqbENqo1ZomKhIEN5eZWd5bTMY4a7hMtEE4gZ+FrV84+yyS1GE3RCP4tduWlTxP1
         bOY03Z4DfP4AUowkGFvp3hBONg4HjqpbiheGnZRuEMvFLizNC3YHO/Oz6zHUGwbBTHM0
         LjsoKLK8QZ+Pie/IrLHeh3ylyQsU5vVT9KZA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794568087; x=1795172887;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QS9bf1IobbOIotKh3VTuTbeh7Hn+DqKh/HcGHkOex68=;
        b=D86lc9Jl9xxnqVY/hw+qH8AdVO1/Sc1Qzb7GajSHGa4q3rJnEZ2r37wchV4gswchPW
         NE/S9Chi1vJPn2rRz/og2CTsinYqpEOjvHxQYH+QVCpeRtzX9Xp4L8lsrCY4lIBORmZN
         eQus2yzGajZZlYF6DoCjuGN3P5IwOGSkbhE4IPdEsAU947+Ky1fIwwj9arunZ4ap58m5
         HfAe14s6P2+jy4Cem5+3n61tucddPUTYB83LujNxgJQkPZJ74WSCHvtIEBfWSIbBFDWU
         HUvSJDZAR+zxMaS7Oi7uuSfR+1rx1AjsiQMHd4YixttfOX1D3Q1YYlXkX8FUaDgh8OVy
         KKfg==
X-Forwarded-Encrypted: i=1; AL+hErGXPgMIW01mX2UEWtlgQ5xAwHMU4CfOySTjhJdY9fuf8C566mfIJpEqQkip2rD20oEFPKzK+Vr5GGE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8fpglsruU6+UEudvJGff8aKURII68mYfMKI3hBAPBtifvd3eoe
	P8pOHyt5eLyd0T8LOUS1wT/sMOxDG+XFRjoOOYBFOBHVDmQSPINTIBoK2UOpqx1Y6R4=
X-Gm-Gg: AYBFou3rw9HErhMiV7FGg5yBsx4NMwDpIA7QaFqL2JJb7kw4+PvQS7Ys8l2EKVIzhbx
	ritz9EKw4/BnfaTSdmzXNdgNALcrSb932Xcu7tM9g/2ZKrPhirsAzuRmm47uonLdrgbjyzRDp9H
	mdB5WNFrcwIb3QplAaXDlstAi2KIL98qj8Diyp/we7eDWK2dJhiOcVU1J61UGVb/FOZJ5B6qojH
	/dQVXi47Nyaj+PIQ1GbomJYGvyOqqbOrtvVS5bXzON35hphp1X30jkQsUjgjz4exqSDmKrnUi+r
	GrbR3G/m5s+luOpxkmIfxiNwPtCdIBUgDb9pk/dajsStlYL3Kbo/UFmknG4GnhaTxiGEurT4JE/
	BPwAtCLrKdZ8x5wja42Y+TVCSILOCDQraEBHOBb58fC3Ss9dsLRt2egMdG+089wqZ+Vgt8AyDKw
	877iu2D/B5iA156JnJsiF2xnFhbQLJ2d84sypU2RWDattmRKW54cFewBUVLUoCOph2OroyB5b5p
	O8KFe1uORZ094waJKgKj8GZImiq+h1f+iTNICr8RPgp1I3IFjYN6EivXPy9rVUIhEGRl8+yv5kl
	FojtMp1xoudvff+yvIG0j9x005eZv9J2CBOsJVQeaWVFHbTV3Qb4rvBsaMKolxOd+tJ/9J6HW9t
	ZLZ/5xEIks8eOJek=
X-Received: by 2002:a05:600c:354a:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4bb55abaedcmr42056205e9.25.1794568087160;
        Fri, 13 Nov 2026 03:08:07 -0800 (PST)
Message-ID: <cebace3c-0a33-4e48-9c6b-a2dbdbc7db26@citrix.com>
Date: Fri, 13 Nov 2026 11:08:06 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH] xen/link: Move SCHEDULER_ARRAY into .rodata
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261112183620.3277591-1-andrew.cooper3@citrix.com>
 <df33fa53-8de3-47ed-984c-f23bc7161965@amd.com>
 <c5e2bffd-5576-46dd-a555-ef45066f35f8@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c5e2bffd-5576-46dd-a555-ef45066f35f8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1794568087-A6CDFAE4-48447D00/0/0
X-purgate-type: clean
X-purgate-size: 807
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 13/11/2026 9:47 am, Andrew Cooper wrote:
> On 13/11/2026 7:31 am, Orzel, Michal wrote:
>> On 12-Nov-26 19:36, Andrew Cooper wrote:
>>> This is a list of pointers which is only ever read.
>> I think that's not true. See sched_test_func() macro in scheduler_init() that
>> assigns NULL in case the scheduler does not implement the required hook.
> Lovely, sorry I misread the const on the name there.
>
> sched_test_func() on the other hand can be delete.  We can force those
> checks at compiletime.
>
> But, there's the global init case.  None of the current global init
> hooks do anything except return 0, but I suppose in principle that may
> want to stay.
>
> I suppose I'll keep SCHEDULER_ARRAY in read_mostly for now.

Actually no.  They should be in ro_after_init.

~Andrew

