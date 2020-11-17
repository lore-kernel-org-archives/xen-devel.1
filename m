Return-Path: <SRS0=l9VS=EX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4894AC2D0E4
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2020 11:04:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9ED72078E
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2020 11:04:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ZkHiB4wC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9ED72078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.28917.58061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keymE-0005Rs-7A; Tue, 17 Nov 2020 11:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28917.58061; Tue, 17 Nov 2020 11:03:58 +0000
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
	id 1keymE-0005Rl-48; Tue, 17 Nov 2020 11:03:58 +0000
Received: by outflank-mailman (input) for mailman id 28917;
 Tue, 17 Nov 2020 11:03:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1keymC-0005Rg-44
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 11:03:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63daa348-7cdb-475a-a71f-c8185187e1a0;
 Tue, 17 Nov 2020 11:03:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 60F4AAC2E;
 Tue, 17 Nov 2020 11:03:54 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1keymC-0005Rg-44
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 11:03:56 +0000
X-Inumbo-ID: 63daa348-7cdb-475a-a71f-c8185187e1a0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 63daa348-7cdb-475a-a71f-c8185187e1a0;
	Tue, 17 Nov 2020 11:03:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605611034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mXevA6p3/+3NhtQoFA/yMlemtZVTpwrq9UFhquhsaic=;
	b=ZkHiB4wC2yxi3WCDi2qjF9CCr1YlskztBOgSJbeZh55os4L+69tT2ArdIj0UA4jVMlJJVB
	sbfI62y1aEjWVmK0bbydrGoyxF8vHX0AkQrrWJoYDQpkNbsH1qdFp2hAQviVfGMbRA3aE1
	NhXH6QKxVoN8C/h2U7aX4YwkgHn8KmI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 60F4AAC2E;
	Tue, 17 Nov 2020 11:03:54 +0000 (UTC)
Subject: Re: [PATCH v3 2/3] xen/pci: Move x86 specific code to x86 directory.
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1605527997.git.rahul.singh@arm.com>
 <a84005e5aa6733043e043b015cde4983719c8535.1605527997.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a6e6d884-93c0-f9ac-c2b4-b264c5a72db1@suse.com>
Date: Tue, 17 Nov 2020 12:03:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <a84005e5aa6733043e043b015cde4983719c8535.1605527997.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.11.2020 13:25, Rahul Singh wrote:
> passthrough/pci.c file is common for all architecture, but there is x86
> specific code in this file.

In how far is ...

> @@ -1370,13 +1301,6 @@ static int __init setup_dump_pcidevs(void)
>  }
>  __initcall(setup_dump_pcidevs);
>  
> -int iommu_update_ire_from_msi(
> -    struct msi_desc *msi_desc, struct msi_msg *msg)
> -{
> -    return iommu_intremap
> -           ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
> -}

... this code x86-specific? The hook being called lives in a
#ifdef CONFIG_HAS_PCI section, and MSI is a general PCI sub-
feature. IOW if this is another workaround, it should be
called so (if there's really no other way to address whatever
issue there is), which in turn likely means it wants to be in
a separate patch.

Jan

