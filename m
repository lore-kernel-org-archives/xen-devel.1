Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C696C5B572
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 15:34:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395627.1633957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwiIY-0007Qf-NM; Wed, 19 Aug 2026 15:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395627.1633957; Wed, 19 Aug 2026 15:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwiIY-0007QY-JN; Wed, 19 Aug 2026 15:33:50 +0000
Received: by outflank-mailman (input) for mailman id 1395627;
 Wed, 19 Aug 2026 15:33:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <32syFagYKCeUZLHUQJNVVNSL.JVTeLU-KLcLSSPZaZ.eLUWYVQLJa.VYN@flex--seanjc.bounces.google.com>)
 id 1wwiIX-0007QS-Rp
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 15:33:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwiIX-0037Ib-8u
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 17:33:49 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <32syFagYKCeUZLHUQJNVVNSL.JVTeLU-KLcLSSPZaZ.eLUWYVQLJa.VYN@flex--seanjc.bounces.google.com>)
 id 6a85ccd9-8faa-0a2a0a5109dd-0a2a4506b77c-8
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:33:49 +0200
Received: from [209.85.210.197] (helo=mail-pf1-f197.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <32syFagYKCeUZLHUQJNVVNSL.JVTeLU-KLcLSSPZaZ.eLUWYVQLJa.VYN@flex--seanjc.bounces.google.com>)
 id 6a85ccdb-195a-0a2a45060019-d155d2c5a884-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:33:49 +0200
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-84c4cd31b51so15826b3a.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:33:48 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787153627; x=1787758427; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2FvzDQHxVaueg4hvKJpjDuB27Njlxwegg3SIxYd2Fg=;
        b=UXFZaNX5rOqMYok4fpR3qSSJw6eZWTnbNxi1TUxrOSS42cM0yCiaVyBBCIyKhOaF++
         3mipzWrRqBm6wY+7nHdoHP79oV5zf7TYrw3JGcveS9a1UVzalbuDzRSrasKMGJs6+QyE
         ljT0ceGZUJkFjsUWBq+cUqkvCz4esBDZPukH6h1JTPaY6e4eXFaIQCXZzbpoV9/d5W30
         JIwLo+5qK8WF//9h8Fhp0C4lI/5++qAT2vgOD5rpTjJz5dcCS1okPQou3mqEJ00YYAEe
         9zSAy6U8iVc6656vMtylFdVRVq2j+LqBjrWzKTvU9iB1DIZN0tlDhxU2XgRkL95ZIT1a
         zgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153627; x=1787758427;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2FvzDQHxVaueg4hvKJpjDuB27Njlxwegg3SIxYd2Fg=;
        b=SR4kJX4uXIeZgbfSCtsZebyzJH9uazrTbB1M8CdMczSzZMI6jSLrCT3MiZhIQeUgYS
         LNBUUM6wbNMJYk21elaon/XNqYcb52E1ErpjkQf+E4/JiKdq2JzAyWZ7yBB0YSyZAY+Z
         u/4FtfJKvO5keWb3rALt0PlveET5rAOdSPS0V3pNArNwOsOgVdHSPf3aniKCHm3tpqoc
         7294fM7uFf7Arwfhc3UNwVj4RnSm6hHpwTLbaLNrafYL6xLYktMgtz2f0t6G0L9W509H
         eYnt/oaqG8oAbI/NzEFunMDazDiA5kQLT0YSeGduSYJCUogs7cYlI7vOoUir+Sf2dJab
         U5jw==
X-Forwarded-Encrypted: i=1; AHgh+RqTZQhBuLP4yt1aQClzKwp5lmxxXXtSUDp803Yj05gqNTqUeJoxSwquNkZejE7eF9C6OjQvFN2LIz8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBK3SrJYS4rmPpC6sdj1pFMySskLQvJHStInemgoQP+wHX2JSD
	K5TnAdgKA6WZ7L5hXSZgMDvzhvDtmwk6UUe+1fmfeRvMIcf5S+a3pFqaq1iUC8HmhwKMqIaF1Ur
	fFA6CBg==
X-Received: from pfoo3.prod.google.com ([2002:a05:6a00:1a03:b0:84f:df8f:5a90])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2913:b0:84b:9a69:156d
 with SMTP id d2e1a72fcca58-851df6dc419mr109732b3a.0.1787153626373; Wed, 19
 Aug 2026 08:33:46 -0700 (PDT)
Date: Wed, 19 Aug 2026 08:33:45 -0700
In-Reply-To: <bd9e5b6e-07f2-459d-bca6-e290585060aa@intel.com>
Mime-Version: 1.0
References: <20260819102314.1499258-1-jgross@suse.com> <bd9e5b6e-07f2-459d-bca6-e290585060aa@intel.com>
Message-ID: <aoXM2f1YTwgVj8KL@google.com>
Subject: Re: [PATCH v2 00/13] x86/msr: Drop 32-bit MSR interfaces
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	virtualization@lists.linux.dev, linux-ide@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	kvm@vger.kernel.org, linux-edac@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, David Airlie <airlied@redhat.com>, Helge Deller <deller@gmx.de>, 
	linux-geode@lists.infradead.org, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Pu Wen <puwen@hygon.cn>, 
	Tony Luck <tony.luck@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, 
	Babu Moger <babu.moger@amd.com>, Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Len Brown <lenb@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Huang Rui <ray.huang@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Perry Yuan <perry.yuan@amd.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Yazen Ghannam <yazen.ghannam@amd.com>, 
	Guenter Roeck <linux@roeck-us.net>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, 
	Artem Bityutskiy <dedekind1@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Ashok Raj <ashok.raj.linux@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, 
	"Ilpo =?utf-8?B?SsOkcnZpbmVu?=" <ilpo.jarvinen@linux.intel.com>, 
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, David E Box <david.e.box@intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="us-ascii"
X-purgate-ID: tlsNG-16d1c6/1787153629-F687577B-967E702C/0/0
X-purgate-type: clean
X-purgate-size: 1172

On Wed, Aug 19, 2026, Dave Hansen wrote:
> Hey Juergen,
> 
> These look great. Thanks for doing it!
> 
> The only wonky thing is how we're going to actually merge it. We
> obviously can't do patches 10-11 until all the "stop using" patches have
> been applied.
> 
> I obviously 100% realize that it's during the merge window, but any acks
> that the maintainers of 5-9 provide in the next few weeks would be super
> helpful. Or, if any of those maintainers want to cherry pick their
> subsystem's stuff out of this series and apply it, that would be great too.
> 
> But, the last time we did some MSR function munging, the tip tree
> carried most of the patches. I would expect we'll have a repeat of that
> here too. I'll pencil in the idea of just merging the lot around -rc1 time.

Note, patch 12 "treewide: convert rdmsrq() from a macro to an inline function"
is going to conflict with the KVM changes for 7.3; kvm_access_xstate_msr() is
getting moved from x86.c to msrs.c.  Somewhat surprisingly, AFAICT that's the
only conflict with KVM's code movement, so it's probably not strictly required
to send a new version after the KVM pull request?

