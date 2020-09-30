Return-Path: <SRS0=Shbi=DH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67EDBC4727F
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 08:35:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AEAA206B7
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 08:35:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="jFFiZxTm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AEAA206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.484.1529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNXZz-00049K-SH; Wed, 30 Sep 2020 08:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484.1529; Wed, 30 Sep 2020 08:35:15 +0000
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
	id 1kNXZz-00049D-Ny; Wed, 30 Sep 2020 08:35:15 +0000
Received: by outflank-mailman (input) for mailman id 484;
 Wed, 30 Sep 2020 08:35:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNXZx-000497-Jr
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:35:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3e9a43e-7e65-4896-927a-1844ae3a13b2;
 Wed, 30 Sep 2020 08:35:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 58806AFE8;
 Wed, 30 Sep 2020 08:35:12 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNXZx-000497-Jr
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:35:13 +0000
X-Inumbo-ID: c3e9a43e-7e65-4896-927a-1844ae3a13b2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c3e9a43e-7e65-4896-927a-1844ae3a13b2;
	Wed, 30 Sep 2020 08:35:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601454912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mcz4R87e2qSfE28jsC5TdQAb8sfDN8YK9eEsI1I92cM=;
	b=jFFiZxTmPNv5smXrklmFDblXGvFFk+OEI4ksWvwdTRC51buejc5wRkJd9KYciyEpmc9u3W
	Uu4F2Ze6U0CCgmAae8Shx2MF5NFsi1D/Sr02qdv99jrvYs7QEcoqTVjxXeeeve5cPqJmlE
	1+7JyhC2pFTSp6Qb86klZM2xFJVwEK8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 58806AFE8;
	Wed, 30 Sep 2020 08:35:12 +0000 (UTC)
Subject: Re: [PATCH 10/12] evtchn/fifo: use stable fields when recording "last
 queue" information
To: paul@xen.org
Cc: xen-devel@lists.xenproject.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Stefano Stabellini' <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <ff4c9cc4-c642-2f51-da36-c9883ab65e61@suse.com>
 <004501d696fc$37c969c0$a75c3d40$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2514b083-8f70-3898-eedb-88419c6f1d63@suse.com>
Date: Wed, 30 Sep 2020 10:35:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <004501d696fc$37c969c0$a75c3d40$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 09:35, Paul Durrant wrote:
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
>> Sent: 28 September 2020 12:02
>>
>> Both evtchn->priority and evtchn->notify_vcpu_id could, prior to recent
>> locking adjustments, change behind the back of
>> evtchn_fifo_set_pending(). Neither the queue's priority nor the vCPU's
>> vcpu_id fields have similar properties, so they seem better suited for
>> the purpose. In particular they reflect the respective evtchn fields'
>> values at the time they were used to determine queue and vCPU.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I think these changes make the code clearer anyway.
> 
> Reviewed-by: Paul Durrant <paul@xen.org>

Thanks. With the change of description in the earlier patch, and with
this one possibly going in ahead of it, I'll massage the description
here somewhat, I guess.

Jan

