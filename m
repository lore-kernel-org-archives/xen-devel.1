Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCAAC5DF9B
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 13:26:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398857.1635102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyUgu-0005rt-1q; Mon, 24 Aug 2026 13:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398857.1635102; Mon, 24 Aug 2026 13:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyUgt-0005rm-Ue; Mon, 24 Aug 2026 13:26:19 +0000
Received: by outflank-mailman (input) for mailman id 1398857;
 Mon, 24 Aug 2026 13:26:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1wyUgs-0005rQ-0K
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 13:26:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyUgr-00225T-2H
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 15:26:17 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6a8c4677-8faa-0a2a0a5109dd-0a2a4505ca52-8
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 15:26:16 +0200
Received: from [209.85.218.42] (helo=mail-ej1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6a8c4678-4cb1-0a2a45050019-d155da2abc48-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 15:26:16 +0200
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-c1c26d7e951so517022866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 06:26:16 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1787577976; cv=none;
        d=google.com; s=arc-20260327;
        b=LmHtVf5ZT84M3Y/rC6fYIaf3ImVMfmgA7GdDLf8Hz2XJhsa6+vizXWK+oZtQOhTuUM
         BsqHoiI9Fsmj5NKzMeSdIOKwuub0rTFWofZGeyXW53y7i5NxKKBtqoJ34KYZwJQagpMq
         j1jUfWZ81lAvcb15jmT+A5/YaXwNJ50DJyudGWVk7zrhHegfcDrlDEkAsroT/n9VpuOJ
         LTbYm4gNGO/dFCZ4eEnOU9dh4teGBhDdIFXbwRu3eXyh148NgMMfOqKFJMeFI+3Gjmo9
         OTXU2P3uJI3ducJTpMJG2rms83NbSXsgCXTj12eXmZbC0Cdl0AEZY0k3NbOXSquEVFYc
         EMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WJOQloOIABkgH6V3JAdZSvG6I3xZcRSyyak3uFeJFGk=;
        fh=Q3MFvgmBVez3lAjgQPyQRycJzUFWQ5jTf8kh/WjsKT4=;
        b=hujInGLYA7LvUUOqJrRgqnd3N9n8oDMpvV+JZqvgmkbnen6SePgk+AIhsBb6apCiao
         52vK6He3wYXGcOvBMpslxhH1WVW1nd45lzmUD4vqqoSLBr4R+E+tsK9USMj+9V5HtYP5
         WMPYEFcVATUUp8o50NODEKtGJ1r2O+UThFklESWQm5l8hsfpK+56Uy0ODraZWIzc1CSf
         fLiDzZgl7h/h0dAQwy8VdozQ7iHhs25qefb/nzXFUemWkanP5vPOgD1c6kjYxjb2meR0
         3+SQJcuC8t39+XQdQL4/ElFP2kXAacGpGQv+6Y68vZShZBiFUQjHdYS9xluPs01YwBrE
         5Kbg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787577976; x=1788182776; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WJOQloOIABkgH6V3JAdZSvG6I3xZcRSyyak3uFeJFGk=;
        b=BZ3l7HwDSqZ2Ogu1Uub4Dx4PbdpnIxGv/Ax8uobXlct4R3WfiYWwqtZVnaq0VvpEXh
         LhXuTkKbLSuAIMVE7V8FXEL37vndxQ8hadnp7dVg+7SrYoE9oQFm+7btTb7eCq/3EYLw
         aHFFGFQml0uDiDcPhUp8nSV0nQmZVJV9Vvyu0KxCul7B68G5j8/Pd1wBgcuR9HmXsmxh
         uzsxkzzANGSwiS8Yu4Uc+/e20CDCIe7qo40PsfG9OliqAkNTS4KCViXD/qYzozy4b3nT
         a/sKW5QoozW0ZdL5SgppFh3UmU13ArIcrc9zBbRxxnPKTGaXz9tU8cCdLbG/GsLwz+/Q
         OyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787577976; x=1788182776;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WJOQloOIABkgH6V3JAdZSvG6I3xZcRSyyak3uFeJFGk=;
        b=pzcrGcLh3U2OBIl6fp/RSG1giD2UpjCLRiBLTkr5Fw82LZvdiYcMJypptpFz/rDeEC
         jvlOW+523zrYZyDrdnDvgaKvZq1/QP3kED2S0qrq896KDKXT2I4pUwF18KWO8nN3wd99
         42nAXRRjn6T0zsT6U5itlG7xUTlMFrkUF8vXmPjwm7ctYLR7XkBqtwTraVSrO0UCb+xL
         XoS4HNtcfZLlJt1mlE0cqb5A75KDgEqJ0Zmu0cNYA+cBJDwuHgG8TdTB2Brpeg6oK4zG
         r3nvt7H5EdkmknLhzXXDBib+MtPgPvZWRK4Eld5U1FKH/pJoDv/O0OXkPLpniDbyuZR3
         W3jQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFOwYZPNsrZAkL9vtaMpBjpc5NnhcLdONvgoIyISUlKX9P4CCyXrXQBs1HT4wu24Qm/ausWqg7wz4=@lists.xenproject.org
X-Gm-Message-State: AFuF++nseN5TaxWG+7hW6BDbuczAF2rIZ5rr7Ix82gejMUf5o+T70siz
	pB6NpSXCFVC3VNmwwBMyXF66wz35AXhFt7YLeHv64JQLfh26uTfZHSLieC26KOnbVJJmFX8k/jr
	RckCoz+v+5UMHSwK2335aChW4/+rhUz06Od585+oSJQ==
X-Gm-Gg: AR+sD10LX32G5RNI+wgZzYX2ma6DDRk65DVZtsfsdncyFCEzCsZpAp2SNJZIOBP25TR
	UIolrtkaKq1nZfFjshP4FM5wrfZ5BB5PSJcaZ0ByhewxLsjUhiSd6JRrbk3qz3eMCJOYOwNqXyn
	LfqfPFgU60/P6XApuVETw5LznNa3plIYirmEDdbQ+Mh5f8hncHgq0fuqyyR36UhljU1e4eiXKfR
	WbiqCEeJNnMuaKFeyf6KeOi2sWO+tkzGNNWpn9ob91OwAjBB70OCDN/NutnpfWBefxOIf7sPoOG
	y3ibRyPQmO8sWI9Uv9WnttWdTRxjEwuKoxvvYZkfHKJ0iGpMUPLtffKSLeprykOm3MQ/lCRIFDG
	q0sFWxr0CQkxFEynJnZEUuk+rLl4G
X-Received: by 2002:a17:907:7b93:b0:c20:5213:56f1 with SMTP id
 a640c23a62f3a-c246a60348emr2829725766b.13.1787577975945; Mon, 24 Aug 2026
 06:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260805052723.2823538-1-neal.frager@amd.com> <2383a98d-d88d-415d-9de1-aa68a5d215fe@amd.com>
 <BL1PR12MB5032F21E0E2A6F17398B6D76F0A02@BL1PR12MB5032.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5032F21E0E2A6F17398B6D76F0A02@BL1PR12MB5032.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2026 14:26:00 +0100
X-Gm-Features: AcwNN1VvxlRRRHvnKb0O7rD1SVWHvRL8XBQeDCQKBO42isGO3VyXT47Xz83_lqU
Message-ID: <CAFEAcA8sWn1vjm+OFYzwA-jko2vYkFcWPwT6g9=0AeO+JQo-JQ@mail.gmail.com>
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
X-purgate-ID: tlsNG-c201ff/1787577976-F7CB82A1-10C05EE8/0/0
X-purgate-type: clean
X-purgate-size: 1316

On Mon, 24 Aug 2026 at 14:14, Frager, Neal <neal.frager@amd.com> wrote:
>
> AMD General
>
> Hi Stewart,
>
> > The -I$(XEN_ROOT)/tools/include added to QEMU's extra-cflags causes
> > __XEN_INTERFACE_VERSION__ to be defined before xen_native.h is included,
> > triggering an include-order assertion. Downgrade to a warning since the
> > version is consistent in cross-compile.
> > Ref: https://github.com/qemu/qemu/commit/e2abfe5ec6

> > This is a buildroot issue, so I don't believe it's necessary to fix from the
> > qemu side.
>
> I am not sure I fully agree here. While this is a buildroot identified issue,
> there could be other use cases for __XEN_INTERFACE_VERSION__ to be defined
> before xen_native.h is included.

But what, though?

> And what we have found is that if
> __XEN_INTERFACE_VERSION__ to be defined before xen_native.h is included, it
> is not a hard error.  For buildroot, the qemu works just fine in spite of
> this.

I think that just means you got lucky. Either there is a hard requirement
for one header to be included before the other (in which case it must
be a #error, and whatever is causing the mis-ordering to happen must be
fixed), or it's fine for the ordering to be either way (in which case it
doesn't even need to be a #warning).

thanks
-- PMM

