Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44448C88E77
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 05:07:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422314.1647766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6hrd-0002v4-3y; Wed, 16 Sep 2026 05:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422314.1647766; Wed, 16 Sep 2026 05:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6hrd-0002ux-0y; Wed, 16 Sep 2026 05:07:21 +0000
Received: by outflank-mailman (input) for mailman id 1422314;
 Wed, 16 Sep 2026 05:07:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x6hrb-0002ur-Fm
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 05:07:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6hra-00E7xh-P7
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 07:07:18 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aaa23fb-bab6-0a2a0a5309dd-0a2a4505c60c-32
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 07:07:18 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aaa2406-4cb1-0a2a45050019-4a7de18dd05c-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 07:07:18 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912e4ad9so2334435e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 22:07:18 -0700 (PDT)
Received: from [10.59.3.202] ([146.0.124.57]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e83db9102sm46523255e9.12.2026.09.15.22.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2026 22:07:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1789535238; x=1790140038; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqy+eUnBDhR3xphgwfhff7sRpkik/R1pHavkMcVWaco=;
        b=MXvImZCOWlYGhh4Q8J65J6Hwjtxmej0YS5o48FhT1sGXFVr+5OnaBB1JgJ5Y34K1pl
         N/q3Ix7UQ+9JPzrIAaOwvn5+TzJ0zW3iTz5PgxeHG0tuW5svqd8DhVKmDNe3f5XQq68+
         JHNh1fGUPqqLCLIkQs7a6kC8DrFV4n3yjrgfWlqSfELo5fhVCj/VF7S3Z03TAWGRu9jc
         VbaXYcoTn20SvZXpOmfaUGiW15nHvUDc0jNlP6QaxqXePFPdMcRX4GPsN19i45wM0a1g
         b2nOQq/jeurCGPyiVWeQZs644fkC3tAfW5gifig+1gMc7J2ouiRfc0LBDskdWd0A2KIf
         qPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535238; x=1790140038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wqy+eUnBDhR3xphgwfhff7sRpkik/R1pHavkMcVWaco=;
        b=CM25yItX+oVmuYjFn3r0PcXTOEZMprhW6mfFzHQeciAMQA98GVQdHD/5HXF5fhs6Jy
         Pnfdlj/3oEYmc/ZHhu4IFE0fI040N7QBVW1uokRwba6B5srSYQmdn571vxODvOSaymFO
         Qpo9C90wvcNbQtQ3MKJVMpK3t6xIBRk/tANeahF+O95GLCluXF5HXuQF9IgK1va4BIF2
         jfuB7At8J4iDOr5KjU6MnLYVwOy66aH+WSbT0qNDjou9UHWWgrCmciYSCxpegOwxE5P/
         ZZk7250Qe6B9r1g4gubapg1RaFHKN4fq+s4Ptggl+QW7HOYW+XSBvMuK9IkhjthbQcKd
         U2Fg==
X-Forwarded-Encrypted: i=1; AKwUvBxV3MZNKH6SNOcDB/Y/ShOj/8sd7HLN9FFFdmBG9tdfbvQ/O/a8frtUFpFSKlUJ02jQTNA4QPO0hJw=@lists.xenproject.org
X-Gm-Message-State: AFuF++mswaMuHdtZq+Z3sKce2n2h2IavFAA8SIi+FWtvozW41KjvRReb
	/aPJ/wvjHamiz/yt9DVrFooOvyyA/33ImcdjJHWwPHUj+zOiGeaszvFeDdIzY+qZ8Q==
X-Gm-Gg: AYBFou22jwVcOHHXKQMpCr0GBS4MVl2jFe7ErTowz1klVgfEub9+VA+uRl5xw4+2sMz
	xTJQFFp9c9jIWm8ZgAM6ImQmCy3jbzGt41ds99oozi1jBLhXs0trx8Azdug/KKUbbwaKZ4099C+
	adMznpDzcxb6217WLBc8FyOq3SL3SBFRPZ5ouv3KYmmF2zranmbxOpR2Dr6wsW7+py9JXxQ4UCX
	N9rI5SpVTH06VjV4QFJmBBmChWA96t/yADzgHzPTt/4UBoxjan9XuHEikjBuTaSmcj6XQZvd4i+
	2IQ1fPGBJmUDNWb9H7nRRHdumo/HPi7OEF1TK+1+2TCw2WMqhKV7ilC7R9gPAC5UyjDtAk2EbQB
	2tI+w3hjkOmAMjRArWFh4zZ8OOCl1GW9x99THYCQtrjnRrf05JrX6lSAmrpxw413D7DI1amEPTb
	rYRTlbYCbms34bQhKnm0nxBPwnkXVTyaG2CTf7tGrXpuDov475XzH7YIFYDNgax1mFKRm5Q3G2K
	ZY=
X-Received: by 2002:a05:600c:c165:b0:49c:fc6e:a3d8 with SMTP id 5b1f17b1804b1-49eb733641fmr9448305e9.23.1789535237953;
        Tue, 15 Sep 2026 22:07:17 -0700 (PDT)
Message-ID: <85e4aa12-7fc8-4c52-9fdc-ca4408cc9375@suse.com>
Date: Wed, 16 Sep 2026 07:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nSVM: Validate the L1 MSRPM physical address range
To: Lin Liu <lin.liu01@citrix.com>, andrew.cooper3@citrix.com
Cc: abdelkareem.abdelsaamad@citrix.com, jason.andryuk@amd.com,
 roger@xenproject.org, teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <73918fa5-0c61-4a91-8e44-be5bd377141b@suse.com>
 <20260916031952.720395-1-lin.liu01@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20260916031952.720395-1-lin.liu01@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1789535238-F46A52A1-F21E3C5E/0/0
X-purgate-type: clean
X-purgate-size: 2239

On 16.09.2026 05:19, Lin Liu wrote:
> On 10.09.2026 09:29, Jan Beulich wrote:
>> On 10.09.2026 08:18, Lin Liu wrote:
>>> 8c36d5a500 ("x86/nSVM: Validate the L1 IOPM physical address range") added
>>> this check for the IOPM.  The MSRPM requires a check as well.
>>
>> See https://lists.xen.org/archives/html/xen-devel/2026-08/msg00242.html
>> and Abdelkareem's reply. If you disagree, please go into further detail
>> here.
> 
> I had missed that thread; the patch as posted should not go in as it
> stands.
> 
> The one thing I would still raise is that hvm_copy_from_guest_phys()
> does not only reject an out-of-range MSRPM.  It also rejects one which
> is in range but simply not backed by memory - and hardware accepts
> that.
> 
> I checked on an EPYC 9255: I patched Xen so an ordinary non-nested
> guest's own VMCB carried _msrpm_base_pa = 1 << 45, in range with
> nothing behind it.  The guest ran a full Linux boot; a rejected VMRUN
> would have executed no guest instructions at all.  On an EPYC 9965 I
> then counted MSR exits, and the CPU reads such a map as all ones -
> every one of the ten bits construct_vmcb() clears trapped, against
> none in a control guest on the same boot.  (What an unbacked
> machine-physical read returns is chipset behaviour, not architectural.)
> 
> So what I would like to send as v2 is two patches:
> 
>   1/2  make the MAXPHYADDR range check explicit, as 8c36d5a500 did for
>        the IOPM.  No functional change on its own.
>   2/2  stop a failed copy returning NSVM_ERROR_VVMCB; fill the cached
>        map instead - all ones where L1 set MSR_PROT, zero where it did
>        not.
> 
> They have to go together: that failing copy is currently the only
> thing rejecting an out-of-range MSRPM, so 2/2 alone would leave one
> accepted.
> 
> Does that sound reasonable to you?

On the surface it sounds plausible. I'm not sure we'd be doing ourselves
a favor, though. Non-RAM is rejected in other situations as well, where
in principle the same behavior you describe could apply. Hence imo if we
wanted to go that route, I think we'd want to be consistent. That would
be quite a bit more work.

Andrew - do you have any thoughts here?

Jan

