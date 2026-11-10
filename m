Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B30606A321
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 05:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b2s74qPM
Received: from list by lists.xenproject.org with outflank-mailman.1480642.1684406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQeIn-00084n-1e; Tue, 10 Nov 2026 05:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480642.1684406; Tue, 10 Nov 2026 05:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQeIm-00084f-Ut; Tue, 10 Nov 2026 05:21:48 +0000
Received: by outflank-mailman (input) for mailman id 1480642;
 Tue, 10 Nov 2026 05:21:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lkp@intel.com>) id 1xQeIk-00084Z-Sp
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 05:21:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQeIj-00DD0c-QF
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 06:21:45 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lkp@intel.com>)
 id 6af2a9dc-bab6-0a2a0a5309dd-0a2a450c92b0-16
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 06:21:44 +0100
Received: from [198.175.65.19] (helo=mgamail.intel.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lkp@intel.com>)
 id 6af2a9e5-f479-0a2a450c0019-c6af41132484-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 06:21:43 +0100
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 21:21:41 -0800
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 09 Nov 2026 21:21:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1xQeIV-00000000w43-0oq1;
 Tue, 10 Nov 2026 05:21:31 +0000
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
  t=1794288104; x=1825824104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oFY/jbHuyFVs9fcim3O79B+sKqlAAqnVh+aV2N/0ovY=;
  b=b2s74qPMoeBpD+nQMYjvsGy5sWMU4Fi5GQ/ikHgK1UNjQ1HeiBY1Uapi
   satBCna3LsR6D2lFrr5Ju4jWUNiO08uOOT8lgcns71s/jUbm+iiDSAsVZ
   I0rS5jCek3/aDFFaia5aK1QXRvVSAoQVQrN0hs87+YCONsTtk7DCd3+Jn
   c6lMD8k0z5d78Z3PrDoIOGr3OQ9ou8GayZN+X4NjRmo9AuLMLcpZbfJ1R
   BW08tcH172mCExJVS+rBUNmLTassZWrIZEnw7SvpDKdIm3EEIlBQeSUqo
   yYwpVYPX/rL2kQuMf+fskIw+tOfGYeDGQ3zApN1ftLQnxzTpUbgNDQsO7
   Q==;
X-CSE-ConnectionGUID: /M/8/Wd0QJ+npj6S75PeDA==
X-CSE-MsgGUID: LWsCiiXkRtuNRsBSK9f3sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3062302"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3062302"
X-CSE-ConnectionGUID: RKv6GKLrRXekh8Hyw1NSow==
X-CSE-MsgGUID: B2DoDwPBT2ynDzLgYC0JmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8233683"
Date: Tue, 10 Nov 2026 13:21:04 +0800
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
Message-ID: <202611101323.6WZgh2FM-lkp@intel.com>
References: <20261109012112.3415328-9-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109012112.3415328-9-dwmw2@infradead.org>
X-purgate-ID: tlsNG-d25034/1794288104-51339A5B-EE62E0FC/0/0
X-purgate-type: clean
X-purgate-size: 1290
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20261110/202611101323.6WZgh2FM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611101323.6WZgh2FM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611101323.6WZgh2FM-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: arch/x86/kvm/kvm.ko: symbol '__udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

