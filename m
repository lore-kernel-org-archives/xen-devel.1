Return-Path: <SRS0=xflx=L3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D4F1C07E97
	for <xen-devel@archiver.kernel.org>; Sat,  3 Jul 2021 09:21:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D778961447
	for <xen-devel@archiver.kernel.org>; Sat,  3 Jul 2021 09:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D778961447
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.149440.276326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzbpy-00062g-9F; Sat, 03 Jul 2021 09:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149440.276326; Sat, 03 Jul 2021 09:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzbpy-00062Z-5y; Sat, 03 Jul 2021 09:21:22 +0000
Received: by outflank-mailman (input) for mailman id 149440;
 Sat, 03 Jul 2021 09:21:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c6Yl=L3=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lzbpx-00062T-1e
 for xen-devel@lists.xenproject.org; Sat, 03 Jul 2021 09:21:21 +0000
Received: from deinos.phlegethon.org (unknown [5.39.92.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 526fe32f-c4a4-4a83-9879-c8026fb4986f;
 Sat, 03 Jul 2021 09:21:18 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.94.2 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lzbPW-000Hw7-CP; Sat, 03 Jul 2021 08:54:02 +0000
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
X-Inumbo-ID: 526fe32f-c4a4-4a83-9879-c8026fb4986f
Date: Sat, 3 Jul 2021 09:54:02 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>
Subject: Re: [PATCH] x86/shadow: drop callback_mask pseudo-variables
Message-ID: <YOAlqnHqHQ7nfs2X@deinos.phlegethon.org>
References: <b791d89f-5c9d-9c04-00ed-0cbaae68536a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <b791d89f-5c9d-9c04-00ed-0cbaae68536a@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 08:42 +0200 on 30 Jun (1625042541), Jan Beulich wrote:
> In commit 90629587e16e ("x86/shadow: replace stale literal numbers in
> hash_{vcpu,domain}_foreach()") I had to work around a clang shortcoming
> (if you like), leveraging that gcc tolerates static const variables in
> otherwise integer constant expressions. Roberto suggests that we'd
> better not rely on such behavior. Drop the involved static const-s,
> using their "expansions" in both of the prior use sites each. This then
> allows dropping the short-circuiting of the check for clang.
> 
> Requested-by: Roberto Bagnara <roberto.bagnara@bugseng.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tim Deegan <tim@xen.org>

