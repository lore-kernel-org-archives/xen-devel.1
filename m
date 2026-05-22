Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FDFCD5BB3
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2026 07:13:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1316376.1585759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQK4I-0004Ot-Q8; Fri, 22 May 2026 07:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316376.1585759; Fri, 22 May 2026 07:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQK4I-0004Om-NR; Fri, 22 May 2026 07:13:14 +0000
Received: by outflank-mailman (input) for mailman id 1316376;
 Fri, 22 May 2026 07:13:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wQK4H-0004Og-AC
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 07:13:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQK4G-005Iut-M1
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 09:13:12 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1001f9-e002-0a2a0a5209dd-0a2a4506bee0-36
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 09:13:12 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a100208-7371-0a2a45060019-d155802dd576-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 09:13:12 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-48fe26a177cso52283235e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 00:13:12 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49042aec059sm11244405e9.28.2026.05.22.00.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 00:13:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779433992; x=1780038792; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pr2shRaWS2fF84DEieW/TNvVy/2Fb7SEONyZc10LoPc=;
        b=Xb5CGnynFd2Lmz7UlhJ5hjdFPwPMYKA365NjhNYlFFi3wrjv0jjFVKOgqJC5vtG8oU
         fHFcGAa/0ymL/DxvpJFsWvZchcZ/WRW/KZEQkTtDmsG3RezY5nd5lRyvRXD9waAOyuxG
         28GGMlEHInDduwdZKJBybV7yAfxmuglSmHI/HIlJ5+FP88QZIo1m7cqHnzrG1XDzDyhv
         j4auQKSbMzbuePmZ+O1rif2bpskK8aQe5coAlE2rBQ5/nkVW/Ig6LDlGOl/otZ4otJmA
         HucIVYytJ6d9LxckfoE9ngakAn3SAD7i4N7BvTuVutbQ5BbU0+uNnTO0pmSdetFowD6e
         m61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779433992; x=1780038792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pr2shRaWS2fF84DEieW/TNvVy/2Fb7SEONyZc10LoPc=;
        b=fofLIm8iMUASpaM+WeESOkTvSF9H2uVL1oYtzLrY7htohemxZHF1Sbvw5I2w4VX7n2
         rHRyWDD5Q4gxWkGwqxebiN2k54oURQmRRTtxAzzikTZKu+euzf1MDMK95Z5tGRqc4rps
         bpPAsBb8IT+XOdGMWQFl/xDSJKjJV+hwaUUu314Fb8aeSETa3l9W24+KH+Azfm1HlwiQ
         7klHQK/mW43cLozPheRfQ4mkWk7t8UXQyvqOPi4XIbKu1KR4uBGrgiwtoePXsGnAdOWh
         cXikDJvkcsukzyYiCrlQDvc4fHziKLYDzTa8zREFYkmzieKbzU6cOHpJWDPtRSYc3Fel
         uYzg==
X-Forwarded-Encrypted: i=1; AFNElJ838SDgrrmDjLnNjcmCYSi4irfWnSx1lEyMfWUjXx3yMYb8WKvIQ00fdOymBh4weJ2fHT5Cik4pPpg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPVQjiiomNJ9QaB3hRLWqP5o+vjs6FuPXPFbOJhphXqeiDT9r4
	B9Q851xegUex3G2cXPQzeAZbrKr6z7GTHVP2zmR51DstY5QboY7ZFAXR
X-Gm-Gg: Acq92OHafICBNQk5wJabVUfNzyeiI2R8W0Der7gCwsfrelqhH1xwO2nxgUecea3JNz2
	DUsSbRDL5i9wSKbeWQ6HhBcyp1zxTUA2fRtGXs9iJCoqKN7c24RzCUXcAmHg9h3CuVeZ51didVM
	B+XNhYAGH0jpyC64EQEn0961MnMjPWvEiGx8PcwV7DHPDkHcxUEPoxnjWowzz8yI7vfhJHHJgUf
	6stpMAGm7/Df5JqBAAperDrko94Gn5ozZStNGcmQ4PAMR2mMNU2YEpFuqmD4bCaVq9W/8X4Actb
	pxnkhbVf2tPG+4vOEZ736N+vX9u8HP7DGDyu25cRRUZXNu4RdJHZfydKtZMqfe5gT5Lu7l1cCGV
	Qmk8TV+GpXoltJIsZMveP61n714QZNgLrtIvlN9+BO7GKrw5X4s2TC2Yjq6uavxFFOUD0Vexzk5
	1Q+lMIS6wF3FkcD63QiW9oiq6NWq/4OKIa4U3iBP9qXwacw7I0WyY3xInnVtNRpgLgLL7FQ1UIr
	j8=
X-Received: by 2002:a05:600c:4706:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-49042487e09mr24557545e9.4.1779433991900;
        Fri, 22 May 2026 00:13:11 -0700 (PDT)
Message-ID: <a38c3b10-a7a3-4c16-a8fb-9932a6785102@gmail.com>
Date: Fri, 22 May 2026 09:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22? 0/2] x86: don't exclude time.c from scanning
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2ad2b572-45b4-42a5-9b7a-80eebfacc80e@suse.com>
 <d87a4771-b2c7-4696-a45e-726821bf1963@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d87a4771-b2c7-4696-a45e-726821bf1963@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1779433992-7FF7BD75-1F63A2C2/10/73395122804
X-purgate-type: spam
X-purgate-size: 505



On 5/21/26 4:34 PM, Jan Beulich wrote:
> On 21.05.2026 14:25, Jan Beulich wrote:
>> 1: x86/time: address Misra C:2012 rule 8.3
>> 2: x86/time: don't exclude from Eclair scanning
>>
>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2543286982
> 
> With the quick R-b from Nicola (thanks much!), what's you're view towards
> including this in 4.22?

I am okay with having it in 4.22:
  Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

