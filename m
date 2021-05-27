Return-Path: <SRS0=cWgu=KW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E179C4708A
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 11:17:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25E7C610A6
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 11:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25E7C610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.133006.248011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmE0e-0006cz-DN; Thu, 27 May 2021 11:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133006.248011; Thu, 27 May 2021 11:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmE0e-0006cs-AU; Thu, 27 May 2021 11:17:04 +0000
Received: by outflank-mailman (input) for mailman id 133006;
 Thu, 27 May 2021 11:17:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmE0d-0006cm-4b
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 11:17:03 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6533f1b-3c6e-44e3-bc90-e1f143d4bbcf;
 Thu, 27 May 2021 11:17:01 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BF169218DD;
 Thu, 27 May 2021 11:17:00 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 8A11611A98;
 Thu, 27 May 2021 11:17:00 +0000 (UTC)
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
X-Inumbo-ID: a6533f1b-3c6e-44e3-bc90-e1f143d4bbcf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622114220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0WtvNwAECKle8+6jyQuA7PmY2BIdWUsLQwGx1tLe9Ns=;
	b=JYIEv7kr8MQ3szYMRnCH1wQVG5B7Bvhd34qGXC+FRF6tqTP0E4e86vnKSQ/H96iSLXWedV
	D0+a/drrixhYgVeOxcjGmNzC2pLYkk2V4DzS/m7SO+oDNavD023Y7j2TzDNwCPyBtz6P2v
	qIpWzHyGC0viE1OapAOJECnlS+ReyWc=
Subject: Re: [PATCH v5 2/6] evtchn: convert domain event lock to an r/w one
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <306e62e8-9070-2db9-c959-858465c50c1d@suse.com>
 <5f5fc6a7-6e27-8275-0f05-11ba5454156a@suse.com>
 <YK978wmwAZqQDEQZ@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d2bebb20-0216-e17d-e7c3-6085ea300e26@suse.com>
Date: Thu, 27 May 2021 13:16:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YK978wmwAZqQDEQZ@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.05.2021 13:01, Roger Pau Monné wrote:
> On Wed, Jan 27, 2021 at 09:16:07AM +0100, Jan Beulich wrote:
>> Especially for the use in evtchn_move_pirqs() (called when moving a vCPU
>> across pCPU-s) and the ones in EOI handling in PCI pass-through code,
>> serializing perhaps an entire domain isn't helpful when no state (which
>> isn't e.g. further protected by the per-channel lock) changes.
> 
> I'm unsure this move is good from a performance PoV, as the operations
> switched to use the lock in read mode is a very small subset, and then
> the remaining operations get a performance penalty when compared to
> using a plain spin lock.

Well, yes, unfortunately review of earlier versions has resulted in
there being quite a few less read_lock() uses now than I had
(mistakenly) originally. There are a few worthwhile conversions,
but on the whole maybe I should indeed drop this change.

>> @@ -1510,9 +1509,10 @@ int evtchn_destroy(struct domain *d)
>>  {
>>      unsigned int i;
>>  
>> -    /* After this barrier no new event-channel allocations can occur. */
>> +    /* After this kind-of-barrier no new event-channel allocations can occur. */
>>      BUG_ON(!d->is_dying);
>> -    spin_barrier(&d->event_lock);
>> +    read_lock(&d->event_lock);
>> +    read_unlock(&d->event_lock);
> 
> Don't you want to use write mode here to assure there are no read
> users that have taken the lock before is_dying has been set, and thus
> could make wrong assumptions?
> 
> As I understand the point of the barrier here is to ensure there are
> no lockers carrier over from before is_dying has been set.

The purpose is, as the comment says, no new event channel allocations.
Those happen under write lock, so a read-lock-based barrier is enough
here afaict.

Jan

