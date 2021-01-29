Return-Path: <SRS0=v1SG=HA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EADC433E0
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 20:12:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97B2964E04
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 20:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97B2964E04
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zededa.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.78490.142802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5a7p-000170-Mk; Fri, 29 Jan 2021 20:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78490.142802; Fri, 29 Jan 2021 20:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5a7p-00016t-J8; Fri, 29 Jan 2021 20:12:13 +0000
Received: by outflank-mailman (input) for mailman id 78490;
 Fri, 29 Jan 2021 20:12:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fMc6=HA=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1l5a7o-00016o-RR
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 20:12:12 +0000
Received: from mail-qk1-x733.google.com (unknown [2607:f8b0:4864:20::733])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 014ceb0e-14d2-444b-99e7-b9aa3a5f0a81;
 Fri, 29 Jan 2021 20:12:12 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id t63so9998241qkc.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 12:12:12 -0800 (PST)
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
X-Inumbo-ID: 014ceb0e-14d2-444b-99e7-b9aa3a5f0a81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=7+ZPBD93wU9Oq4PyTgn3HqsJ99mpynfKlSUpq0XM4mA=;
        b=ZwpCsp/2soyh1nf7wf2dt+3jtCy9QUb5FThVpFlzJgQpFwZceTb5d6jMtgktDfraMe
         9Xx9RSlMBZRT2aeqxkFG+4IZqUVhtxXdeysNaP2imXXfBVFEN1xE5e6Ptc385rIzLXV2
         GCweOh48HnOYh8mWlTeTPYy8WP8nxlpXJ75UrZQr5ywJGDZMRDZJ4b9glvgUyGSLVygi
         30XWjExvPdLBFA6vxfFxNxil5atVrrQ/OHqLnHPBAnl0lDF+DE4JbseyF+zVK1/obXDa
         u65LvlHkOFuqyeDhPNpCggYNsFnFXZHR3fVuoc32dtO8dBPSgdlPx6fh+xPh3AjkCmYB
         BcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=7+ZPBD93wU9Oq4PyTgn3HqsJ99mpynfKlSUpq0XM4mA=;
        b=EajiDEMlcevfAExjRtCVtpjBEbGxLyr3wjnCKrsZW69u1/vBtzdOw2Oq2opj9w4f+L
         Iyx9goPoFZojOBZDBe7gA6Qh0QCX/v0JtABk7+VOgwRquS7A/12x2uRiJ1F7bK+k6+BR
         u5rzNY6DKMSCFO6qXVN0SQ6Mqv0A5IEUraQMnTsDRh20Mzob2PftBno0zPJb/Ast57zF
         kWe4YSUqdROrUrHsb8BypSunQvzE/aH5sLF3ZHuE4MijF1Mes8LqRlqBFmylazFR7qtP
         VqFhhipeH3DUaOg/5h67WufMsLDtP+W1NOMQNwgIBHgsXsnOlEoWdLKNa3ASxt1IMsl8
         GFYQ==
X-Gm-Message-State: AOAM532quRmkEt6lQ6m2MRunUNJ1YgpQU7XqccydUAt1FDpLaBgxkT2s
	ZVxuaIOpGLNBhqdJOzVutE+lsBkMFvPsanpPYJTBRJ2xJW/AUQ==
X-Google-Smtp-Source: ABdhPJxIpGaRWNsnBay2Smeu9zsMG4x6baJWWxxat1mxwopNoRFNpl3EkyQy4TdOdsLDiV+SQBSeuQDRy+yn9iBmhD8=
X-Received: by 2002:a37:6f42:: with SMTP id k63mr5659469qkc.291.1611951131237;
 Fri, 29 Jan 2021 12:12:11 -0800 (PST)
MIME-Version: 1.0
From: Roman Shaposhnik <roman@zededa.com>
Date: Fri, 29 Jan 2021 12:12:00 -0800
Message-ID: <CAMmSBy-wXf+YHa_m1N37537EQfUrs8RVi2i=Ur6yXGtJV_bCgQ@mail.gmail.com>
Subject: Troubles analyzing crash dumps from xl dump-core
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi!

I'm trying to see how much mileage I can get out of
crash(1) 7.2.8 (based on gdb 7.6) when it comes to
analyzing crash dumps taken via xl dump-core (this
is all on x86_64 with stock Xen v. 4.14).

The good news is that the image actually does load
up but it throws the following WARNINGs in the process:

WARNING: cannot access vmalloc'd module memory
crash: read error: kernel virtual address: ffffffff93613480  type:
"fill_task_struct"
WARNING: active task ffffffff93613480 on cpu 0 not found in PID hash
crash: read error: kernel virtual address: ffffffff93613480  type:
"fill_task_struct"
WARNING: cannot read log_buf contents

And then the info that it gives me around basic things like
ps, mod, log, etc. is really super limited (and I am now suspecting
may even be wrong).

Since I was primarily after dmesg/log initially, I tried:
crash> log
log: WARNING: cannot read log_buf contents

Then I tried taking an xl dump-core from the domU that was still
very much alive and happy and got similar results -- so it clearly
doesn't seem to be related to the state domU is in.

As matter of fact, I actually got to the desired dmesg output
by simply running strings(1) on the core file -- so the info is
definitely there -- but I guess some kind of index/reference maybe
broken.

With all that in mind, if there's anyone on this ML who has recently
done Xen DomU crash dump analysis -- I would definitely appreciate
the pointers!

Thanks,
Roman.

