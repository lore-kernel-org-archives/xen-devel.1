Return-Path: <SRS0=Qn0h=BE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67F7C433E4
	for <xen-devel@archiver.kernel.org>; Sat, 25 Jul 2020 10:00:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A633820656
	for <xen-devel@archiver.kernel.org>; Sat, 25 Jul 2020 10:00:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Of9JEDhY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A633820656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzGyK-0001yt-T7; Sat, 25 Jul 2020 10:00:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mx1j=BE=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jzGyJ-0001nJ-Is
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2020 10:00:03 +0000
X-Inumbo-ID: 9b28dce2-ce5d-11ea-8900-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b28dce2-ce5d-11ea-8900-bc764e2007e4;
 Sat, 25 Jul 2020 10:00:02 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a15so10357221wrh.10
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2020 03:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DQr2fn8K0lfi7wz2bcOOr7pSID9kg5rEDXkxGKuFfxk=;
 b=Of9JEDhYB10kyI1kqHj6N9i2y55NqeC9KJBpblLrWIq5PdxZJZ6d0gYVGDgX4M68Ln
 NBO/JU2qSszzrTPDDEnf7DSLsTH4w3/BlgmfRoUAubO6UnFEsaI4iLjI6t06hO9afd4m
 fS+Ns2CuWVSeFi77vNgkx2bo7k98Rj3V/Tbnv7c+BNAfcyFtNFBMh9SF0yF4O/Bp49Sz
 nDjAc0ZuNdMhXu8SmT0MQI3jX7cbQznwG2hhhNM7CvpOXJ0lcBTxy4dW92Ct679/iMaU
 rUASHWNT03vNWbAaotC29OyBKjqDHCP9HOlsDnDQ7YB+23pNLYDD9xs1lIJGQOtJWkue
 JeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DQr2fn8K0lfi7wz2bcOOr7pSID9kg5rEDXkxGKuFfxk=;
 b=LSD0jRlKz36tD9ueGh6SwNI95WGj6uTrEs+HMLnlp1MmEBpzJMmJ1le5mwibMEDzgx
 h+bPTkh8J2LpzjMpQ7MxsM6rKz4pThMADyd6mXkOoFZKAmssrNnkn0E5p2EKl7guTpty
 WGSAEz/uPkOSz7E7OQZ11v4QEzXQfvumXbvA1ddL4krdcEdy6Wvenr17A+kDg4NYWlfS
 Olq9uTzDwoFCMo5rn2uDTuPV3edv/jg+1UPREJOVy9P0p5XGYqkNXrVCbH7A0gwv079X
 0bcaYUk0Ct1clZ8KP7AFdBn0xz1RYws8mbmjqvXoHPVchquFj3TJxkaeVN0bZp323/0Z
 enow==
X-Gm-Message-State: AOAM531ONHflZaVBWqCXmV6uxGJ89JrG55NZDpOMj+yjAsYvE0arOxMA
 JgurAypbQPzK58Zsa08c0GLqGxMfc0ET3t7iS3g=
X-Google-Smtp-Source: ABdhPJyO1goX3bYVCyEmBOJ9i3lEnj1lFFAETkQzxJIvVLWegrGS53cJrCraYBg2qvUX5jfE8OTrY3RFdfz1YnFPHIQ=
X-Received: by 2002:a05:6000:142:: with SMTP id
 r2mr13125339wrx.103.1595671201417; 
 Sat, 25 Jul 2020 03:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2007231055230.17562@sstabellini-ThinkPad-T480s>
 <9f09ff42-a930-e4e3-d1c8-612ad03698ae@xen.org>
 <alpine.DEB.2.21.2007241036460.17562@sstabellini-ThinkPad-T480s>
 <40582d63-49c7-4a51-b35b-8248dfa34b66@xen.org>
 <alpine.DEB.2.21.2007241127480.17562@sstabellini-ThinkPad-T480s>
 <CAJ=z9a3dXSnEBvhkHkZzV9URAGqSfdtJ1Lc838h_ViAWG3ZO4g@mail.gmail.com>
 <alpine.DEB.2.21.2007241353450.17562@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2007241353450.17562@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Sat, 25 Jul 2020 10:59:50 +0100
Message-ID: <CAJ=z9a1RWXq3EN5DC=_279yzdsq3M0nw6+CZtKD00yBzKomcaw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rahul Singh <rahul.singh@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, 25 Jul 2020 at 00:46, Stefano Stabellini <sstabellini@kernel.org> wrote:
>
> On Fri, 24 Jul 2020, Julien Grall wrote:
> > On Fri, 24 Jul 2020 at 19:32, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > > > If they are not equal, then I fail to see why it would be useful to have this
> > > > value in Xen.
> > >
> > > I think that's because the domain is actually more convenient to use
> > > because a segment can span multiple PCI host bridges. So my
> > > understanding is that a segment alone is not sufficient to identify a
> > > host bridge. From a software implementation point of view it would be
> > > better to use domains.
> >
> > AFAICT, this would be a matter of one check vs two checks in Xen :).
> > But... looking at Linux, they will also use domain == segment for ACPI
> > (see [1]). So, I think, they still have to use (domain, bus) to do the lookup.
> >
> > > > In which case, we need to use PHYSDEVOP_pci_mmcfg_reserved so
> > > > Dom0 and Xen can synchronize on the segment number.
> > >
> > > I was hoping we could write down the assumption somewhere that for the
> > > cases we care about domain == segment, and error out if it is not the
> > > case.
> >
> > Given that we have only the domain in hand, how would you enforce that?
> >
> > >From this discussion, it also looks like there is a mismatch between the
> > implementation and the understanding on QEMU devel. So I am a bit
> > concerned that this is not stable and may change in future Linux version.
> >
> > IOW, we are know tying Xen to Linux. So could we implement
> > PHYSDEVOP_pci_mmcfg_reserved *or* introduce a new property that
> > really represent the segment?
>
> I don't think we are tying Xen to Linux. Rob has already said that
> linux,pci-domain is basically a generic device tree property.

My concern is not so much the name of the property, but the definition of it.

AFAICT, from this thread there can be two interpretation:
      - domain == segment
      - domain == (segment, bus)

> And if we
> look at https://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf
> "PCI domain" is described and seems to match the Linux definition.
>
> I do think we need to understand the definitions and the differences.

+1

> Reading online [1][2] it looks like a Linux PCI domain matches a "PCI
> Segment Group Number" in PCI Express which is probably why Linux is
> making the assumption that it is making.
>
> So maybe it is OK to use domains == segments, but we need to verify this
> in the specs and also clarify the terminology we use in a doc for our
> own sanity --  I am hoping that Rahul can come up with a good
> explanation on the topic :-)

I am a bit confused.... You were the one arguing that domain ==
(segment, bus) in this thread. So may I ask why the interpretation
wouldn't be valid anymore?

Cheers,

> [1] https://stackoverflow.com/questions/49050847/how-is-pci-segmentdomain-related-to-multiple-host-bridgesor-root-bridges
> [2] https://wiki.osdev.org/PCI_Express

