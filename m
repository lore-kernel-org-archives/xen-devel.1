Return-Path: <SRS0=ycEq=EN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1914AC388F7
	for <xen-devel@archiver.kernel.org>; Sat,  7 Nov 2020 08:48:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCA2B20704
	for <xen-devel@archiver.kernel.org>; Sat,  7 Nov 2020 08:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCA2B20704
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.21309.47621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbJtJ-0001at-63; Sat, 07 Nov 2020 08:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21309.47621; Sat, 07 Nov 2020 08:48:09 +0000
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
	id 1kbJtJ-0001am-2v; Sat, 07 Nov 2020 08:48:09 +0000
Received: by outflank-mailman (input) for mailman id 21309;
 Sat, 07 Nov 2020 08:48:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=np7k=EN=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1kbJtH-0001ah-B2
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 08:48:07 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d30c386-f72e-43b5-b65c-2d8fcde62ff4;
 Sat, 07 Nov 2020 08:48:06 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1kbJtE-0003Jq-Eq; Sat, 07 Nov 2020 08:48:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=np7k=EN=xen.org=tim@srs-us1.protection.inumbo.net>)
	id 1kbJtH-0001ah-B2
	for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 08:48:07 +0000
X-Inumbo-ID: 3d30c386-f72e-43b5-b65c-2d8fcde62ff4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3d30c386-f72e-43b5-b65c-2d8fcde62ff4;
	Sat, 07 Nov 2020 08:48:06 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
	(envelope-from <tim@xen.org>)
	id 1kbJtE-0003Jq-Eq; Sat, 07 Nov 2020 08:48:04 +0000
Date: Sat, 7 Nov 2020 08:48:04 +0000
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH v2 9/9] x86/shadow: adjust TLB flushing in
 sh_unshadow_for_p2m_change()
Message-ID: <20201107084804.GC11151@deinos.phlegethon.org>
References: <4b63025f-164c-2e93-3d54-7a7f145ad046@suse.com>
 <76665833-415c-f192-29f6-1340191db7ff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <76665833-415c-f192-29f6-1340191db7ff@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 10:39 +0100 on 06 Nov (1604659168), Jan Beulich wrote:
> Accumulating transient state of d->dirty_cpumask in a local variable is
> unnecessary here: The flush is fine to make with the dirty set at the
> time of the call. With this, move the invocation to a central place at
> the end of the function.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tim Deegan <tim@xen.org>

