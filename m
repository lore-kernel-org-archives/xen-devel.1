Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACB4606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 10:15:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1494198.1693839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTchB-00032y-7J; Wed, 18 Nov 2026 10:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494198.1693839; Wed, 18 Nov 2026 10:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTchB-00032r-43; Wed, 18 Nov 2026 10:15:17 +0000
Received: by outflank-mailman (input) for mailman id 1494198;
 Wed, 18 Nov 2026 10:15:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lin.liu01@citrix.com>) id 1xTchA-00032l-2Y
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 10:15:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTch9-00FHc1-FC
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 11:15:15 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6afd7ab0-bab6-0a2a0a5309dd-0a2a45069330-22
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 11:15:15 +0100
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6afd7ab1-195a-0a2a45060019-a0658309e0bc-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 11:15:14 +0100
Received: from cdev-nkg (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id DD0EC84EA7C2;
 Wed, 18 Nov 2026 05:13:44 -0500 (EST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Lin Liu <lin.liu01@citrix.com>
To: jbeulich@suse.com
Cc: xen-devel@lists.xenproject.org,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech
Subject: Re: [PATCH] x86/hvm: Don't save or load HVM context of a domain with no vCPUs
Date: Wed, 18 Nov 2026 10:15:08 +0000
Message-ID: <20261118101508.1979025-1-lin.liu01@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <8bea775d-19a5-402f-bc29-bbdb76164621@suse.com>
References: <8bea775d-19a5-402f-bc29-bbdb76164621@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1794996914-1ECC577B-997F254B/0/0
X-purgate-type: clean
X-purgate-size: 888
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18.11.2026 09:40, Jan Beulich wrote:
>> +    /* Per-domain records are saved via vCPU 0, absent before max_vcpus. */
>> +    v = domain_vcpu(d, hvm_sr_handlers[typecode].kind == HVMSR_PER_VCPU
>> +                       ? instance : 0);
> 
> ... this wrapped differently (happy to adjust while committing):
> 
>     v = domain_vcpu(d,
>                     hvm_sr_handlers[typecode].kind == HVMSR_PER_VCPU
>                     ? instance : 0);
> 
> or
> 
>     v = domain_vcpu(d,
>                     hvm_sr_handlers[typecode].kind == HVMSR_PER_VCPU ? instance
>                                                                      : 0);
> 
> When an argument is too long to fit on a line, I don't think it should share
> a line with any earlier (or later) arguments.

Thanks Jan. Please adjust it while committing; I'll keep this in mind for
next time.

Lin

