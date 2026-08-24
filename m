Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDD9C5DF81
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 14:13:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398875.1635121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyVQP-0004oM-L9; Mon, 24 Aug 2026 14:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398875.1635121; Mon, 24 Aug 2026 14:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyVQP-0004oF-Hm; Mon, 24 Aug 2026 14:13:21 +0000
Received: by outflank-mailman (input) for mailman id 1398875;
 Mon, 24 Aug 2026 14:13:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1wyVQO-0004nq-FZ
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 14:13:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyVQM-002AhK-Cs
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 16:13:18 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6a8c517e-2eae-0a2a0a5409dd-0a2a45069f78-0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 16:13:18 +0200
Received: from [74.125.224.44] (helo=mail-yx1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6a8c517d-195a-0a2a45060019-4a7de02cd170-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 16:13:18 +0200
Received: by mail-yx1-f44.google.com with SMTP id
 956f58d0204a3-66825847b2cso3690101d50.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 07:13:17 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1787580797; cv=none;
        d=google.com; s=arc-20260327;
        b=Qeg06ijEBpORyr9Gl8Ew6ZO5gbWGtAlZl83SwIHJFH8CVT7tNeI7yl/nHpfWuRZNJj
         0LlSa797EwyMM7VhhTfYNvERVJAg12jSOOMVgRY+OGXy3oxHz2K/ucE0a3X8sWwiIqyK
         Isk5luHTQLQ8Ae6JrZLBtyL4XMZGhhtdabL9C3760HU9qJ9kbFHj3zoQ6USDP7TzPflS
         EueXxxg0TP5n3Gi4Sy076mRQKBWwbDCXOXj1l0zh3k7muewvgp8vJjL15q4ySU3XuROi
         KmfWzZ4pedGyoxpPhhSK7qcghue647vZBskUW5sd67lHDTUgjJ7IVzznu6joJ9wMcJgh
         QeEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i90qMMZqov8wxYQ380J3TeVkiRq0NLJOwuvPuDjyrj0=;
        fh=sv8mYavBC6Z+YQNb7RBJnfB0wI4gDSvMcgATypxev0M=;
        b=lqMnEU+1Fmwbs2hulQllQmMWuzlhaqhLkqJ/Szk+Oav9mtPliSf8mGklnuN9HkDBHK
         HEsHUBsTA8nw4xPfJl/txWswB3xhZmJDZ25o6+8dFYu28bCUkgUYwvHlp/mZ+JlAc4Bm
         sAIAxQbyCQVYALZ/o8nuz0o/3A87NX/SzNXP+0ykscLoPVh8U75T+b0JtJTrKgV+vqDo
         UdKKLz75I3MQ7ghgaZJ5k5nVO1gap6mSE/3mZp6Y681jlJZCyBSHCQ84PRDbK8pgtlSd
         hjyRzMOC7baaIte5sv5SF+4OgmT3xEmzWEAytJHLDAFk6oKO6txhxaynYeKld9NTmKhK
         R4KA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787580797; x=1788185597; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i90qMMZqov8wxYQ380J3TeVkiRq0NLJOwuvPuDjyrj0=;
        b=pC+SbYFhtQmSazvGjNjDJefjVhlGADMWsgr4i8PNtQR4ErF+l/T7+rvVCwMdREmyuu
         zJKMnQs/SK8IJDWlBw2fSne2DUilN/MvQDWVDh1Me7i3/2em9L8wZs0NxvznyWwNXWxn
         7JBujxyoBsKAebiK+hCHGI/kToOi3LYNhmRCgmM62EKf3je0l51DyrS5PwsFrTljnWjp
         yiKs/PsqiPw8bcu/M6vnHzWV5z8k8t7eJMo78DHGNlFS1k1KiQNYZbkZycKjU5Dp8RjX
         gn8/4b4u2SNQS7xd7dVaCddO+xL5yC3kq2olwmi2LRVFO6+sjagAOgNyMtvL/g72Nkhh
         T8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787580797; x=1788185597;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i90qMMZqov8wxYQ380J3TeVkiRq0NLJOwuvPuDjyrj0=;
        b=FPjSAzGK6JvQsqHhNFT5KxeoFjUSkU7gqwtAkph8TvBUAtAxd+DbzLgSZyagqnfHtZ
         S0AW1WbVLJOT/rCPKulH2I4PHwSqvqOqBzyix68+ZE78dvPRsnyssEhROvZgoYFrhf4I
         hURAaSiu9I5ZO2L3XavYVwJVMEe8N0pHtFSNOiqxg+6AOBB/SXOj/E1byfhdxoKjX10y
         XDtAGle8Wu1KNDTl2euF9S6D8Y1svLYyG+hcpYGFiEGTz2tjxOc/tDQTMlmLmf7VFtsS
         DxtqTbjl1VGe4tYIzq1/mqM/JRjGPq5uHNOp8Y82Mwd90/j+1r4VsD5Z+DNXzl+q9gT7
         4v4A==
X-Forwarded-Encrypted: i=1; AHgh+RqLKKpI6Y8Ivj3Ee5JDUfWlDQ+Gx3YxnWleysyH8Lrzgh0HjWVyMXTO4xly3U38buD1Edpu7peb6Hw=@lists.xenproject.org
X-Gm-Message-State: AFuF++l0NzkrAhlbpbjQx+VTio4avBxKlF8GKeZUVI5cJpXHqwE3x0EK
	ORPA6KB3ldunBV1LUxyh0/WJ5YE+sf6tD900U0Ww0WrpO7loWTdJAdVJFOT8otTyZs+CfoCMDHL
	p9w0MvGCPGuMRcOGCVtvXyGvbTgdKjON3BGMX92VQfQ==
X-Gm-Gg: AR+sD12wad5vU7Caff6NvH0sIrRgaUpPe3jHiImF7Nye/NHor1K/7W6PU3VsOmKeRjA
	qcJsFHW3mRl1hBG2sAh5OrE50tbhXkicf1DZcLGJsPQ2mUVHfCgIpz20txoDqjSwPBchGrT2tpM
	P04Zg3yWe8n5uNFW38/k+PDzDgGZ6lPDNhAxeOcz1g7NjUQ2tqmU4Bjf+mnLXhyWkeqfYLzgz8g
	yJWDdnZiuPqVg1XygWqHhuGedwR+LL9tgFrmA8lWy18AfgkFSaVU/NH5jR1rf4BhR4BO1vaI11v
	uoXJFRvKrgjVrvwkiK59YgWi75lr34k8dFlaMCPjPZYA3vlByK9cni3UbfRSKvF/8a8PyUv9IJu
	t8RTjGq/Pz1XZq1eTME7sVTnWdT1B
X-Received: by 2002:a53:ac9d:0:b0:66c:9f99:9133 with SMTP id
 956f58d0204a3-66cf21bc69cmr6817963d50.29.1787580796530; Mon, 24 Aug 2026
 07:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260805052723.2823538-1-neal.frager@amd.com> <2383a98d-d88d-415d-9de1-aa68a5d215fe@amd.com>
 <BL1PR12MB5032F21E0E2A6F17398B6D76F0A02@BL1PR12MB5032.namprd12.prod.outlook.com>
 <CAFEAcA8sWn1vjm+OFYzwA-jko2vYkFcWPwT6g9=0AeO+JQo-JQ@mail.gmail.com> <BL1PR12MB50322B1D97569B5CADEC8E55F0A02@BL1PR12MB5032.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB50322B1D97569B5CADEC8E55F0A02@BL1PR12MB5032.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2026 15:13:04 +0100
X-Gm-Features: AcwNN1VxiYK2jXYCrQnBcioJAtVp2kRV-_L71rBTzoEWsRsEjGV3LGfW0swuAp0
Message-ID: <CAFEAcA9rWqo92nt1StDuBwUjbV0eqdAA921nozpjQHDF_ARJyg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] include/hw/xen/xen_native.h: downgrade
 include-order assertion to warning
To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>, 
	"anthony@xenproject.org" <anthony@xenproject.org>, 
	"edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	"Stabellini, Stefano" <stefano.stabellini@amd.com>, "Saleab, Micheal" <Micheal.Saleab@amd.com>, 
	"john.ernberg@actia.se" <john.ernberg@actia.se>, 
	"matthew.l.weber3@boeing.com" <matthew.l.weber3@boeing.com>, 
	"vincent.stehle@arm.com" <vincent.stehle@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-16d1c6/1787580798-F627077B-FAC9D719/0/0
X-purgate-type: clean
X-purgate-size: 2517

On Mon, 24 Aug 2026 at 14:31, Frager, Neal <neal.frager@amd.com> wrote:
>
> AMD General
>
> Hi Peter,
>
> >
> > Hi Stewart,
> >
> > > The -I$(XEN_ROOT)/tools/include added to QEMU's extra-cflags causes
> > > __XEN_INTERFACE_VERSION__ to be defined before xen_native.h is included,
> > > triggering an include-order assertion. Downgrade to a warning since the
> > > version is consistent in cross-compile.
> > > Ref: https://github.com/qemu/qemu/commit/e2abfe5ec6
>
> > > This is a buildroot issue, so I don't believe it's necessary to fix from the
> > > qemu side.
> >
> > I am not sure I fully agree here. While this is a buildroot identified issue,
> > there could be other use cases for __XEN_INTERFACE_VERSION__ to be defined
> > before xen_native.h is included.
>
> > But what, though?
>
> > And what we have found is that if
> > __XEN_INTERFACE_VERSION__ to be defined before xen_native.h is included, it
> > is not a hard error.  For buildroot, the qemu works just fine in spite of
> > this.
>
>
> > I think that just means you got lucky. Either there is a hard requirement
> > for one header to be included before the other (in which case it must
> > be a #error, and whatever is causing the mis-ordering to happen must be
> > fixed), or it's fine for the ordering to be either way (in which case it
> > doesn't even need to be a #warning).
>
> From my view, the order the header files are included does not matter, and
> this should not be an error.  I agree with removing the warning as well, if
> that is what we all agree on in the end.

The rationale for the header ordering is in the comment in include/hw/xen/xen.h:

/*
 * C files using Xen toolstack libraries will have included those headers
 * already via xen_native.h, and having __XEM_TOOLS__ defined will have
 * automatically set __XEN_INTERFACE_VERSION__ to the latest supported
 * by the *system* Xen headers which were transitively included.
 *
 * C files which are part of the internal emulation, and which did not
 * include xen_native.h, may need this defined so that the Xen headers
 * imported to include/hw/xen/interface/ will expose the appropriate API
 * version.
 *
 * This is why there's a rule that xen_native.h must be included first.
 */

...basically, if something doesn't include xen_native.h before xen.h
then __XEN_INTERFACE_VERSION__ can end up defined to the wrong thing.
(Disclaimer: I'm not a Xen expert, I'm just applying Chesterton's Fence.)

thanks
-- PMM

