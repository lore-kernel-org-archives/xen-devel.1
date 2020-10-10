Return-Path: <SRS0=K75F=DR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD64C433DF
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2020 11:42:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A994E2224A
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2020 11:42:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=trmm.net header.i=@trmm.net header.b="XkSLE3DK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A994E2224A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trmm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.5400.14097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRDGn-00082d-2g; Sat, 10 Oct 2020 11:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5400.14097; Sat, 10 Oct 2020 11:42:37 +0000
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
	id 1kRDGm-00082W-W6; Sat, 10 Oct 2020 11:42:36 +0000
Received: by outflank-mailman (input) for mailman id 5400;
 Sat, 10 Oct 2020 11:42:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p5/m=DR=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kRDGl-00082R-Mk
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 11:42:35 +0000
Received: from mail-40133.protonmail.ch (unknown [185.70.40.133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 675bc7dd-ddc9-4f7d-b986-a4d50f077b4b;
 Sat, 10 Oct 2020 11:42:32 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=p5/m=DR=trmm.net=hudson@srs-us1.protection.inumbo.net>)
	id 1kRDGl-00082R-Mk
	for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 11:42:35 +0000
X-Inumbo-ID: 675bc7dd-ddc9-4f7d-b986-a4d50f077b4b
Received: from mail-40133.protonmail.ch (unknown [185.70.40.133])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 675bc7dd-ddc9-4f7d-b986-a4d50f077b4b;
	Sat, 10 Oct 2020 11:42:32 +0000 (UTC)
Date: Sat, 10 Oct 2020 11:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
	s=protonmail; t=1602330151;
	bh=WWQ4gUUJ6h8klFU4fMdnE0RbkA80QkHki4E1xrHzezg=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=XkSLE3DKU0dRRp49F4z9cCgqeT5MUdHcvSduicf37nVgLGWfm2H3sUHcKOSF5ys0D
	 q498rU/yOxv4R6K+mxvAt5/lEnKlZj6QRw2FuiuA1QCr/OnWxbRLYoCBKK/+dAkZH3
	 Td4uG9O67o6ZIvGCf19SJa/5tvll+6KsCzoEIhrA=
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Reply-To: Trammell Hudson <hudson@trmm.net>
Subject: Re: [xen-unstable-smoke test] 155612: regressions - FAIL
Message-ID: <l13ej-jSgj1tw6_awkBjUgauf1oh4k3PIQavoWsHdhhiH0qLc1hI4x0lK1Sx4S6DseYE2JQ4w1uFwuEgF325BDawQcpOe5sDX95C3MyqXlQ=@trmm.net>
In-Reply-To: <0d3766f0-a1a4-bc86-9372-79b1b65eae47@citrix.com>
References: <osstest-155612-mainreport@xen.org> <0d3766f0-a1a4-bc86-9372-79b1b65eae47@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, October 9, 2020 10:27 PM, Andrew Cooper <andrew.cooper3@citrix.c=
om> wrote:
> [...]
> Looks like arm64 is crashing fairly early on boot.
>
> This is probably caused by "efi: Enable booting unified
> hypervisor/kernel/initrd images".

Darn it.  I'm working out how to build and boot qemu aarch64 so
that I can figure out what is going on.

Also, I'm not sure that it is possible to build a unified arm
image right now; objcopy (and all of the obj* tools) say
"File format not recognized" on the xen.efi file.  The MZ file
is not what they are expecting for ARM executables.

--
Trammell


