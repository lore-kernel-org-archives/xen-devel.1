Return-Path: <SRS0=v0bc=AS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5193C433E0
	for <xen-devel@archiver.kernel.org>; Tue,  7 Jul 2020 11:21:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ECA520702
	for <xen-devel@archiver.kernel.org>; Tue,  7 Jul 2020 11:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ECA520702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jslfL-0000QA-V7; Tue, 07 Jul 2020 11:21:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqME=AS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jslfK-0000Q5-U2
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 11:21:34 +0000
X-Inumbo-ID: 0384d05c-c044-11ea-8d51-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0384d05c-c044-11ea-8d51-12813bfff9fa;
 Tue, 07 Jul 2020 11:21:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C28C5B163;
 Tue,  7 Jul 2020 11:21:33 +0000 (UTC)
Subject: Re: [PATCH v4 03/10] tools/libxl: add vmtrace_pt_size parameter
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <b5335c2e-da13-28de-002b-e93dd68a0a11@suse.com>
 <20200703101120.GZ735@Air-de-Roger>
 <51ecaf40-8fb5-8454-7055-5af33a47152e@xen.org>
 <d9e604e9-acb7-17df-f0d1-7552dab526c7@suse.com>
 <88892784-0ed6-2594-bef8-fd0ae46c2b17@xen.org>
 <a13451d6-d6b5-6d86-aeb0-8985db730866@suse.com>
 <ab992813-4584-f8e0-b90a-7a587c396bae@xen.org>
 <1580655090.20712847.1594120639229.JavaMail.zimbra@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3644946e-a3fa-bef0-4c55-a42988b12368@suse.com>
Date: Tue, 7 Jul 2020 13:21:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1580655090.20712847.1594120639229.JavaMail.zimbra@cert.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 tamas lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei kang <luwei.kang@intel.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.07.2020 13:17, Michał Leszczyński wrote:
> So would it be OK to use uint32_t everywhere and to store the trace buffer
> size as number of kB? I think this is the most straightforward option.
> 
> I would also stick with the name "processor_trace_buf_size"
> everywhere, both in the hypervisor, ABI and the toolstack, with the
> respective comments that the size is in kB.

Perhaps even more clearly "processor_trace_buf_kb" then?

Jan

