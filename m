Return-Path: <SRS0=xk2l=5Y=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE24C2D0EA
	for <xen-devel@archiver.kernel.org>; Wed,  8 Apr 2020 11:36:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F95720747
	for <xen-devel@archiver.kernel.org>; Wed,  8 Apr 2020 11:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F95720747
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM908-00050S-L0; Wed, 08 Apr 2020 11:36:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N8iV=5Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jM907-00050M-P5
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 11:36:11 +0000
X-Inumbo-ID: 251ba0b8-798d-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 251ba0b8-798d-11ea-b4f4-bc764e2007e4;
 Wed, 08 Apr 2020 11:36:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 59F2BAF48;
 Wed,  8 Apr 2020 11:36:09 +0000 (UTC)
Subject: Re: [XEN PATCH v4 05/18] xen/build: use new $(c_flags) and $(a_flags)
 instead of $(CFLAGS)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-6-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e096f692-7c67-707a-4ed2-156d725a43ad@suse.com>
Date: Wed, 8 Apr 2020 13:36:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331103102.1105674-6-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.03.2020 12:30, Anthony PERARD wrote:
> In a later patch ("xen/build: have the root Makefile generates the
> CFLAGS), we want to generate the CFLAGS in xen/Makefile, then export
> it and have Rules.mk use a CFLAGS from the environment variables. That
> changes the flavor of the CFLAGS and flags intended for one target
> (like -D__OBJECT_FILE__ and -M%) gets propagated and duplicated. So we
> start by moving such flags out of $(CFLAGS) and into $(c_flags) which
> is to be modified by only Rules.mk.
> 
> __OBJECT_FILE__ is only used by arch/x86/mm/*.c files, so having it in
> $(c_flags) is enough, we don't need it in $(a_flags).
> 
> For include/Makefile and as-insn we can keep using CFLAGS, but since
> it doesn't have -M* flags anymore there is no need to filter them out.
> 
> The XEN_BUILD_EFI tests in arch/x86/Makefile was filtering out
> CFLAGS-y, but according to dd40177c1bc8 ("x86-64/EFI: add CFLAGS to
> check compile"), it was done to filter out -MF. CFLAGS doesn't
> have those flags anymore, so no filtering is needed.
> 
> This is inspired by the way Kbuild generates CFLAGS for each targets.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

