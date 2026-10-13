Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C8DCC6B12
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 15:55:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448094.1664128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGeqF-0000Xi-M6; Tue, 13 Oct 2026 15:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448094.1664128; Tue, 13 Oct 2026 15:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGeqF-0000Xb-JR; Tue, 13 Oct 2026 15:55:03 +0000
Received: by outflank-mailman (input) for mailman id 1448094;
 Tue, 13 Oct 2026 15:55:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xGeqE-0000XV-Tv
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 15:55:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGeqE-002ZlD-2X
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 17:55:02 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace544e-8faa-0a2a0a5109dd-0a2a4504d2aa-24
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:55:02 +0200
Received: from [209.85.128.181] (helo=mail-yw1-f181.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace5453-b57f-0a2a45040019-d15580b5d068-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:55:00 +0200
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-87ab6e5f91eso20189957b3.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 08:54:59 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1791906899; cv=none;
        d=google.com; s=arc-20260327;
        b=XKhBcxyA0VLq25NAA/P3IKLEPFKJ+5N8YvJ/v+1qG4dHRjpPfPfR3GYWn2rnU59JYG
         nfROq1rCI7YM5FQ/uKcVmJ4jrySQIGGIVQzGcVGLnbeEVhrw22G4xrW4vPPs3gpbuEri
         /dI4aLPCT5uRDBpD+wEVBx8vDJv9/pWfsadir/NfOuFwkVhDmDHDHjt1Dpw8FaizuiJD
         +/5ltRjeXur4QkAdh2MwgNSi/6i9lPfrdbfmZSdg0ksy0wPwoa+97t5Zn6cbtmMkqsd1
         PPqozjXyinP4EaKiZtwRu6LT3V2Hf3Tu3Zj/9AKGdnrGtmKhlLbsXqthYh95mCmt2Eek
         Ya2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xUX7O0hyhnzIaBL4GI7Fs2xl6p868YhCKfTy7miSTVE=;
        fh=O8iawPLS+ehX6UAPcVgqxNWbNsAxaElMVazIf4YE99A=;
        b=QjvF40ipFq3tFAQVHJin7CWaeGsKT5JZZeWiLpA258JrpPTIu+hic7X0zMnL6Tj/hD
         BCIuQzSuXs8BYAlvpliZLFUIRt+u965paTxL3D9LUHgRjQ+9tTUb4lx/fO+J+gBC4fva
         oUKO15p14x9xA3E29GPG/N69TDrQDoFqTeyxpd2t3uGs0crp7o4Yq20/3PuswEmHPkdm
         6lEN23DBl8GapecbF/X/xhzxeyc/Vv/kKQcth9fbF7bTBCEY+0Vx1I8KfEV2ExLOWJ1U
         kEodpcW3F1opPNIVRk2EIO81u1EJypgHyzE1sxdYB2dLWHuGzTvZz3yUwObE6XS5P6oT
         a5UQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791906899; x=1792511699; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUX7O0hyhnzIaBL4GI7Fs2xl6p868YhCKfTy7miSTVE=;
        b=XCfx68Exjy69HoyC4Q/+tWXP875riZDfC2JX+y1ErMETZ11IL47/UfbIEFN/cQYNO/
         ilCpZmJH3FG/XXaPdaJnuSmm8QFohHloQctG1halNj8fcG93KPriOpHH3jU8cMTHQSgz
         eDlA5qXVy4qe6PYBBD/ohR63PQCA9bs6meKw3ojw+1dBc62ikTIC2+HQXheB2+IjySpL
         pd+sbSmAZ+1vCz/JV1V8yMquFUdECiyfvU5FXxMVtNdJAPyzdyWTkRljmPLHLCeUCclL
         yMYUzPFLmPdRVfF8XPV4bnENTHgbKQn29WPAk3a2f+XjAel7EsMerLCNT2PmL+Ou9vIR
         khjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906899; x=1792511699;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xUX7O0hyhnzIaBL4GI7Fs2xl6p868YhCKfTy7miSTVE=;
        b=2fhCjfWIsLktvjfXvSf4pHh49aM8fnfRNrluJFprV6XZsKulH68yOU6XuBH7xV5F0x
         Io0LPMlai83GX0oHo08ID6dL8KoT5+7v5TBbA2j5c1goGXMpctuW8mrfTCTGr9EOJBwE
         F3zrEppALIjEpx/TJvXO9mV7hmyA3VvcloriONO+O/+vmUdV3pIdj+4J2NOxgBFNwuOt
         AmQKgZYy3MOlD3vTBePN6z+olFpUsvO8et0Gbhw6Ne7VpzpAfVbbRRYSPu5dStzMEZQq
         I3W0fM6jSJggPMFdcsTChBpOSQ+6+3QKecDb+Y6md/RfePp2ORYn9167JeJxuERvK04V
         9YdA==
X-Forwarded-Encrypted: i=1; AKwUvBzMuh4J1aGv6blvWOEJYJRasN5ooYXkRbtePDLfaUvfBBkIPpCwF5MxK/SLLzjlwe/nLzAcdlnqgOA=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJTwY70Z4a22LkNQAzUOS4RN7Gklygo34GAzrKBAV7LFCVzxAfO
	0BY45TBVgeA9VYLXXEdM/KGj2b4iuReeStg+tdyeOcbw6VJyiAYQhPP9DmfJ2AUQgYRJQOCWCio
	lBAiHW7IwuhdaLQ1zbyh5keqctk0uHT9A8FwTn01dWw==
X-Gm-Gg: AYBFou24YAySuEuEeRS+Ull3JRS2zHMtap0OguJaqA62S13B/tLMQM6GuOxlAbGTtRt
	qnga0yVs0a84k8OCiCKxiQijw2DG1G/wHF9A20oWDZQ/+8xUPWwIN+o0ibgs33IeIN+/eiMTHvf
	/8g92qH490H4FDWae2MGYoFHDOVNGT6JgiAxPsBaTRea+eNO8nRvwjFRQmuUUchRpjl/4LKGyBe
	V+PDCSjcdcwU+iTrXwDVGbgKQx744b1+JwNDA4quUQXcddVGNNsprYNg3KqspkbRM+qS1QfmS66
	hpilyvWh55h2PdOUyJoACJORPppPYKI8+YMjVi5pRc3Ow76pQE6FZvSjbatily7AV0bRCogF42A
	kIqiNxO4sGuCsB6qKVSjxhwcRv/pTyK7aoMgrKhE=
X-Received: by 2002:a05:690c:c510:b0:8b0:b0d1:fc47 with SMTP id
 00721157ae682-8b0b0d20337mr16623687b3.60.1791906898640; Tue, 13 Oct 2026
 08:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com> <20260916104435.600211-6-mark.caveayland@nutanix.com>
In-Reply-To: <20260916104435.600211-6-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 16:54:46 +0100
X-Gm-Features: AclHuK8tx9cc1Chrkd1VlgBGe_Zyl8Wqsg8OPvfvGLJ1IUyuXdLtJM5RjrH8d_0
Message-ID: <CAFEAcA9eucRyzG=PR2tpx8ObHkdK6xUmOjQ+-nNbJ2dVHaptOA@mail.gmail.com>
Subject: Re: [PATCH 05/22] i8259.c: move parent_realize from PICClass to I8259CommonClass
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-ebf023/1791906900-502E4B50-DCAA0EBD/0/0
X-purgate-type: clean
X-purgate-size: 1483

On Wed, 16 Sept 2026 at 11:49, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> Both the emulated and KVM i8259 implementations store a reference to the
> parent_realize function in their respective classes. Start by moving
> parent_realize from PICClass to I8259CommonClass and removing PICClass since
> it is no longer required.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>

This is one of those things where I think we're not 100% consistent
about whether we think the parent_realize field should go in the
child class struct or the parent class struct. The name "parent_realize"
implies it ought to be in the child struct, though, and I think we
do that more often than we put it in the parent class. This also
makes some kind of separation-of-concerns sense too: it's the child
that knows (a) that it exists at all and that (b) it wants to have a
realize method that will mean it needs to chain back to the parent.

The docs for device_class_set_parent_realize() claim the parent
realize ptr is stored "usually in the instance structure" which
I think is just completely wrong.

I could be persuaded otherwise. As usual with QOM/qdev, I'm
mostly interested in (a) consistency and (b) documenting what the
"right thing" is. Realize, reset and unrealize are the three
methods where QOM's lack of convenient support for "child
implementation of method will need to chain to parent impl"
is most awkward.

thanks
-- PMM

