Return-Path: <SRS0=d7tj=7P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99AFC433E0
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 09:39:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C493020679
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 09:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C493020679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg3Ny-0006wX-V3; Tue, 02 Jun 2020 09:39:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jg3Nx-0006wQ-VM
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 09:39:05 +0000
X-Inumbo-ID: e457061e-a4b4-11ea-abb5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e457061e-a4b4-11ea-abb5-12813bfff9fa;
 Tue, 02 Jun 2020 09:39:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 15303B019;
 Tue,  2 Jun 2020 09:39:02 +0000 (UTC)
Subject: Re: [PATCH v19 for-4.14 00/13] VM forking
To: paul@xen.org
References: <cover.1591017086.git.tamas.lengyel@intel.com>
 <000c01d63826$6d125900$47370b00$@xen.org>
 <4017F2B3-BB9B-4E9F-813C-6FE68BA0D568@citrix.com>
 <CABfawh=YHA9Lxbto5Qgf_wkSFAR+JxCdWB99iAhCmBgwSwvmVg@mail.gmail.com>
 <002401d638b0$a5460f80$efd22e80$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d3df7cbf-843a-9253-292c-b6bb48ff9c94@suse.com>
Date: Tue, 2 Jun 2020 11:38:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <002401d638b0$a5460f80$efd22e80$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: 'Julien Grall' <julien@xen.org>, 'Kevin Tian' <kevin.tian@intel.com>,
 'Tamas K Lengyel' <tamas@tklengyel.com>,
 'Tamas K Lengyel' <tamas.lengyel@intel.com>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <Andrew.Cooper3@citrix.com>,
 'George Dunlap' <George.Dunlap@citrix.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Jun Nakajima' <jun.nakajima@intel.com>,
 'Ian Jackson' <Ian.Jackson@citrix.com>,
 'Anthony Perard' <anthony.perard@citrix.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>,
 'Roger Pau Monne' <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.06.2020 09:37, Paul Durrant wrote:
> Maintainers/committers, can we please get those patches in a.s.a.p.?

The sole reason I didn't put in at least the 1st patch on Friday
(perhaps also the 2nd, as it is suitably ack-ed) was that it's
still missing a VMX maintainer ack, and Kevin had provided
comments on v2 of the smaller (2-patch) series.

Jan

