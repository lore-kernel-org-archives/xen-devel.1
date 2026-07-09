Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44074C43458
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jul 2026 09:36:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1357716.1612058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlAh-00017z-5P; Thu, 09 Jul 2026 09:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357716.1612058; Thu, 09 Jul 2026 09:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlAh-00017s-22; Thu, 09 Jul 2026 09:35:55 +0000
Received: by outflank-mailman (input) for mailman id 1357716;
 Thu, 09 Jul 2026 09:35:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1whlAf-00017l-1Z
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:35:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whlAe-002aTK-6m
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:35:52 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f6b6f-e002-0a2a0a5209dd-0a2a4503aa16-22
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:35:52 +0200
Received: from [74.125.224.41] (helo=mail-yx1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f6b77-ec1a-0a2a45030019-4a7de029c4a2-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:35:52 +0200
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-664db84f074so2027877d50.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 02:35:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1783589750; cv=none;
        d=google.com; s=arc-20260327;
        b=VUIfX9mPSAOhWIsiMh8RAhNwZi4r4B7atIOmlatwtMzm3pxTINUEdRhajuG+/z9tUp
         RYMI93WQBox2eO1flU/oqpT9lMgoqqYPRoF27wdtTSQgsjrFk9f+7q4gGsVkF71rpRD1
         xBGw4fz6OPL2yPRygBZAnaOs3o3/yTxbrSJefuLtp8155viq555QErxTEwf5VW1ACK8R
         N2gGwiLrKebuydrwk+Qq9hcAR61oxBit64hLHBlNx+cBfrDxXRk6VRrAT+WQsRlRLC3B
         Q6QnYFhm4VbmK6DxJStXObXKE5W512LBcWWMK6zNBUiAsXxbaWb4cW0Za7FzcWXaZH5O
         y8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lqPoy7n3B/2r5nuw2Q1yV+Dn/OHkHAArlO16MqDXa6E=;
        fh=/xIDEt21AoDgIoFrvXO7IQvdlvHF73QaNWBe25gcoZE=;
        b=XkE5NZuQSdgZ3TcfZojMIiuAD9A1wFOSqd2vy/zAm1p9wLAdrbg45NNgMd0DIbF+/G
         g01I8daOw0hZS/HGymUpwCv2P51O9winRD9u7X/cfNWtlZp/HHbsZuf+RNRK44FcGKU7
         U96KTt1i0LIFVgXIyyXmSVPSUReA7/IiGoxqcWByKZuiFEqdBOSwE9m9XLuROjCXrrZZ
         mwzeI1fSSomovmXbxi1BBnfF/ge8pjNFtOwEZKNapsbFzwVNF0SfqUhhM/EmQ7SAhqK6
         POPpQckfIAVRY8GXTu3JG+aisJxGhwEs9oXjjD9nf+bQAQAFYBvfUl5ySeZF1/qA3WuU
         EXlQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783589750; x=1784194550; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lqPoy7n3B/2r5nuw2Q1yV+Dn/OHkHAArlO16MqDXa6E=;
        b=hTLqCtxSyLwgfglU+VXDV9dlcTyHfc9bE3Et7rFyuFIhbvTN3L5a+rj54fWAeiA5P9
         Z0n0q0lr1+Yy6ID8rCoNMywBSRfy+f+CrTKUZt5u/UVveJK5q5QpxzRZ/OqrDNltZeq8
         WhbKUOry3MwQN3BJeWXBMDz4/XYdJ1eQsNoAIQAzWTM74klikrIhJIcyHMLvj0HQfo9v
         oQk4BI7i81yvy9CdF1607aXUvfcfoX5H6bX8pu+WiW070BzQ/3nYXiG03p9BjLBybIp+
         kD+n+QpCwauO3fuUYdvfx6b7+EjT0iiDcUo9XRCEZvkzQGtXvuAVjH+ZNxr3qPdJGjEm
         9B0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783589750; x=1784194550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lqPoy7n3B/2r5nuw2Q1yV+Dn/OHkHAArlO16MqDXa6E=;
        b=RQtLZlQjlZBXmJxBZIYQorj9q/mWMyRWFaawMckp46NXblEVbj7FcVzeebjom11OdX
         aHka/eXaApaV5brOPO4nu0zlT4iNpTx2S7R00t+a5uQ4EdFoxi8gLZ2Unhhze6NL4eBN
         SxCOScHcxfN3WIPgIhx1pZGOFKY+qu6B2KotvlYMwMdXxehSjxniK28zkblD8eMQvLmr
         IpNpxMqcslA3DJOHCvqlISSYJ7zZil0s85as0zjcfRCZDatTj9xODJ9B09FQ9ASaG6IG
         8jVxgBZX+5EmZWILhfh+T3q92xFJ2vW2pDJlPFkUFgExWQm3yX5AVsCOHHxiH32x5I3r
         NX2w==
X-Gm-Message-State: AOJu0YwI0vwZGwFHUuSGoJ6IyCdWkwsd0E8t8XXtmZblsEhafDbx9Bds
	6KIO7C724oqb5ZyUqhYzYPyWs23klBd8Qbswa086fOSrFJGqrLsayNsEcraNExV2Lh0PXB2nN0l
	CKRHdduTGpa2RuiIrI10S/ksSTKS/y84=
X-Gm-Gg: AfdE7cnEQlDs3SKQKVpys4gqssLjA/h4p/av6+Gpl/kB+U4nUom5Pj28o/FdkqvCq4E
	t+31/ybC18nEP1VeXhib1W6ejnB2txVBPO4eYEN+xcNmV9apbJCuVCpCgg1CTpVWP/+LObFjRXw
	Kylc036o1n6ZxH5eWlwtd8rwVUNk6HQS4hThJ4sf0IgzuFZNWzisbhSmXmrscGepXsUkRe95iCW
	pznbADZTcm4NkbWNkOqd9OIqW8+uOD0rhlhzGQQoa4b5q0bPbkauuQofoG+Y8O2dbhmGCEdOlxz
	5noClD+W9W9AdTSOth7LY4dap2g=
X-Received: by 2002:a05:690e:20d:b0:667:8b91:244b with SMTP id
 956f58d0204a3-6679f2b20ccmr3766830d50.98.1783589750608; Thu, 09 Jul 2026
 02:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-12-frediano.ziglio@citrix.com> <1783518933.8631fc262581453bbf619ec5b2062170.19f420331a900080a8@vates.tech>
In-Reply-To: <1783518933.8631fc262581453bbf619ec5b2062170.19f420331a900080a8@vates.tech>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 9 Jul 2026 10:35:39 +0100
X-Gm-Features: AVVi8CekR3mQV0Nm25bT8MGuWQL9tgplakFi6i-6bmJgF0ekaloybntpx9WRceI
Message-ID: <CAHt6W4dECmk-16oPt2kEr5tp9LPrZzCdAKFr-m6JFaj2FMCViA@mail.gmail.com>
Subject: Re: [PATCH v6 11/16] PoC: libs/guest: use foreign copy during migration
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Juergen Gross <jgross@suse.com>, 
	Frediano Ziglio <frediano.ziglio@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1783589752-BD1BE5D1-8884D4A2/0/0
X-purgate-type: clean
X-purgate-size: 1885

On Wed, 8 Jul 2026 at 14:55, Anthony PERARD <anthony.perard@vates.tech> wro=
te:
>
>
> A note about the subject, a "PoC" or Proof-of-concept to me isn't
> a patch that can be accepted, especialy if is a patch to an existing
> library.
>

Yes, mainly it should be merged with the final "finalize PoC".
Still nice for review at the moment.

> On Fri, Jun 19, 2026 at 02:04:56PM +0100, Frediano Ziglio wrote:
> > From: Edwin T=C3=B6r=C3=B6k <edwin.torok@citrix.com>
> >
> > ministat confirms the improvement:
> >
> > ```
> > x baseline
> > + foreigncopy
> >     N           Min           Max        Median           Avg        St=
ddev
> > x  20     1.1306997     1.1447931     1.1356569     1.1365742   0.00324=
2175
> > +  20     0.4311504    0.44180303    0.43616705    0.43600089  0.003109=
4689
> > Difference at 95.0% confidence
> >       -0.700573 +/- 0.00203311
> >       -61.639% +/- 0.133355%
> >       (Student's t, pooled s =3D 0.00317652)
> > ```
>
> There's been some comment about this stat in previous version of the
> series, and the description is still the same. Could you describe how
> the stat have been generated, and what the number mean?
>

We managed to ask the author but got not much clue. Mainly timing.
Probably better to do new statistics.

> Also, what's the different between "baseline" and "foreigncopy". I've
> only had a glimpse at this patch, and it just looks like the code have
> been moved to a different part of the library, with somehow less lines
> of code.
>

"baseline" I suppose without these changes, "foreigncopy" will the changes.

> >
> > The tests pass too, which means that it has correctly migrated all gues=
t
> > memory.
>
> Which tests?
>

Different migrations with multiple OSes and configuration (for
instance PV and not PV, these from me).

> Thanks,
>
>

Frediano

