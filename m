Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE459C88E64
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 10:35:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420718.1646958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x641a-0002vm-Lb; Mon, 14 Sep 2026 10:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420718.1646958; Mon, 14 Sep 2026 10:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x641a-0002vf-In; Mon, 14 Sep 2026 10:34:58 +0000
Received: by outflank-mailman (input) for mailman id 1420718;
 Mon, 14 Sep 2026 10:34:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1x641a-0002vZ-2d
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 10:34:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x641Z-00Cy2y-FH
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 12:34:57 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aa7cdc6-bab6-0a2a0a5309dd-0a2a4506b762-22
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 12:34:57 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aa7cdd1-195a-0a2a45060019-d155dd2fa871-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 12:34:57 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-48431648f33so1782467f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 03:34:57 -0700 (PDT)
Received: from [192.168.1.109] ([85.107.101.239])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb35c071sm25984659f8f.33.2026.09.14.03.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 03:34:56 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789382097; x=1789986897; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jawtF7j3qPP2d7G5bvrt5AsqmK13Zt06E+7LKY6ouMQ=;
        b=J3DuhVZk6SgwBkVXVGGFCQyDEMWTjndBPMLbVcu1M0Khnb+WApheRrsvP0cTLJr/l/
         4BgaexNxNhPJJmbveqKBIC4fnVkptyA1FL/xtmkVna4Fsx+Q25eSIb7C8x7A+Og4NebR
         3uL5aQVMoiKLjp43+S+5bkL2S24CrGqF5YeG431XZfCPKibQ5ptxPcLOV6h9rIbkOgc+
         tS3Jw6GtBMI4vf6tdIdKXZq/jgSxdpjCnoggYZzSBd+cym08VIK/AnnhD2Vm3GDmZLyU
         ocGY9Q5fXJimsk9UjhPerww1eZrG3Wwi6lLtn2JWRPu3/IBQq4E3/kAlm+6qgKmEB7eh
         J3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382097; x=1789986897;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jawtF7j3qPP2d7G5bvrt5AsqmK13Zt06E+7LKY6ouMQ=;
        b=T7w9Hg1HaFcYB9SnJGU2lqlSf5cVcJBABS+dw4g89hYdg6v4XtoLFMRQewZBAIXhCL
         1DlGdFR0u4NueUUC2y22vYHY/fFiinI/qu4c29HaXnBsrDu4/qQ5cMIrlXjUWrlIrfW2
         3tGt89pARXmqWJM2MjlInObiDp04uIVmUKI6hhvEOTc8+1yHDNTZMWF21St+Ykk9qGQo
         y9ouzIjwbfb+YGsYz5ESFlI3rNA1nKaxUxAuscT3wHU7jqrBohU7Ys1ehJPlcllLBSby
         yEYwiBrbxfcnbLb1Sx8b87gu0Ju9BoWY7pGZZFRTTuToHO39vN+4fyQsMCCt6B2XUFFA
         EHxw==
X-Forwarded-Encrypted: i=1; AKwUvBySAQL/iJM7AuF+Nlw0o7ej+ci6U/Jtt1PuE1d9zaI2L/pnovMZb1cJUZ/MWOhFvw2BdktBL6Guv5I=@lists.xenproject.org
X-Gm-Message-State: AFuF++lE2LLzFDBedu0jCF9ZaYZn+Z10NA0WCI5/b3jJdsXibn0Eb0ng
	gZ22fQjHmSFcn09q+WgsTAgxxvN7psIx3WRuTgSrNM6OdbfqCE37HuYg
X-Gm-Gg: AYBFou15RqqeerT+6dr2u1ZM1tXW6Q954jX/ZkpjApa6bnMzRPcGr/mj4mNsWxA/T84
	h/KfR/mKMcvKKhZd59Vj9jaCIjSYKMt7AY6lpb0vcKg18MkGvnLx9qLpNMqOK7I0RmLJ4IHt2/B
	ofY7hXPbp0z0iu1YRaRFnQCTpVn02fZTXS2pGxZwhGBI/8i5UDFPo8FwvW+FAnFw+l8uEp4VIIg
	KqpYUtTQbZt2AuxGZ4rOhCAVg9wFmeIVCah3KvNhJ4ThOdlbD6uSkrA6sWlnTb4ApFtKBIAXDyr
	Dp2jE2ShD9jyYVZHlL1PZW7DTB/RgrB8uwO5b0QiIx1jzNzjfvuddvaXxJojFzqFufp3XWKMx8U
	BQHjPxDgiZFtyz/q8rvI/q2dez3nkLu5FoEakmmF/zibhefzvwTWW768mCh2KHNMSUNexIqUryY
	tWeHAR3UcV8KYxyHQMoYqVyWOEPizMPipj9gGqsMYJlN39qCiU22BX0a+CDV2ysxu6u7bP/OSUU
	7pAxe9U
X-Received: by 2002:a05:600d:848e:20b0:49d:28fc:d6a0 with SMTP id 5b1f17b1804b1-49e7607d36cmr47216025e9.18.1789382096627;
        Mon, 14 Sep 2026 03:34:56 -0700 (PDT)
Message-ID: <85e6a89a-edc4-4d2e-9d75-5933af44f7fc@gmail.com>
Date: Mon, 14 Sep 2026 13:34:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] xen/sched: rtds: add global-EDF utilization admission
 control
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, dfaggioli@suse.com,
 anthony.perard@vates.tech, julien@xen.org, sstabellini@kernel.org,
 gwd@xenproject.org, enr0n@ubuntu.com, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <20260826045720.5779-2-frn1furkan10@gmail.com>
 <371537bb-7c12-4630-bb1f-57e301b1fbf2@suse.com>
 <325f2b44-ea61-45e8-a681-c0bb08d5766a@suse.com>
 <6fc3aa29-f6b5-43fd-893c-f4cbab0b5c84@suse.com>
 <67395a7d-ccd7-41a3-a925-8679e5d37911@suse.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <67395a7d-ccd7-41a3-a925-8679e5d37911@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1789382097-F70C777B-48F2B81E/0/0
X-purgate-type: clean
X-purgate-size: 1227


On 9/14/26 12:45, Jan Beulich wrote:
> On 14.09.2026 11:33, Jürgen Groß wrote:
>> On 14.09.26 11:13, Jan Beulich wrote:
>>> On 14.09.2026 11:10, Juergen Gross wrote:
>>>> On 26.08.26 06:57, Furkan Caliskan wrote:
>>>>> @@ -892,8 +983,19 @@ rt_alloc_udata(const struct scheduler *ops, struct sched_unit *unit, void *dd)
>>>>>    static void cf_check
>>>>>    rt_free_udata(const struct scheduler *ops, void *priv)
>>>>>    {
>>>>> +    struct rt_private *prv = rt_priv(ops);
>>>>>        struct rt_unit *svc = priv;
>>>>>    
>>>>> +    if ( svc && !is_idle_unit(svc->unit) )
>>>>> +    {
>>>>> +        unsigned long flags;
>>>>> +
>>>>> +        spin_lock_irqsave(&prv->lock, flags);
>>>>> +        rt_admission_test(prv, svc->unit->domain,
>>>>> +                           svc->period, svc->budget, 0, 0);
>>>>
>>>> This use case clearly shows you are not only testing. :-)
>>>
>>> Yet at the same time ignoring possible errors.
>>
>> I don't see how this could happen, as new_period and new_budget are both 0 here.
> 
> Okay, that's simply entirely invisible here. So before freeing the two
> items are somehow zeroed?
> 
> Jan

Can you please clarify what do you mean here?

Furkan


