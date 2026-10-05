Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFE1CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 10:48:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440735.1658175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDgEZ-0004hb-6r; Mon, 05 Oct 2026 10:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440735.1658175; Mon, 05 Oct 2026 10:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDgEZ-0004hU-42; Mon, 05 Oct 2026 10:47:51 +0000
Received: by outflank-mailman (input) for mailman id 1440735;
 Mon, 05 Oct 2026 10:47:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDgEY-0004hO-0X
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 10:47:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDgEX-00AjU3-DY
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 12:47:49 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac3804f-2eae-0a2a0a5409dd-0a2a4501d35c-10
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:47:49 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac38055-5984-0a2a45010019-4a7de18cb1e1-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:47:49 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49fff72474fso11086225e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 03:47:49 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c62837a29sm2609218f8f.4.2026.10.05.03.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 03:47:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791197269; x=1791802069; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+rslWrr5eeSrUMe8piPow0KdmVtIv5sLIU0fuFyEfm8=;
        b=gK6/UvMN/q2ULeVN+zNGaoGS6qPaTnfyzCcdLWZqoRjMrPq8GJzMse5olObm8FqHWI
         Zjo22hPhgJMfpHcWGTbaHkbndmP3kZlDj/4mtmkVBow25bGP7DPtg+2vZd6E9WP+IlTY
         Y0ph03RWAdFa34phbnfdspd56HTjyKwZC0bfG5pgRriXsFs6P9bJPxPpyMWSmKMtsyh5
         42LtK8eprmZaAEoAMQ2PORIVp9duO5mqx/bUJCkmj02AIPAaCleiYqKj5/rRZ4GRnlji
         yohSFXy/C5pd3J00DXTPCyCc4rWh+tHDk3sYnLQCrMI3yBLC5HjjjRPolO7Bk0U2I5PA
         MfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791197269; x=1791802069;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+rslWrr5eeSrUMe8piPow0KdmVtIv5sLIU0fuFyEfm8=;
        b=xSTk7J8WNyF2zETVHDrGH1xyZdQULuRgPA7CFy/zI+6oeuasQvFz61KrzrpMwOBln1
         6oJTUm6uoS1U2RQCilc9wM7S/E6YaYzuh1xknR8fbmHoM8972hmX0mQU40Zj0eBvnjUa
         EKT3nEgjRbpqhBTqDkpTIvL81icjXw046i3lD54OyuOOjK3nwg6JnY98ZBC3l5R9/+8V
         uD0H6r6+20Ys79W+Yhk4I5dkai4jqZBQYz6K73zDzmP8PEymffaEo9P0Cf1kJ59flMJ3
         ahV+4/gllpu8dukgtq6qSXgEuLOuKBLUU9oLA5+5vrXWBMmATQJvG+V9KvSEFGcyfQJr
         SMpA==
X-Gm-Message-State: AFuF++mJ/NF5ZcJtAUxop5t4vnoEhu/6/wVQyXyr+UGuhvcBawC5zV7q
	ZAlk7d6cmEub0Ivr5rt0tp+llMR1t6kSrRysrclkd6iZMcbyK2KMtMgC
X-Gm-Gg: AYBFou2LiW5eRPRbOHIRsW+0o40jaKIqUcU4I/oqnkqmkfzhzE63vp7DZcFb3eZrAbX
	KO3WKx4uG2wOS/HyVb/DlMjpyzjW8jVQGR9Ak+rTYhjPK69JLWH19Fk78qhCkgGPqcU9MBCvnP8
	TNLYKtVVL/j7zKwVllSptGa3yUwgWRxfQH4egzAghOkxwRnK38MDE0AKbhL3wS8b/C6eFcXlE3Q
	q7+dZA+Eb1apCaDmHrX/AyyVdIKsDwDk4ge32aHN4I/HV6ULD8KAH2REQrSnpaQ8CkFY3FCIgEq
	lWtYYJ6N9rjxsSQmtiyqRYJTEQ3ADtqg8X9Bw19hgiauMvJbqhkg7dCP6zZ7FXZAnmwzN+AR1Ed
	/zdZ3UQkLW1xXRQWZU314OuRcOoEGpMUNdDZYfXAJQPLF0Xyj88wm2MLHU7e4klw/IovSuUrC0M
	j4GNFDFUJt2Jc3SMkEGFDwD5mOO3DKgDDMToFvatbtSheaR7RQIAw4itxqW/eYXQ6900NBPycO3
	0t5razybG4qGcKAfMVmD86yLFHFYaJ18OVAfo0k3W+e6f35+A==
X-Received: by 2002:a05:600c:4e8e:b0:49f:ce78:3561 with SMTP id 5b1f17b1804b1-4a02759b360mr189029705e9.18.1791197268546;
        Mon, 05 Oct 2026 03:47:48 -0700 (PDT)
Message-ID: <1eedf751-5d4f-46ec-b3fd-1149b35d92ec@gmail.com>
Date: Mon, 5 Oct 2026 12:47:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] xen/riscv: use pte_is_valid() in pte_is_mapping()
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <1790845467.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@vates.tech>
 <1790845650.8631fc262581453bbf619ec5b2062170.1a0f6b805100003f66@vates.tech>
 <1790846121.8631fc262581453bbf619ec5b2062170.1a0f6bf34f40003f66@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790846121.8631fc262581453bbf619ec5b2062170.1a0f6bf34f40003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1791197269-BFA6E757-39BCAA3B/10/73395122804
X-purgate-type: spam
X-purgate-size: 1211



On 10/1/26 11:15 AM, Baptiste Le Duc wrote:
> On 2026-10-01 11:07 +0200, Baptiste Le Duc wrote:
>> Use pte_is_valid() instead of open-coding the PTE_VALID check.
>>
>> No functional change.
>>
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> 
> I forgot the changelog for this patch:
> 
> Changes since v3:
> - Rebase on the pte_is_reserved() -> pte_has_reserved_rwx() rename in
> patch 3, only the context line changes.

I’m sorry, but I’m not sure the changelog entry is expected to apply to 
this patch. I don’t see these changes in the patch itself. Am I missing 
something?

It looks like this renaming may have been done in one of the previous 
patches, since there is no + or - next to the ASSERT line:

@@ -188,7 +188,7 @@ static inline bool pte_is_mapping(pte_t p)
  {
      ASSERT(!pte_has_reserved_rwx(p));

Anyway ...

> 
> Sorry for the noise, I didn't know if the reviewed-by
> Oleksii gave applied here as I rebased the patch.
> 

... I think that you could keep R-by but anyway the changes look good to 
me so:

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks!

~ Oleksii

