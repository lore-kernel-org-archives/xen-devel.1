Return-Path: <SRS0=k7LG=6U=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F14C28CBC
	for <xen-devel@archiver.kernel.org>; Wed,  6 May 2020 13:18:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B38C206D5
	for <xen-devel@archiver.kernel.org>; Wed,  6 May 2020 13:18:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/JEN4E+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B38C206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWJvk-0001bI-Tc; Wed, 06 May 2020 13:17:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TX5G=6U=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jWJvj-0001bB-M9
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 13:17:43 +0000
X-Inumbo-ID: f79d6246-8f9b-11ea-b9cf-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f79d6246-8f9b-11ea-b9cf-bc764e2007e4;
 Wed, 06 May 2020 13:17:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h4so2554070wmb.4
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2020 06:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZEu/pshMue4rFNKdoEFdM6+ctXD8/pMrLXmSDPxBu6g=;
 b=N/JEN4E+HvkH+/iP5iqSrY5e9xDPIKI+1cmVeOz2Y1EplP3Bq+aRMAECEDIQSnD4t4
 Gj3v0VpIcvo5TBGvI9bbbchE0hMIkRjSKixz+pXR/JucnWsHiuafDhmL3JuyqLm5QWaQ
 hm4C/Hbsvq0q8gpjmIlokRw7KRFSgMfaFHqLs3t/GA+TAtgaaJAafUu4BKWPV9b3bhdY
 a8nwqNV8XPI7B6gTT8+XnBb4GyP4BzaXKTS34tei1kdMcxDJ91/cx5nnIcIeetkyQcrn
 G4wsihVTNwaSjS70dMwQS1m/yC4Q8cOAMzPIUCJdLA+EtZsSpAkHRCDvkIg/nM3kySRa
 8B0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZEu/pshMue4rFNKdoEFdM6+ctXD8/pMrLXmSDPxBu6g=;
 b=H6b8wEE3I9+usDu2W42rvOUYrPrEHY9Dyp0hqre8Uf0c9hKorTxyxpSmOoxx1C0/0E
 PsTvOkVgDdhjTBfAncda1Q3RNbUPddZ9EwqoGEMnj+OfkLKmPrbMvv8E1TczAH0SAxvW
 4kkofOmeIgbBdQProPoeinOQm5mZxJbuyjewMPvEkclE57QwKkvYtFyxjRWMZYr50fjd
 C+p8ep157VxwvoyzWtB94f0le/MaAZJuA3GYsldYoEBrKmVQ+FYpqchZdHQjGESqFB+8
 vSdftSQIc4tqxhe8UJW06LxFXqzYenGgvAbjSbC1zJhpkZP97eF3cOfhbNvgF1Ay08d/
 FSGw==
X-Gm-Message-State: AGi0PuZ/4ddD/15nHPnzgOa0cGWyF4C5QYt1OJnkptsa4uWfSIQWIlE3
 aHEQu9NkyEBLCHBTZHR/Q+VBlWq7O07ab+Nxav8=
X-Google-Smtp-Source: APiQypKziUFUYHjMPtxC9bIUrcMnbZwPOYTGATFUJ6tldHw86ldUZCMbQ68TyIjyDkuRbfBLf4cu3LTEWUBh4kTOqGs=
X-Received: by 2002:a1c:2ed3:: with SMTP id u202mr1872390wmu.77.1588771061198; 
 Wed, 06 May 2020 06:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <70ea4889e30ed35760329331ddfeb279fcd80786.1587655725.git.tamas.lengyel@intel.com>
 <e416eac0c986fd1aba5f576d9b065a6f47660b2c.1587655725.git.tamas.lengyel@intel.com>
 <CABfawhnxoQbehu-bvT7Uhd808rsjjDsB87O=CKqHDsrBUvur-g@mail.gmail.com>
 <20200506130037.mklkimsaetmzqu6h@debian>
In-Reply-To: <20200506130037.mklkimsaetmzqu6h@debian>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 6 May 2020 07:17:05 -0600
Message-ID: <CABfawhniFVz05fc1TWwvjOL2nfM9JcMB3AbXeX7GsJojMLToyg@mail.gmail.com>
Subject: Re: [PATCH v17 2/2] xen/tools: VM forking toolstack side
To: Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 6, 2020 at 7:00 AM Wei Liu <wl@xen.org> wrote:
>
> On Fri, May 01, 2020 at 07:59:45AM -0600, Tamas K Lengyel wrote:
> > On Thu, Apr 23, 2020 at 9:33 AM Tamas K Lengyel <tamas.lengyel@intel.com> wrote:
> > >
> > > Add necessary bits to implement "xl fork-vm" commands. The command allows the
> > > user to specify how to launch the device model allowing for a late-launch model
> > > in which the user can execute the fork without the device model and decide to
> > > only later launch it.
> > >
> > > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> >
> > Patch ping. If nothing else at least the libxc parts would be nice to
> > get merged before the freeze.
>
> Changes to libxc looks good to me.
>
> Please split it out to a patch with proper commit message.
>

Sounds good, will do.

Thanks,
Tamas

