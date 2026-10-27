Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66C2606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GCAhdSES
Received: from list by lists.xenproject.org with outflank-mailman.1461945.1672958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLd5U-00057U-AK; Tue, 27 Oct 2026 09:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461945.1672958; Tue, 27 Oct 2026 09:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLd5U-00057N-6w; Tue, 27 Oct 2026 09:03:20 +0000
Received: by outflank-mailman (input) for mailman id 1461945;
 Tue, 27 Oct 2026 09:03:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLd5T-00057H-9I
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 09:03:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLd5S-003Lvq-EQ
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 10:03:18 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ae068c7-8faa-0a2a0a5109dd-0a2a450c9a7c-40
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 10:03:18 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ae068d6-f479-0a2a450c0019-d155dd34f064-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 10:03:18 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48e04773687so1262406f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 02:03:18 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3eb8f37csm17545198f8f.8.2026.10.27.02.03.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 02:03:16 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793091798; x=1793696598; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxjO1Kv2vQzQyD/gkkSr+kz1ao5O4z6geQtsdpKJpt0=;
        b=GCAhdSESawOWqyzTfl9yqznlhhA59j9QHHiQ6zeWQt3TfYx6PHTq7zYWwHYDSbdxLA
         MD7EnXp5s4/cAQX52SPFDxVa7eV5FmfGll9+eL0A4LfO9vnaN6tXP0ts9G2wo3tN7EtW
         yWzaZuGR5LTmbcZmT3m2rCSB2eguCh2wVJSMen4w2JXL3866+lTsiw86cr6BvN+6tOwY
         ChXFbIpQsmboMPcaFuU7S5LyIyvcxPB3o1PQUYtv5gkTKTOJlUrrtYakCDCSuQ8fVyHa
         psBov7qEmwezPfhDLpiAuvtkuFyiRIz7A00IHQ9YImGwNo1uj/WYsX3rxtH88RWEAUU7
         J+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091798; x=1793696598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxjO1Kv2vQzQyD/gkkSr+kz1ao5O4z6geQtsdpKJpt0=;
        b=ZGAQPwvuryMXemC/eiJ53T/TUffMo5KoHGxMmsVca2rmBqxc1vS1XrNKB2X9aO1fLN
         6G99gTY8FmRBO7xmrtj1J0UJpF5iuAJz09JWDplylQryO0NZ2LZN6pKSaJTXG02kHWpJ
         YeZAIJy3GcKuuthQkiWeIzBZhO0rLfI2DrK7U9YKwCZxUz5j5EPo2yfTL75EEsRJDzPV
         DLuat98PtJYR4rzFmZRsaMyds6ECYDp3Q4YeEvlnLcBJ531wk2C8WicGSQ5/fOftHZkB
         2QsSEUWQTZ3DfTZpmyGLAxGiezC3JcT2nNBjCWn/5di49FenfHhTh6b92Mihv+oLUtJ0
         C2XA==
X-Forwarded-Encrypted: i=1; AKwUvByw2arbIR8DEW113ccDrp6ZOxhrgf3tdyKhKgtrjIZ3Un/p211dBjjnw5j6J3liqD8pGmioL4a1PKY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJLq/Qm6Aw28bVrmBWJfR5PuvFqyo2HtC1KKy7LxQKBj/JRTWRF
	mqyNpUHvB5yaB5URTQGU18AUP8Q4EczeUbFq25bxgDJn1qx+8CYIoqPL
X-Gm-Gg: AYBFou1CGgYShhTTjGVuv1cAsMumsnrBgMHzyCSDDxyfGpX1vWdWGbdsmjphzZhSbUX
	kCcwcNKxVdE3CLpmDjBcg1bnBPplslYFqPdY/3Sq3IUOPBNuoy147tYJmqZN5MeLT1VVT/XuKG/
	IinZAJy1rAVl0jAtHjtpH+GNTen+U5Tp2047bqKqFFB2gbIssmon8fuClAjXU/3NM86SaxAVo6A
	ZoSqfQflYrtmfi4iaRWCD6RLN1MXUuGy8SJQF68rHMmg59vHzVNwMmWvBhMshxSp0pU5yvNS9Tz
	u1ZkwgHr+fQRNIP3pkxwIR5GtOqjzBkjRgEGIvwsAM5+S6YrNABnqtua1hzcN10WN9n0zouz9+c
	dAYARvSjpO6+X5XEBM8UmsqWywLInPHOxIgSb1pFddP41xNzBPlklMP/eXX/w5KY96AhSBv6cZq
	mXUUttOG/a7sm7yeWE+AYyjO+nO2+nEisPy3CAvCRrj6EA7V/BG9KxS8U/tn5St8ZB7plGYWHLT
	WmG5PUK5ceOkbDmK/z5NA5aVQzW1TeJ97wXNK8hUKljmdTNM3/1hLyRFwUoEzTFCC4PHvRtD6o6
	m/n8XmPgbbP3CHD/zYjg99+Xyjgx8g==
X-Received: by 2002:a05:6000:29ce:b0:48d:eb6b:9d0f with SMTP id ffacd0b85a97d-48e3eb6153emr9966461f8f.11.1793091797475;
        Tue, 27 Oct 2026 02:03:17 -0700 (PDT)
Message-ID: <6c0d9aa3-fb6e-4916-bea2-033f3f9dad96@gmail.com>
Date: Tue, 27 Oct 2026 10:03:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] xen/riscv: probe the A/D update scheme if the DT
 advertises neither
To: Jan Beulich <jbeulich@suse.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 xen-devel@lists.xenproject.org
References: <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
 <1793027685.8631fc262581453bbf619ec5b2062170.1a178c73a5d000f79f@vates.tech>
 <9986e03e-bf09-46b6-9d2a-82a1864a59b5@gmail.com>
 <462a149d-9a4a-49c7-8db4-96e99463a47b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <462a149d-9a4a-49c7-8db4-96e99463a47b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1793091798-028DDA5B-48ADD289/10/78276251493
X-purgate-type: spam
X-purgate-size: 1810
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/26/26 5:59 PM, Jan Beulich wrote:
> On 26.10.2026 16:35, Oleksii Kurochko wrote:
>> On 10/26/26 4:14 PM, Baptiste Le Duc wrote:
>>> +/*
>>> + * Probe whether hardware updates the PTE A/D bits by writing to a local
>>> + * variable through an alias mapping whose A and D bits are clear.
>>> + *
>>> + * Check the D bit rather than the A bit, as the A bit may be set
>>> + * speculatively while the D bit can't.
> 
> Following Andrew's clarification, I don't think this is relevant anymore
> (but I also don't mind it to stay the way it is): If we observed the A
> bit set (and no fault), we can still deduce Svadu, no matter whether the
> update was due to an architectural or a speculative access. Svade would
> implicitly disallow speculative updates of A, as exceptions may only be
> raised for architectural accesses (unless there are provisions in the
> spec that I'm unaware of).
> 
> Both of you: Please clarify whether you want this change to go in as-is,
> or whether this wants updating again.

I'd prefer to update it: the statement itself is true, but it isn't a 
reason to check D rather than A, since, as you say, observing A set 
without a fault would equally imply Svadu.

If you're fine adjusting it while committing, the second paragraph could 
become:
   Check the D bit, as it is set only once the store through the alias
   has been performed.

(or just be dropped), with the matching sentence in the description 
("The D bit is checked rather than the A bit, as the A bit may be set 
speculatively.") dropped as well. Otherwise Baptiste, please send an 
updated version.

~ Oleksii

> 
>> Generally, looks good to me:
>>
>> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>




