Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10ED9C433EF
	for <xen-devel@archiver.kernel.org>; Thu, 24 Mar 2022 12:25:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.294280.500288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXMWJ-000145-1W; Thu, 24 Mar 2022 12:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294280.500288; Thu, 24 Mar 2022 12:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXMWI-00013y-Us; Thu, 24 Mar 2022 12:24:50 +0000
Received: by outflank-mailman (input) for mailman id 294280;
 Thu, 24 Mar 2022 12:24:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PXCt=UD=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1nXMWI-00013s-8v
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 12:24:50 +0000
Received: from smarthost01a.sbp.mail.zen.net.uk
 (smarthost01a.sbp.mail.zen.net.uk [212.23.1.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 619fc5a0-ab6d-11ec-8fbc-03012f2f19d4;
 Thu, 24 Mar 2022 13:24:42 +0100 (CET)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.uk)
 by smarthost01a.sbp.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>)
 id 1nXMWF-00016E-U7; Thu, 24 Mar 2022 12:24:47 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.92)
 (envelope-from <dvrabel@cantab.net>)
 id 1nXMW6-0002uH-UQ; Thu, 24 Mar 2022 12:24:47 +0000
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
X-Inumbo-ID: 619fc5a0-ab6d-11ec-8fbc-03012f2f19d4
Message-ID: <35700440-4614-cbd3-361c-3a82cb3d37a9@cantab.net>
Date: Thu, 24 Mar 2022 12:24:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com>
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 82.70.146.43
X-SA-Exim-Mail-From: dvrabel@cantab.net
Subject: Re: [PATCH] xen/evtchn: Add design for static event channel signaling
 for domUs..
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on pear.davidvrabel.org.uk)
X-Originating-smarthost01a-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41



On 23/03/2022 15:43, Rahul Singh wrote:
> in dom0less system. This patch introduce the new feature to support the
> signaling between two domUs in dom0less system.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   docs/designs/dom0less-evtchn.md | 96 +++++++++++++++++++++++++++++++++
>   1 file changed, 96 insertions(+)
>   create mode 100644 docs/designs/dom0less-evtchn.md
> 
> diff --git a/docs/designs/dom0less-evtchn.md b/docs/designs/dom0less-evtchn.md
> new file mode 100644
> index 0000000000..6a1b7e8c22
> --- /dev/null
> +++ b/docs/designs/dom0less-evtchn.md
> @@ -0,0 +1,96 @@
> +# Signaling support between two domUs on dom0less system
> +
> +## Current state: Draft version
> +
> +## Proposer(s): Rahul Singh, Bertrand Marquis
> +
> +## Problem Statement:
> +
> +The goal of this work is to define a simple signaling system between Xen guests
> +in dom0less systems.
> +
> +In dom0less system, we cannot make use of xenbus and xenstore that are used in
> +normal systems with dynamic VMs to communicate between domains by providing a
> +bus abstraction for paravirtualized drivers.
> +
> +One possible solution to implement the signaling system between domUs is based
> +on event channels.

This problem statement could do with some example use cases that are 
usefully solved by this proposed solution.

"We don't have xenstore so can't set up shared rings, but here's a 
replacement comms mechanism that can do a single bit." Doesn't seem very 
compelling to me.

> +    chosen {
> +        ....
> +
> +        domU1: domU1 {
> +            ......
> +        };
> +
> +        domU2: domU2 {
> +            ......
> +        };
> +
> +        evtchn@1 {
> +            compatible = "xen,evtchn";
> +            xen,evtchn = <0xa &domU1 0xb &domU2>;
> +        };
> +
> +        evtchn@2 {
> +            compatible = "xen,evtchn";
> +            xen,evtchn = <0xc &domU1 0xd &domU2>;
> +        };

How is the domain supposed to know what these event channels are for?

I'm not that familiar with device tree. Is it possible to give these 
entries name?

David

