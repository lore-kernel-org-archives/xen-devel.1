Return-Path: <SRS0=QJhb=DU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D3FC433E7
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2020 09:38:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF42920714
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2020 09:38:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="jH8U92HE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF42920714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.6135.16132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSGkf-0005s1-5C; Tue, 13 Oct 2020 09:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6135.16132; Tue, 13 Oct 2020 09:37:49 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSGkf-0005ru-01; Tue, 13 Oct 2020 09:37:49 +0000
Received: by outflank-mailman (input) for mailman id 6135;
 Tue, 13 Oct 2020 09:37:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSGke-0005rB-KC
 for xen-devel@lists.xen.org; Tue, 13 Oct 2020 09:37:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84596f92-858b-4962-86d2-6a2f0808ccdb;
 Tue, 13 Oct 2020 09:37:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 66112B00A;
 Tue, 13 Oct 2020 09:37:46 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSGke-0005rB-KC
	for xen-devel@lists.xen.org; Tue, 13 Oct 2020 09:37:48 +0000
X-Inumbo-ID: 84596f92-858b-4962-86d2-6a2f0808ccdb
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 84596f92-858b-4962-86d2-6a2f0808ccdb;
	Tue, 13 Oct 2020 09:37:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602581866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FWFovjq8UywOZdRtko2zvRMKBxqypmNrhXV85DC7h+U=;
	b=jH8U92HEQqgXJ5pB6jF5FXIZiQtJn486VutZMkuKigLD6MpEO/bgaKZ747vRgMaIw/86hF
	3M5TkcwvTB8VFWszKq6oJJkz4xmuT152iNpqA+cwuDUlxt2IPMdVH27s6xTq3UaxvDs9EP
	F728AJ9R6Z/+t5Kaku+Wj7iimWN3Poo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 66112B00A;
	Tue, 13 Oct 2020 09:37:46 +0000 (UTC)
Subject: Re: [XEN PATCH v14 7/8] Add IOREQ_TYPE_VMWARE_PORT
To: paul@xen.org
Cc: 'Don Slutz' <don.slutz@gmail.com>, xen-devel@lists.xen.org,
 'Boris Ostrovsky' <boris.ostrovsky@oracle.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Jun Nakajima' <jun.nakajima@intel.com>,
 'Kevin Tian' <kevin.tian@intel.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Tim Deegan' <tim@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>
References: <cover.1597854907.git.don.slutz@gmail.com>
 <bfe0b9bb7b283657bc33edb7c4b425930564ca46.1597854908.git.don.slutz@gmail.com>
 <e7581f3a-71eb-3181-9128-01e22653a47e@suse.com>
 <000901d69bb8$941489b0$bc3d9d10$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8bf54ee4-2379-f3eb-57a4-ee572978d219@suse.com>
Date: Tue, 13 Oct 2020 11:37:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <000901d69bb8$941489b0$bc3d9d10$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.10.2020 10:13, Paul Durrant wrote:
> 
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 01 October 2020 15:42
>> To: Don Slutz <don.slutz@gmail.com>
>> Cc: xen-devel@lists.xen.org; Boris Ostrovsky <boris.ostrovsky@oracle.com>; Ian Jackson
>> <iwj@xenproject.org>; Jun Nakajima <jun.nakajima@intel.com>; Kevin Tian <kevin.tian@intel.com>;
>> Stefano Stabellini <sstabellini@kernel.org>; Tim Deegan <tim@xen.org>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>; George Dunlap
>> <George.Dunlap@eu.citrix.com>; Paul Durrant <paul@xen.org>
>> Subject: Re: [XEN PATCH v14 7/8] Add IOREQ_TYPE_VMWARE_PORT
>>
>> On 19.08.2020 18:52, Don Slutz wrote:
>>> This adds synchronization of the 6 vcpu registers (only 32bits of
>>> them) that QEMU's vmport.c and vmmouse.c needs between Xen and QEMU.
>>> This is how VMware defined the use of these registers.
>>>
>>> This is to avoid a 2nd and 3rd exchange between QEMU and Xen to
>>> fetch and put these 6 vcpu registers used by the code in QEMU's
>>> vmport.c and vmmouse.c
>>
>> I'm unconvinced this warrants a new ioreq type, and all the overhead
>> associated with it. I'd be curious to know what Paul or the qemu
>> folks think here.
>>
> 
> The current shared ioreq_t does appear have enough space to accommodate 6 32-bit registers (in the addr, data, count and size) fields co couldn't the new IOREQ_TYPE_VMWARE_PORT type be dealt with by simply unioning the regs with these fields? That avoids the need for a whole new shared page.

Hmm, yes, good point. But this is assuming we're going to be fine with
using 32-bit registers now and going forward. Personally I'd prefer a
mechanism less constrained by the specific needs of the current VMware
interface, i.e. potentially allowing to scale to 64-bit registers as
well as any of the remaining 9 ones (leaving aside %rsp).

Jan

