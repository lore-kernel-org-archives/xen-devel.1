Return-Path: <SRS0=UpcS=BU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266DCC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2020 18:43:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA98022B4E
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2020 18:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA98022B4E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5Cl7-00060C-2W; Mon, 10 Aug 2020 18:42:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BFG=BU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k5Cl5-000607-8K
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 18:42:55 +0000
X-Inumbo-ID: 6f02a5aa-7a9f-4702-9636-a5eff9f42a1b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f02a5aa-7a9f-4702-9636-a5eff9f42a1b;
 Mon, 10 Aug 2020 18:42:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D34E6AB55;
 Mon, 10 Aug 2020 18:43:12 +0000 (UTC)
Subject: Re: [PATCH v3 4/7] x86/paravirt: remove 32-bit support from
 PARAVIRT_XXL
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
References: <20200807083826.16794-1-jgross@suse.com>
 <20200807083826.16794-5-jgross@suse.com>
 <a1073b86-ebd5-68b6-7761-99669dd93e1c@oracle.com>
 <4c5fb964-6acb-6bb8-4eff-0bcb67d922f2@suse.com>
 <8506b0cd-6f7e-7505-d9b9-e1468cefa4ec@oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c0917f5a-ffec-d422-bf8b-8c8859ea4312@suse.com>
Date: Mon, 10 Aug 2020 20:42:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8506b0cd-6f7e-7505-d9b9-e1468cefa4ec@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Deep Shah <sdeep@vmware.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.08.20 18:53, Boris Ostrovsky wrote:
> On 8/10/20 12:39 AM, Jürgen Groß wrote:
>> On 09.08.20 04:34, Boris Ostrovsky wrote:
>>> On 8/7/20 4:38 AM, Juergen Gross wrote:
>>>> @@ -377,10 +373,7 @@ static inline pte_t __pte(pteval_t val)
>>>>    {
>>>>        pteval_t ret;
>>>>    -    if (sizeof(pteval_t) > sizeof(long))
>>>> -        ret = PVOP_CALLEE2(pteval_t, mmu.make_pte, val, (u64)val >>
>>>> 32);
>>>> -    else
>>>> -        ret = PVOP_CALLEE1(pteval_t, mmu.make_pte, val);
>>>> +    ret = PVOP_CALLEE1(pteval_t, mmu.make_pte, val);
>>>>          return (pte_t) { .pte = ret };
>>>
>>>
>>> Can this now simply return (pte_t) ret?
>>
>> I don't think so, but I can turn it into
>>
>>    return native_make_pte(PVOP_CALLEE1(...));
> 
> 
> I thought that since now this is only built for 64-bit we don't have to
> worry about different pte_t definitions and can do what we do for
> example, for __pgd()?

Yes, I did that:

  return (pte_t) { ret };


Juergen


