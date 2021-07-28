Return-Path: <SRS0=WCSt=MU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9B9C4338F
	for <xen-devel@archiver.kernel.org>; Wed, 28 Jul 2021 12:19:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF0D860F46
	for <xen-devel@archiver.kernel.org>; Wed, 28 Jul 2021 12:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF0D860F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.161524.296533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8iWh-0004p8-MZ; Wed, 28 Jul 2021 12:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161524.296533; Wed, 28 Jul 2021 12:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8iWh-0004p1-Jd; Wed, 28 Jul 2021 12:19:07 +0000
Received: by outflank-mailman (input) for mailman id 161524;
 Wed, 28 Jul 2021 12:19:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=knVX=MU=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m8iWg-0004ov-U0
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 12:19:07 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00300d43-ef9e-11eb-979b-12813bfff9fa;
 Wed, 28 Jul 2021 12:19:05 +0000 (UTC)
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
X-Inumbo-ID: 00300d43-ef9e-11eb-979b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1627474745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/vDRPclXAYcjJh9cj8K0LIDey8arVHXBOnNNst61jEU=;
  b=aLSlRzBQR/YV0k3UA18Z2dAGQfKBe38/nWhj8xyfn12xOTAloIukLtSK
   +8L2KsX+AosyV2ETIwVH2vuQDEOofcgA+NFYYLJgaE379x+S0gITvJJHM
   StB3RAn3prvVafXQXibpXosq35kkaCNuids+h+b25X7oic5hNEq9gahSZ
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +1BSTEMfOJOh84y3okYcLvjUO7ZiLqed2gpZtIzK1djXYE/glqva69hYvdnjjxzs8N/yKUw2OR
 2zAm1OnyayJX7DPRMG3vFf2zuNRIOIRFqofpgeRe3gRsUPz1UILNmNO/aTROdBSfSfMNBUUYC7
 yP264vibYucyE7qHZHZXTQ3GmHLc+U3gZ/uCFXYn4A5Is9HHZA7a2T7elxNj9ItF+Dxf8wJiKJ
 mZmCIwDf4fWNgPP+FLk2LE/G5HodbIu41303fxLGe8FgSzmLSqc87/7MRsNAMaMdOMLTsUC5la
 uhwXjBgcgNaNQMeB0KT8pQUu
X-SBRS: 5.1
X-MesageID: 49647694
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:sBxFU6hNRWQOzwfM6Rg9xyrZ3XBQXuIji2hC6mlwRA09TySZ//
 rOoB0+726StN93YgBHpTngAtjlfZqyz/JICOUqUotKGTOWwVdAT7sSiLcKoQeQeBEWn9Q1vc
 wLHpSWSueAb2SS5fyKmDVQeOxB/DDoys6Vuds=
X-IronPort-AV: E=Sophos;i="5.84,276,1620705600"; 
   d="scan'208";a="49647694"
Date: Wed, 28 Jul 2021 13:19:00 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>, "Scott
 Davis" <scottwd@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>,
	"Scott Davis" <scott.davis@starlab.io>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@ainfosec.com>, "Juergen
 Gross" <jgross@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P
 . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [XEN PATCH] tools/xl: Add device_model_stubdomain_init_seclabel
 option to xl.cfg
Message-ID: <YQFLND63SJH85Zeo@perard>
References: <8ee22fab0731347dd7f998c5f336eac804785c28.1627014699.git.scott.davis@starlab.io>
 <CAKf6xpvZZCdEbPoetXabX15yL_oMnya0813-nrm6+WagL3Wx3w@mail.gmail.com>
 <YP/5wL2p/CGR5g7D@mail-itl>
 <24832.2790.631888.595948@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24832.2790.631888.595948@mariner.uk.xensource.com>

On Tue, Jul 27, 2021 at 02:32:22PM +0100, Ian Jackson wrote:
> Marek Marczykowski-Górecki writes ("Re: [XEN PATCH] tools/xl: Add device_model_stubdomain_init_seclabel option to xl.cfg"):
> > On Mon, Jul 26, 2021 at 09:07:03AM -0400, Jason Andryuk wrote:
> > > Sort of relatedly, is stubdom unpaused before the guest gets
> > > relabeled?  Quickly looking, I think stubdom is unpaused.  I would
> > > think you want them both relabeled before either is unpaused.  If the
> > > stubdom starts with the exec_label, but it sees the guest with the
> > > init_label, it may get an unexpected denial?  On the other hand,
> > > delayed unpausing of stubdom would slow down booting.
> > 
> > Some parts of the stubdomain setup are done after it's unpaused (but
> > before the guest is unpaused). Especially, PCI devices are hot-plugged
> > only when QEMU is already running (not sure why).
> 
> I think the PCI hotplug involves interaction with QEMU, and providing
> only hotplug simplifies the code in libxl.  Anthony, do I have that
> righgt ?

I think interaction with QEMU is needed to find out the new address of
the PCI device in cases none were asked for. And have a single
implementation in libxl is certainly better.
But even if QEMU is running, I think we can still call it cold-plugged,
when it's done before emulation is supposed to have started.

Cheers,

-- 
Anthony PERARD

