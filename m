Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C16E9A74A
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2026 09:28:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1260182.1553540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4y3R-0001k7-8d; Tue, 24 Mar 2026 09:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260182.1553540; Tue, 24 Mar 2026 09:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4y3R-0001k0-4z; Tue, 24 Mar 2026 09:28:05 +0000
Received: by outflank-mailman (input) for mailman id 1260182;
 Tue, 24 Mar 2026 09:28:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69c25920.v1-e48e8c2345b1464b8871a0896651f48b@bounce.vates.tech>)
 id 1w4y3P-0001ju-Ns
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 09:28:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4y3O-00DcvC-UO
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 10:28:02 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69c25920.v1-e48e8c2345b1464b8871a0896651f48b@bounce.vates.tech>)
 id 69c2591f-2eae-0a2a0a5409dd-0a2a450297b4-16
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 10:28:02 +0100
Received: from [198.2.180.47] (helo=mail180-47.suw31.mandrillapp.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from
 <bounce-md_30504962.69c25920.v1-e48e8c2345b1464b8871a0896651f48b@bounce.vates.tech>)
 id 69c25921-63bb-0a2a45020019-c602b42f3a4e-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 10:28:02 +0100
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-47.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4fg4TD5J5ZzPm0Vq1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:28:00 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e48e8c2345b1464b8871a0896651f48b; Tue, 24 Mar 2026 09:28:00 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="anthony.perard@vates.tech" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774344480; x=1774614480;
	bh=xySpiGsL6jhSgBQryanlxjULqiUOOXBfzlvPnW3Iw4Y=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=NPp7ltawkHhYbUxk/jmORm3ttGgOE0Cnfrv44zUgTeukjOdTn8t2SL+or/9kD6T0T
	 +WHAHnmnjMIGvXjUDDARaCwWHcSp9kElutNJ5r9Qwp3BmRdBG/l5a7qL1F6/y92/Vk
	 oISBy2XFUnLR03i1ZWax9IP+3FH3U6XdEfg6LFehJyyMUbIlHPl+jfNj6hZMcJvVko
	 ZkL0skAC2udiifTf+GqLLV2ib8mXhDwLfmtSzAuELeGB8mwX1KdwCNTGCk6LEixyLa
	 xqniW/g92zKpdYyLkXw/agrPXnA9+zgRs6PYZWrEnRswrpbEjM2KaXCLaTXhePzQYb
	 JLH1oiRGiWIvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774344480; x=1774604980; i=anthony.perard@vates.tech;
	bh=xySpiGsL6jhSgBQryanlxjULqiUOOXBfzlvPnW3Iw4Y=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=o4sK16TJtv3scZI1Vny5HgKi4f1jWzDj+jcg9cjVc6GX+oSRY7i3KIfEcR1799NK4
	 X2EKoDIBN0aAAcnrQLzUd6P36yt5T8GS515CLNUE96P/T2/QLAAvKXqaGHujDk7Hox
	 NrQ8hwhcKHSEsbOVah7MmYVdcXj+BosD0mttAttu9Jpa6IpqC6j6CEDb0J23hIYie7
	 0cB/IjTBy0+N672oSJy4bOpTfAUK9a0Dm2LT8p9cs47pFlCMhT26rlaen3vKSsatt9
	 VXPhWAoY/sIeglxDCIpN1DTzxhE9czjLyXMcZUCciJmZLa8X24r93k5oHT3UTljr6R
	 zZgvJYqODcYKg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=200/4]=20Xen:=20Add=20Q35=20initial=20support=20for=20HVM=20guests?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774344479469
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: "Thierry Escande" <thierry.escande@vates.tech>, qemu-devel@nongnu.org, "Paolo Bonzini" <pbonzini@redhat.com>, "Richard Henderson" <richard.henderson@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, "Eduardo Habkost" <eduardo@habkost.net>, xen-devel@lists.xenproject.org
Message-Id: <acJZHpw8tcTMPpCn@l14>
References: <20260313164649.794591-1-thierry.escande@vates.tech> <abVtsK31t9tWgsaY@mail-itl>
In-Reply-To: <abVtsK31t9tWgsaY@mail-itl>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e48e8c2345b1464b8871a0896651f48b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260324:md
Date: Tue, 24 Mar 2026 09:28:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1774344482-BDC9BDB8-359DE2F9/0/0
X-purgate-type: clean
X-purgate-size: 1782

On Sat, Mar 14, 2026 at 03:16:15PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Fri, Mar 13, 2026 at 04:46:56PM +0000, Thierry Escande wrote:
> > This patch series introduces Q35 chipset support for Xen HVM guests. Th=
is is
> > based on the work from Alexey Gerasimenko (See patchset [1] for referen=
ce).
> > 
> > This series does not implement device passthrough as this will need mor=
e work
> > on the Xen side to support multiple PCI buses. Since Q35 chipset does n=
ot
> > support device hotplugging and with current Xen mechanism for device
> > passthrough, they have to be plugged to a new PCIe root port, i.e. not =
the PCI
> > bus 0.
> 
> I always found it weird that Xen does hot-plugging of PCI passthrough
> devices... Wouldn't it be easier to change this (connect them from the
> very start, via QEMU cmdline) and declare hotplug as unsupported (at
> least at this time)? I realize it's more complex change at the toolstack
> side, but overall may simplify things and maybe even improve
> reliability.

Skipping hot-plug on Q35 sounds good to me.

I though we could keep using QMP to do cold plug, with the experimental
"--preconfig", but "device_add" isn't allowed :-(. So yes, doing this
via command line sounds fine.

In libxl, we might be able to transform the json for `device_add` into
the command line counterpart for `-device` fairly easily so the argument
are only generated in a single place. Then we could skip the QMP
"device_add" in libxl when it's already done via command line.

But looks like XCP-ng also does QMP "device_add" for passthrough :-( but
one step-at a time.

Cheers,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



