Return-Path: <SRS0=Kfrc=CS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E30C433E2
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2020 16:00:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFBEB20639
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2020 16:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFBEB20639
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG2WH-0003uX-4n; Wed, 09 Sep 2020 16:00:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y3mV=CS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kG2WF-0003lb-UQ
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 16:00:23 +0000
X-Inumbo-ID: 77089315-94fa-4edc-8bea-b220cd7e8297
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77089315-94fa-4edc-8bea-b220cd7e8297;
 Wed, 09 Sep 2020 16:00:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA8BBAF7C;
 Wed,  9 Sep 2020 16:00:34 +0000 (UTC)
Subject: Re: [PATCH v4] hvmloader: indicate ACPI tables with "ACPI data" type
 in e820
To: Igor Druzhinin <igor.druzhinin@citrix.com>, andrew.cooper3@citrix.com
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com, wl@xen.org,
 iwj@xenproject.org
References: <1599579679-23983-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a0587271-db3a-638e-201c-03bcb46426ed@suse.com>
Date: Wed, 9 Sep 2020 18:00:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599579679-23983-1-git-send-email-igor.druzhinin@citrix.com>
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

On 08.09.2020 17:41, Igor Druzhinin wrote:
> Guest kernel does need to know in some cases where the tables are located
> to treat these regions properly. One example is kexec process where
> the first kernel needs to pass ACPI region locations to the second
> kernel which is now a requirement in Linux after 02a3e3cdb7f12 ("x86/boot:
> Parse SRAT table and count immovable memory regions") in order for kexec
> transition to actually work.
> 
> That commit introduced accesses to XSDT and SRAT while the second kernel
> is still using kexec transition tables. The transition tables do not have
> e820 "reserved" regions mapped where those tables are located currently
> in a Xen guest. Instead "ACPI data" regions are mapped with the transition
> tables that was introduced by the following commit 6bbeb276b7 ("x86/kexec:
> Add the EFI system tables and ACPI tables to the ident map").
> 
> Reserve 1MB (out of 16MB currently available) right after ACPI info page for
> ACPI tables exclusively but populate this region on demand and only indicate
> populated memory as "ACPI data" since according to ACPI spec that memory is
> reclaimable by the guest if necessary. That is close to how we treat
> the same ACPI data in PVH guests. 1MB should be enough for now but could be
> later extended if required.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

After committing this I'm now somewhat uncertain whether to queue this
for the stable trees. Does either of you (or anyone else) have any clear
opinion either way?

Jan

