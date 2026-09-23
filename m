Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1C5C98304
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 20:15:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431309.1653477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9TMr-0001bu-5L; Wed, 23 Sep 2026 20:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431309.1653477; Wed, 23 Sep 2026 20:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9TMr-0001bn-1J; Wed, 23 Sep 2026 20:15:01 +0000
Received: by outflank-mailman (input) for mailman id 1431309;
 Wed, 23 Sep 2026 20:14:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1x9TMp-0001bg-Rt
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 20:14:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9TMp-00A9tI-92
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 22:14:59 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab43327-8faa-0a2a0a5109dd-0a2a450a91b6-40
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 22:14:59 +0200
Received: from [74.125.229.205] (helo=mail-lf2-f13.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab43342-f2d2-0a2a450a0019-4a7de5cdb678-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 22:14:59 +0200
Received: by mail-lf2-f13.google.com with SMTP id
 2adb3069b0e04-5b8d6489419so1132026e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 13:14:59 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1790194498; cv=none;
        d=google.com; s=arc-20260327;
        b=UR9hEXeUm5vLqFHPKxBYmOjex8zylPzn6d8GDa69uMkzL660DhkpIR+vnbn43XVkiK
         sKGNI4Tet1ksY3DJOQrb77Q/zNn0cbUg/9/csC+mhrT8/thNicYQLXcE9HBMLipdlUFl
         Ud8GLaFl+rmDtczJX8R5pEtNvPk0VjI4xQ7Lv3cxWTf1DVPr8YRnkntG2lsINOkDWyw6
         dhx00lzYXXTQjbzSZIZLFeIq6JygNf9bnF+8samX8a8dNy07FSx0VzHiCSJeRQL3OVa7
         W7+lI+SgqU39ySpaVoIBSRjgdd02seodZ3A3xupBvswYYmtr8gzbQTJTja1HUT2MxVDf
         voDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=310ddxPyQ67CdOkKBpra+N+cJtSwigrefj3YJxWCnWk=;
        fh=iHb7RP+hgXFgvYb7euIDLHwm1Ntj6lTjth0e/S9Xdj8=;
        b=Xa6Xw4MTKC9uKOLVW2L3J6kZwyrDoHRq9mZ1XbkY16iwMiy4EDabuMJABe5Zoay4YH
         989fUGweSnda/U4pYx51LMUmPxbEZ7hbCUBm4Qc1BXLTLoJrIepgpJWscss5Z4OobNVB
         feMwo783oft+Jhw4HiIwLIAhr04JVuzGcaUsIFroBCwhJJVYTViaE3Tq1QzXy2mK09HM
         K/aLSGy7NNeIdubK7+QBn/E2OQmNKIUhEyYCm3i+eiH3jvXnspgG2fXGcpaLjO7guqzs
         B/nDO+VZuvb0mICPhETubBHURWivELeELuKoBo9779/AXSQgs2dgYBwK5kXVLsNNkm0c
         nUxw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194498; x=1790799298; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=310ddxPyQ67CdOkKBpra+N+cJtSwigrefj3YJxWCnWk=;
        b=JtSg1AWxw0p9hSY4DRyR6Z8M2g5cCoy4X8Ya7+Df+J8hkhMpcOAOO98/pU3LJ8Szdl
         jOcB6wMqcMyJ573947uiwL7gh4E0SyyRD9uyzEcwirRD+i8eitjAv0ZY/qJc25uo8v5i
         gNgQ1oJYCpH1JnJRL67UiQejlxU0hoaNUs33Nt+26jetYW+HKjQVlekB3zsk1Fmu3Ubz
         LFqfMmwgWzOgDVlq8+5gBDVWR9L4yQ2n9dBAzCLqYJnRWXJndSZX5MwJ/PaBUEz4hQR0
         MBX9p5ZEmkXhvW/ODqG5M4sQtl8XOD+SpSBPReVs0WzgQgCphst35GPXf9TQcZsANu7I
         ujCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194498; x=1790799298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=310ddxPyQ67CdOkKBpra+N+cJtSwigrefj3YJxWCnWk=;
        b=uwoNaq+uGOiTLoGesqMM4jDAHbF9Nx+0kesKI0Wn2j6rjORZV4aPcM8pIZehyHjFpk
         J0iRlwFFWznbgBmANKvDjsQJZyw2dUYjbXW7KM55W27bkhD9su/DoJIEEw9U//+QGVw7
         YlMcJ+6KLmt8WSK35+el75M0rrsLv72eQ7glZV+XY+41KxMAIvoFma95O14n69GaCrOJ
         H53DBumzTujlo7Gq4H/8ZhD7tc16FeMk0VfgiNJkeJNJ6r0n6c7oSy3EXpZnR8l83EeU
         mMdBgr3jpdpUEozb25hr+qFzEGEmHmKNyKfbupacRsA8jLRdFFiNLb+kqTU9JNmt3GbF
         venw==
X-Forwarded-Encrypted: i=1; AKwUvBzCNP1iaz++1RgCjLK48w4ZcdEhNFwHuq6cZ7g3J4kPDOWu23v/zUIMweFggLSjl4hx587Ce8ZGPO0=@lists.xenproject.org
X-Gm-Message-State: AFuF++ksyYtJtEjYzplnpIPTh7dlO08HvSVgodkqgo9IonJ5Dc6bBQjU
	zJGOhJmbcl1DhcErzcjKhsbwzAdcLmQy6YLbtYWDHrYt58sXAo9hNG5PgL4k0ezQrH2/AjWOH2/
	5ZhxhaNLxoES8+Jw7uSGROYJtuV2Qj6E=
X-Gm-Gg: AYBFou1xDZ8vduRECPYEe8PuSzJshu7EP0BFFAKzbDgkeaWQIMwdrb9uO6CYyGki4+X
	1Y1GmDWzsJTdrlfhoT35V4b0MGwKD6ZDY26Ln9orHXzJQD7KZSHG0QpVBX6Nvtv6DU6KgjEsDf+
	Qqhb6ehsLv4Tubh4rgcpEb5Gu8rCJ2RwYqPikdkLJmaSD3P0KDXP03xAZQEbY5xSpi0IDTG6ZT1
	nfVDgmN9VZ8NSv0CPfdNa2RgmR1H77png+37jngeKksWLD5g7qAOlSAXTmP3d3eoyLMxB59MrTq
	X/oJoIuzVwBtpfuRSklHaRKs5a+cIfo1VcIHXJ0ER9DlTLx/GnxQtw==
X-Received: by 2002:a05:6512:2383:b0:5b8:cfd0:90b3 with SMTP id
 2adb3069b0e04-5b8df0590fbmr101470e87.19.1790194498352; Wed, 23 Sep 2026
 13:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <1c846d023255a7a7a9ce533cde0a8db3c26eb855.1765811852.git.dmytro_prokopchuk1@epam.com>
 <bfe096e0-c908-468f-a916-b1981a6e159d@amd.com>
In-Reply-To: <bfe096e0-c908-468f-a916-b1981a6e159d@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 23 Sep 2026 23:14:46 +0300
X-Gm-Features: AclHuK9FD8zCBvGXohgM66Y66Arw7eVwR6HMki0gP4Xzkl0-i2cM81LRv6qxmPg
Message-ID: <CAGeoDV9UBQ9xMJ7JG_hW=kVfAWp0Vr6mSth+sf9vP9+byY5t+g@mail.gmail.com>
Subject: Re: [PATCH v2] gic: Replace BUG() with ASSERT_UNREACHABLE() in LPI paths
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1790194499-53ED2CFC-426BC88B/0/0
X-purgate-type: clean
X-purgate-size: 674

On Tue, Dec 16, 2025 at 10:57=E2=80=AFAM Orzel, Michal <michal.orzel@amd.co=
m> wrote:
>
>
>
> On 16/12/2025 09:22, Dmytro Prokopchuk1 wrote:
> > MISRA C Rule 2.1 states: "A project shall not contain unreachable code.=
"
> > The GIC LPI driver callbacks violate this due to the use of the BUG()
> > macro, which causes the function to never return.
> >
> > Swap BUG() for ASSERT_UNREACHABLE() to satisfy the rule without needing
> > an additional deviation.
> >
> > Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>

Best regards,
Mykola

