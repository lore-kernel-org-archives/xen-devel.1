Return-Path: <SRS0=RIB2=7F=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1123C433DF
	for <xen-devel@archiver.kernel.org>; Sat, 23 May 2020 16:49:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7444207F7
	for <xen-devel@archiver.kernel.org>; Sat, 23 May 2020 16:49:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9ovKB1E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7444207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcXK9-0001GC-9p; Sat, 23 May 2020 16:48:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9iM=7F=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jcXK8-0001G5-3A
 for xen-devel@lists.xenproject.org; Sat, 23 May 2020 16:48:36 +0000
X-Inumbo-ID: 3e05134c-9d15-11ea-b9cf-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e05134c-9d15-11ea-b9cf-bc764e2007e4;
 Sat, 23 May 2020 16:48:35 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id h188so8291628lfd.7
 for <xen-devel@lists.xenproject.org>; Sat, 23 May 2020 09:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dFe3xhhoFWohY7kyQoEsaym4h3cRs1TlV6VivlpKLzg=;
 b=N9ovKB1E+OxhCKcISs04gTOvKiXi8P5l8JpPVzKgdxWxuMxvIMPMe8ZliOGMpoRBQd
 yNMna47lrw1x4SlLZ41Q2Qs7kdRhDq0ToHGfgw3f/R/UPABS+pgFRtPrg1druccqU8dU
 frBpL/U/pfZh+H/1ChoDFrmHVkFLUAzHmd/kvu6Q/nHxd28u+y35NrHEXOgI4HgefVTr
 xU9vtGj6k7MRTi4vm+bLKYMVofDCV7PWns5nXAaTCf849ucWAv3XAp8Os4QDl9OS3unV
 DqVGcFF0pxHiOkGcfPoNz5FNJVtlsXHN5PSPs4stG+Qr6fWUo59go5/n82CxbUXmnuDk
 nkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dFe3xhhoFWohY7kyQoEsaym4h3cRs1TlV6VivlpKLzg=;
 b=HBR3w8BUZpMckntEdclD5FCYULTZlEeyp8yDuawDcn4un9cjrdLd+bxq7zfRLu5Xaj
 Zq5DLUOldhu7NX5Nl31v+gLMU1IIOAMMdaxBlKqVmgx8Aw7VjdcVC9hjlkVevJcXqJFq
 q5owMSXTfUz7UTGhK7WzOaZVKp0jMuoXCNLvgk1klwdVEbsBBg24kCLcV9ASe1ee4oR5
 MpVTEWeemZVfRjTrPlJXfJsvKds003tFH7g4Zb0mY08wA3aa/lnq/yEtdPhfZdIiXCw3
 1kEzKLNRA4n/0DOZth+9s2o1RLnRHTeO/SLWSfYcZuuoch8cf1PPdq0qeRbbWdYL3ujo
 kztA==
X-Gm-Message-State: AOAM532j1ct86q1l7wIxPq20LIW9FVxXRlxFkj2madt5xchhoSwAeOiK
 jzVoFWPKB36kKlokO8kiH1qqHWa6jFebe/+bvmg=
X-Google-Smtp-Source: ABdhPJy6GUvTW5Lz0tZHuLsinCQpNaxP+LehX/nbL5c9xVLhawjv0ptLRtZQcnH0dAKaIXxmuaSA7eYkYMBmgDbua6A=
X-Received: by 2002:a05:6512:3139:: with SMTP id
 p25mr10318594lfd.214.1590252514255; 
 Sat, 23 May 2020 09:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
 <20200522161240.3748320-5-george.dunlap@citrix.com>
 <CAEBZRSfF8KAnzz5LW8GhcuJu=2rex3d6bvgz=a7-kLMp-itjqQ@mail.gmail.com>
In-Reply-To: <CAEBZRSfF8KAnzz5LW8GhcuJu=2rex3d6bvgz=a7-kLMp-itjqQ@mail.gmail.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Sat, 23 May 2020 12:48:23 -0400
Message-ID: <CAEBZRScpycd2_A8moi68AA3asbsUSRjkW1kUVdpsdwgx-SZKpQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] golang/xenlight: Use XEN_PKG_DIR variable rather than
 open-coding
To: George Dunlap <george.dunlap@citrix.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> > Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> Reviewed-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Oh, I just noticed your commit message calls the variable
"XEN_PKG_DIR", but it's actually named "GOXL_PKG_DIR."

