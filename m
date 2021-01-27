Return-Path: <SRS0=2Mj5=G6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41F6C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 27 Jan 2021 11:20:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E4220754
	for <xen-devel@archiver.kernel.org>; Wed, 27 Jan 2021 11:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E4220754
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.76023.137040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4isK-00026Y-UM; Wed, 27 Jan 2021 11:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76023.137040; Wed, 27 Jan 2021 11:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4isK-00026R-RS; Wed, 27 Jan 2021 11:20:40 +0000
Received: by outflank-mailman (input) for mailman id 76023;
 Wed, 27 Jan 2021 11:20:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4isJ-00026M-ON
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 11:20:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68258056-ef2c-4c31-9267-262ce9fdaa8d;
 Wed, 27 Jan 2021 11:20:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 078F5AD26;
 Wed, 27 Jan 2021 11:20:37 +0000 (UTC)
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
X-Inumbo-ID: 68258056-ef2c-4c31-9267-262ce9fdaa8d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611746437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sTPfmJYS9K4cDzIeVmkm+0vr0eBqdm0Bp1Q5Z9yBMa0=;
	b=tcWvnXzV4MLZ+DQuecYXmwdrTwr8uC8U2uXoOm24fc/K3CAM+orKakcfguyxzw9PYjOlwA
	GKpQUDgv4GaECfg1CsitVK8kMnElzq4jqkXaScoIK/Ais7a6rdPx+u2ft4p7Pqqji8cfj3
	MXtgHuDvQ1tUyjyJEkgI3MzJjgEnPN8=
Subject: Re: [PATCH] xen-blkback: fix compatibility bug with single page rings
To: paul@xen.org
Cc: 'Paul Durrant' <pdurrant@amazon.com>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Jens Axboe' <axboe@kernel.dk>, 'Dongli Zhang' <dongli.zhang@oracle.com>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20210127103034.2559-1-paul@xen.org>
 <cd70ae5e-a389-7521-8caf-15650a276152@suse.com>
 <026001d6f49c$eab982b0$c02c8810$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ed1988d9-131a-daf1-787f-3f49269b91aa@suse.com>
Date: Wed, 27 Jan 2021 12:20:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <026001d6f49c$eab982b0$c02c8810$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.01.2021 12:09, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 27 January 2021 10:57
>> To: Paul Durrant <paul@xen.org>
>> Cc: Paul Durrant <pdurrant@amazon.com>; Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>; Roger Pau
>> Monné <roger.pau@citrix.com>; Jens Axboe <axboe@kernel.dk>; Dongli Zhang <dongli.zhang@oracle.com>;
>> linux-kernel@vger.kernel.org; linux-block@vger.kernel.org; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH] xen-blkback: fix compatibility bug with single page rings
>>
>> On 27.01.2021 11:30, Paul Durrant wrote:
>>> From: Paul Durrant <pdurrant@amazon.com>
>>>
>>> Prior to commit 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to avoid
>>> inconsistent xenstore 'ring-page-order' set by malicious blkfront"), the
>>> behaviour of xen-blkback when connecting to a frontend was:
>>>
>>> - read 'ring-page-order'
>>> - if not present then expect a single page ring specified by 'ring-ref'
>>> - else expect a ring specified by 'ring-refX' where X is between 0 and
>>>   1 << ring-page-order
>>>
>>> This was correct behaviour, but was broken by the afforementioned commit to
>>> become:
>>>
>>> - read 'ring-page-order'
>>> - if not present then expect a single page ring
>>> - expect a ring specified by 'ring-refX' where X is between 0 and
>>>   1 << ring-page-order
>>> - if that didn't work then see if there's a single page ring specified by
>>>   'ring-ref'
>>>
>>> This incorrect behaviour works most of the time but fails when a frontend
>>> that sets 'ring-page-order' is unloaded and replaced by one that does not
>>> because, instead of reading 'ring-ref', xen-blkback will read the stale
>>> 'ring-ref0' left around by the previous frontend will try to map the wrong
>>> grant reference.
>>>
>>> This patch restores the original behaviour.
>>
>> Isn't this only the 2nd of a pair of fixes that's needed, the
>> first being the drivers, upon being unloaded, to fully clean up
>> after itself? Any stale key left may lead to confusion upon
>> re-use of the containing directory.
> 
> In a backend we shouldn't be relying on, nor really expect IMO, a frontend to clean up after itself. Any backend should know *exactly* what xenstore nodes it’s looking for from a frontend.

But the backend can't know whether a node exists because the present
frontend has written it, or because an earlier instance forgot to
delete it. It can only honor what's there. (In fact the other day I
was wondering whether some of the writes of boolean "false" nodes
wouldn't better be xenbus_rm() instead.)

Jan

