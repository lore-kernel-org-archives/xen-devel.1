Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF30EEE3686
	for <xen-devel@archiver.kernel.org>; Thu, 12 Feb 2026 14:05:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1229033.1535069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXJI-0002tv-8O; Thu, 12 Feb 2026 14:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229033.1535069; Thu, 12 Feb 2026 14:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXJI-0002to-5k; Thu, 12 Feb 2026 14:04:48 +0000
Received: by outflank-mailman (input) for mailman id 1229033;
 Thu, 12 Feb 2026 14:04:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ry7C=AQ=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1vqXJG-0002sv-DN
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 14:04:46 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c70d5595-081b-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 15:04:43 +0100 (CET)
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 06:04:40 -0800
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123)
 ([10.211.93.152])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2026 06:04:37 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vqXJ4-000000001Kr-2rHR;
 Thu, 12 Feb 2026 14:04:34 +0000
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
X-Inumbo-ID: c70d5595-081b-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770905084; x=1802441084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hC83cy9I+QvOHq44fYtXM6qMN9P2fhKYqhqqNyaPhiw=;
  b=Lie3jEI5jY4FJqeqtEdunHEoQc+iZq2K5A7IN6gDD/n8sg2XSjOs/4Px
   oI1Li9P1cRaNV7cgiQeaq8YWE+I4k7LS6iMdas4DmjTFF+wmVa+9C8KDU
   A/7Uj6rPDK6U2Wvx6rNOY5hzqHaD8rhsAyVcJ3bjKCX0ZgTlx5UnjkONy
   40Wqs0TWYoDRj7f89sWlPcRJpEexp0g/63oo7g+/QgxujDqOEmAOC2w8X
   LTLX1iQGg4m4I5fw1hqC/w4xx3YZ7yDXH4W1oREdiDCVLoPzRDIgS8gPv
   2ED05nmk5r2z8uvwd7pIBkz2rff0A/jZtB2aKT04tb/In5ixdQCCenoHY
   w==;
X-CSE-ConnectionGUID: hjFT8ebsSdyv09SIaZiwHQ==
X-CSE-MsgGUID: K/ALXR6JT62AoEObuW8rDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="83443606"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="83443606"
X-CSE-ConnectionGUID: TUgDl26jTP25Gm4vGa+Q2g==
X-CSE-MsgGUID: TXT8PHAFRqu/SXTEK+WepQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="216763664"
Date: Thu, 12 Feb 2026 15:04:02 +0100
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-scsi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	xen-devel@lists.xenproject.org,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 1/2] xenbus: add xenbus_device parameter to
 xenbus_read_driver_state()
Message-ID: <202602121525.xsMivuEv-lkp@intel.com>
References: <20260212083826.136221-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212083826.136221-2-jgross@suse.com>

Hi Juergen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on xen-tip/linux-next]
[also build test WARNING on linus/master v6.19 next-20260211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Juergen-Gross/xenbus-add-xenbus_device-parameter-to-xenbus_read_driver_state/20260212-164134
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
patch link:    https://lore.kernel.org/r/20260212083826.136221-2-jgross%40suse.com
patch subject: [PATCH 1/2] xenbus: add xenbus_device parameter to xenbus_read_driver_state()
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260212/202602121525.xsMivuEv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602121525.xsMivuEv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602121525.xsMivuEv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/xen/xenbus/xenbus_client.c:940 function parameter 'dev' not described in 'xenbus_read_driver_state'
>> Warning: drivers/xen/xenbus/xenbus_client.c:940 function parameter 'dev' not described in 'xenbus_read_driver_state'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

