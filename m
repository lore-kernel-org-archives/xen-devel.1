Return-Path: <SRS0=qW8Y=ME=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34E7C07E99
	for <xen-devel@archiver.kernel.org>; Mon, 12 Jul 2021 14:42:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E39061156
	for <xen-devel@archiver.kernel.org>; Mon, 12 Jul 2021 14:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E39061156
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.154587.285617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2x8U-000086-06; Mon, 12 Jul 2021 14:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154587.285617; Mon, 12 Jul 2021 14:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2x8T-00007z-TX; Mon, 12 Jul 2021 14:42:17 +0000
Received: by outflank-mailman (input) for mailman id 154587;
 Mon, 12 Jul 2021 14:42:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKSD=ME=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m2x8S-00007s-2k
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 14:42:16 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59357372-e31f-11eb-86ef-12813bfff9fa;
 Mon, 12 Jul 2021 14:42:15 +0000 (UTC)
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
X-Inumbo-ID: 59357372-e31f-11eb-86ef-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626100934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AS7ZNg4Tqka4pfg9hSdQfj62jtgn04NDY6RLVqXGxzY=;
  b=THEAcObEv7dC5TeOUYDUkHgG8Z6nP6KBudmq3wDnSnQh1zgY5YyGq+15
   u6N7gxu9Rj7YlOwv+viXzq41roGGMibIJpByFuZBHKU4iudNknKtqPczD
   QFSvRBQN8XlmUMxHWzLZFnpmn13sL0Nm7FfwuITmxRl8AEJs3wtAxVxNl
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xJBSIDu/M272tH2EVtmo7XuTbnlTvXdeMzC5Zd+KprpuVmJRHeve3SFoI+DuXAfM8wWVQO01GZ
 SojV9fN8yK2j4VZ335TmrS+5I/3tl8RCleiiM/Bss5plEFePzCOVUk88aozMubVnkMcanLuXWz
 2ZcEHf1GGM/aWFgOVxRKg9O36B6FOJHjwfa6yq6k9yMvb6SHcaBH+EvtsgKjvhwn8Qcgz6so2F
 GoLKJ8f+2CMXe2s0xF0iy1QgO1B/+MonjI/cwFFgZ8ZmrkRkFwktbTe3m7JMDpzw6Ccg4AP9tA
 zl0=
X-SBRS: 5.1
X-MesageID: 48069256
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Pqk1Zq9v4cMdceO96Mtuk+AuI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHnJYVMqMk3I9uruBEDtex3hHNtOkOss1NSZLW7bUQmTXeJfBOLZqlWNJ8S9zJ856U
 4JScND4bbLfDxHZKjBgTVRE7wbsaa6GKLDv5ah85+6JzsaGp2J7G1Ce3am+lUdfng+OXKgfq
 Dsm/auoVCbCAwqR/X+PFYpdc7ZqebGkZr3CCR2eyLOuGG1/EiVAKeRKWnj4isj
X-IronPort-AV: E=Sophos;i="5.84,234,1620705600"; 
   d="scan'208";a="48069256"
Date: Mon, 12 Jul 2021 15:42:10 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v6 09/31] build: clean "lib.a"
Message-ID: <YOxUwpjwRZBlP1xB@perard>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-10-anthony.perard@citrix.com>
 <bb2c21cc-b801-6d94-5762-7f9e35793998@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bb2c21cc-b801-6d94-5762-7f9e35793998@suse.com>

On Wed, Jul 07, 2021 at 05:03:12PM +0200, Jan Beulich wrote:
> On 01.07.2021 16:09, Anthony PERARD wrote:
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Hmm, I was clearly under the impression (or at least assuming)
> that $(targets) would be included in what gets cleaned by the
> general rule.

Unfortunately, that not true for two reasons, the first is that `make
clean` doesn't actually remove anything from $(targets), but that could
be changed as Linux does remove files listed in $(targets). The second is
that `make clean` doesn't actually use anything from "Rules.mk" and
doesn't include it, so when running `make clean`, "lib.a" is never in
$(targets).

> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks,

-- 
Anthony PERARD

