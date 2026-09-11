Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFE5C88E4C
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 09:38:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416128.1645288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xi1-000572-Fi; Fri, 11 Sep 2026 09:38:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416128.1645288; Fri, 11 Sep 2026 09:38:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xi1-00056v-Cd; Fri, 11 Sep 2026 09:38:13 +0000
Received: by outflank-mailman (input) for mailman id 1416128;
 Fri, 11 Sep 2026 09:38:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ilpo.jarvinen@linux.intel.com>) id 1x4xhz-00055X-OM
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:38:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4xhy-003ILw-U0
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:38:11 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ilpo.jarvinen@linux.intel.com>)
 id 6aa3cbf3-bab6-0a2a0a5309dd-0a2a450ce094-22
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:38:10 +0200
Received: from [192.198.163.7] (helo=mgamail.intel.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ilpo.jarvinen@linux.intel.com>)
 id 6aa3cbff-f479-0a2a450c0019-c0c6a307d6be-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:38:09 +0200
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 02:38:07 -0700
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.158])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 02:37:41 -0700
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=Intel header.d=intel.com header.i="@intel.com" header.h="From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789119489; x=1820655489;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=sb6ClNqSQhPq2ZVhuU+8klKUwkLjODKU96QOOaqi6Cw=;
  b=mvxroAT2UdWsWymjT43kAFl+kcFJugc5ykv7CvwyU6H+owZ7NYMnq9fl
   IJ/UDjLY72XtqMNj0GZ5qLKzxUzSLWWkdt9VxGjN0t+HxLlQQBDHYR8tH
   C/+bG8avMN6uzfOGDHfVvSgxbimL21m70Rg2LI61HK+RPwYstjrxtZpUw
   rQ6w3d+dZLbjMneIsPN91xWVVfCHQXzg/0T4wkoGfTtY45sY3UA1Rjb8S
   QhoxF8c9+gEF5/1ve1PuxbgqcmsM+x7F5EB6/CWAG9blBKcMUcZyXW1Cy
   D98QyqSsXdW2s6lHJels1uKhWKK/hOJmwh1QVLmJijlCChfXKke1sXmBE
   g==;
X-CSE-ConnectionGUID: OzlVyZaDRpyUmf82PIcUWQ==
X-CSE-MsgGUID: ubs3gCeGRUaLcoqt0KoTIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="115120611"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="115120611"
X-CSE-ConnectionGUID: SRo+o97pTgCUDHnSfx1bsQ==
X-CSE-MsgGUID: d5IlSxrWQfGb/hpk+vV9Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="296857533"
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 11 Sep 2026 12:37:38 +0300 (EEST)
To: Juergen Gross <jgross@suse.com>
cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, 
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
    Dave Hansen <dave.hansen@linux.intel.com>, 
    "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
    Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
    Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
    Adrian Hunter <adrian.hunter@intel.com>, 
    James Clark <james.clark@linaro.org>, 
    "K. Y. Srinivasan" <kys@microsoft.com>, 
    Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
    Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
    Sean Christopherson <seanjc@google.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
    Alexey Makhalov <alexey.makhalov@broadcom.com>, 
    Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
    Josh Poimboeuf <jpoimboe@kernel.org>, 
    Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Pu Wen <puwen@hygon.cn>, 
    Tony Luck <tony.luck@intel.com>, 
    Reinette Chatre <reinette.chatre@intel.com>, 
    Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, 
    Babu Moger <babu.moger@amd.com>, Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>, 
    Vitaly Kuznetsov <vkuznets@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
    Bjorn Helgaas <bhelgaas@google.com>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, 
    Kiryl Shutsemau <kas@kernel.org>, 
    Rick Edgecombe <rick.p.edgecombe@intel.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, Len Brown <lenb@kernel.org>, 
    Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
    David Airlie <airlied@redhat.com>, Olivia Mackall <olivia@selenic.com>, 
    Herbert Xu <herbert@gondor.apana.org.au>, 
    Viresh Kumar <viresh.kumar@linaro.org>, Huang Rui <ray.huang@amd.com>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Perry Yuan <perry.yuan@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
    Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
    Yazen Ghannam <yazen.ghannam@amd.com>, Linus Walleij <linusw@kernel.org>, 
    Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
    Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, 
    Artem Bityutskiy <dedekind1@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Miquel Raynal <miquel.raynal@bootlin.com>, 
    Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
    Ashok Raj <ashok.raj.linux@gmail.com>, Hans de Goede <hansg@kernel.org>, 
    Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
    Xi Pardee <xi.pardee@linux.intel.com>, 
    Daniel Lezcano <daniel.lezcano@kernel.org>, 
    Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
    Helge Deller <deller@gmx.de>, xen-devel@lists.xenproject.org, 
    linux-geode@lists.infradead.org, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v3 12/13] treewide: convert rdmsrq() from a macro to an
 inline function
In-Reply-To: <20260911074530.3140830-13-jgross@suse.com>
Message-ID: <b2baa471-0f6b-84e8-bda1-ae0964b72b04@linux.intel.com>
References: <20260911074530.3140830-1-jgross@suse.com> <20260911074530.3140830-13-jgross@suse.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1162080221-1789119116=:1171"
Content-ID: <b9134b99-a885-4c62-2abd-7195415a52e3@linux.intel.com>
X-purgate-ID: tlsNG-d25034/1789119490-03CD3A5B-0F405256/0/0
X-purgate-type: clean
X-purgate-size: 1201

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1162080221-1789119116=:1171
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <085b47bf-864b-9802-2915-a51186e45c40@linux.intel.com>

On Fri, 11 Sep 2026, Juergen Gross wrote:

> Today rdmsrq() is a macro using its second parameter as the target for
> storing the read MSR value.
>=20
> Convert rdmsrq() to an inline function returning the MSR value.
>=20
> The users have been converted using the following semantic patch:
>=20
>   // Options: --include-headers
>=20
>   virtual patch
>   virtual report
>=20
>   @@
>   expression msr, val;
>   @@
>   (
>   - rdmsrq(msr,val)
>   + val =3D rdmsrq(msr)
>   )
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Damien Le Moal <dlemoal@kernel.org>      # ATA

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>=09=09# pdx86

What is the plan for merging this?

> Reviewed-by: Michael Kelley <mhklinux@outlook.com> # Hyper-V

--=20
 i.
--8323328-1162080221-1789119116=:1171--

