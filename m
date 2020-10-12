Return-Path: <SRS0=QJhb=DU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB22C433E7
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2020 04:12:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6075F20838
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2020 04:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6075F20838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.6028.15981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSBfM-00070w-Aa; Tue, 13 Oct 2020 04:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6028.15981; Tue, 13 Oct 2020 04:12:00 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSBfM-00070o-5g; Tue, 13 Oct 2020 04:12:00 +0000
Received: by outflank-mailman (input) for mailman id 6028;
 Mon, 12 Oct 2020 20:17:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zk8D=DT=suse.de=cfontana@srs-us1.protection.inumbo.net>)
 id 1kS4Fh-0008Eg-Pf
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 20:17:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1e5fb89-147b-4516-89b2-995612048671;
 Mon, 12 Oct 2020 20:17:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0CCFFAC12;
 Mon, 12 Oct 2020 20:17:00 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zk8D=DT=suse.de=cfontana@srs-us1.protection.inumbo.net>)
	id 1kS4Fh-0008Eg-Pf
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 20:17:01 +0000
X-Inumbo-ID: e1e5fb89-147b-4516-89b2-995612048671
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e1e5fb89-147b-4516-89b2-995612048671;
	Mon, 12 Oct 2020 20:17:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0CCFFAC12;
	Mon, 12 Oct 2020 20:17:00 +0000 (UTC)
Subject: Re: [PATCH 0/2] Add Xen CpusAccel
To: Jason Andryuk <jandryuk@gmail.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201012200725.64137-1-jandryuk@gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <c2b2ed9a-879c-f676-86f0-22b3a77b770f@suse.de>
Date: Mon, 12 Oct 2020 22:16:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012200725.64137-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/12/20 10:07 PM, Jason Andryuk wrote:
> Xen was left behind when CpusAccel became mandatory and fails the assert
> in qemu_init_vcpu().  It relied on the same dummy cpu threads as qtest.
> Move the qtest cpu functions to a common location and reuse them for
> Xen.
> 
> Jason Andryuk (2):
>   accel: move qtest CpusAccel functions to a common location
>   accel: Add xen CpusAccel using dummy-cpu
> 
>  .../qtest-cpus.c => dummy/dummy-cpus.c}       | 22 +++++--------------
>  .../qtest-cpus.h => dummy/dummy-cpus.h}       | 10 ++++-----
>  accel/dummy/meson.build                       |  7 ++++++
>  accel/meson.build                             |  1 +
>  accel/qtest/meson.build                       |  1 -
>  accel/qtest/qtest.c                           |  7 +++++-
>  accel/xen/xen-all.c                           | 10 +++++++++
>  7 files changed, 34 insertions(+), 24 deletions(-)
>  rename accel/{qtest/qtest-cpus.c => dummy/dummy-cpus.c} (76%)
>  rename accel/{qtest/qtest-cpus.h => dummy/dummy-cpus.h} (59%)
>  create mode 100644 accel/dummy/meson.build
> 

Yep, forgot completely, sorry.

Acked-by: Claudio Fontana <cfontana@suse.de>



