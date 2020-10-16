Return-Path: <SRS0=yWKO=DX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786EAC433DF
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2020 15:38:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 075BA207DE
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2020 15:38:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="b5zCO3NE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 075BA207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.8157.21690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTRoH-0002Pw-GC; Fri, 16 Oct 2020 15:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8157.21690; Fri, 16 Oct 2020 15:38:25 +0000
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
	id 1kTRoH-0002Pp-D7; Fri, 16 Oct 2020 15:38:25 +0000
Received: by outflank-mailman (input) for mailman id 8157;
 Fri, 16 Oct 2020 15:38:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Q1u=DX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kTRoF-0002Pk-Sr
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 15:38:23 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a2555b3-db8a-48b2-b0e0-87655f23cf88;
 Fri, 16 Oct 2020 15:38:22 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0Q1u=DX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
	id 1kTRoF-0002Pk-Sr
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 15:38:23 +0000
X-Inumbo-ID: 4a2555b3-db8a-48b2-b0e0-87655f23cf88
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4a2555b3-db8a-48b2-b0e0-87655f23cf88;
	Fri, 16 Oct 2020 15:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602862702;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GTzravAnKnhxtLl9cPws+qnSmaTjDzSL5lAd3eS6BKo=;
  b=b5zCO3NE3cdRooURtbwwQHAAZ+dP9hs6t0q9aq2wbU0l50KGYN884n5S
   2uIAX86wjKjz5OilWgqkzv7e/OilMMCi0E9XapeftdPQ1rLrQgFOWgz3Y
   HzvxvQ3xbloyZ4eOWvOc8alza7T5yFuy8GmPlJD1k0mswh4LE0NWtq4Dj
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: wJ9MoMoAAlTEMN9xPetJhVcvwbURac+r3BOVHRnAPedrzcUqgyb1jssTnjrUu6GK62x4PdbINj
 5EkJ1MdR+QNdXDlnktt9DCpCCFO1yMyU/d79tkj51YWVd8ImatYQpYeGQZHZxcupfXpnhPi3bN
 1Ju1GtFm/kDuy2OauF4TfmZIFfQcVwdYN6NnYqKpC+FbE+AchvGFJjEtJYhp/myYg2NPZEjem5
 iEwxAP1SVZL9UhVha+35TvNBxJRhHgf0NcsYp3Qxj81adyCT+PuXTtPDcuOBBKwPYZenAP65tt
 6/o=
X-SBRS: 2.5
X-MesageID: 29429829
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,383,1596513600"; 
   d="scan'208";a="29429829"
Date: Fri, 16 Oct 2020 16:37:08 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <qemu-devel@nongnu.org>, <dgilbert@redhat.com>,
	<xen-devel@lists.xenproject.org>, <paul@xen.org>, <sstabellini@kernel.org>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, Eduardo Habkost
	<ehabkost@redhat.com>
Subject: Re: [PATCH] hw/xen: Set suppress-vmdesc for Xen machines
Message-ID: <20201016153708.GB3105841@perard.uk.xensource.com>
References: <20201013190506.3325-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201013190506.3325-1-jandryuk@gmail.com>

On Tue, Oct 13, 2020 at 03:05:06PM -0400, Jason Andryuk wrote:
> xen-save-devices-state doesn't currently generate a vmdesc, so restore
> always triggers "Expected vmdescription section, but got 0".  This is
> not a problem when restore comes from a file.  However, when QEMU runs
> in a linux stubdom and comes over a console, EOF is not received.  This
> causes a delay restoring - though it does restore.
> 
> Setting suppress-vmdesc skips looking for the vmdesc during restore and
> avoids the wait.

suppress-vmdesc is only used during restore, right? So starting a guest
without it, saving the guest and restoring the guest with
suppress-vmdesc=on added will work as intended? (I'm checking that migration
across update of QEMU will work.)

Thanks,

-- 
Anthony PERARD

