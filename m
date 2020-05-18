Return-Path: <SRS0=XBwx=7A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E144C433DF
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2020 10:28:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AE9620657
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2020 10:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AE9620657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jad05-0007wH-0Y; Mon, 18 May 2020 10:28:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k4Zq=7A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jad03-0007wC-K6
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 10:27:59 +0000
X-Inumbo-ID: 3e46f0fe-98f2-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e46f0fe-98f2-11ea-b07b-bc764e2007e4;
 Mon, 18 May 2020 10:27:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6EA6BAA4F;
 Mon, 18 May 2020 10:28:00 +0000 (UTC)
Subject: Re: [PATCH] public/io/netif.h: add a new extra type for XDP
To: Denis Kirjanov <kda@linux-powerpc.org>
References: <1589790285-1250-1-git-send-email-kda@linux-powerpc.org>
 <bbd8a83a-a676-9fa1-b03b-526e5122966f@suse.com>
 <CAOJe8K2pUv4Upvxya3LFPj0CxZ1-_hDZcrv-r6Q2EaxC8Ym6Ow@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2615d770-c17b-26e0-4686-852ca122eeb4@suse.com>
Date: Mon, 18 May 2020 12:27:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAOJe8K2pUv4Upvxya3LFPj0CxZ1-_hDZcrv-r6Q2EaxC8Ym6Ow@mail.gmail.com>
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
Cc: xen-devel@lists.xenproject.org, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.05.20 11:52, Denis Kirjanov wrote:
> On 5/18/20, Jürgen Groß <jgross@suse.com> wrote:
>> On 18.05.20 10:24, Denis Kirjanov wrote:
>>> The patch adds a new extra type to be able to diffirentiate
>>> between RX responses on xen-netfront side with the adjusted offset
>>> required for XDP processing.
>>>
>>> For Linux the offset value is going to be passed via xenstore.
>>
>> Why? I can only see disadvantages by using a different communication
>> mechanism.
> I see it like other features passed through xenstore and it requires
> less changes to
> other structures with the same final result.

This is okay as long there is no Xenstore interaction required when the
interface has been setup completely (i.e. only defining the needed
offset for XDP is fine, enabling/disabling XDP at runtime should not be
done via Xenstore IMO).

And please, no guest type special casing. Please replace "Linux" by e.g.
"The guest" (with additional tweaking of the following sentence).


Juergen

