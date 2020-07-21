Return-Path: <SRS0=Ywvf=BA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F651C433E3
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 10:52:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A6EE2073A
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 10:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A6EE2073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxpsq-0007Fk-S9; Tue, 21 Jul 2020 10:52:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXjz=BA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jxpsp-0007Ff-LH
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 10:52:27 +0000
X-Inumbo-ID: 431ae326-cb40-11ea-a09d-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 431ae326-cb40-11ea-a09d-12813bfff9fa;
 Tue, 21 Jul 2020 10:52:25 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id o11so20731861wrv.9
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 03:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=LOBSvIoSTI/YyYbDBxuuGau4sSa1XnEal6omX4ja83c=;
 b=JZaRrY+bK2jVEEOLlVzgVQ+0jUknwC4ZLQ3VtXhnQhYM4ogDYwBAk9mObVpPyG1fHH
 8uPe7loLxQgLh6AjchPkhdBcQNmiH8phNeGcdZ9CZtSBlXSmaRmOR5P1yBlbrb2Iivj4
 IYcft4cn95g++WTNols0Ye+A8+wjZmAVHOfVSfILgBmbDw/oDHzyPakNZVcyU9Hai3vs
 qc9sPwwb6lciinIK9Vn1pn0AOMkgWd+BTaCzFepXKZqAVWA/liEQB55ieJXT4EW7PIGD
 dCI8XzMRGNy6KNjS9uGD68nOj4E3OjtA9RnTB9+0WHW55tPDBq87bFjXlZmzDq9/HlHi
 ImbA==
X-Gm-Message-State: AOAM533Z3Y/zzOVXzlHNcp/vNCmSNJcXD8rM3R8oisVBw9/e/jV9Ae1Y
 g/btGRIbcpjmaDE8/zoASjI=
X-Google-Smtp-Source: ABdhPJydJzMphHAlzgjG4pRy5BGHruDzDy8FswiCqxvPTxmVlSk3arvzeJzOkmy9b9KbKNZasD6kZw==
X-Received: by 2002:adf:fc45:: with SMTP id e5mr14506576wrs.226.1595328744934; 
 Tue, 21 Jul 2020 03:52:24 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id g3sm42002405wrb.59.2020.07.21.03.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 03:52:24 -0700 (PDT)
Date: Tue, 21 Jul 2020 10:52:23 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 10/10] tools/proctrace: add proctrace tool
Message-ID: <20200721105223.ao3mlpabk77vufh6@liuwe-devbox-debian-v2>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <0ab003238e4e666d3847024b8917dbc11c40fecb.1593519420.git.michal.leszczynski@cert.pl>
 <241285fc-f8be-575f-8b2a-f5aa44b77d47@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <241285fc-f8be-575f-8b2a-f5aa44b77d47@citrix.com>
User-Agent: NeoMutt/20180716
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
Cc: tamas.lengyel@intel.com, Wei Liu <wl@xen.org>,
 =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>, luwei.kang@intel.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jul 02, 2020 at 04:10:57PM +0100, Andrew Cooper wrote:
[...]
> 
> > +#include <stdlib.h>
> > +#include <stdio.h>
> > +#include <sys/mman.h>
> > +#include <signal.h>
> > +
> > +#include <xenctrl.h>
> > +#include <xen/xen.h>
> > +#include <xenforeignmemory.h>
> > +
> > +#define BUF_SIZE (16384 * XC_PAGE_SIZE)
> 
> This hardcodes the size of the buffer which is configurable per VM. 
> Mapping the buffer fails when it is smaller than this.
> 
> It appears there is still outstanding bug from the acquire_resource work
> which never got fixed.  The guest_handle_is_null(xmar.frame_list) path
> in Xen is supposed to report the size of the resource, not the size of
> Xen's local buffer, so userspace can ask "how large is this resource".
> 
> I'll try and find some time to fix this and arrange for backports, but
> the current behaviour is nonsense, and problematic for new users.

I can't quite figure out if this is a blocking comment of this tool to
be accepted. Can you clarify?

Wei.

> 
> ~Andrew

