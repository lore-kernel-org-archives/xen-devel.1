Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E68606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 06:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XxD4lowi
Received: from list by lists.xenproject.org with outflank-mailman.1479549.1683470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQIoE-00083b-Qx; Mon, 09 Nov 2026 06:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479549.1683470; Mon, 09 Nov 2026 06:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQIoE-00083U-OB; Mon, 09 Nov 2026 06:24:50 +0000
Received: by outflank-mailman (input) for mailman id 1479549;
 Mon, 09 Nov 2026 06:24:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lkp@intel.com>) id 1xQIoC-00083O-PA
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 06:24:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQIoB-001Z7k-V0
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 07:24:47 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lkp@intel.com>)
 id 6af16705-e002-0a2a0a5209dd-0a2a4503c11e-44
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 07:24:47 +0100
Received: from [192.198.163.13] (helo=mgamail.intel.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lkp@intel.com>)
 id 6af1672c-fae8-0a2a45030019-c0c6a30dfe0a-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 07:24:46 +0100
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2026 22:24:43 -0800
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 08 Nov 2026 22:24:38 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1xQIny-00000000u1P-2AzQ;
 Mon, 09 Nov 2026 06:24:34 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=Intel header.d=intel.com header.i="@intel.com" header.h="Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794205486; x=1825741486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YSso0Po3Ac6MsrirK9TwldtrkZcqVN03F1SxefX9FxQ=;
  b=XxD4lowi4DyZwwvYPFhrYpqkSWB74nH5+e8X6KouOKCu4XYzwSxdmcpp
   KLyCGN0Z2aU1UvDCIhL5khlrZV+4mG8OjnaGJZvh5Eosx30WB1YE67fbD
   hA5Lv2bjAfaMhq0XsJTYdRYpS/m0U79DIwc/fygSirU5+L6pcNvjPtz36
   sj6PT4FqxFL7OcKHwLphjc9vsG7ooQVd7IWu7aaQ4MVx1LQw4BPX0AYsG
   uQE3CP1dOsJtIhmBeUL7STwhxxKA5HC3QsJVYiUYjO9SGFF9FhAcTSRAk
   +N9hzziCSMXv0sI7ifpJbsz/SkH7/UDpqRi+qhohsyi3/3h7imEve9VDO
   Q==;
X-CSE-ConnectionGUID: IiGCwNNgQjeDbJC5EmaOGA==
X-CSE-MsgGUID: uuZ7M4kXTjSiEbmjOrK7sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2913758"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2913758"
X-CSE-ConnectionGUID: GzK1GYJdQue5f+Pi2BBMaQ==
X-CSE-MsgGUID: iW7KKfENRneZYXWo/Xw9aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7824695"
Date: Mon, 9 Nov 2026 14:24:09 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw2@infradead.org>, kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	xen-devel@lists.xenproject.org, x86@kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Paul Durrant <paul@xen.org>, Vitaly Kuznetsov <vkuznets@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Jack Allister <jalliste@amazon.com>,
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH v12 08/24] KVM: x86: Re-synchronize TSC after
 KVM_SET_TSC_KHZ
Message-ID: <202611091411.tSxUx2Bj-lkp@intel.com>
References: <20261109012112.3415328-9-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109012112.3415328-9-dwmw2@infradead.org>
X-purgate-ID: tlsNG-33051d/1794205487-6D8D54E9-0F72CE6F/0/0
X-purgate-type: clean
X-purgate-size: 1343
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on dea4f6380f4ec96e8f3b0aaf2343764bd0d25ef4]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Woodhouse/KVM-x86-Improve-synchronization-in-kvm_synchronize_tsc/20261108-172047
base:   dea4f6380f4ec96e8f3b0aaf2343764bd0d25ef4
patch link:    https://lore.kernel.org/r/20261109012112.3415328-9-dwmw2%40infradead.org
patch subject: [PATCH v12 08/24] KVM: x86: Re-synchronize TSC after KVM_SET_TSC_KHZ
config: i386-buildonly-randconfig-1005-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091411.tSxUx2Bj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091411.tSxUx2Bj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091411.tSxUx2Bj-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kvm/x86.o: in function `kvm_synchronize_tsc_at':
>> x86.c:(.text+0xfaca): undefined reference to `__udivdi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

