Return-Path: <SRS0=Ywvf=BA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D214C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 12:08:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 503F72065D
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 12:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 503F72065D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxr4d-0006NU-Sp; Tue, 21 Jul 2020 12:08:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jxr4d-0006NP-0G
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 12:08:43 +0000
X-Inumbo-ID: eaba306e-cb4a-11ea-a0a7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eaba306e-cb4a-11ea-a0a7-12813bfff9fa;
 Tue, 21 Jul 2020 12:08:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4BEEB118;
 Tue, 21 Jul 2020 12:08:47 +0000 (UTC)
Subject: Re: [PATCH v2 0/7] xen: credit2: limit the number of CPUs per runqueue
To: Dario Faggioli <dfaggioli@suse.com>
References: <159070133878.12060.13318432301910522647.stgit@Palanthas>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fe24d520-7ef8-7dd7-6aa8-64df3a55b0bb@suse.com>
Date: Tue, 21 Jul 2020 14:08:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <159070133878.12060.13318432301910522647.stgit@Palanthas>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.05.2020 23:29, Dario Faggioli wrote:
> Dario Faggioli (7):
>       xen: credit2: factor cpu to runqueue matching in a function
>       xen: credit2: factor runqueue initialization in its own function.
>       xen: cpupool: add a back-pointer from a scheduler to its pool
>       xen: credit2: limit the max number of CPUs in a runqueue
>       xen: credit2: compute cpus per-runqueue more dynamically.
>       cpupool: create an the 'cpupool sync' infrastructure
>       xen: credit2: rebalance the number of CPUs in the scheduler runqueues

I still have the last three patches here as well as "xen: credit2:
document that min_rqd is valid and ok to use" in my "waiting for
sufficient acks" folder. Would you mind indicating if they should
stay there (and you will take care of pinging or whatever is
needed), or whether I may drop them (and you'll eventually re-
submit)?

Thanks, Jan

