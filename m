Return-Path: <SRS0=iN5S=NA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C905C4338F
	for <xen-devel@archiver.kernel.org>; Mon,  9 Aug 2021 13:20:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B1C661004
	for <xen-devel@archiver.kernel.org>; Mon,  9 Aug 2021 13:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B1C661004
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.164990.301489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD5CP-0003q4-99; Mon, 09 Aug 2021 13:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164990.301489; Mon, 09 Aug 2021 13:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD5CP-0003px-4n; Mon, 09 Aug 2021 13:20:13 +0000
Received: by outflank-mailman (input) for mailman id 164990;
 Mon, 09 Aug 2021 13:20:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gMyi=NA=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mD5CN-0003pr-Ch
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 13:20:11 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 854df58c-f914-11eb-9f16-12813bfff9fa;
 Mon, 09 Aug 2021 13:20:10 +0000 (UTC)
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
X-Inumbo-ID: 854df58c-f914-11eb-9f16-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628515209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EnGkYAHHTZYD9DJKFvAOUTPA+FQ7X5db2HGiMlp7bz8=;
  b=beez14gdUKvHsh4Ia28IOECRqmT2Z7jXgrksN17ZbDyjNhDo/OFKpszZ
   QMsmIMDcbiMhXsk7iEmh2e+ZFzXFsndrWLhOv10dPH+b6iZv8AE5kNQYO
   oHRrdc9BPVVut7Rt+xUGp+GQctV3dSeU2e/S/cYo5AvcruP58x7Fqk3B1
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 74OwcdoaWmRszUlHdhLVQVkl7GtlDvdq2fdabEH3uMjisbt/7iladjTFNQ9C9xYcbNmfi4p+HO
 Cy2XK4KB2hwBIkR7WcW0JsUSEZ4wQ1TKQi55jG7BggX1U5qYKMkX4I6auIHasfA/1Y6O+XXkCU
 bZEGO0aDOH/nQkA+zJDfVoNyHFsf0calnyr/Yzsx3a7XGxdilNI83xmdx0smm7AuND9LrIxCRB
 a6YJlSBtmU62+LjByxmIiG+cMXAXM2d8S6k58lueBRSUu1L4fQIpEESJ6wLSAJVn3HjjgHxzuN
 rN9oBeep8bmNL+sCfIHpKNuT
X-SBRS: 5.1
X-MesageID: 50059635
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:aTuEi6xHfnrrPqhV8KPzKrPwLL1zdoMgy1knxilNoRw8SKKlfu
 SV7ZAmPH7P+VMssR4b9OxoVJPtfZqYz+8T3WBzB8bBYOCFgguVxehZhOOIqQEIWReOldK1vZ
 0QFZSWY+eQMbEVt6nH3DU=
X-IronPort-AV: E=Sophos;i="5.84,307,1620705600"; 
   d="scan'208";a="50059635"
Date: Mon, 9 Aug 2021 14:20:03 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
	<aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Paul
 Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v6 18/31] xen: move include/asm-* to
 include/arch-*/asm
Message-ID: <YRErg7bcpSOYucfd@perard>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-19-anthony.perard@citrix.com>
 <58a894a9-dc64-6a4d-7468-acb509892777@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <58a894a9-dc64-6a4d-7468-acb509892777@suse.com>

On Thu, Aug 05, 2021 at 09:04:18AM +0200, Jan Beulich wrote:
> On 01.07.2021 16:09, Anthony PERARD wrote:
> > This avoid the need to create the symbolic link "include/asm".
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> > 
> > Other possible locations that I could think of:
> > include/arch/*/asm
> > arch/*/include/asm
> 
> I thought it was always the plan to follow Linux (and kind of XTF) in
> this regard, using the latter of these options?

I'm not sure what the plan was, but putting the arch specific headers
in arch/ sound good. I'll rework the patch.

> > --- a/xen/include/xen/bitmap.h
> > +++ b/xen/include/xen/bitmap.h
> > @@ -14,7 +14,7 @@
> >   *
> >   * Function implementations generic to all architectures are in
> >   * lib/bitmap.c.  Functions implementations that are architecture
> > - * specific are in various include/asm-<arch>/bitops.h headers
> > + * specific are in various include/arch-<arch>/asm/bitops.h headers
> 
> Then, just to take this as an example, referring to just asm/bitops.h
> in comments might be enough (limiting churn on some of the ones that
> you're altering)?

Sound good.

Thanks,

-- 
Anthony PERARD

