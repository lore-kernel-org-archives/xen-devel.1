Return-Path: <SRS0=FjyW=DQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C78C433E7
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2020 20:28:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B0A22225B
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2020 20:28:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Tq+HRWzm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B0A22225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.5200.13603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQyzd-0003Uj-Bb; Fri, 09 Oct 2020 20:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5200.13603; Fri, 09 Oct 2020 20:27:57 +0000
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
	id 1kQyzd-0003Uc-8J; Fri, 09 Oct 2020 20:27:57 +0000
Received: by outflank-mailman (input) for mailman id 5200;
 Fri, 09 Oct 2020 20:27:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4y9=DQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kQyzc-0003UX-1m
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 20:27:56 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8aeadf5d-0244-4420-92fd-c55589930fe0;
 Fri, 09 Oct 2020 20:27:54 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=n4y9=DQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kQyzc-0003UX-1m
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 20:27:56 +0000
X-Inumbo-ID: 8aeadf5d-0244-4420-92fd-c55589930fe0
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8aeadf5d-0244-4420-92fd-c55589930fe0;
	Fri, 09 Oct 2020 20:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602275275;
  h=subject:to:references:cc:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=SLeBnas35PvecqOOwKJ2Z9gEB76wpLcuw/zkY5tzagg=;
  b=Tq+HRWzmgGGAL8ufd0lQ1QI3aiwZQZYlMz9fNzqnEXE4YRsor5sLOZso
   uQGMBmyYw1BIe+o4epX94WgTLgGj0gW3TOKJoKZu1UAe2iY7dWxA1PCAV
   EO6S1uktdgDQofVse69+CkR2D6KmlB86YpVVxSHpckLkaarP62lCEl+8w
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: sQ0GOikCXaagwywo+Q7GFOnFqXN6P1vQ6AxKP05If4QAzmNnD9mo4lsYfXq6bg5rs6xmztFW4S
 hOUNdLBmJj01k7L4BWmASv2Xl1UzPkAmcot2fmLg7eNwlG2WqwAzFilaIIbZ0c0ERlupiWLBU1
 uw41o0j7UEJJMMMo0W9ky79xcckYCJZDWLZNvF8ibizQrHKaCV+MNVkVPcYesUUqcPPsMdnJWJ
 R2zsRHBueCyd458dlnzqf4dwdajoApZPvIhE/+qJYY5TEYL7OM9avvVVJVINu+9Ihdfk95ySti
 Rhk=
X-SBRS: 2.5
X-MesageID: 28680128
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,355,1596513600"; 
   d="scan'208";a="28680128"
Subject: Re: [xen-unstable-smoke test] 155612: regressions - FAIL
To: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <osstest-155612-mainreport@xen.org>
CC: Trammell Hudson <hudson@trmm.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0d3766f0-a1a4-bc86-9372-79b1b65eae47@citrix.com>
Date: Fri, 9 Oct 2020 21:27:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <osstest-155612-mainreport@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 09/10/2020 21:20, osstest service owner wrote:
> flight 155612 xen-unstable-smoke real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/155612/
>
> Regressions :-(
>
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 155584

From
http://logs.test-lab.xenproject.org/osstest/logs/155612/test-arm64-arm64-xl-xsm/serial-laxton0.log

Oct  9 18:45:20.790611
Xen 4.15-unstable (c/s Fri Oct 2 12:30:34 2020 +0200 git:8a62dee9ce) EFI
loader
Oct  9 18:45:20.934506 Using configuration file 'xen.cfg'
Oct  9 18:45:20.934558 vmlinuz: 0x00000083fb1e2000-0x00000083fc8b6a00
Oct  9 18:45:20.946436 initrd.gz: 0x00000083f94ef000-0x00000083fb1e1c5a
Oct  9 18:45:21.618435 xenpolicy: 0x00000083f94ec000-0x00000083f94eea0a
Oct  9 18:45:21.774473 Oct  9 18:51:08.218564 <client 0x1b7f430
connected - now 1 clients>
Oct  9 18:51:08.976537 <client 0x1b7f430 disconnected - now 0 clients>

Looks like arm64 is crashing fairly early on boot.

This is probably caused by "efi: Enable booting unified
hypervisor/kernel/initrd images".

~Andrew

