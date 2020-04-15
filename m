Return-Path: <SRS0=NS8K=57=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB44DC2BA19
	for <xen-devel@archiver.kernel.org>; Wed, 15 Apr 2020 09:02:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3200206E9
	for <xen-devel@archiver.kernel.org>; Wed, 15 Apr 2020 09:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3200206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOdwK-0003Aq-Ol; Wed, 15 Apr 2020 09:02:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOdwJ-0003Al-JQ
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 09:02:35 +0000
X-Inumbo-ID: d89def8c-7ef7-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d89def8c-7ef7-11ea-83d8-bc764e2007e4;
 Wed, 15 Apr 2020 09:02:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5B726AFB4;
 Wed, 15 Apr 2020 09:02:33 +0000 (UTC)
Subject: Re: xenoprof
To: paul@xen.org
References: <000001d5f95c$df50ce60$9df26b20$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <51b20e28-5176-426b-b9fc-12ad89e1deb5@suse.com>
Date: Wed, 15 Apr 2020 11:02:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <000001d5f95c$df50ce60$9df26b20$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 13.03.2020 18:28, Paul Durrant wrote:
>   I'm trying to determine the status of HYPERVISOR_xenoprof_op. The code behind it appears to be unmaintained and I cannot find any
> support statement for it. Googling around finds some mentions of Xen and oprofile but it's not clear whether it works and most
> references I find are quite old. Is it time to remove it?

Well, in the course of XSA-313 inside the security team we asked
ourselves the same, but came to the conclusion that we're better
off keeping it, probably. But clarifying its status in SUPPORT.md
would likely be a good idea. We may want to go as far as
removing security support from it, which then imo ought to be
accompanied by changing its Kconfig option to default-off. The
effect of doing such on older, in particular no longer fully
maintained releases is unclear to me though.

Jan

