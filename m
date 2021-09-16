Return-Path: <SRS0=mttQ=OG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7773EC433F5
	for <xen-devel@archiver.kernel.org>; Thu, 16 Sep 2021 21:49:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21C6460E05
	for <xen-devel@archiver.kernel.org>; Thu, 16 Sep 2021 21:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21C6460E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eikelenboom.it
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.188784.338093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQzFX-0008HY-P9; Thu, 16 Sep 2021 21:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188784.338093; Thu, 16 Sep 2021 21:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQzFX-0008HR-Lm; Thu, 16 Sep 2021 21:48:55 +0000
Received: by outflank-mailman (input) for mailman id 188784;
 Thu, 16 Sep 2021 21:48:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aD9s=OG=eikelenboom.it=sander@srs-us1.protection.inumbo.net>)
 id 1mQzFV-0008HL-Pe
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 21:48:54 +0000
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e19669e6-1737-11ec-b64c-12813bfff9fa;
 Thu, 16 Sep 2021 21:48:52 +0000 (UTC)
Received: from 76-24-144-85.ftth.glasoperator.nl ([85.144.24.76]:55038
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <sander@eikelenboom.it>)
 id 1mQzFN-0005CU-QZ; Thu, 16 Sep 2021 23:48:45 +0200
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
X-Inumbo-ID: e19669e6-1737-11ec-b64c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References:Cc:To:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+kmogzI7kwhnNwR3x3lgp5G8pQBmKvDxMAVeBzIgThY=; b=HzjMEh1Y5BxK04vXaYCv4o0Ryw
	AdEqAi5XN3Zw1SQnlpjMHhQawsYbhR4RISsinSFbSgJ789gyo0C0b9fZP9utaDIGaMp4KqojWkoIl
	RsBM5x1YMbDNG+QkRZ5ctr0ufXOPGTMK42vjt8W5MAL/Ux1fbt/wMhflQwqziHIFr6/k=;
To: paul@xen.org, Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <4dd5b8ec-a255-7ab1-6dbf-52705acd6d62@suse.com>
 <67bc0728-761b-c3dd-bdd5-1a850ff79fbb@xen.org>
 <76c94541-21a8-7ae5-c4c4-48552f16c3fd@suse.com>
 <17e50fb5-31f7-60a5-1eec-10d18a40ad9a@xen.org>
 <57580966-3880-9e59-5d82-e1de9006aa0c@suse.com>
 <a26c1ecd-e303-3138-eb7e-96f0203ca888@xen.org>
 <1a522244-4be8-5e33-77c7-4ea5cf130335@suse.com>
 <9d27a3eb-1d50-64bb-8785-81de1eef3102@suse.com>
 <d4f381e9-6698-3339-1d17-15e3abc71d06@suse.com>
 <0dff83ff-629a-7179-9fef-77bd1fbf3d09@xen.org>
From: Sander Eikelenboom <sander@eikelenboom.it>
Subject: =?UTF-8?Q?Re=3a_Ping=c2=b2=3a_=5bPATCH=5d_xen-netback=3a_correct_su?=
 =?UTF-8?Q?ccess/error_reporting_for_the_SKB-with-fraglist_case?=
Message-ID: <5a8c1f28-eefb-87e2-998b-7cbfb0f0b8dd@eikelenboom.it>
Date: Thu, 16 Sep 2021 23:48:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0dff83ff-629a-7179-9fef-77bd1fbf3d09@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 16/09/2021 20:34, Paul Durrant wrote:
> On 16/09/2021 16:45, Jan Beulich wrote:
>> On 15.07.2021 10:58, Jan Beulich wrote:
>>> On 20.05.2021 13:46, Jan Beulich wrote:
>>>> On 25.02.2021 17:23, Paul Durrant wrote:
>>>>> On 25/02/2021 14:00, Jan Beulich wrote:
>>>>>> On 25.02.2021 13:11, Paul Durrant wrote:
>>>>>>> On 25/02/2021 07:33, Jan Beulich wrote:
>>>>>>>> On 24.02.2021 17:39, Paul Durrant wrote:
>>>>>>>>> On 23/02/2021 16:29, Jan Beulich wrote:
>>>>>>>>>> When re-entering the main loop of xenvif_tx_check_gop() a 2nd time, the
>>>>>>>>>> special considerations for the head of the SKB no longer apply. Don't
>>>>>>>>>> mistakenly report ERROR to the frontend for the first entry in the list,
>>>>>>>>>> even if - from all I can tell - this shouldn't matter much as the overall
>>>>>>>>>> transmit will need to be considered failed anyway.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>>>>
>>>>>>>>>> --- a/drivers/net/xen-netback/netback.c
>>>>>>>>>> +++ b/drivers/net/xen-netback/netback.c
>>>>>>>>>> @@ -499,7 +499,7 @@ check_frags:
>>>>>>>>>>       				 * the header's copy failed, and they are
>>>>>>>>>>       				 * sharing a slot, send an error
>>>>>>>>>>       				 */
>>>>>>>>>> -				if (i == 0 && sharedslot)
>>>>>>>>>> +				if (i == 0 && !first_shinfo && sharedslot)
>>>>>>>>>>       					xenvif_idx_release(queue, pending_idx,
>>>>>>>>>>       							   XEN_NETIF_RSP_ERROR);
>>>>>>>>>>       				else
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> I think this will DTRT, but to my mind it would make more sense to clear
>>>>>>>>> 'sharedslot' before the 'goto check_frags' at the bottom of the function.
>>>>>>>>
>>>>>>>> That was my initial idea as well, but
>>>>>>>> - I think it is for a reason that the variable is "const".
>>>>>>>> - There is another use of it which would then instead need further
>>>>>>>>       amending (and which I believe is at least part of the reason for
>>>>>>>>       the variable to be "const").
>>>>>>>>
>>>>>>>
>>>>>>> Oh, yes. But now that I look again, don't you want:
>>>>>>>
>>>>>>> if (i == 0 && first_shinfo && sharedslot)
>>>>>>>
>>>>>>> ? (i.e no '!')
>>>>>>>
>>>>>>> The comment states that the error should be indicated when the first
>>>>>>> frag contains the header in the case that the map succeeded but the
>>>>>>> prior copy from the same ref failed. This can only possibly be the case
>>>>>>> if this is the 'first_shinfo'
>>>>>>
>>>>>> I don't think so, no - there's a difference between "first frag"
>>>>>> (at which point first_shinfo is NULL) and first frag list entry
>>>>>> (at which point first_shinfo is non-NULL).
>>>>>
>>>>> Yes, I realise I got it backwards. Confusing name but the comment above
>>>>> its declaration does explain.
>>>>>
>>>>>>
>>>>>>> (which is why I still think it is safe to unconst 'sharedslot' and
>>>>>>> clear it).
>>>>>>
>>>>>> And "no" here as well - this piece of code
>>>>>>
>>>>>> 		/* First error: if the header haven't shared a slot with the
>>>>>> 		 * first frag, release it as well.
>>>>>> 		 */
>>>>>> 		if (!sharedslot)
>>>>>> 			xenvif_idx_release(queue,
>>>>>> 					   XENVIF_TX_CB(skb)->pending_idx,
>>>>>> 					   XEN_NETIF_RSP_OKAY);
>>>>>>
>>>>>> specifically requires sharedslot to have the value that was
>>>>>> assigned to it at the start of the function (this property
>>>>>> doesn't go away when switching from fragments to frag list).
>>>>>> Note also how it uses XENVIF_TX_CB(skb)->pending_idx, i.e. the
>>>>>> value the local variable pending_idx was set from at the start
>>>>>> of the function.
>>>>>>
>>>>>
>>>>> True, we do have to deal with freeing up the header if the first map
>>>>> error comes on the frag list.
>>>>>
>>>>> Reviewed-by: Paul Durrant <paul@xen.org>
>>>>
>>>> Since I've not seen this go into 5.13-rc, may I ask what the disposition
>>>> of this is?
>>>
>>> I can't seem to spot this in 5.14-rc either. I have to admit I'm
>>> increasingly puzzled ...
>>
>> Another two months (and another release) later and still nothing. Am
>> I doing something wrong? Am I wrongly assuming that maintainers would
>> push such changes up the chain?
>>
> 
> It has my R-b so it ought to go in via netdev AFAICT.
> 
>     Paul

Could it be the missing "net" or "net-next" designation in the subject 
[1] which seems to be used and important within their patchwork 
semi-automated workflow ?

--
Sander

[1] 
https://www.kernel.org/doc/html/latest/networking/netdev-FAQ.html#how-do-i-indicate-which-tree-net-vs-net-next-my-patch-should-be-in

