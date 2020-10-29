Return-Path: <SRS0=SN9p=EE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CE5C2D0A3
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2020 09:52:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 727672076D
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2020 09:52:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vMd1WTw4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 727672076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.14089.35053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY4ar-0001Ys-Ss; Thu, 29 Oct 2020 09:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14089.35053; Thu, 29 Oct 2020 09:51:41 +0000
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
	id 1kY4ar-0001Yl-Pv; Thu, 29 Oct 2020 09:51:41 +0000
Received: by outflank-mailman (input) for mailman id 14089;
 Thu, 29 Oct 2020 09:51:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vaed=EE=kernel.org=arnd@srs-us1.protection.inumbo.net>)
 id 1kY4aq-0001Yg-4v
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 09:51:40 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d10c9f9c-25f2-4fef-8023-716e105234c2;
 Thu, 29 Oct 2020 09:51:39 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72FA121655
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 09:51:38 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id t20so1069902qvv.8
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 02:51:38 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vaed=EE=kernel.org=arnd@srs-us1.protection.inumbo.net>)
	id 1kY4aq-0001Yg-4v
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 09:51:40 +0000
X-Inumbo-ID: d10c9f9c-25f2-4fef-8023-716e105234c2
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d10c9f9c-25f2-4fef-8023-716e105234c2;
	Thu, 29 Oct 2020 09:51:39 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 72FA121655
	for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 09:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603965098;
	bh=9kcfotFFJ47rYdLC6ZxzdCDBa1k7PeFD878Gh2iRMYw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vMd1WTw46NmbdjDfGERZXE49CkIxTu62Lo98SE3sftOXo2ak1wjE9ZykA5QSCJ4f6
	 RDyWIZLY0FUMnquHbcpT2wuFgnwMWGJcElPYN/dCVDOBDKjwtw6POjOBjpvi7Bxxzs
	 IPD7rWkW0qA5Zp3lwpn5CoP9SOsl9SQ1SBIW0R2s=
Received: by mail-qv1-f45.google.com with SMTP id t20so1069902qvv.8
        for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 02:51:38 -0700 (PDT)
X-Gm-Message-State: AOAM5339D4LE5ypYI3aIYXXGK8fbutN+VYoeeu9JSR4XLBJ5JNULwXxo
	NlH496EvW4+JgvF4X+7cFvR8ImnDMS7e3jSVljQ=
X-Google-Smtp-Source: ABdhPJxaZEntygitIVQOXS85Gb8nGw1osAMMJulsU6ZeD1uTGkc5sotJk4c97dNCIKL6ORL8v2BjlIfOh3rRL6d2/zw=
X-Received: by 2002:ad4:4203:: with SMTP id k3mr2986180qvp.8.1603965097361;
 Thu, 29 Oct 2020 02:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201028212417.3715575-1-arnd@kernel.org> <ea34f1d3-ed54-a2de-79d9-5cc8decc0ab3@redhat.com>
In-Reply-To: <ea34f1d3-ed54-a2de-79d9-5cc8decc0ab3@redhat.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 29 Oct 2020 10:51:21 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0e0YAkh_9S1ZG5FW3QozZnp1CwXUfWx9VHWkY=h+FVxw@mail.gmail.com>
Message-ID: <CAK8P3a0e0YAkh_9S1ZG5FW3QozZnp1CwXUfWx9VHWkY=h+FVxw@mail.gmail.com>
Subject: Re: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"the arch/x86 maintainers" <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, linux-hyperv@vger.kernel.org, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kvm list <kvm@vger.kernel.org>, 
	Platform Driver <platform-driver-x86@vger.kernel.org>, 
	xen-devel <xen-devel@lists.xenproject.org>, 
	"open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 29, 2020 at 8:04 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 28/10/20 22:20, Arnd Bergmann wrote:
> > Avoid this by renaming the global 'apic' variable to the more descriptive
> > 'x86_system_apic'. It was originally called 'genapic', but both that
> > and the current 'apic' seem to be a little overly generic for a global
> > variable.
>
> The 'apic' affects only the current CPU, so one of 'x86_local_apic',
> 'x86_lapic' or 'x86_apic' is probably preferrable.

Ok, I'll change it to x86_local_apic then, unless someone else has
a preference between them.

> I don't have huge objections to renaming 'apic' variables and arguments
> in KVM to 'lapic'.  I do agree with Sean however that it's going to
> break again very soon.

I think ideally there would be no global variable, withall accesses
encapsulated in function calls, possibly using static_call() optimizations
if any of them are performance critical.

It doesn't seem hard to do, but I'd rather leave that change to
an x86 person ;-)

      Arnd

