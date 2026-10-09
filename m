Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A6CCA601E
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 13:44:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444411.1661273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFAt2-0006Qm-Jd; Fri, 09 Oct 2026 13:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444411.1661273; Fri, 09 Oct 2026 13:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFAt2-0006Qf-Gm; Fri, 09 Oct 2026 13:43:48 +0000
Received: by outflank-mailman (input) for mailman id 1444411;
 Fri, 09 Oct 2026 13:43:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xFAt0-0006QZ-Re
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 13:43:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFAt0-004grD-0l
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 15:43:46 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac8ef8b-e002-0a2a0a5209dd-0a2a4505caf8-10
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 15:43:46 +0200
Received: from [74.125.82.177] (helo=mail-dy1-f177.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac8ef90-4cb1-0a2a45050019-4a7d52b1b55e-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 15:43:45 +0200
Received: by mail-dy1-f177.google.com with SMTP id
 5a478bee46e88-354ba08cfd1so680699eec.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 06:43:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=toxicpanda.com header.i="@toxicpanda.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1791553424; cv=none;
        d=google.com; s=arc-20260327;
        b=NYFhxVb5diyr7jjBZJbK8Aude9UoV43ZL0UR/Pc8WHI608GtNj+/LpT5RrUtoie8Vi
         mhxFSQVUKbEKRkFh1e33AyC6Yi3mRhNZJ7Ss+C9lpAAgtn7uRZ6WYTuDQFi2K9Hu126Z
         GXMmwQKNRcd58f1rxAD/12Lhuc9DYTpig4l2O8W0MPjhbOkBc95EvwDDFpySQmcTd7pM
         BqRq3A57Hhqy8RIMr26UmvmsNyjn19EDh136TUXc1fvcxm6e0zfdPwdvj970hH7TsE2i
         lrq7U5EaBA+1w1IyoJrgiMA0MkhjL4x5TOGv/zUWSBal9fJIZBpstnpXVGJ+IInBdZgr
         9snA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cr53QXzLPPnzzAYL9+Ow9RuREkmHHvveZLDzlgyx6as=;
        fh=f4v+fmtPwzY0SRokZxYCwr5G2OFpMlb0pe8xMOD0FGI=;
        b=UXnu9gGWD9cs1LJhf1y0axFIHtB/mJYvDG4x+IFKcoSe9pvAzrDFYqP7I0Ukkp5HLo
         RZmFHQUrX6/+3v3JGRWuoDvBh13J0jpdfrkVSEKn8/7/2UoAEkawtkBeBf1u74USkrSM
         WGWSAvCi8sSi41wXTMEwUAYPaAifQ8Xm0JUaXke6EE+mJvzChx9PAbChelu9vnA+3ZUn
         LbpcyIb8wCiyx+D7wgcCkt3qe3CR//lVIQylqxbSTeN7UpKEtDpoAFtRLbZheCVjztPw
         b84gD/NOJR6pdbiaI9K3iEAMA2zZYAArK6HLBIDUHGLHxIybxqi3HtZkmisUVYVO2jPj
         ujxA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791553424; x=1792158224; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cr53QXzLPPnzzAYL9+Ow9RuREkmHHvveZLDzlgyx6as=;
        b=KzydRzWAOYmFgCqUUo02orS01mOz665E0xgWIYfLnrcLNQf8TYBITw/3gzkcaI0+cn
         DZNUEX3aRhBMGoW8LAKdEmde0PVdHqcXRlhi0XDoPYIRFOpC2hbYVMZ6tL+UViNEDU6H
         u4No0FuySeKW8G2P5uUjEsYth2OVJBfz+n4u6NICiu2U7mIfY9BRYrPZZDR8oOUl6Om7
         dw/yKsYoxRVI1ue8ySdyco2a+UzXEUzImVHqOd4/Zh2P4QdUZFiNIwna4eiqkpy7LXXJ
         QgCgPUT0TEAKqoHZdrVc+F7reyW9QNjneksZll/B27U3ecQ+jGBow4G3NWdr2NCeXsDN
         MezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553424; x=1792158224;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cr53QXzLPPnzzAYL9+Ow9RuREkmHHvveZLDzlgyx6as=;
        b=zvUYi4Fb7x2hxjHxgvRUfqkzgU6uLpefQ3rPHJFJIdoUH1xycouJn4GxWeYn6YisVQ
         zOUzzsdesOQ8MPzOOAdzqY7XLSxSgJgxCRES/Z8NlF2HFnS2QYkuJqi0DyawzWNHiKwC
         vflSXj8H64+WlBHej0HKtSeUDUXuS/qdwZmn4d8UZY4sstCulXOvAyCZvuYU1NUbtI5G
         qaKKjbaLxechFRaPmS75Wp6vOGtxA0h6sCYzLan3dZEhZb5Ip2yfby0mMpxGepgcTiKl
         DrPvXqj8iZ3yq88SJxArlYArJGgIE1iUYW58EONMXffxQjdnb3yfW2kTsu7lyqW0N/JK
         yTjA==
X-Forwarded-Encrypted: i=1; AKwUvBzUtGkMeHTGkr793aUkcJXqk30J/0c+WqJNRF06HLqw9Gn47SVZsraDMpfX1FTifomZisQ+3r+dm88=@lists.xenproject.org
X-Gm-Message-State: AFuF++n0QckBO5cEbsH9GMtxBC76hmRYeYWu76rYf1zQ3bgTg21vwwG7
	qTjtFjNfg6RrOZUN4VIoWfOa24ZeKt+mH5hf8Z4vHjWV6mRvLVT7zKCYcxJOkiQvX5UYH5irIxs
	KPnOV4cA1u3kGwJE+uvK8u9LPCDMOcC4+vBsZGDNsCg==
X-Gm-Gg: AYBFou3kLI9gme3yxHGvYBja22GxagoknZwpTU4NuESQQVpYopKSM6hdr0SUixVnPqL
	EtSxZVkkYlP/nsJpcieBZ0oDfDX6A4mvC7naA2UYHFCWBXd8ODwZKT7pMHokhV06e+ldNadImfa
	hq0mp3cBw00b00Ch/du/HoqIldVRRw1mpGo3qyW4gIy9+UZNqmtu8M292ujrKRm9hC73RfyHSfq
	4QHXlp+mItYfmNK3Qbs+xJnfiYZFbDi0N3zUYZSaszN0dJowqkHooELF2TpxTfYjKGFSDxLQsHp
	hVaTeAqdPlGm1keHfPMd/ePOF+BtTwSszmpx4eKrgcWf6IfwNhorLMbFBKLX2J3fVNZlouLIGXB
	TUW+ZgqyLOa+zEA==
X-Received: by 2002:a05:7301:6e98:b0:33c:e74:4624 with SMTP id
 5a478bee46e88-3537e112919mr2778982eec.27.1791553422908; Fri, 09 Oct 2026
 06:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
 <20261008141131.0ac356dd@kernel.org>
In-Reply-To: <20261008141131.0ac356dd@kernel.org>
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 9 Oct 2026 09:43:31 -0400
X-Gm-Features: AclHuK9i2kH_QiKyGXflCaQStHSk6ronnlxME5kUtzkQ0rs0GpgdrjH4gnmAJRI
Message-ID: <CAEzrpqfgBrvwy0Q_AX8X1s3ogq3g1U=JmpqHAM8QUmMHAqWPsw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 00/10] net: stop calling __pskb_pull_tail()
 from drivers
To: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Manish Chopra <manishc@marvell.com>, 
	Rahul Verma <rahulv@marvell.com>, GR-Linux-NIC-Dev@marvell.com, 
	Shahed Shaikh <shshaikh@marvell.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
	xen-devel@lists.xenproject.org, intel-wired-lan@lists.osuosl.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1791553425-F4EA12A1-1B794979/0/0
X-purgate-type: clean
X-purgate-size: 1089

On Thu, Oct 8, 2026 at 5:11=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Thu, 08 Oct 2026 21:02:47 +0000 Josef Bacik wrote:
> > v1->v2:
> > - New 1/10: skb_drop_empty_frags(). xen-netfront, netxen and qlcnic
> >   relied on __pskb_pull_tail() releasing zero-length frags even when
> >   there's nothing to pull, which pskb_may_pull() doesn't do (Sashiko).
> > - xen-netfront, netxen, qlcnic: call skb_drop_empty_frags() after
> >   pskb_may_pull().
> > - skb_drop_empty_frags() checked with a boot-time test under KASAN and
> >   kmemleak, on cloned and uncloned skbs.
>
> Please keep in mind that we ask people to limit themselves to 15
> outstanding patches per tree. You have 18 right now.
> (200 active netdev contributors + an LLM) x 20 patches =3D=3D insanity :/

Eesh sorry Jakub, the skbuff BUG_ON() removal series is the more
important one, this series is the followup so I can finish that work.
By outstanding do you mean per-merge window or once I get
notifications for things being merged I'm good to send the next batch?
 Thanks,

Josef

