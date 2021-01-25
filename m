Return-Path: <SRS0=xPWR=G4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B09C433DB
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 23:13:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10339227BF
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 23:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10339227BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.74546.133991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4B2w-00018B-UX; Mon, 25 Jan 2021 23:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74546.133991; Mon, 25 Jan 2021 23:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4B2w-000184-RM; Mon, 25 Jan 2021 23:13:22 +0000
Received: by outflank-mailman (input) for mailman id 74546;
 Mon, 25 Jan 2021 23:13:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wS9q=G4=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1l4B2v-00017t-FY
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 23:13:21 +0000
Received: from mail-ej1-x633.google.com (unknown [2a00:1450:4864:20::633])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a76cfa0-19b9-4cf0-a77f-54197f13dc28;
 Mon, 25 Jan 2021 23:13:20 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id 6so20479711ejz.5
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 15:13:20 -0800 (PST)
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
X-Inumbo-ID: 9a76cfa0-19b9-4cf0-a77f-54197f13dc28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T0i/F3xt7h+qADNJph55TQUO8Ol/q++JoTdhG1xK2Y0=;
        b=k/nJbv+8QWadYFkPM6ez66i2rYJ6gI7o1t/VfsywwmelqsmeNxGeqm3wTrBnszSVAn
         exDFA0LAg57d0KuwrLSo0vutejlNCEJzBNbybQwE9uJi0caRh/Trr9Gk3swROmfFKu/B
         ZnOP2znPtliEMzs4nQ2+/3I/mJ/t3rVUtDiJ039SpaVlc0falhS1GbXaRQ3eCjqfwi9v
         whsjeSKBAU0ZDtXsp9TW4SuGAznfoInLjV2ZdYko34SmY2okxXek0q8A/isxeXj7N3bW
         HHCJ0bSgJ2hR4pST3lwWsWiQ2txRcSzuBu8/bjhnP181gzz1H/fAW6O465uNE6V0SH2U
         OXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T0i/F3xt7h+qADNJph55TQUO8Ol/q++JoTdhG1xK2Y0=;
        b=BWFRm/R8e8HSrbqWFSa6U0Z2/ovRslpLQAuvaMJwIaXaTe9mlU6jZ23gBjrtFWAdfR
         3ZDN5XfyfHxACtxvhpFeNNnFkQ9oB7cnDEu7UV8zyzOabQjAXSdu3P2cNXPfB84pscaq
         nNF/Fal9yKJC/ZAOBdzGmpRhcfA5os+Q245k8limWjztpFjtpkawSg3pXTsLYo+spNqM
         o+UN3p+JPmtqQcw4trrqSnI5VRU0MwWJIVA8U5Ew5gahbXWc6zvxq2OkvykWw0u+tics
         cBWbfss0+Wlt9fBBPInvZr7wQpV6tu2/rM77+QGrOxxqC++yc3m/yFE9UGBISidWjfaE
         D0rQ==
X-Gm-Message-State: AOAM532n2CTdh/eI5JvjF8CzGxCnVHsAarlcI0dUV6GzdoR94pYX0hUA
	Hh1ZLGTzmxPGrCWkDmtg78ulvO7DzWrRJHkLSwU=
X-Google-Smtp-Source: ABdhPJzXkdTeWLjTTJQjBVrTdeh3mR7ixNxkMLOMTwWwqF3ILNlh8DcHVT9NTMwlmWu4Rjnhl3OoOHV5SKoH7xB0Vgo=
X-Received: by 2002:a17:906:b082:: with SMTP id x2mr1657407ejy.100.1611616399275;
 Mon, 25 Jan 2021 15:13:19 -0800 (PST)
MIME-Version: 1.0
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com> <1611601709-28361-5-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1611601709-28361-5-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 25 Jan 2021 23:13:08 +0000
Message-ID: <CAJ=z9a1c+obN3KW_cMr7OH0112_gHSxnAoEJb9qW6R1J38QgQQ@mail.gmail.com>
Subject: Re: [PATCH V5 04/22] xen/ioreq: Make x86's IOREQ feature common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, 25 Jan 2021 at 19:09, Oleksandr Tyshchenko <olekstysh@gmail.com> wrote:
> ***
> Please note, this patch depends on the following which is
> on review:
> https://patchwork.kernel.org/patch/11816689/
> The effort (to get it upstreamed) was paused because of
> the security issue around that code (XSA-348).
> ***

I read this comment as "This series should be applied on top the patch
X". However, looking at your branch, I can't see the patch. What did I
miss?

Cheers,

