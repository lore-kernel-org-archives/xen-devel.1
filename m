Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB85C5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 07:47:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388812.1629793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu3g6-0000JW-Ii; Wed, 12 Aug 2026 07:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388812.1629793; Wed, 12 Aug 2026 07:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu3g6-0000JP-Fg; Wed, 12 Aug 2026 07:47:10 +0000
Received: by outflank-mailman (input) for mailman id 1388812;
 Wed, 12 Aug 2026 07:47:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wu3g5-0000JJ-J4
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 07:47:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu3g4-002OsC-Uo
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 09:47:08 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7c24f6-8faa-0a2a0a5109dd-0a2a450bb4b6-8
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 09:47:08 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7c24fc-b7e8-0a2a450b0019-d1558033bdcf-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 09:47:08 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso3373455e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 00:47:08 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150bf412dsm5571774f8f.6.2026.08.12.00.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 00:47:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786520828; x=1787125628; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=omH6Psqa+nZQ3VqvSc7ewDfYwdMATazl10IXo7nn/VA=;
        b=R0r8UwY1px3FzhceeJIsbyYQJTRZjNDk2usm34Xr0GV4kyTEYJmRc6+SSvJjlnjmfb
         TZjVTEksgNmUKvfsuk4hVqXW4FWrF2M5Kv9iRUcdM8jo/J6axDTC15qZFsdH4hsXZoMk
         IkOagCJOdMlsakP70l1xJQSJPQmhbnB6LbTNoqXY7o4Vf+Y9fkYGL1+kWO0TYlRYmnLq
         rg3SV5CsGUQ0zcOkf/o/eVmu9TPleTp7xeUgt2sBDwLL0Ni6g+jb/QegX0z5yAsLD7lm
         5GnRqaijXy+kuysvWjFrfK/ugrhCfgCwtxsoD/EGxmGnqOoMiWIDCVq0U15923yzHR2U
         8MoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786520828; x=1787125628;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=omH6Psqa+nZQ3VqvSc7ewDfYwdMATazl10IXo7nn/VA=;
        b=LkdNDwO+HHxIYgmi9AGn2ozMvSGoCvs7cxiXTt89X9CJnlaSlGiMvkOTg8bfYPPuN+
         9R7YQI8rtY3uekp6Jw3fzAteNJt+Xw0lhth8ddMrl116j1h2AUIfH6sfUAAsYKoDbUst
         829KQJ7+sc1QTRUww0eMcbVaY0QW8bogasUd5ivrYw1cJy06ZG5fx+YGG6pIAwVT+Nt3
         +KuEv0K0Y8M/bd2eru73ZbPhX1+8jHTk3lSMc7izwk8biVyoXZtvdiFfO6RBxTlawsxj
         ucGX99IECswzlFOGliRj9dNRPpoWLKbb2FVZ0dG5sXD0lZu8DY+//p7jlfkjXctFc6t5
         UT8A==
X-Gm-Message-State: AOJu0Yzk0SrIIEeHRtAt7e0EPnMNYqepry/wSjN0vFUnMpdSDqWVUVTy
	/mMzCl//5V6QS5tGSiegiyD22gCTJgYJuVS8Ie+Hi7uu/0iH2H/laC8N
X-Gm-Gg: AR+sD11tOwye6t1JriRM5pCtMuBoMoEB1JQ3rDjA7CJfkWGBFGqoZZU/HDDcOcpFR8i
	vJR9S5EvRA1/hczJFz4vm/V7hArZxBxOq9OBI+cq+uUA2O1Sc3/CfJbvd2t3SM2oA6D4oLbDHhp
	+MgwCf2fopqhfRwU1xBrDJb6xAZigLssTGFWxtQl/C5yTHyW/NK+xz35NHSWEV9zsyPQLp7hWIQ
	QQn9aLlzfhVw+ohrwHouzoGjMtvjhn5HaoCyriOftWgUbPrrh6hmHCqD5uNMqC4RnDZk2nOYsDD
	q82/f68gPpVBSlI+XHj/+XQuLCyvs+6QyGgth5RFN/ixNPg8L9ICEXgdVQJQSo532CRQJjxyaKn
	59KUEfCLXG9A/FvMpUYzKrbpwis7sS3udUooio+Z7eRMvhk+TNbi/zEQp5qou/gR0OizISWP2go
	5MNUTuNJiGJxvpVvPK8kqVcacSTS6csiIxUV9WOkdvDai5uUBGfa0kOzqs7RPwRUArtw6Kk355D
	FkmuueOaQPVscYrILcwwq5R5ehBC3hSZH7GuNbBRKI=
X-Received: by 2002:a05:600c:3b11:b0:495:4b42:8677 with SMTP id 5b1f17b1804b1-4997c1721c2mr34926165e9.18.1786520828427;
        Wed, 12 Aug 2026 00:47:08 -0700 (PDT)
Message-ID: <dc0fc4dc-0e03-48be-b186-27139708cba8@gmail.com>
Date: Wed, 12 Aug 2026 09:47:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/17] xen/riscv: introduce device-agnostic MMIO
 emulation dispatch
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <c12b69710d7b79bfc0c110f3fa043d871d8b8394.1784560663.git.oleksii.kurochko@gmail.com>
 <1786373377.8631fc262581453bbf619ec5b2062170.19fec268e07000e099@vates.tech>
 <05283ea0-de82-4160-a3f9-5fc1292a20a5@gmail.com>
 <1786436246.8631fc262581453bbf619ec5b2062170.19fefe5dbbc000c4f3@vates.tech>
 <a58af12e-13f0-48a3-b39d-bff92991ccd1@gmail.com>
 <b7754a86-4602-4b41-a07e-3e6389dac78d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b7754a86-4602-4b41-a07e-3e6389dac78d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1786520828-A88C99EA-9520F32F/10/73395122804
X-purgate-type: spam
X-purgate-size: 973



On 8/12/26 9:21 AM, Jan Beulich wrote:
> On 11.08.2026 13:49, Oleksii Kurochko wrote:
>> On 8/11/26 10:17 AM, Baptiste Le Duc wrote:
>>> On 2026-08-10 17:36:56+02:00, Oleksii Kurochko wrote:
>>>> On 8/10/26 4:49 PM, Baptiste Le Duc wrote:
>>>>>> +/*
>>>>> Why have you included a copyright notice here, but not in the other
>>>>> files?
>>>>
>>>> So I just decided to do that for new files as I am not using corporate
>>>> e-mail.
>>> But why didn't you do it for all new files of this series?
>> If there are such cases then I just missed to add it. I will double
>> check during preparation of v2.
> 
> Hmm, I'm a little irritated by "missed to add". In past discussions (plural)
> the usefulness of such copyright notices in comments was put under question.
> They go stale anyway as code moves around. And likely there were other
> aspects that I forgot.

Then lets follow a strategy not to add such copyright notices in comments.

~ Oleksii

