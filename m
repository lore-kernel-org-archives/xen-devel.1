Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D9BCD5BAB
	for <xen-devel@archiver.kernel.org>; Thu, 21 May 2026 22:30:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1316041.1585633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQBuP-0002PD-6I; Thu, 21 May 2026 22:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316041.1585633; Thu, 21 May 2026 22:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQBuP-0002P6-3a; Thu, 21 May 2026 22:30:29 +0000
Received: by outflank-mailman (input) for mailman id 1316041;
 Thu, 21 May 2026 22:30:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3gIcPagYKCSUTFBOKDHPPHMF.DPNYFO-EFWFMMJTUT.YFOQSPKFDU.PSH@flex--seanjc.bounces.google.com>)
 id 1wQBuN-0002P0-JN
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 22:30:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQBuM-00F99U-Vp
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 00:30:26 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3gIcPagYKCSUTFBOKDHPPHMF.DPNYFO-EFWFMMJTUT.YFOQSPKFDU.PSH@flex--seanjc.bounces.google.com>)
 id 6a0f873f-5cb7-0a2a0a5109dd-0a2a4505c0b0-40
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 00:30:26 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3gIcPagYKCSUTFBOKDHPPHMF.DPNYFO-EFWFMMJTUT.YFOQSPKFDU.PSH@flex--seanjc.bounces.google.com>)
 id 6a0f8781-aaa8-0a2a45050019-d155d6cae50c-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 00:30:26 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2b4530a90fdso118295965ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 15:30:26 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779402625; x=1780007425; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+mwj630vVwEqi8mq4SZZW5tTSWOGwfC/65sZINb+5IQ=;
        b=BugGeCbwc+RKATirmzIrYnpstZ69HJ9H8pkOesTVfk2+vVU1cBd9tJcWoM4j51COeg
         4B9NwSMmOXjzgDMCqv06miwr2U8SyqLr3OUxtNn30nVtzm+2x2wKOVx4J1fTwj5yY2bq
         lN2F6GJznHU0t/KQAzVl9e6v7T/306IOyn5BQkXwaY1INHG5paG13xOcNwwZ0H1zxlKN
         22C0TTmgf8WHlcbkataxC4Fzp8Ypp0w0wLCJepd4x/htQAYWlBMewyE12O/t+EQj/hGi
         w7hxJJxLjCQv25wUjcKTvblfuPn+hz+Zu9W12PTt0SFBArlmxn/+Kix7DQ1MHs0v9YXp
         2Z2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779402625; x=1780007425;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+mwj630vVwEqi8mq4SZZW5tTSWOGwfC/65sZINb+5IQ=;
        b=c75FrKh4MIES1Y5wD9NPRYByXnff+RiaoW0/UaLBLDAH5oDwymUNnjiDzCQmvebQ93
         WjscJE1ZQdb4CU8s6ElVU1rGbFy0zV/QeYnUUThiEYENBgFhBGS4B1EWdZ6PkeD6U6bZ
         bPtzWFDZZjfAH+BbC9p/WJWR19BRM695euR+zjQjssTC5F6CrTRJcfZp/UDNF+IQo/pE
         Zqnao66NDN5bgSJJwSlb7JCIm8PFJiFdPDIM2YijfReiSImSWR6BLBX8FFFK/DlBn0s+
         B4bj8LsEkAh8mQwqvj7WdzGJUaomf5r7jbI4LGeo4jPLCZSj8l5v/eKUhVIpQSOvLV/T
         LKeg==
X-Forwarded-Encrypted: i=1; AFNElJ9AxtuhF0RIvV2fJa5NascMlrbnRV8tQg6XJmOrn2rGNJLJonFZUxYljRvhCLg2d4BQVcwrEeZyIAI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBL1mdjBOWv2aDAfPDdHq0Oph+SYwcVktdMTbphT6+uUQF+06p
	SFrirht/PDVbGDkqOErIT59D0WiWbxfUFUjyHJYBvN16Uk7V/b9K7CS5M6a1T8a9TyCd+nlkklf
	F8Yxgkg==
X-Received: from pgbfl15.prod.google.com ([2002:a05:6a02:50cf:b0:c80:1541:9dfc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:430e:b0:3a3:a55f:407c
 with SMTP id adf61e73a8af0-3b328cad3aemr900407637.16.1779402624505; Thu, 21
 May 2026 15:30:24 -0700 (PDT)
Date: Thu, 21 May 2026 15:30:23 -0700
In-Reply-To: <3ad6cd109480772ade3c11f23b9c1d7a9855d67e.camel@infradead.org>
Mime-Version: 1.0
References: <20260509224824.3264567-1-dwmw2@infradead.org> <20260509224824.3264567-28-dwmw2@infradead.org>
 <3ad6cd109480772ade3c11f23b9c1d7a9855d67e.camel@infradead.org>
Message-ID: <ag-Hf2liLSX9q0rS@google.com>
Subject: Re: [PATCH v4 27/30] KVM: x86: Add KVM_VCPU_TSC_EFFECTIVE_FREQ attribute
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-purgate-ID: tlsNG-c201ff/1779402626-D3961443-0CC7ED7C/0/0
X-purgate-type: clean
X-purgate-size: 511

On Thu, May 21, 2026, David Woodhouse wrote:
> On Sat, 2026-05-09 at 23:46 +0100, David Woodhouse wrote:
> > From: David Woodhouse <dwmw@amazon.co.uk>
> That does leave userspace still needing a way to get the APIC bus
> frequency, to populate CPUID. So maybe I'll just make an attribute
> which returns that as a single value.

Already exists, KVM_CAP_X86_APIC_BUS_CYCLES_NS.  The TDX architecture decided
that unconditionally telling guests the virtual APIC bus runs at 400Mhz was a
brilliant idea.

