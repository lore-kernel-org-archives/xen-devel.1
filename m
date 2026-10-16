Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA39CCF2C2
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 15:56:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452305.1667128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkI5-0007Ti-PU; Fri, 16 Oct 2026 15:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452305.1667128; Fri, 16 Oct 2026 15:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkI5-0007Tb-Li; Fri, 16 Oct 2026 15:56:17 +0000
Received: by outflank-mailman (input) for mailman id 1452305;
 Fri, 16 Oct 2026 15:56:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xHkI4-0007TQ-Lc
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 15:56:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHkI4-001P9I-2e
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:56:16 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad248f3-8faa-0a2a0a5109dd-0a2a4507c970-36
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:56:15 +0200
Received: from [209.85.128.182] (helo=mail-yw1-f182.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad2491e-b4ea-0a2a45070019-d15580b6cc9d-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:56:15 +0200
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-8b0e21048f8so977767b3.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 08:56:15 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1792166174; cv=none;
        d=google.com; s=arc-20260327;
        b=EMcRtxKJB6u1vN6V12Rgo/GSZaRL5y4/Q1lpB2FrjK6hwHD3EYfV3HfkRLIZaVMwqt
         qpHs0w4dr1URK4NGHBjADZp/QSxRNVAlB8HOA3xr9PRCWBEIzv4t6C/DJ2cHGvzXBsWf
         XbNQixS7v6xn9562BZvWi8fvvb6807piTM8l/eyCQqxfKFd6UjHm2I8L0PCwFk/ApoUE
         B1ATgnu/uW0vGv2J0KrjUEK+su01v//rS01x4PUdoNINeIp5ZKMROj46dPLjQ8duf6sq
         FQ19dSR6EZgUE1fAY5I121VmO8zW6cl5Z83Zgjn0JtStuFN9CR2G9T5d2MMnYAcOdQOB
         pR3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LyGTEQn8TvpSDs3sbo/pVW3eD0AVPEzIKc7OTWsb7K8=;
        fh=Iw0Q9aK5H2fVDFR6XeLQ1T89x2FAfz8yIySiIH8CsJ4=;
        b=h+LQZRlWDxauud/A1jA4l6AxkZleTB4kMx4TyKDSNiVX0lJRQ8B3FG8Sbj2hUIppgb
         0kusT4zo6tnWX8800iS7rW6hdmY9iW4fZ+UFK29TigCrHTaYFpr88iSB3SqJ/ZkaSv+y
         Zh+lN4LKmkOjikIfx7naD73+FjdKnvBKugEdWMjziDpSTyz+iGZ9LhXzJRtHSpzDnfkT
         M3MiqPlPllu8wriMc4ZGssuM1Myh8TiPghYri1R55YedY+eEJEqhlfCC1Dmja3bnnXUZ
         nH+XlS1whZd1m8sK5bmqcrnWNVs0flpAPNTe61kMmQm9FOzgYibewQeJg4PCsE/iSKXD
         sW0w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792166174; x=1792770974; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LyGTEQn8TvpSDs3sbo/pVW3eD0AVPEzIKc7OTWsb7K8=;
        b=FQOR6V5wxYd4zwBuNQY6PCH2M0KshLHANM5qVEm9j0B6+Bc/Dr9pEGu/8ioS5v1ke7
         9NnSIqzZktoMQdfuLy48+z7OCanZNs83pqTqZhaJk0Y/SC//tnfeq9XbE+kfa85tJdcC
         V/EHkWAVMK0M12vD/K5xd9LWY5SPh8Je2ZiC8M4xKbHQ1iAoskIgFh5LuDqYGrpHIQsq
         Sd2VDXacqA+Li4Jb6YmBhz57f2IqJkKao5UoOslVftmI8jg6X4QQTMPLMf2KVUcqtDSA
         tbMkG8sO0xm25IW1Zmvb1PccSSbSmdakQs95bfW5YkuXBWCJWpjxy5JSNcLBhCyp5QmV
         /Tjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166174; x=1792770974;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LyGTEQn8TvpSDs3sbo/pVW3eD0AVPEzIKc7OTWsb7K8=;
        b=A24lEo3kM5jk9SfpT95NCmKwKXR7TZGTSCuOKIKkZ93du2gJVXgkTzEbF4scni1fQx
         7VXArDfTiPAzGuuflmeNPZD49YLpzO/SaifFGxEbo3aRnzEVG0dLu9LmHSrDGSc6ObQY
         uOEoUOtx1PXOyKg3cJtqqkCvSkNp5XrsZ7ubkW9Eh2Tbkk6XS8/nZhZErTtJcHXdrx1S
         EamqVvjlZn8Mu4JuSwAP6sRlxGrruBtAnO6BHpt0wsxZgK96mnkHI6BA3ks4K/ZfL1px
         PHD1muGvpjUEd0ihbRRk6vTTAcHkwRoYyBB8xav+MeYTTvMA+eGQsHtQq+l2TtEfQC6F
         angg==
X-Forwarded-Encrypted: i=1; AKwUvBxg/pgvMkLIbTstOuoGs4O6SQITEkqVsYw40uvEBiZqQehna78svdoevzbZI1/cEYHD7he3hDXtoYs=@lists.xenproject.org
X-Gm-Message-State: AFq9FYI3Q1f6dADPjT3NXaW7tQVI/B6iE9HxKzxc+QyIsksQlcLvascw
	J+kdAbexvaZTD3Hev9p+KJ9PPCzvjKMEswtAcbTUDgYS35ZMCFtjsTe2fcz1vULZB1fWoHhk4I1
	oFcWqfwVrJO/DlUVMKsPyZjT1w2JXLyywPGckJcB+bQ==
X-Gm-Gg: AYBFou2OigGG5Q+jZ52f6jgGK/jBWFVtWuR9Fk3mrnkOcYuJ7UMYWbOEZK/aQ++QJ96
	FPqKf/XdVsbqqMnv1Kok2PV32xgnwhfKk3fjexyBYP4zMmWI+70Ya+42RiKRl/Pk4s9UBbLMaAi
	+sbOIVTOjsoocOe8+YwiAz4ts2WXy5l5shh8O8aTd/E8XV8uszuRDcoK0n7u2DIxr31cnLmnqGe
	MDLLncShmDlxZKU+OYzZ5ivnIXOUS5Zwf7eqVGI71OQECIuePs3tet5mcVl9j40Hth1EkKmuKFS
	3WMEaOTBNqZqDijsd2W7qQER1/zRHJ0GmXBTPHgh7Oj5U2NweSNl4auihkKYAjXTNx0V80sTeWi
	skeGjHkn9yx/Gjs2D73VdOYX7r4xbH9yMjD7K/r9ApZKizvkGPA==
X-Received: by 2002:a05:690c:4d84:b0:8b0:8a9c:fac9 with SMTP id
 00721157ae682-8b0f2170e34mr1713327b3.28.1792166174293; Fri, 16 Oct 2026
 08:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20261016142031.1204281-1-mark.caveayland@nutanix.com> <20261016142031.1204281-7-mark.caveayland@nutanix.com>
In-Reply-To: <20261016142031.1204281-7-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Oct 2026 16:56:02 +0100
X-Gm-Features: AclHuK9MHRDi7s52R0estk1KzgTugvCrprtO3xo5sNZ623bTnalBpp4C5HsLsLA
Message-ID: <CAFEAcA_X3PV8qM-ELPJqcB3tJ2W613Hfjpff3-zU9Xk469MsnA@mail.gmail.com>
Subject: Re: [PATCH v2 06/27] i8259.c: introduce TYPE_I8259 device
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-ef75cf/1792166175-358C1AE4-60581A2B/0/0
X-purgate-type: clean
X-purgate-size: 388

On Fri, 16 Oct 2026 at 15:21, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> This device represents a single emulated 8259 PIC and its associated class and
> ensures that we can safely embed the device within a container device.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

