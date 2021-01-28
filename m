Return-Path: <SRS0=OK+i=G7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576EEC433DB
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 17:24:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0468064DED
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 17:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0468064DED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.77315.139975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5B1e-0003Ck-Rl; Thu, 28 Jan 2021 17:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77315.139975; Thu, 28 Jan 2021 17:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5B1e-0003Cd-Mx; Thu, 28 Jan 2021 17:24:10 +0000
Received: by outflank-mailman (input) for mailman id 77315;
 Thu, 28 Jan 2021 17:24:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+gg=G7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l5B1d-00039r-6c
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 17:24:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1151c23c-2f34-4317-b299-b4a14364e58c;
 Thu, 28 Jan 2021 17:24:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D2F164E01;
 Thu, 28 Jan 2021 17:24:04 +0000 (UTC)
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
X-Inumbo-ID: 1151c23c-2f34-4317-b299-b4a14364e58c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611854645;
	bh=G58/BjCp4PuTTCqUlLqasmLHng545gugUjUWfHOeewY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t4Sebc9c9o14VIuupFtz23oD7fN7vR//5s7zA5jJUPvpHmfOqNs9UaZUt1ji+f6Cb
	 1yTP8KCaUFYTOBNvUu1naVbekELWzIdImt46ltSbcDOH30Md2336D9qd72TiH+m93b
	 yMOcG5SlOQfyECRoGKamP4bzvPGOyZnzJ2629ZPxQC1Y+UeHgM8m0fXpjj6Pkjd7av
	 9Efpt/tQ9V0YxPB4uXhfBppVtZ5OZ76s5aygNUEP/XTpZMxg7LsUL7Ra6emDAw8enQ
	 i2gFLsBUUXLhDiRevUTl42DrBO4KqOteYnOEsaUjdQPulU6EtVXERBND6+o7Bq5mwA
	 GkeoK8qs6/ZRA==
Date: Thu, 28 Jan 2021 09:24:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Ian Jackson <iwj@xenproject.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Julien Grall <julien.grall@arm.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
    Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Kaly Xin <Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>, 
    =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
In-Reply-To: <ca1375c7-852d-fb3a-6895-5ef12ea7a01e@xen.org>
Message-ID: <alpine.DEB.2.21.2101280919590.9684@sstabellini-ThinkPad-T480s>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com> <ca1375c7-852d-fb3a-6895-5ef12ea7a01e@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Jan 2021, Julien Grall wrote:
> On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
>  > Patch series [8] was rebased on recent "staging branch"
> > (5e31789 tools/ocaml/libs/xb: Do not crash after xenbus is unmapped) and
> > tested on
> > Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio disk
> > backend [9]
> > running in driver domain and unmodified Linux Guest running on existing
> > virtio-blk driver (frontend). No issues were observed. Guest domain
> > 'reboot/destroy'
> > use-cases work properly. Patch series was only build-tested on x86.
> 
> I have done basic testing with a Linux guest on x86 and I didn't spot any
> regression.
> 
> Unfortunately, I don't have a Windows VM in hand, so I can't confirm if there
> is no regression there. Can anyone give a try?
> 
> On a separate topic, Andrew expressed on IRC some concern to expose the
> bufioreq interface to other arch than x86. I will let him explain his view
> here.
> 
> Given that IOREQ will be a tech preview on Arm (this implies the interface is
> not stable) on Arm, I think we can defer the discussion past the freeze.

Yes, I agree that we can defer the discussion.


> For now, I would suggest to check if a Device Model is trying to create an
> IOREQ server with bufioreq is enabled (see ioreq_server_create()). This would
> not alleviate Andrew's concern, however it would at allow us to judge whether
> the buffering concept is going to be used on Arm (I can see some use for the
> Virtio doorbell).
> 
> What do others think?

Difficult to say. We don't have any uses today but who knows in the
future.

Maybe for now the important thing is to clarify that the bufioreq
interface won't be maintain for backward compatibility on ARM, and could
be removed without warnings, at least as long as the whole IOREQ feature
is a tech preview.

In other words, it is not like we are forced to keep bufioreq around
forever on ARM.

