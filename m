Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE617CC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 16:40:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449331.1665184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH221-00081g-52; Wed, 14 Oct 2026 16:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449331.1665184; Wed, 14 Oct 2026 16:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH221-00081Z-2P; Wed, 14 Oct 2026 16:40:45 +0000
Received: by outflank-mailman (input) for mailman id 1449331;
 Wed, 14 Oct 2026 16:40:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xH220-00081T-6B
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 16:40:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH21z-00E2AW-JF
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 18:40:43 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6acfb08b-8faa-0a2a0a5109dd-0a2a4509b402-0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 18:40:43 +0200
Received: from [209.85.128.175] (helo=mail-yw1-f175.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6acfb08a-be1a-0a2a45090019-d15580afd448-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 18:40:43 +0200
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-8565d77c277so32536647b3.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 09:40:43 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1791996042; cv=none;
        d=google.com; s=arc-20260327;
        b=brApiVNi2GM/ej6m9e5vu1Y4fgwUIJzBuNSK33HC0SBmHTwIAtycJENnxGycuHMGxo
         UwFLD/YU8PZU1jijQr+n0RCWPCxHKc05Z9SZtcGvoNFbZ7bxWrI1MrtMOlJwODp3wfD5
         koGY8KDa3THVnibNIVvL+MglWF6HNzu2D1fZlFA3ZlMS+ujGmN0U5cpTZK75Fj1gUy22
         SwmBokjP7i4+XCvfoFGJFOPkxYMPt/Fg8PFsATJpowL5IzUXhXXlZD9i/TO232Zm+AeD
         N8FMK63TgN/a9223skuuv4FcP4/S/ugzFGsdJtyg8UqPkr3zCUcaj/MXqTgmIMqXWzjk
         D4bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HsE4A9PIDoSy53wyR5EU6kLVeX4AGREiYkgrJG6uiU8=;
        fh=UIbfyH6QNm5she87CVPUpSvCylEkXLj7ha4U0bSspuQ=;
        b=rIUQl6l86NSvzP37UYg1kd1VdmgNXfUhvGhw3FXQ9vu8slWx5aJxTK+Nr7PL8FlhNI
         6FXkTssVvUeFqCAXRuGMtoeeTOWSgF/4+92a9RWeSYt1n9s/1C/7dSvM0hEGCF2G1G0K
         jEuIIIg/6uWR42LgJ9wlfYvgeqKciPmU1yK7F7pIm8VpGwzutbK7VjYLzKgtfzYJ8z45
         LJU/iNLahaGapEWPQF6PTzTZANY47k2CKy8SPmbvdz82UkzjcPXpb/TrleaS3T6uQaWq
         HrIr0apDyxauPJLimvFTr+uEjORL6yH8ObnnDI9KQVTcbvE6vcc4C8l6y5ZbWmV/IZfC
         gfxw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791996042; x=1792600842; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsE4A9PIDoSy53wyR5EU6kLVeX4AGREiYkgrJG6uiU8=;
        b=Gbu5BuEWWjmNpHi1MX3bZztvrgzIE8qJ6G8KeuTOWDTODtUSmwld4u9EztkYvKHlFv
         9gXn1k3VGoiMbOEp+x0drWAwcQiQEVRxXnkSG0MOlx6zLRDl6GFqXpatqJZIw/SgfwhP
         Tdgyo4nsynEqpNNrv90txbsO5OhUbKvG/31TbqdSyXp6EsmNwgOx9v+aoEnY1jWQVFuZ
         d0n6Mpw6lLJ+eEGTrKZHXObLV+kt+ewc898iLqdoBRxt5vFIBgHVAerrP8LCfznHg/3+
         mNrAKZAJsGN6UaFRBfbVoWIL8qPdV8i+aTdR4TN/+jwRoBzt5d8y/6i/RBFbUGO+1mPp
         ThPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996042; x=1792600842;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HsE4A9PIDoSy53wyR5EU6kLVeX4AGREiYkgrJG6uiU8=;
        b=Yh2FZgq7uJ4N3Pn7nLdVS5iH7U5VDjRmkPo3gkoa8PE3LLxUISLlOE8lphZutLHQYT
         3p0rPhRV5NoTMCSHuqVRv6meMFrwei6HmN3OO4wm9NROapcHyYnTBE3c3Enza/800cK+
         ENJryFDkSO+sLYwEs4QeBEWpCORbqHX5veYBWrBs3rh8iMnQXVEM1qdbkBlRQDRiGum2
         dz3iZZ50/cZ/BpMMJJv7TNT7QW6bf02qQ5Z0rE+vb1UEirmTWbxLTARjttVhLIFfIEyX
         XYt0NWP7E6KN2aSOXP+7Bv0V2rOOBzXSgxFyx+MZQ64h/piiZdAd2Xr0Glpv4vrFIuNK
         JHSg==
X-Forwarded-Encrypted: i=1; AKwUvBzlD4Xkpn+7xQ7dOiGJm+BF/siHGLkH7UcZUkZ1+WEvjJw48C7KNwP+QGrYJcS/JZk7tErOl6bJL6s=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKMRqx2bRa247BwLiaHbdOm939fyJMwa6om9XdlcC9XC23mUNrD
	NPrVjqHcq2nQ6IyssYbVwvfg9JTmXL3x3Y4wukfcENVt3vBLGKa1qKY69amlAv2Xv8WHvsbXxX5
	DGCxRKxApVqqOqIHixNQa66WQ50BvtLebMKjk9UVmog==
X-Gm-Gg: AYBFou18N14DCXbjmlN57B8e8sonbqlSu8w4/I/ZO168g9loZ5M7sAJ4Io+obO6ylFX
	x2UWPRzjYuWAtNQNuTxi+LW0HRZW5liZe4Aza8h9nqDcykvK9F3rcy5JkhzC2QWV0vdecmpfKeS
	Fe4S0G6mx7wMZcaYR9fokqFRtkG8c+iR6WlCU/M2VuOdPKWe0n/8QwqEfejE2/X9kR77YpEXUj/
	y+MthQQDiqAeU2EvginOJUqMfBEg8TEifmSV2LZvQz4wiaS0i3kHPBo1px735hlrt5sNeXPBCnm
	2kGOVLdfXrfLDFdMiRPv+ZNPOOYynZ0iM7CNFb5nFSWEDZv2y9bIqj3sWdST/MPyPytcqy1aYwL
	m8LN4SHAuuQg8lD2yh0rmZlt0JnukK/oob4UfKmLxRML4aLkFrg==
X-Received: by 2002:a05:690c:ed6:b0:8b0:ac08:d706 with SMTP id
 00721157ae682-8b0ac08e3aemr29323927b3.12.1791996041754; Wed, 14 Oct 2026
 09:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com>
 <20260916104435.600211-6-mark.caveayland@nutanix.com> <CAFEAcA9eucRyzG=PR2tpx8ObHkdK6xUmOjQ+-nNbJ2dVHaptOA@mail.gmail.com>
 <876b66cd-0ea6-4943-9a0e-c0abf2ad6e26@nutanix.com> <ca07d55b-3a6b-455c-b456-8944459f051f@nutanix.com>
In-Reply-To: <ca07d55b-3a6b-455c-b456-8944459f051f@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Oct 2026 17:40:30 +0100
X-Gm-Features: AclHuK9GKZpuJodSpbaJGGjpNEJHf1hmwnQWIYQLstVzf56ZJooPw1UCua58JCI
Message-ID: <CAFEAcA80Rb_TY81bFAu1q33uFL2COfdiH22iw5tkN9aG_gCN_Q@mail.gmail.com>
Subject: Re: [PATCH 05/22] i8259.c: move parent_realize from PICClass to I8259CommonClass
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-bad1c0/1791996043-BE0C5034-DF18534F/0/0
X-purgate-type: clean
X-purgate-size: 2794

On Wed, 14 Oct 2026 at 14:58, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> On 14/10/2026 12:00, Mark Cave-Ayland wrote:
>
> > On 13/10/2026 16:54, Peter Maydell wrote:
> >
> >> On Wed, 16 Sept 2026 at 11:49, Mark Cave-Ayland
> >> <mark.caveayland@nutanix.com> wrote:
> >>>
> >>> Both the emulated and KVM i8259 implementations store a reference to the
> >>> parent_realize function in their respective classes. Start by moving
> >>> parent_realize from PICClass to I8259CommonClass and removing
> >>> PICClass since
> >>> it is no longer required.
> >>>
> >>> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> >>
> >> This is one of those things where I think we're not 100% consistent
> >> about whether we think the parent_realize field should go in the
> >> child class struct or the parent class struct. The name "parent_realize"
> >> implies it ought to be in the child struct, though, and I think we
> >> do that more often than we put it in the parent class. This also
> >> makes some kind of separation-of-concerns sense too: it's the child
> >> that knows (a) that it exists at all and that (b) it wants to have a
> >> realize method that will mean it needs to chain back to the parent.
> >>
> >> The docs for device_class_set_parent_realize() claim the parent
> >> realize ptr is stored "usually in the instance structure" which
> >> I think is just completely wrong.
> >>
> >> I could be persuaded otherwise. As usual with QOM/qdev, I'm
> >> mostly interested in (a) consistency and (b) documenting what the
> >> "right thing" is. Realize, reset and unrealize are the three
> >> methods where QOM's lack of convenient support for "child
> >> implementation of method will need to chain to parent impl"
> >> is most awkward.
> > Yeah it's a tricky one. This patch was really just refactoring what was
> > already there, but I'm open to moving it into the instance if you think
> > that is better. I agree with your point about the child instance being
> > the one that knows it needs to chain back to the parent.
> >
> > I'll have an experiment and if it looks good, I'll move it to the
> > instance in v2.
> I did a search over the codebase and checked all references to
> DeviceRealize, and they are all stored in QOM classes and make use of
> device_class_set_parent_realize(). So for now I think we can say it is
> the documentation for device_class_set_parent_realize() that is wrong,
> and I will leave it this way in v2 of the series.

Yes, the *instance* part is definitely wrong. But there's still
"parent class struct" vs "child class struct". This patch puts
it in the parent class struct, and as I say above I kind of
prefer child class struct and think we do that the most often.

-- PMM

