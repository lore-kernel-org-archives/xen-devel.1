Return-Path: <SRS0=Fsqj=DS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8AB7C433DF
	for <xen-devel@archiver.kernel.org>; Sun, 11 Oct 2020 00:06:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8176621734
	for <xen-devel@archiver.kernel.org>; Sun, 11 Oct 2020 00:06:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="XTKkB6CJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8176621734
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.5557.14457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kROsP-0006JU-0f; Sun, 11 Oct 2020 00:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5557.14457; Sun, 11 Oct 2020 00:06:12 +0000
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
	id 1kROsO-0006JN-Tv; Sun, 11 Oct 2020 00:06:12 +0000
Received: by outflank-mailman (input) for mailman id 5557;
 Sun, 11 Oct 2020 00:06:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCit=DS=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kROsO-0006JH-0h
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 00:06:12 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b936d2fe-b81f-4f13-a6e1-196cba0676c6;
 Sun, 11 Oct 2020 00:06:08 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CCit=DS=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
	id 1kROsO-0006JH-0h
	for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 00:06:12 +0000
X-Inumbo-ID: b936d2fe-b81f-4f13-a6e1-196cba0676c6
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b936d2fe-b81f-4f13-a6e1-196cba0676c6;
	Sun, 11 Oct 2020 00:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602374768;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=dYEOxio7772ItDxMpmD0lMpQJAns+yid55pYiW2kXek=;
  b=XTKkB6CJweiVl68AH2GNJT3iWtmSgkKB26Tky6FPxHPMywP1tmoNQw8L
   /9m82ELWbh9xf8YsVNz/r0J2/Bye9CBECxWjLIQq48rCKdoHMHZgch4Z4
   Sq7cK+IeSJdrlq4Zs6/fgcH/PNqKw1xcPmSFy5p1V7LXexz0AI5nboeX7
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Nz4t/PtSFcIHSjBW/V4VqUzm5V0GhfM6O7tyxrtRBLuMOk6Pa+DCVrf2yg0wcHIsUKnPepaciK
 jQOf5ljCm+OmuorSxL2rgibYTd3HdYkfXy5kIl7TMHmfjSJsvZRH95/A/7/3cN+BfVDVFY4BwO
 zyn8w9JyUyH8qcWvEFqF0kYclH1tvV/+W9V1GTjd5Vit0ke9fQg9N5nQnDAIQa1rE8dqaiZSJH
 yR3mzJhSGmN9n5MamXGH895Om5WQS8mdv1SPZFe7zsSQEIE+Re7iBZYYE5T/iWsSZGnM6SH93F
 Xcg=
X-SBRS: 2.5
X-MesageID: 28810665
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,360,1596513600"; 
   d="scan'208";a="28810665"
Subject: Re: [SUSPECTED SPAM]Xen-unstable :can't boot HVM guests, bisected to
 commit: "hvmloader: indicate ACPI tables with "ACPI data" type in e820"
To: Sander Eikelenboom <linux@eikelenboom.it>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>
References: <9293a9e1-e507-4788-5460-d5ec9abc1af9@eikelenboom.it>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <bbc026b0-06f1-a052-030d-d6757dda89b9@citrix.com>
Date: Sun, 11 Oct 2020 01:06:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9293a9e1-e507-4788-5460-d5ec9abc1af9@eikelenboom.it>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/10/2020 18:51, Sander Eikelenboom wrote:
> Hi Igor/Jan,
> 
> I tried to update my AMD machine to current xen-unstable, but
> unfortunately the HVM guests don't boot after that. The guest keeps
> using CPU-cycles but I don't get to a command prompt (or any output at
> all). PVH guests run fine.
> 
> Bisection leads to commit:
> 
> 8efa46516c5f4cf185c8df179812c185d3c27eb6
> hvmloader: indicate ACPI tables with "ACPI data" type in e820
> 
> I tried xen-unstable with this commit reverted and with that everything
> works fine.
> 
> I attached the xl-dmesg output.

What guests are you using? Could you get serial output from the guest?
Is it AMD specific? If it's a Linux guest could you get a stacktrace from
the guest using xenctx?

We have tested the change on all modern guests in our Citrix lab and haven't
found any problem for several months. 

Igor

