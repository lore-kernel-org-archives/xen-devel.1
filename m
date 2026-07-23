Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F213CC531D0
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 20:10:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369571.1618192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmzjx-00005j-G4; Thu, 23 Jul 2026 20:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369571.1618192; Thu, 23 Jul 2026 20:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmzjx-00005b-DH; Thu, 23 Jul 2026 20:09:57 +0000
Received: by outflank-mailman (input) for mailman id 1369571;
 Thu, 23 Jul 2026 20:09:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wmzjw-00005V-EK
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 20:09:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmzjv-00HFoP-NM
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 22:09:55 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a6274cd-5cb7-0a2a0a5109dd-0a2a4505e70a-26
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 22:09:54 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a627510-4cb1-0a2a45050019-888fbc33528c-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 22:09:54 +0200
Received: by mx.zohomail.com with SMTPS id 1784837383134238.7169774010447;
 Thu, 23 Jul 2026 13:09:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1784837386; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H0nT+hIsHvsJyPbgFEkcIj3W2pXB8QumH6K/s5nb/mz5h69y6RsyqcKdam8INKAEhzOANLopiP1KUgm3tozC3kaTsYuQG3KAq0wT2xe/5Vnu0iIvmj9ysbpDhzWcXP98p9p1C6qYTr6v/ILlcRJzlnWTWiYGG6jNYlTNsv31Klo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784837386; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xyrZrnO7UUfiAb9p2N/AvrPPLvs3tA1EnMk7suP4ZRY=; 
	b=nx4uVH0Y569ywsIYvIEriD20kAwAWCfWzu6px5EOuTEOzlqDl482PSJZpcpQCNZoOeh+/3Hm8XJ9B0/Wb+rCGALxIDAW/aFwzdcdl8W20iILc/fA69YlJOPz8VqH136pb//lCTbkz1trqyKFmGmplHu8lTBv+k8D1Ia822AxB4k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784837386;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xyrZrnO7UUfiAb9p2N/AvrPPLvs3tA1EnMk7suP4ZRY=;
	b=KsGpC0vPShCctCiNUDu1twotwDCggACy9LFHcWNdIyvzD6EQ7z/nj4oyx9t+84tf
	PC7zSr4dorjz2giL476tYlaKEWyDCkATjNAO4oAeATBVgcHaIHXMM5m3veoeND8J+OV
	jBRNPRcmCTGZU+5TU1rwWf9OFj/u8pLit/wOJk5c=
Message-ID: <9ee6c888-f0ca-402f-9b4f-64d9777cd41f@apertussolutions.com>
Date: Thu, 23 Jul 2026 16:09:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] vpci: move BAR mapping permissions checks
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260708210233.922275-1-stewart.hildebrand@amd.com>
 <20260708210233.922275-2-stewart.hildebrand@amd.com>
 <0255d2bf-748e-444b-8c09-f69925ec88c4@suse.com>
 <amIrwLuIdOBaAi9d@macbook.local>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <amIrwLuIdOBaAi9d@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-c201ff/1784837394-72CB02A1-41A0C1FA/0/0
X-purgate-type: clean
X-purgate-size: 3489

On 7/23/26 10:57 AM, Roger Pau Monné wrote:
> On Thu, Jul 23, 2026 at 04:44:26PM +0200, Jan Beulich wrote:
>> On 08.07.2026 23:02, Stewart Hildebrand wrote:
>>> There's no need to defer the permissions checks. Perform them right away
>>> in modify_bars().
>>>
>>> As a result of the move, the permissions checks will now cover the whole
>>> BAR before any holes are removed.
>>
>> Is this a good idea though? A really good toolstack would avoid granting
>> access to e.g. the MSI-X table.
>>
>>> Carry over the domain_crash() in the error path for domUs.
>>
>> I don't think this is warranted.
>>
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -58,24 +58,6 @@ static int cf_check map_range(
>>>            * offset of the current address from the BAR start.
>>>            */
>>>           unsigned long map_mfn = start_mfn + s - start_gfn;
>>> -        unsigned long m_end = map_mfn + size - 1;
>>> -
>>> -        if ( !iomem_access_permitted(map->d, map_mfn, m_end) )
>>> -        {
>>> -            printk(XENLOG_G_WARNING
>>> -                   "%pd denied access to MMIO range [%#lx, %#lx]\n",
>>> -                   map->d, map_mfn, m_end);
>>> -            return -EPERM;
>>> -        }
>>> -
>>> -        rc = xsm_iomem_mapping_vpci(XSM_HOOK, map->d, map_mfn, m_end, map->map);
>>> -        if ( rc )
>>> -        {
>>> -            printk(XENLOG_G_WARNING
>>> -                   "%pd XSM denied access to MMIO range [%#lx, %#lx]: %d\n",
>>> -                   map->d, map_mfn, m_end, rc);
>>
>> I realize you literally only take what's here, but ...
>>
>>> @@ -369,6 +351,28 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>>               return -EINVAL;
>>>           }
>>>   
>>> +        if ( !iomem_access_permitted(pdev->domain, start, end) )
>>> +        {
>>> +            printk(XENLOG_G_WARNING
>>> +                   "%pd denied access to MMIO range [%#lx, %#lx]\n",
>>> +                   pdev->domain, start, end);
>>> +            if ( !is_hardware_domain(pdev->domain) )
>>> +                domain_crash(pdev->domain);
>>> +            return -EPERM;
>>> +        }
>>> +
>>> +        rc = xsm_iomem_mapping_vpci(XSM_HOOK, pdev->domain, start, end,
>>> +                                    !!(cmd & PCI_COMMAND_MEMORY));
>>> +        if ( rc )
>>> +        {
>>> +            printk(XENLOG_G_WARNING
>>> +                   "%pd XSM denied access to MMIO range [%#lx, %#lx]: %d\n",
>>> +                   pdev->domain, start, end, rc);
>>
>> ... is the logging of rc actually useful? Afaict it's only ever going to be
>> -EPERM.
> 
> I think Flask can also return -EACCES, not that it's very relevant I'm
> afraid.  It's likely too late now, but those XSM checks should instead
> return a bool to avoid this kind of confusion with the returned
> error? (or whether diverse return codes are indeed expected).

An XSM access check may return -EACCES as one of any number of error 
codes depending on which XSM module is loaded. I haven't traced this 
specific path but a quick grep for the direct FLASK hooks shows EPERM, 
EINVAL, ENOMEM, and ENOENT directly in the hooks themselves. This does 
not even include the error codes that could come from the AVC. This is a 
consist interface provided by all XSM calls and fairly standard behavior 
across any number of respectable kernels such as Linux.

v/r,
dps

