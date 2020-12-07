Return-Path: <SRS0=Mf7K=FL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC06C433FE
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 15:21:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1113923730
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 15:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1113923730
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.46698.82769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIKc-0001zg-Pm; Mon, 07 Dec 2020 15:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46698.82769; Mon, 07 Dec 2020 15:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIKc-0001zZ-MY; Mon, 07 Dec 2020 15:21:42 +0000
Received: by outflank-mailman (input) for mailman id 46698;
 Mon, 07 Dec 2020 15:21:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmIKb-0001zU-1u
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 15:21:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a0de98d-3d99-451e-abbd-1e897680e968;
 Mon, 07 Dec 2020 15:21:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7C0E1AB63;
 Mon,  7 Dec 2020 15:21:39 +0000 (UTC)
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
X-Inumbo-ID: 4a0de98d-3d99-451e-abbd-1e897680e968
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607354499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4qsMwrQS7vfRwqSJw3t1sG9JFXYCXuoAuYCkKH3a51E=;
	b=QKeCgOo60R3nl5TYxtphUai48h7V7S/iBlIkmZYBqmEQ4bLJnAAx2ng7U1MU51fNs2OGzm
	JcK2lsI2id9FHzVETkzzGLdo9RDWEpvviyfuuiQPRgi1qWZg3hBUJoqh4Si4T+DOhbAZDB
	4D4dmHhnGtzyXHlxli/cgoaiSRpNvRs=
Subject: Re: [PATCH v2 04/17] xen/cpupool: switch cpupool id to unsigned
To: Dario Faggioli <dfaggioli@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-5-jgross@suse.com>
 <c2753a9853a1dccc159e0b34db0cdf0a364d2206.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <45bd5958-5935-7cbf-ddb3-7fae9e2dfd4b@suse.com>
Date: Mon, 7 Dec 2020 16:21:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <c2753a9853a1dccc159e0b34db0cdf0a364d2206.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.12.2020 16:52, Dario Faggioli wrote:
> On Tue, 2020-12-01 at 09:21 +0100, Juergen Gross wrote:
>> The cpupool id is an unsigned value in the public interface header,
>> so
>> there is no reason why it is a signed value in struct cpupool.
>>
>> Switch it to unsigned int.
>>
> I think we can add:
> 
> "No functional change intended"

I've not added this - there is an intentional change at least
for

        if ( (poolid != CPUPOOLID_NONE) && (last >= poolid) )

Jan

