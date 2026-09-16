Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C591C982C4
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 15:05:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423291.1648504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6rCH-0002Yb-74; Wed, 16 Sep 2026 15:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423291.1648504; Wed, 16 Sep 2026 15:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6rCH-0002YU-3c; Wed, 16 Sep 2026 15:05:17 +0000
Received: by outflank-mailman (input) for mailman id 1423291;
 Wed, 16 Sep 2026 15:05:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x6rCF-0002YO-TQ
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 15:05:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6rCF-00AhOQ-9x
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 17:05:15 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aaab02a-bab6-0a2a0a5309dd-0a2a45049700-6
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 17:05:15 +0200
Received: from [74.125.228.140] (helo=mail-ej2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aaab02b-b57f-0a2a45040019-4a7de48c849b-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 17:05:15 +0200
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c254f55efe5so180047866b.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 08:05:15 -0700 (PDT)
Received: from [10.72.3.60] ([91.26.93.146]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c29de454babsm151691266b.12.2026.09.16.08.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 08:05:14 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789571115; x=1790175915; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WKwD5CEyyczDXC7rMb4uQ85VEJAd/Vp60j6HWY+K1ww=;
        b=COIn+Y9e4i2uweasTeGf22VKAD+c3ifC7+oxgHRmUi4dxczCaUIxrOSac/8GxfT7OS
         +89Gt8aQGHbFQCNQnekqr+HXqqMtzDbWYRZYZ4tcc2Vsl80HJkz++899hl+v4ehIbsnd
         PiW7A0r6zAHcE7RrkgN7NJZ3v8dBc4YPDWIOnysDCzVvRImSLJQwqj2Khw3G3MynBdrR
         MX8msArnQ0IYubJIe9dyKmwqeal1PYiJFskQbHacT+7DczqE3EFs7wBH279fIUK7KVfi
         a+3+CDpvmdtb7Yg9Dko+mIzuymujnI2js0mW0NOcnqYK0X8HGLlVQmSGjKHFX8Rl8S0A
         pqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789571115; x=1790175915;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WKwD5CEyyczDXC7rMb4uQ85VEJAd/Vp60j6HWY+K1ww=;
        b=Beq5/Pr8jY+hGcZuqfZaGmYpHdEnMnIWMGB6xZTBcFi2ZOhf6pHeoDZpFPwtYVcEH5
         R2NbXZxsgsVBxBgXu15XxeWNXnYCwchx1R/IZaNjt4jKGalrYHgmlBxtqHyzVR4xxvQc
         AK/o5/yHUoLTZquQ2oXcW+jhvnxvvbgBcjMs/Iu/czn+TPQAR9cyGCH+WKX8FCoQRVFu
         vh7IAsHGTcy08CU/Ij+HdMTbl/1pX+5BrhtYKsC6utWIRbXw1XS4LtMdLp00cMNkpqEi
         hUbhWbPifJ/3FMRNs5uSKg3pL4rJNEEUz15pJGTvGza+sSov/5BFUMK5vlAd45YJbhKb
         vOOQ==
X-Gm-Message-State: AFuF++mcPMqioPi6AWlXKcDH/ueYTBbi3y92zBu0rWPwoY2R6p8yzvdg
	/LkRL5KBeAObk3TB7gaQvBDaNwP/MKEH+/DHQihWGFt2gHsIjWT/U/wlB21JqjwUeQ==
X-Gm-Gg: AYBFou144uTHCP1Vw6nUF+GSUWAkfnRTjndOcyYuMgy8jZD5uHJO1PsMElgiKE0mRu8
	Q/Z7FxuKHB73DoOyFal9ChOK7DW601MgdyEc91dNXK95PyudRE34LoQ9GXKIs4/QPd15+L5Y2oj
	r2OCYZ/IQnncbfD1CFAjAZGBycMMlZ/9J6nvsa50rYuVYE/dx7uzK+K6a1tCGD5X+8qgZWDaoyD
	S/qq1n/atpWXs8L1icp0Ol5tnXJEvSoWuoVmHbuQlqnoe+bg3WmNHhFow3CXNCC93Lr1iS34xIA
	3sUoETdR7vI1Rr9PGq4T8UkoW9tqyFwnoCtZJbMr5msfjSObdZ1jwjrUQ6ASZ4RT85hRPdCLsVc
	Uax5VD1UOBpeBk+JzcLMoSnppdcnqFr1tQVEyUDg1crQE0GBIc/PcyFyxowI6U39oxZgnu03vM2
	vEZGMyP2BDKsHIPX/CylU8RNNXoKdn34zmQeg8SAjGKTJz/RL8ZhIYtUmgFGJtt5uQ0kUNn+uPi
	Q==
X-Received: by 2002:a17:907:9343:b0:c29:62d8:68af with SMTP id a640c23a62f3a-c29e5311f45mr201016966b.47.1789571114597;
        Wed, 16 Sep 2026 08:05:14 -0700 (PDT)
Message-ID: <64821a66-6726-449e-b1f4-2d8750e99f95@suse.com>
Date: Wed, 16 Sep 2026 17:05:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] EFI: avoid OOB config file reads
To: George Dunlap <dunlapg@umich.edu>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <aa19318c-c91a-4cda-b36f-d2049914c42c@suse.com>
 <f0cd81c0-81d2-4273-a2c8-736ce976670a@suse.com>
 <CAFLBxZbhF8=1RC4-6jXnaVYjxxk6aGTadA_kaCLbfop2xqYyuw@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAFLBxZbhF8=1RC4-6jXnaVYjxxk6aGTadA_kaCLbfop2xqYyuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1789571115-502E4B50-458FC1F8/0/0
X-purgate-type: clean
X-purgate-size: 1263

On 16.09.2026 16:37, George Dunlap wrote:
> On Wed, Mar 25, 2026 at 2:24 PM Jan Beulich <jbeulich@suse.com> wrote:
>> @@ -878,6 +882,23 @@ static bool __init read_section(const EF
>>
>>      file->ptr = ptr;
>>
>> +    /* For cfg file, if necessary allocate space to put an extra NUL there. */
>> +    if ( file == &cfg && file->size && !iscntrl(file->str[file->size - 1]) )
>> +    {
>> +        EFI_PHYSICAL_ADDRESS addr;
>> +        EFI_STATUS ret = efi_bs->AllocatePages(AllocateMaxAddress,
>> +                                               EfiLoaderData,
>> +                                               PFN_UP(file->size + 1), &addr);
> 
> efiapi.h lists the Memory parameter as OUT, but that seems to be a
> mistake; the UEFI spec [1] says this is IN OUT; and the other two
> callers of AllocatePages in Xen initialize the value before passing it
> in.  So we should probably fix both efiapi.h, and initialize this to
> an appropriate value, rather than passing in stack rubble.

Oh, yes, we definitely need to init the variable. I'm less certain about
efiapi.h, though, as that's an imported header. We'd need to check
gnuefi, and import a possible update from there. I guess I'll leave that
part to the maintainers...

Jan

