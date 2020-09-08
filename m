Return-Path: <SRS0=UWXF=CR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D9FC43461
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2020 08:55:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3114D20678
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2020 08:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3114D20678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFZPB-0006Dh-3T; Tue, 08 Sep 2020 08:55:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBuC=CR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFZPA-0006Dc-Bu
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 08:55:08 +0000
X-Inumbo-ID: b9451b4c-01d9-4e4a-92c9-8bd21da5f9cd
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9451b4c-01d9-4e4a-92c9-8bd21da5f9cd;
 Tue, 08 Sep 2020 08:55:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ECEADB604;
 Tue,  8 Sep 2020 08:55:06 +0000 (UTC)
Subject: Re: [PATCH] Revert "x86/hvm: simplify 'mmio_direct' check in
 epte_get_entry_emt()"
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <20200907170916.61693-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8a050491-4e02-63be-c622-6fab25c4c2e6@suse.com>
Date: Tue, 8 Sep 2020 10:55:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200907170916.61693-1-roger.pau@citrix.com>
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

On 07.09.2020 19:09, Roger Pau Monne wrote:
> This reverts commit 81fd0d3ca4b2cd309403c6e8da662c325dd35750.
> 
> Original commit only takes into account the APIC access page being a
> 'special' page, but when running a PVH dom0 there are other pages that
> also fulfill the 'special' page check but shouldn't have it's cache
> type set to WB.
> 
> For example the ACPI regions are identity mapped into the guest but
> are also Xen heap pages, and forcing those to WB cache type is wrong.

Why is this wrong? Xen heap pages are RAM ones. Quite the opposite,
_not_ forcing them to WB is going to cause cachability conflicts,
unless their direct mapping entries also got changed to UC (which I
think we want to avoid if at all possible). The cachability we
select here is the one to be used by the hardware, not the one
perceived by a domain (be it Dom0 or a DomU).

> I've discovered this while trying to boot a PVH dom0, which fail to
> boot with this commit applied.

And what exactly is the deeper reason of the failure?

Jan

