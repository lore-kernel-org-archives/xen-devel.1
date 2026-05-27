Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74187CD4F54
	for <xen-devel@archiver.kernel.org>; Wed, 27 May 2026 22:50:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1320806.1587958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSN5J-0002K9-F7; Wed, 27 May 2026 22:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320806.1587958; Wed, 27 May 2026 22:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSN5J-0002K2-Bs; Wed, 27 May 2026 22:50:45 +0000
Received: by outflank-mailman (input) for mailman id 1320806;
 Wed, 27 May 2026 22:50:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wei.liu@kernel.org>) id 1wSN5H-0002Jc-98
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 22:50:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSN5G-0003XJ-Lh
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 00:50:42 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <wei.liu@kernel.org>)
 id 6a17750c-5cb7-0a2a0a5109dd-0a2a450ba522-36
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 00:50:42 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <wei.liu@kernel.org>)
 id 6a177541-212f-0a2a450b0019-ac6904feb280-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 00:50:42 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D7CE9605C1;
 Wed, 27 May 2026 22:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C7B1F000E9;
 Wed, 27 May 2026 22:50:40 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779922240;
	bh=9ySTpxezoAiBFX0/7zEUiI4eNm+Oaylf4HMVPn8Ys+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fhw7S3jJcbuIlgSOp29WFGHzJGB8ddxj21QfNQC7Kt+/DuNhL3vzkfrKDOK2vHXpU
	 9u3VGq1FBhaFxNhXtDsHCGmQxkVUA9Ohv3lMJq9Az76x2nDOwUB6XMvehUlh9tTFoC
	 EGh04Ya+JrGSncmzc441tVrPR6j2TzwyfIIw08LxXSPeFPEe6h/434pSvOdwDDpKsf
	 7oDoNQaqM5EhSla92HypgPbcuB4wUC2Nf3obbHOjWriw5lRJevLfjOdPHN4Upktnyr
	 vdvGgOrWVDC3Yq5FtR1nZ8EZ9nncfapF6wZnVzmeAn8Aci91MUqjjSrAfcng/qGtOj
	 ZNfnnt/SxyJXg==
Date: Wed, 27 May 2026 15:50:38 -0700
From: Wei Liu <wei.liu@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stephen Boyd <sboyd@kernel.org>, x86@kernel.org,
	linux-coco@lists.linux.dev, kvm@vger.kernel.org,
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Michael Kelley <mhklinux@outlook.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH v3 09/41] clocksource: hyper-v: Don't save/restore TSC
 offset when using HV sched_clock
Message-ID: <20260527225038.GG3518940@liuwe-devbox-debian-v2.local>
References: <20260515191942.1892718-1-seanjc@google.com>
 <20260515191942.1892718-10-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515191942.1892718-10-seanjc@google.com>
X-purgate-ID: tlsNG-42698a/1779922242-12573F3B-B5741393/0/0
X-purgate-type: clean
X-purgate-size: 953

On Fri, May 15, 2026 at 12:19:10PM -0700, Sean Christopherson wrote:
> Now that Hyper-V overrides the sched_clock save/restore hooks if and only
> sched_clock itself is set to the Hyper-V reference counter, drop the
> invocation of the "old" save/restore callbacks.  When the registration of
> the PV sched_clock was done separately from overriding the save/restore
> hooks, it was possible for Hyper-V to clobber the TSC save/restore
> callbacks without actually switching to the Hyper-V refcounter.
> 
> Enabling a PV sched_clock is a one-way street, i.e. the kernel will never
> revert to using TSC for sched_clock, and so there is no need to invoke the
> TSC save/restore hooks (and if there was, it belongs in common PV code).
> 
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Acked-by: Wei Liu <wei.liu@kernel.org>

