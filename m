Return-Path: <SRS0=ej9i=MM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363D3C07E95
	for <xen-devel@archiver.kernel.org>; Tue, 20 Jul 2021 14:42:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6D8361164
	for <xen-devel@archiver.kernel.org>; Tue, 20 Jul 2021 14:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6D8361164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.158793.292136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5qwo-0000yt-4u; Tue, 20 Jul 2021 14:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158793.292136; Tue, 20 Jul 2021 14:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5qwo-0000ym-1M; Tue, 20 Jul 2021 14:42:14 +0000
Received: by outflank-mailman (input) for mailman id 158793;
 Tue, 20 Jul 2021 14:42:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hl5X=MM=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1m5qwn-0000yg-Eh
 for xen-devel@lists.xenproject.org; Tue, 20 Jul 2021 14:42:13 +0000
Received: from mail-lj1-x22e.google.com (unknown [2a00:1450:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31c981fc-29e7-4e38-9c74-615f2a3dbc46;
 Tue, 20 Jul 2021 14:42:12 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id u14so31433646ljh.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jul 2021 07:42:12 -0700 (PDT)
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
X-Inumbo-ID: 31c981fc-29e7-4e38-9c74-615f2a3dbc46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=juy2lbl74Rn6ykOaEQtIkw1UiXMHnx+MEYlt1GWRrFA=;
        b=fF6SHJISCxmXamw8fLOddMax9LXscXIdEFLgz4d0y/sa1drbLRNfut7sSmI2MOxJ84
         YI1mB6c31S2rzHi+SGFAdvKFODoV1iB2pbfhoBZo6r5W6AMbzID0R0t+JYW0maRoTQrs
         fConoGBqxN+uHKyh0gwbV+jeylvEqRX7Nzyy5/rkKnlIJgS1O9vpdi3WdL9CG6ju5VE0
         lbsOSLhb3VhAy+qXccTtGznu3QvWMWmfU0nUipFVbfJbPJtDwUuzQXas3TOZs3iOZt7E
         H3oFRFi5XmoqRUKymoStMhWi3ec831i8GBhC6LjP8N9Xlzhqky5KfNe9VcJFx+vLj+yn
         OpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=juy2lbl74Rn6ykOaEQtIkw1UiXMHnx+MEYlt1GWRrFA=;
        b=PJV/IS13X7JrUmrEz+/bMip9RNC4pfNaLqzPl/n0OSAggxTWKPE1xImc8laSgONyQ+
         0YSNVRSqESSXPwKaXhJkZ7WnauTNsEZ4nVDfIZDoOrA5fYVpgGEhGrkokdKls8pfeSwZ
         0n2JS9mNaRZrdTUyQ19EsnNYacrspXZFgFQUXCtHLCqiLqdVWudhsTt0RBOx4MGh/LPQ
         E//yslJSgg/+RvnH4/W4lsd3Nc91ajCEnnUlQqx5rUw7RRAUQPxEx/QHIGAlfjvoqu03
         AWT18Ris2Du8xX1SQ0tisBrxzzkjy6bRvxSssboI291MK52z1KHWHqxj6YY0Mhh+dB1t
         Ct2w==
X-Gm-Message-State: AOAM5326akBxgS4qISEg8JpHKkjpPp3q3z6Fnp5Lw3xHT4x8BRJVX68T
	9AfNbPFsjs+skqX4hSdvkXECAtDDh1E9BxO+5Xo=
X-Google-Smtp-Source: ABdhPJxSqqLO+4bzVyOTTUHqwonzoN89YZhtVWFa8r3CZO9Kk+UfK6ZdcRn2+aZFoqP86CdQ7Ar23WOhZX4bSSHcswc=
X-Received: by 2002:a2e:a5c6:: with SMTP id n6mr26659931ljp.204.1626792131304;
 Tue, 20 Jul 2021 07:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210718135633.28675-1-jandryuk@gmail.com> <24822.56879.260780.652184@mariner.uk.xensource.com>
In-Reply-To: <24822.56879.260780.652184@mariner.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 20 Jul 2021 10:41:59 -0400
Message-ID: <CAKf6xpsA80d+1zk1qQiTz_bRJ7Ke+2BZazQ4ghcYocDztfmzwg@mail.gmail.com>
Subject: Re: [PATCH] tests/xs: Check asprintf result
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, 
	Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 20, 2021 at 10:31 AM Ian Jackson <iwj@xenproject.org> wrote:
>
> Jason Andryuk writes ("[PATCH] tests/xs: Check asprintf result"):
> > Compiling xs-test.c on Ubuntu 21.04 fails with:
>
> Thanks.  However, your patch doesn't apply to staging; the files have
> been reorganised AFAICT.  Also, I think
>
>   93c9edbef51b31056f93a37a778326c90a83158c
>   tests/xenstore: Rework Makefile
>
> fixed this (with slightly different style, and despite not mentioning
> this change in the commit message)

Yes, that looks like it fixed it.

Sorry, I was working off a stale branch, so I didn't realize this was fixed.

Regards,
Jason

