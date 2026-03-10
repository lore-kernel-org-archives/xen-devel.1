Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA3BFD4F34
	for <xen-devel@archiver.kernel.org>; Tue, 10 Mar 2026 20:56:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1250710.1548120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0480-000822-Dj; Tue, 10 Mar 2026 20:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250710.1548120; Tue, 10 Mar 2026 20:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0480-00081v-A2; Tue, 10 Mar 2026 20:56:32 +0000
Received: by outflank-mailman (input) for mailman id 1250710;
 Tue, 10 Mar 2026 20:56:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LzH0=BK=bounce.vates.tech=bounce-md_30504962.69b08579.v1-658ad54d60d14c9f9a3e30f1ccc89e7a@srs-se1.protection.inumbo.net>)
 id 1w047y-00081p-Ez
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 20:56:30 +0000
Received: from mail133-21.atl131.mandrillapp.com
 (mail133-21.atl131.mandrillapp.com [198.2.133.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a916915-1cc3-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 21:56:28 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-21.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fVmQ13F0Gz1XLMtx
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 20:56:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 658ad54d60d14c9f9a3e30f1ccc89e7a; Tue, 10 Mar 2026 20:56:25 +0000
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
X-Inumbo-ID: 9a916915-1cc3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773176185; x=1773446185;
	bh=2Qtix73FtwoQe1av6i/eYyOKy5BRubR6wgFToyFAgfQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Mcwj6fogJ5/a2kZpLqB5kX9u0PS6Q/JEZSVbxmXL4pb70blATgDAZfYQRkvVyi7K7
	 XZyVu0aCUdp1b3vnjipbTLV2vJT7cCRGD2/DMzm3VnUupIIymzeWgfm6/61XwVm1G4
	 CRbz2/6slnbJJqFpiV8RxQsfWKhbZqlwUdj4lvS90bVj2yZ5JWaLJQ/GBVtwTEczm6
	 O87O7m169bKOQFD4b5McrhqwwWD7w62czAvuCe8KPLKqbTKUHHgkgzx6i8TFerzYrP
	 Vx+iWZiD3lBh5kvm2XFDhWsQdUYzwKGQlSDK3a5C00cpi8BWium4/UPH9sEa0fWwux
	 sfOEEZu/H7p2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773176185; x=1773436685; i=julian.vetter@vates.tech;
	bh=2Qtix73FtwoQe1av6i/eYyOKy5BRubR6wgFToyFAgfQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wEpcsrzZK6SWL+Oovg2BsGytuA17BlewXxWcz41LftFudy0ohzdO3R8/nK4x8YWWE
	 h1uojDC8lD5PzGCjDmJw3M3qwyBQHYN9NSr6z+YhMaFP7kSctki+WpmHZH+33JUMXh
	 EMFRo0ryQkx3YJZs8Qq60tC5rG1XJ+dqR+91UUIuIa6yjCr98f8BYSKh5tHTphoztI
	 hvW72LgYK1h5AquT8+jtzsogKVCF8hbnyOqyUapI254EnWLsyRKKQMCdJvVNla39ge
	 k8zFH0CObXdI+fE8QzzoqGh5/S5pNMTeGxaD5bCMXLJQvL7nTWp6GGHqUbzN7Ll4ML
	 V86IpQt4jDmEA==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v4=202/2]=20x86/ioreq:=20Extend=20ioreq=20server=20to=20support=20multiple=20ioreq=20pages?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773176184057
Message-Id: <4509bc57-ea36-4208-b76b-465d15b25a09@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260305130434.635276-1-julian.vetter@vates.tech> <20260305130434.635276-2-julian.vetter@vates.tech> <c73afb52-e39c-48c8-bf2c-41b509ca0dd0@suse.com> <a05e2d6c-5ba7-4651-b9d1-c1b502be0e7b@vates.tech> <5724bdb3-bec5-4159-a4f4-9bdad39acd7b@suse.com>
In-Reply-To: <5724bdb3-bec5-4159-a4f4-9bdad39acd7b@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.658ad54d60d14c9f9a3e30f1ccc89e7a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260310:md
Date: Tue, 10 Mar 2026 20:56:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 3/10/26 17:09, Jan Beulich wrote:
> On 10.03.2026 16:56, Julian Vetter wrote:
>> On 3/10/26 16:36, Jan Beulich wrote:
>>> On 05.03.2026 14:04, Julian Vetter wrote:
>>>> @@ -45,7 +52,8 @@ struct ioreq_server {
>>>>        /* Lock to serialize toolstack modifications */
>>>>        spinlock_t             lock;
>>>>    
>>>> -    struct ioreq_page      ioreq;
>>>> +    ioreq_t                *ioreq;
>>>> +    gfn_t                  ioreq_gfn;
>>>>        struct list_head       ioreq_vcpu_list;
>>>>        struct ioreq_page      bufioreq;
>>>
>>> This change in data arrangement should in principle be independent of the
>>> step to supporting multiple pages. Hence it should be possible to separate
>>> out. Problem being that just by looking here and at hvm_{,un}map_ioreq_gfn()
>>> I can't conclude how you get away without the "page" field that struct
>>> ioreq_page had. If you can get away without, it's not quite clear why the
>>> field exists in the first place. If it's not needed, dropping it would be
>>> yet another separate, prereq change. At which point the remaining pair of
>>> fields could continue to be used, i.e. the change above then wouldn't be
>>> needed; va could be renamed if need be, and its type changed.
>>
>> Thank you again Jan for your feedback! I don't need the page anymore.
>> When I use vmap(), I don't need to keep track of it, because during
>> teardown, I can recover it via vmap_to_page(). Currently it's necessary
>> because in destroy_ring_for_helper we need the page, to be destroyed.
>> But I see now, on X86 the map_domain_page_global called from
>> prepare_ring_for_helper actually does vmap(&mfn, 1). So the page is also
>> from the vmap range. So for the teardown I assume a vmap_to_page() could
>> be used as well. But I also see there is a special case, if NDEBUG=1,
>> map_domain_page_global short-circuits to mfn_to_virt() for low MFNs
>> (putting the VA in the directmap range) and bypassing vmap. In that case
>>
>> vmap_to_page() would not work. So, this would be really messy. I would
>> rather switch the bufioreq also to an explicitly vmap()'ed page, then we
>> could remove the page pointer and both cases would be aligned again.
> 
> That's an option. Yet are you aware of domain_page_map_to_mfn()? Perhaps
> that's what you want to switch to using in the patch removing the "page"
> field. To then, conditionally or uniformly, switch to vmap_to_{mfn,page}()
> when doing the multi-page work in the subsequent patch.

Yes, thank you. I saw this function, but I was wondering whether it's a 
good idea to wrap the va in two translation functions like:

struct page_info *page = mfn_to_page(domain_page_map_to_mfn(va));

and then calling destroy_ring_for_helper() with it. But I will have a 
look, and this way we would be again aligned between the two cases. So, 
maybe it's the cleanest way.

Julian

> 
> Jan



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


