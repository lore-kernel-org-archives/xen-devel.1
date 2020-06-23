Return-Path: <SRS0=syuX=AE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31925C433DF
	for <xen-devel@archiver.kernel.org>; Tue, 23 Jun 2020 17:33:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08072206EB
	for <xen-devel@archiver.kernel.org>; Tue, 23 Jun 2020 17:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08072206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnmmq-0001p4-Et; Tue, 23 Jun 2020 17:32:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ClC/=AE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jnmmp-0001oz-9b
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 17:32:43 +0000
X-Inumbo-ID: 8a53e80d-b577-11ea-bfc5-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a53e80d-b577-11ea-bfc5-12813bfff9fa;
 Tue, 23 Jun 2020 17:32:42 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: KMqMGmiijij0OIAJMqHUOsU3FlHQIXg/ANNSXcGBJplcIpnAyFM/ThPUrvIn/X9HhLqGp0JN9Y
 z5IaRkDA0ScHIYV3UB7bqCyGdvtaKTYVsXCS1303S1xMBXkb8sQfS1ynl5y5Kmz2sHK2XMfSb+
 AnTFue4mt52suyr7H665iBGC/Z2j95FfmFdcMiEiVgvblQ7li+Icc7/v98LyRnGmRpZX2MQC8f
 3jdFRgo37F6FpoAHWocp8HeYcyNIVjhgQKofLhAzPcr5JZ1gyal27HCmbp7s3piRdlX5iFF2WM
 ivQ=
X-SBRS: 2.7
X-MesageID: 21051973
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,272,1589256000"; d="scan'208";a="21051973"
Date: Tue, 23 Jun 2020 19:32:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14] mm: fix public declaration of struct
 xen_mem_acquire_resource
Message-ID: <20200623173150.GV735@Air-de-Roger>
References: <20200623135246.66170-1-roger.pau@citrix.com>
 <044c278b-e0df-e389-b21a-66c7307997c4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <044c278b-e0df-e389-b21a-66c7307997c4@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 23, 2020 at 05:04:53PM +0200, Jan Beulich wrote:
> On 23.06.2020 15:52, Roger Pau Monne wrote:
> > XENMEM_acquire_resource and it's related structure is currently inside
> > a __XEN__ or __XEN_TOOLS__ guarded section to limit it's scope to the
> > hypervisor or the toolstack only. This is wrong as the hypercall is
> > already being used by the Linux kernel at least, and as such needs to
> > be public.
> 
> Actually - how does this work for the Linux kernel, seeing
> 
>     rc = rcu_lock_remote_domain_by_id(xmar.domid, &d);
>     if ( rc )
>         return rc;
> 
>     rc = xsm_domain_resource_map(XSM_DM_PRIV, d);
>     if ( rc )
>         goto out;
> 
> in the function?

It's my understanding (I haven't tried to use that hypercall yet on
FreeBSD, so I cannot say I've tested it), that xmar.domid is the
remote domain, which the functions locks and then uses
xsm_domain_resource_map to check whether the current domain has
permissions to do privileged operations against it.

Roger.

