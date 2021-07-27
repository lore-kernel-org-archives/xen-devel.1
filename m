Return-Path: <SRS0=Zr9Q=MT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F41C4338F
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 13:32:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4765261A61
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 13:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4765261A61
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.161196.295983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8NC9-0000QY-Sb; Tue, 27 Jul 2021 13:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161196.295983; Tue, 27 Jul 2021 13:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8NC9-0000QR-PB; Tue, 27 Jul 2021 13:32:29 +0000
Received: by outflank-mailman (input) for mailman id 161196;
 Tue, 27 Jul 2021 13:32:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8NC8-0000QI-V2
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:32:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8NC8-0006AY-U6
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:32:28 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8NC8-00089e-TL
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:32:28 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m8NC2-0002aT-QL; Tue, 27 Jul 2021 14:32:22 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=cppFNk2BUE2neqstmGDRc9YL8VWaW+My8IMxMb/EIJc=; b=DmEFxi97EwT3f9C39JK7CnD3Dd
	kneEPuwiQ0DFnhZNZjbp8fWdmuAZGiT9QZeSDpz0s4QX8DWKPO+vqAGl3SzHGGs/pBKIYtAhwKFLf
	WiMAQ5sAgptuUjJOpeduWuZyafJpVmURKnvQA+Tvl7wbSjItCxpmIdBBxYCNmwWvjuVA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24832.2790.631888.595948@mariner.uk.xensource.com>
Date: Tue, 27 Jul 2021 14:32:22 +0100
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
    Scott Davis <scottwd@gmail.com>,
    xen-devel <xen-devel@lists.xenproject.org>,
    Scott Davis <scott.davis@starlab.io>,
    Wei Liu <wl@xen.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Nick Rosbrook <rosbrookn@ainfosec.com>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Daniel De Graaf <dgdegra@tycho.nsa.gov>,
    "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [XEN PATCH] tools/xl: Add device_model_stubdomain_init_seclabel
 option to xl.cfg
In-Reply-To: <YP/5wL2p/CGR5g7D@mail-itl>
References: <8ee22fab0731347dd7f998c5f336eac804785c28.1627014699.git.scott.davis@starlab.io>
	<CAKf6xpvZZCdEbPoetXabX15yL_oMnya0813-nrm6+WagL3Wx3w@mail.gmail.com>
	<YP/5wL2p/CGR5g7D@mail-itl>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Marek Marczykowski-Górecki writes ("Re: [XEN PATCH] tools/xl: Add device_model_stubdomain_init_seclabel option to xl.cfg"):
> On Mon, Jul 26, 2021 at 09:07:03AM -0400, Jason Andryuk wrote:
> > Sort of relatedly, is stubdom unpaused before the guest gets
> > relabeled?  Quickly looking, I think stubdom is unpaused.  I would
> > think you want them both relabeled before either is unpaused.  If the
> > stubdom starts with the exec_label, but it sees the guest with the
> > init_label, it may get an unexpected denial?  On the other hand,
> > delayed unpausing of stubdom would slow down booting.
> 
> Some parts of the stubdomain setup are done after it's unpaused (but
> before the guest is unpaused). Especially, PCI devices are hot-plugged
> only when QEMU is already running (not sure why).

I think the PCI hotplug involves interaction with QEMU, and providing
only hotplug simplifies the code in libxl.  Anthony, do I have that
righgt ?

Naively, it seems to me that the security risks are limited because
until the guest is unpaused it doesn't have the ability to do
anything, so cannot yet mount an attack on qemu.  So I'm expecting
that qemu is still trustworthy until the guest is unpaused.

Ian.

