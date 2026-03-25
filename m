Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7918FFEA839
	for <xen-devel@archiver.kernel.org>; Wed, 25 Mar 2026 09:49:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1261827.1554582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Kr6-0001iA-5U; Wed, 25 Mar 2026 09:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261827.1554582; Wed, 25 Mar 2026 09:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Kr6-0001i3-2a; Wed, 25 Mar 2026 09:48:52 +0000
Received: by outflank-mailman (input) for mailman id 1261827;
 Wed, 25 Mar 2026 09:48:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69c3af7f.v1-d93a7567d71940c395e9f609a47b96cd@bounce.vates.tech>)
 id 1w5Kr4-0001hx-JK
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 09:48:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Kr3-00DbSS-Uf
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 10:48:49 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69c3af7f.v1-d93a7567d71940c395e9f609a47b96cd@bounce.vates.tech>)
 id 69c3af75-bab6-0a2a0a5309dd-0a2a4503b4c2-44
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 10:48:49 +0100
Received: from [198.2.132.30] (helo=mail132-30.atl131.mandrillapp.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from
 <bounce-md_30504962.69c3af7f.v1-d93a7567d71940c395e9f609a47b96cd@bounce.vates.tech>)
 id 69c3af80-1947-0a2a45030019-c602841e40c1-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 10:48:49 +0100
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-30.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fghtl6Y67zP0PSBR
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 09:48:47 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d93a7567d71940c395e9f609a47b96cd; Wed, 25 Mar 2026 09:48:47 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774432127; x=1774702127;
	bh=dfsx9jJk+LhQxtmUiK3ATUX67JKdlC/UN1yl5OqOLjY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=BMFV/7cm8xtljgcyPHwGubgU9bCXwhPGqXJcUWBa5BHEIQp7zaxsZWVqgWF5tWm1M
	 bQfe9xhIVd/p6SdpVxRUkh73/Z3yScQjsVkh+W1LeUIhB9Ed4yFCJgzCV8sxu8dp03
	 6BbOM+lxvh8MYPwSiAMqb1RrIo1I7tmBFtItPNikuNGlTVk1j65WkyEG0hGjUNN8jQ
	 9UrPtJ0e9FPsjVM7A2cAT1ZSISbqPdsp0dIg7sZXkzlyW8W5GkmW8ejjubetV8j3Iu
	 z4AcZVD+jp3y66zbEBbsibda7By3klu8rfKaoia/QCPBVQkfTC3uNhm1J5oaWNeelo
	 0Gbhxcxco6rqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774432127; x=1774692627; i=teddy.astie@vates.tech;
	bh=dfsx9jJk+LhQxtmUiK3ATUX67JKdlC/UN1yl5OqOLjY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=i/m43qDhpi67wkcdlD7PhsExh6zWXqy1/hyzEDi9ty5Yn8wFqlrVXApKUWZ+pPI3l
	 YxnxVHlMr+fi6QchkKazurIXIhcOnhRm5A0MP2UNvx/MbeR/GhCRcUak4YhzF7Nf8J
	 T4nmbf0vePWYyIvFYHlMbmqSdlI5zuyRlT4dzOYPf67kBKMaERgwFiaie93h8AQ07z
	 EPty3q/oyx1Vcy1Dw0UCKUODgW68jPD8BBUh6EoIQhlVmiIKWKwKkg/X344HA81TAv
	 Ai+uZ+JEUfPImrADpAZMgYrQi/ruiK3Ldt71wielx5lUuQw1MzByrkvIX90zhtgauL
	 HuSHxhWFp1b+A==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=203/6]=20x86:=20Define=20some=20Intel=20vPMU=20leafs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774432126933
Message-Id: <690ad4c0-d9b1-45ec-8634-f8c002c0282a@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1773160025.git.teddy.astie@vates.tech> <83a573dcb365761c0f089325365090b6f963fb03.1773160025.git.teddy.astie@vates.tech> <d7438af9-1aad-446b-bd80-7d9e8f955cdc@suse.com>
In-Reply-To: <d7438af9-1aad-446b-bd80-7d9e8f955cdc@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d93a7567d71940c395e9f609a47b96cd?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260325:md
Date: Wed, 25 Mar 2026 09:48:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1774432129-EB28772C-3548E8F0/0/0
X-purgate-type: clean
X-purgate-size: 2740

Le 24/03/2026 =C3=A0 10:25, Jan Beulich a =C3=A9crit=C2=A0:
> On 10.03.2026 17:44, Teddy Astie wrote:
>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>> @@ -162,7 +162,15 @@ struct cpu_policy
>>               uint64_t :64, :64; /* Leaf 0x9 - DCA */
>>   
>>               /* Leaf 0xa - Intel PMU. */
>> -            uint8_t pmu_version, _pmu[15];
>> +            struct {
>> +                uint8_t /* a */ version, num_gp_ctrs, gp_ctr_width,
>> +                                event_enum_length;
>> +                uint32_t /* b */:32;
>> +                uint32_t /* c */ fixed_ctr_mask;
>> +                uint32_t /* d */ num_fixed_ctr:5, fixed_ctr_width:8, :1=
,
>> +                                 anythread_depreciation:1, slots_per_cy=
c:4,
>> +                                 :13;
>> +            } pmu;
> 
> Style-wise this looks to follow e.g. the cache leaf, so perhaps okay, eve=
n
> if I would have preferred you to follow what we did for leaf 6. 

My idea was to put all that as .pmu.*, so I wouldn't need to prefix 
everything with "pmu_". I'm not sure if you're talking about a different 
approach.

 > The named> boolean field, however, wants to be of type bool.

Which fields ?

 > And then the unnamed 1-bit> field really wants to be 2 bits, for 
anythread_depreciation to be bit 15
> (etc).
> 

Ah yes thanks, I got confused with the fields size for a second.
I also found that slots_per_cyc is 3 bits instead of 4.

I think this diff fixes it overall.

diff --git a/xen/include/xen/lib/x86/cpu-policy.h 
b/xen/include/xen/lib/x86/cpu-policy.h
index 9161e2ad8d..796c2edb0e 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -167,9 +167,9 @@ struct cpu_policy
                                  event_enum_length;
                  uint32_t /* b */:32;
                  uint32_t /* c */ fixed_ctr_mask;
-                uint32_t /* d */ num_fixed_ctr:5, fixed_ctr_width:8, :1,
-                                 anythread_depreciation:1, slots_per_cyc:4=
,
-                                 :13;
+                uint32_t /* d */ num_fixed_ctr:5, fixed_ctr_width:8, :2,
+                                 anythread_depreciation:1, slots_per_cyc:3=
,
+                                 :11;
              } pmu;

              uint64_t :64, :64; /* Leaf 0xb - Topology. */

Making the first edx reserved gap actually 2 bits, slots_per_cyc 
actually 3 bits and adjusting the end reserved part that is actually 11 
bits.

> Jan
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



