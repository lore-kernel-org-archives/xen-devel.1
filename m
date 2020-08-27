Return-Path: <SRS0=HZRB=CF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB72C433DF
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2020 16:07:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50AE2080C
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2020 16:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A50AE2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBKQo-0005cm-Ag; Thu, 27 Aug 2020 16:07:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o8NI=CF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kBKQn-0005cd-0Q
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 16:07:17 +0000
X-Inumbo-ID: 7b7680c1-51e7-4341-a1e8-a552d9905893
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b7680c1-51e7-4341-a1e8-a552d9905893;
 Thu, 27 Aug 2020 16:07:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 97A73AF3E;
 Thu, 27 Aug 2020 16:07:47 +0000 (UTC)
Subject: Re: [xen-unstable-smoke test] 152898: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>,
 Costin Lupu <costin.lupu@cs.pub.ro>
References: <osstest-152898-mainreport@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fd303f97-a471-686e-8d4a-12578bdb6c07@suse.com>
Date: Thu, 27 Aug 2020 18:07:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <osstest-152898-mainreport@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.08.2020 17:49, osstest service owner wrote:
> flight 152898 xen-unstable-smoke real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/152898/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-amd64                   6 xen-build                fail REGR. vs. 152892

This looks to be an issue in the mini-os tree, and I'm having
trouble understanding how it can cause the main tree to first
discover it. Is there no push gate for that tree?

In any event, commit 1b8ed31f4ce4 ("mini-os: netfront: Read netmask
and gateway from Xenstore") looks to have missed callers to
init_netfront(), both in the mini-os tree itself and in stubdom/grub/
of the main tree.

Jan

