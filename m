Return-Path: <SRS0=O81L=GO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EEEC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 11 Jan 2021 22:36:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0A0A22288
	for <xen-devel@archiver.kernel.org>; Mon, 11 Jan 2021 22:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0A0A22288
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cam.ac.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.65397.115860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz5nS-00012a-BL; Mon, 11 Jan 2021 22:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65397.115860; Mon, 11 Jan 2021 22:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz5nS-00012T-8P; Mon, 11 Jan 2021 22:36:22 +0000
Received: by outflank-mailman (input) for mailman id 65397;
 Mon, 11 Jan 2021 22:36:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=57GD=GO=cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1kz5nP-00012K-1G
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 22:36:20 +0000
Received: from ppsw-41.csi.cam.ac.uk (unknown [131.111.8.141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b770f06b-e1d7-4a12-8935-598e44eb1361;
 Mon, 11 Jan 2021 22:36:17 +0000 (UTC)
Received: from 88-111-124-141.dynamic.dsl.as9105.com ([88.111.124.141]:50990
 helo=[192.168.1.219])
 by ppsw-41.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1kz5nD-000UYM-S9 (Exim 4.92.3)
 (return-path <amc96@cam.ac.uk>); Mon, 11 Jan 2021 22:36:07 +0000
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
X-Inumbo-ID: b770f06b-e1d7-4a12-8935-598e44eb1361
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk;
	 s=20180806.ppsw; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+7xAq/yiXIpg/aeIDqIkqrOaf+kM5AcZbU+smG5Yexw=; b=GN8jEOJdf0bLWf9ZgVlp+4URqm
	Yct2s/ZdLLSBwuizZyTlrxzxk/4/PvOP3JHGTV7uANHl3vgpuqpQzD2jsJ+X7Fjb+VV1wknUmODtq
	sFR4m3pxbcG5+GzzZV4BvnZwUuKD2x8iTBjbmqrDdEwC83u+6jcQQH8heKnuCRiZF5TY=;
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH v2 09/11] xen/memory: Fix mapping grant tables with
 XENMEM_acquire_resource
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>, Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-10-andrew.cooper3@citrix.com>
 <eb9768ad-b6cd-b01e-d689-63775f6e5914@suse.com>
 <0462d837-947b-30a8-21ab-5a9a6b9ca4e1@cam.ac.uk>
From: Andrew Cooper <amc96@cam.ac.uk>
Message-ID: <810f767b-5da4-5b3e-a8d4-4f868a502952@cam.ac.uk>
Date: Mon, 11 Jan 2021 22:36:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <0462d837-947b-30a8-21ab-5a9a6b9ca4e1@cam.ac.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 11/01/2021 20:05, Andrew Cooper wrote:
>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -1027,17 +1027,31 @@ static unsigned int resource_max_frames(struct domain *d,
>>>      }
>>>  }
>>>  
>>> +/*
>>> + * Returns -errno on error, or positive in the range [1, nr_frames] on
>>> + * success.  Returning less than nr_frames contitutes a request for a
>>> + * continuation.
>>> + */
>>> +static int _acquire_resource(
>>> +    struct domain *d, unsigned int type, unsigned int id, unsigned long frame,
>>> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
>> As per the comment the return type may again want to be "long" here.
>> Albeit I realize the restriction to (UINT_MAX >> MEMOP_EXTENT_SHIFT)
>> makes this (and the other place above) only a latent issue for now,
>> so it may well be fine to be left as is.
> Hmm yes - it should be long, because per the ABI we still should be able
> to return 0xffffffff to a caller in the success case.
>
> I'll update.

Actually, no.  Wrong half the hypercall.

For _acquire_resource(), the return value is bound by nr_frames which is
a maximum of 32, and is unlikely to grow substantially from this.

~Andrew

