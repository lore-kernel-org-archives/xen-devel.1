Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918FCC88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 13:23:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416743.1645675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51DM-00026v-Ei; Fri, 11 Sep 2026 13:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416743.1645675; Fri, 11 Sep 2026 13:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51DM-00026o-B9; Fri, 11 Sep 2026 13:22:48 +0000
Received: by outflank-mailman (input) for mailman id 1416743;
 Fri, 11 Sep 2026 13:22:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3ogCkagYKCY8Bxt62vz77z4x.v75Gx6-wxEx441BCB.Gx68A72xvC.7Az@flex--seanjc.bounces.google.com>)
 id 1x51DL-00025w-5q
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 13:22:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x51DK-008ZRa-9y
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 15:22:46 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3ogCkagYKCY8Bxt62vz77z4x.v75Gx6-wxEx441BCB.Gx68A72xvC.7Az@flex--seanjc.bounces.google.com>)
 id 6aa40094-e002-0a2a0a5209dd-0a2a450ca064-30
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:22:46 +0200
Received: from [209.85.216.70] (helo=mail-pj1-f70.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3ogCkagYKCY8Bxt62vz77z4x.v75Gx6-wxEx441BCB.Gx68A72xvC.7Az@flex--seanjc.bounces.google.com>)
 id 6aa400a4-f479-0a2a450c0019-d155d846d47d-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:22:46 +0200
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-38e1118e4abso1633857a91.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 06:22:45 -0700 (PDT)
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
        d=google.com; s=20251104; t=1789132964; x=1789737764; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqAHaS5fsv9ERkHKe2Kmet0fUHotC014bD2kFqqX4to=;
        b=iaxNMNRDD5bh9fDi5Uj/mNg2fbsPfDeMZeStblTuD8C1v6ZLiRbLxFjgU7CSvFenx9
         JOJZhS/KBIcUEfkWZU3MxQAEhXmhnXyIZMpzHR45IyL2em/UYeymlT1nUQ0skMzgPOo3
         6Cu8KohKxnNe9ZvNAbbfAS0VpyGTuPDM/iiyFjvaDFzH7CfUQ5YnD/xRV2ji14Rpkmh6
         c6rrJHhqtyqcGfNGS4drxBqKX+Mw/YHcg74AMV2tskzg096zwMP6Vdw9jWYELKyG3Gtl
         BPiO/Y7dM1LTM6551sv8mlFDK5+6sqEsod3IRt43f9qMgjMyIaJEa9suGN8Nef8/9XMz
         1VJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132964; x=1789737764;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kqAHaS5fsv9ERkHKe2Kmet0fUHotC014bD2kFqqX4to=;
        b=lwytOvJLMSWed/rkJthS4tiGVATfUSdsN37ux3yNDeckbji8suFCNBhlPEhw106OCm
         1/pkDbWCNAZANiFXdUApRjsDYP1lIDOBk1pobgm0CGcIu16n5pEtIOx/TpBeDByvOyfk
         y7+fb7TtCiG/RVxvNDXG7lu8QG6I9y6N3ZlWQp25+hGAWvhfMBoKnKp8+G7+bcqtE0bl
         NqjKlNocZwPrfJpc6HjPfkYSTq7yuS7tDys57++qjVCUKDW57Rqzx2wmxNhpQGUgAtde
         Phxs+wZ5ZySjgmgpIzVtDYDn+Q0tBnK1D6VX7cWwhXQvmma0Zs0o+nzpTMzURVudbH2H
         tp6Q==
X-Forwarded-Encrypted: i=1; AKwUvBw6iBy0Rq3TIlsxEv3D5aNO45i5AtMAxpzhFgfHA1FQLzKIadctkKUBNoAN90VdYVnuERcWx34VjiI=@lists.xenproject.org
X-Gm-Message-State: AFuF++nnbOHU/MY7/cZJXZDPzx5PDog9PFmbBjg16NfVDYV/FLUVgb4I
	W4O3xgWx+wDpG0Vyo+i0cQg/7DlzoHlo+VWuwQUl7ycIlQodxakosmY/EtdKEWokhZLujpuOzTg
	ABk3UbA==
X-Received: from pjbmv13.prod.google.com ([2002:a17:90b:198d:b0:39d:8dae:7e6d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c89:b0:398:e46e:ade3
 with SMTP id 98e67ed59e1d1-39d9c39625dmr7169956a91.23.1789132962606; Fri, 11
 Sep 2026 06:22:42 -0700 (PDT)
Date: Fri, 11 Sep 2026 06:22:41 -0700
In-Reply-To: <20260911074530.3140830-13-jgross@suse.com>
Mime-Version: 1.0
References: <20260911074530.3140830-1-jgross@suse.com> <20260911074530.3140830-13-jgross@suse.com>
Message-ID: <aqQAodJCAEZyeQ1k@google.com>
Subject: Re: [PATCH v3 12/13] treewide: convert rdmsrq() from a macro to an
 inline function
From: Sean Christopherson <seanjc@google.com>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-edac@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-ide@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-crypto@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Pu Wen <puwen@hygon.cn>, Tony Luck <tony.luck@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Dave Martin <Dave.Martin@arm.com>, 
	James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>, 
	Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Len Brown <lenb@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	David Airlie <airlied@redhat.com>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Huang Rui <ray.huang@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Perry Yuan <perry.yuan@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Yazen Ghannam <yazen.ghannam@amd.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Artem Bityutskiy <dedekind1@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Ashok Raj <ashok.raj.linux@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, 
	"Ilpo =?utf-8?B?SsOkcnZpbmVu?=" <ilpo.jarvinen@linux.intel.com>, 
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, Xi Pardee <xi.pardee@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Helge Deller <deller@gmx.de>, xen-devel@lists.xenproject.org, 
	linux-geode@lists.infradead.org, Michael Kelley <mhklinux@outlook.com>
Content-Type: text/plain; charset="us-ascii"
X-purgate-ID: tlsNG-d25034/1789132966-02EDAA5B-95EB941E/0/0
X-purgate-type: clean
X-purgate-size: 721

On Fri, Sep 11, 2026, Juergen Gross wrote:
> Today rdmsrq() is a macro using its second parameter as the target for
> storing the read MSR value.
> 
> Convert rdmsrq() to an inline function returning the MSR value.
> 
> The users have been converted using the following semantic patch:
> 
>   // Options: --include-headers
> 
>   virtual patch
>   virtual report
> 
>   @@
>   expression msr, val;
>   @@
>   (
>   - rdmsrq(msr,val)
>   + val = rdmsrq(msr)
>   )
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Damien Le Moal <dlemoal@kernel.org>      # ATA
> Reviewed-by: Michael Kelley <mhklinux@outlook.com> # Hyper-V
> ---

Acked-by: Sean Christopherson <seanjc@google.com>

