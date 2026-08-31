Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6216EC61DE8
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 06:00:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403773.1637746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0v3o-00044v-CJ; Mon, 31 Aug 2026 06:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403773.1637746; Mon, 31 Aug 2026 06:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0v3o-00044o-7i; Mon, 31 Aug 2026 06:00:00 +0000
Received: by outflank-mailman (input) for mailman id 1403773;
 Mon, 31 Aug 2026 05:59:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1x0v3m-00044h-Kz
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 05:59:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0v3l-003Yxj-Fs
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 07:59:57 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a95185c-8faa-0a2a0a5109dd-0a2a4506ad90-4
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 07:59:57 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a95185d-195a-0a2a45060019-d155dd32e4ce-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 07:59:57 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-482ea739de2so1787438f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 30 Aug 2026 22:59:57 -0700 (PDT)
Received: from [192.168.1.109] ([88.230.40.90])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4843ce8b015sm3251163f8f.13.2026.08.30.22.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2026 22:59:55 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788155997; x=1788760797; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XfxbA2i+f23qwNxWpVJUWwp2eUr44EFO/Ti3rWFq6J8=;
        b=ezDiRyhvnAhZud/zdIIopqZQ84yfCHXkwnaQLzTmFHLK4HdllAp2NzSu+NqNqQEwzl
         zrrgmkGVSAYZiI2yE/fLgMZKq4ZeBvAk8/zY7qhaGdu2DZyJDJu6wQeeWxTFKSg1VsIM
         LfWAiQAfoykDroul6TPyhk+ORs1MM/BfdMBUGdb1igXb8MAcV9h+3m3QJeLzlj2BGbIy
         dF8UPoaR0XFFOH4kaJLJrPHv91hE7gRysnKxA3I95ZMIHckbJ9/+IhtM2mlDrBEXRiT0
         pdySVivvCjOk/aIUB0zXTE34OXw2jh9V3+DeTf4oyEmJ/BlBcaY1MtKX4Ox3xlcuM/Z0
         saGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788155997; x=1788760797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XfxbA2i+f23qwNxWpVJUWwp2eUr44EFO/Ti3rWFq6J8=;
        b=QNa3//V2gjx+XMhh1AUhkS4PLp0ucZeomSTNSa18Xc7U1jaj9JmUosu6/QtbB/ZUJq
         3CNvv6hVNppaWkS3sPFrFf7N4qNphNh2uSQbWU81cP1pMdICueHIGSbczMow2ew27Q/T
         57+3sEUCUlzZAz0SESRd+DOtmHlmXEx5/+qbNwQuHdDGtqHb42QwCwSVMTfU9iG2UHmt
         WCyQIM0+rcOHSX26Jkbg6tpqMrBDl8DtXXo7hRmFKf3+SIVRBx2XeBfX7C6I4AqHsMe1
         ysg+Jor4Fn134qphFAD/cvQbCrOmmewN+tNl19t09B9WXk70vGHcrlTSjDZbVygWl68w
         2OLg==
X-Forwarded-Encrypted: i=1; AKwUvBwNwfWVoawrApNA2QdSBXRgvL9mPy12jsky1uhyDobBIxZaJk10x8JlsYtTAUwjRosGOskX2w9zF0c=@lists.xenproject.org
X-Gm-Message-State: AFuF++lGQFiNIVZ8swPWUlROkJYHVt57/8T8N+V5DKrgHeltgCNi04eI
	rgSoA6245WDv5m7pXjQgEDxISZq+dQ8rJ6DTEn+Gf79f7HhdY84Hx/Dt
X-Gm-Gg: AYBFou3rgYtyq3ezKYropbN7/4wUE9c4WAylfkprI+HlHPc16wUHIjf7wRQJcH623uq
	jegUwhUMq4uT/NgwTWnopg3b/OTlWBGgnVx5na9ZtkBzWMVOTli+Mld4AjgCIfN1KpeAMgpv2xQ
	Xm+9la/3MAC/1AtOIVUmA69xbhI3hVZXLrT4RE2jHjpCcWLcf//FwByivtgvJ4vrDA8B/Fpk+Nv
	3HjUjyC9R40XlSB/+lfZCwCmD5yy+B2qXJ6DO8tiAbhUNzNo4ExX1DWMo8+wTF4u9Zu4cEieF8E
	1nJvsUyfmXoIvu3M4QY55XnWKrjmwUYCR+ehgeKgGyEnSN5UwL23x8num8JxVyM1/lepFE21BNa
	u74srD02/YiY64kDfxxgxBYBFApKIh6izmFcxhMRiPfCqdXHNa4Yv0FVwhV7iVm4NPx8ZPezONi
	fTHzfE8BuvQ3XMgdYj4fSc4O8yLymiFvUgnW8nxDO0K1SAZSms0TYRluXiG7Cc4DgExw==
X-Received: by 2002:a5d:5f8d:0:b0:482:ee81:f0ca with SMTP id ffacd0b85a97d-482f79c94eemr36614562f8f.12.1788155996487;
        Sun, 30 Aug 2026 22:59:56 -0700 (PDT)
Message-ID: <85c66385-7a28-4779-96d4-6b34f53b5994@gmail.com>
Date: Mon, 31 Aug 2026 08:59:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: x86/xen: Convert evtchn_ports from IDR to XArray
To: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Cc: kvm@vger.kernel.org, x86@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, paul@xen.org,
 xen-devel@lists.xenproject.org
References: <20260706081311.13633-1-frn1furkan10@gmail.com>
 <efe39d24a2621ce23f9d53471b3b587feaaa8526.camel@infradead.org>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <efe39d24a2621ce23f9d53471b3b587feaaa8526.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1788155997-1FECC77B-B6CDEC05/0/0
X-purgate-type: clean
X-purgate-size: 837



On 7/7/26 12:16, David Woodhouse wrote:
> On Mon, 2026-07-06 at 11:13 +0300, Furkan Caliskan wrote:
>> IDR is deprecated in favor of XArray: see
>> Documentation/core-api/idr.rst. Convert evtchn_ports accordingly.
>>
>> kvm_xen_eventfd_assign()'s single-slot idr_alloc() becomes
>> xa_insert(), since it was really an insert-at-index, not an
>> allocation: -EBUSY replaces -ENOSPC, still mapped to -EEXIST.
>>
>> kvm_xen_hcall_evtchn_send() drops its explicit rcu_read_lock(),
>> since xa_load() takes its own RCU read-side section internally.
>> evtchnfd's lifetime is still guaranteed by kvm->srcu.
>>
>> xen_lock is left in place: it protects state beyond the map itself.
>>
>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
> 
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> 
> Thanks.

Ping?

