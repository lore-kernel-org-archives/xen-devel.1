Return-Path: <SRS0=Rr0c=E4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830ACC5519F
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2020 18:23:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E4BE20757
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2020 18:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E4BE20757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.33432.64459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgu1R-0002zr-CR; Sun, 22 Nov 2020 18:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33432.64459; Sun, 22 Nov 2020 18:23:37 +0000
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
	id 1kgu1R-0002zk-82; Sun, 22 Nov 2020 18:23:37 +0000
Received: by outflank-mailman (input) for mailman id 33432;
 Sun, 22 Nov 2020 18:23:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D2VG=E4=perches.com=joe@srs-us1.protection.inumbo.net>)
 id 1kgu1P-0002zb-DI
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 18:23:35 +0000
Received: from smtprelay.hostedemail.com (unknown [216.40.44.203])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f86001f0-9152-4ccb-993e-ce1e8c3a136e;
 Sun, 22 Nov 2020 18:23:34 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 524371802912B;
 Sun, 22 Nov 2020 18:23:34 +0000 (UTC)
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf14.hostedemail.com (Postfix) with ESMTPA;
 Sun, 22 Nov 2020 18:23:29 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=D2VG=E4=perches.com=joe@srs-us1.protection.inumbo.net>)
	id 1kgu1P-0002zb-DI
	for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 18:23:35 +0000
X-Inumbo-ID: f86001f0-9152-4ccb-993e-ce1e8c3a136e
Received: from smtprelay.hostedemail.com (unknown [216.40.44.203])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f86001f0-9152-4ccb-993e-ce1e8c3a136e;
	Sun, 22 Nov 2020 18:23:34 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay05.hostedemail.com (Postfix) with ESMTP id 524371802912B;
	Sun, 22 Nov 2020 18:23:34 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: match16_380b6892735e
X-Filterd-Recvd-Size: 3051
Received: from XPS-9350.home (unknown [47.151.128.180])
	(Authenticated sender: joe@perches.com)
	by omf14.hostedemail.com (Postfix) with ESMTPA;
	Sun, 22 Nov 2020 18:23:29 +0000 (UTC)
Message-ID: <dec07021e7fc11a02b14c98b713ae2c6e2a4ca00.camel@perches.com>
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
From: Joe Perches <joe@perches.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Tom Rix
	 <trix@redhat.com>, Matthew Wilcox <willy@infradead.org>
Cc: clang-built-linux@googlegroups.com, linux-hyperv@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
 tboot-devel@lists.sourceforge.net, kvm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-acpi@vger.kernel.org, devel@acpica.org,
  amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-media@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com, 
 linux-scsi@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, ecryptfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com, 
 linux-mtd@lists.infradead.org, keyrings@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
 alsa-devel@alsa-project.org, bpf@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-nfs@vger.kernel.org, 
 patches@opensource.cirrus.com
Date: Sun, 22 Nov 2020 10:23:28 -0800
In-Reply-To: <751803306cd957d0e7ef6a4fc3dbf12ebceaba92.camel@HansenPartnership.com>
References: <20201121165058.1644182-1-trix@redhat.com>
	 <20201122032304.GE4327@casper.infradead.org>
	 <ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>
	 <20201122145635.GG4327@casper.infradead.org>
	 <0819ce06-c462-d4df-d3d9-14931dc5aefc@redhat.com>
	 <751803306cd957d0e7ef6a4fc3dbf12ebceaba92.camel@HansenPartnership.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2020-11-22 at 08:49 -0800, James Bottomley wrote:
> We can enforce sysfs_emit going forwards
> using tools like checkpatch

It's not really possible for checkpatch to find or warn about
sysfs uses of sprintf. checkpatch is really just a trivial
line-by-line parser and it has no concept of code intent.

It just can't warn on every use of the sprintf family.
There are just too many perfectly valid uses.

> but there's no benefit and a lot of harm to
> be done by trying to churn the entire tree

Single uses of sprintf for sysfs is not really any problem.

But likely there are still several possible overrun sprintf/snprintf
paths in sysfs.  Some of them are very obscure and unlikely to be
found by a robot as the logic for sysfs buf uses can be fairly twisty.

But provably correct conversions IMO _should_ be done and IMO churn
considerations should generally have less importance.




