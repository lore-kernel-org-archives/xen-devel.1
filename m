Return-Path: <SRS0=y3rP=FH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99866C63777
	for <xen-devel@archiver.kernel.org>; Thu,  3 Dec 2020 09:46:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21AD220C56
	for <xen-devel@archiver.kernel.org>; Thu,  3 Dec 2020 09:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21AD220C56
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.43275.77824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kklC9-0004WV-Kp; Thu, 03 Dec 2020 09:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43275.77824; Thu, 03 Dec 2020 09:46:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kklC9-0004WO-He; Thu, 03 Dec 2020 09:46:37 +0000
Received: by outflank-mailman (input) for mailman id 43275;
 Thu, 03 Dec 2020 09:46:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSHx=FH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kklC8-0004WJ-R6
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 09:46:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c04f2bc-b956-40c1-a54c-27a32343a6fa;
 Thu, 03 Dec 2020 09:46:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E26F8ACBA;
 Thu,  3 Dec 2020 09:46:34 +0000 (UTC)
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
X-Inumbo-ID: 5c04f2bc-b956-40c1-a54c-27a32343a6fa
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606988795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QeXzYmmdPu0yiACCqNFWW9iWhMTg03koey4W+Yzot1g=;
	b=pSQOWjddrYPJkGjNIT71GF/j2seaEqNTHA59ySjkrwJhNWada7enK18XLqpSUOQ35aVHe1
	zGywIoIGselbKFSv61tnfkwQ0Aze25IDP8pHU4Pv/dIK7lQXboqpkJA1Loszda9nZVj6QX
	aRm2WDiSkN8rsKwzZXmwOtW7/W4M3Dg=
Subject: Re: [PATCH v3 1/5] evtchn: drop acquiring of per-channel lock from
 send_guest_{global,vcpu}_virq()
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <d709a9c3-dbe2-65c6-2c2f-6a12f486335d@suse.com>
 <70170293-a9a7-282a-dde6-7ed73fc2da48@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c15b1e7e-ed9c-b597-2fc1-b8cf89999c55@suse.com>
Date: Thu, 3 Dec 2020 10:46:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <70170293-a9a7-282a-dde6-7ed73fc2da48@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.12.2020 20:03, Julien Grall wrote:
> On 23/11/2020 13:28, Jan Beulich wrote:
>> The per-vCPU virq_lock, which is being held anyway, together with there
>> not being any call to evtchn_port_set_pending() when v->virq_to_evtchn[]
>> is zero, provide sufficient guarantees. 
> 
> I agree that the per-vCPU virq_lock is going to be sufficient, however 
> dropping the lock also means the event channel locking is more complex 
> to understand (the long comment that was added proves it).
> 
> In fact, the locking in the event channel code was already proven to be 
> quite fragile, therefore I think this patch is not worth the risk.

I agree this is a very reasonable position to take. I probably
would even have remained silent if in the meantime the
spin_lock()s there hadn't changed to read_trylock()s. I really
think we want to limit this unusual locking model to where we
strictly need it. And this change eliminates 50% of them, with
the added benefit of making the paths more lightweight.

Jan

