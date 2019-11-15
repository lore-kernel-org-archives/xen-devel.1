Return-Path: <SRS0=w8Ow=ZH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B357C432C3
	for <xen-devel@archiver.kernel.org>; Fri, 15 Nov 2019 15:52:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCFC2206D3
	for <xen-devel@archiver.kernel.org>; Fri, 15 Nov 2019 15:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLp0hcDV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCFC2206D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVdt7-0000Gj-NU; Fri, 15 Nov 2019 15:51:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1SQg=ZH=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVdt6-0000Gd-CB
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 15:51:56 +0000
X-Inumbo-ID: d9098792-07bf-11ea-9631-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9098792-07bf-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 15:51:55 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y23so11171622ljh.10
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 07:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RdwKRbzFXIFFeT7V1ugGvBKAviV26iBMQZJpzeVfwmQ=;
 b=LLp0hcDVHmCtvRouu0NXpwu9oTInAA4SDJ5QTT00PI/cS3Y8idWa+r+9lQb0Pl83hq
 jLhnzG+nZUTXiTZo7pieV5DdXMcQ4VpDzi/gkIBdPMCpXzrf4C+7AGZ9UMqxrnVcJ9ly
 d/WrZMT8wlg81aOeZK33nREeuST/Z4ktEPfxlxsLVsVURuZviBoV/LgUE6FqqUFCT0ty
 W1KAz27SapHVxY0EDDj7PGLVvGXFhMjNBYPq7QErkDI+8NMmJVxM9BMNxtJnsvX8QeBc
 ItDsnwbt+EOtXPgfRJcHRBV7AkGWpsT0+uz86nhoLCVWLVQT/xG3nY/RdVOWCTI+Pw2S
 xLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RdwKRbzFXIFFeT7V1ugGvBKAviV26iBMQZJpzeVfwmQ=;
 b=KG4VgyAcqIbGwOTXi1jVsVyZEwi201UYyxo1udTuyRrIkP0ehezWTOExefC5rL79HF
 Buyu+7bA8Eo2sOlyDSY9UWutrYguBmQ7zY+8bJPFfK+s+jEwn9GzkcJgYQFC7/bMTLQa
 s9jB5zgVdwZNU7iFsCMU0jGbDKkiq5Ar8HkrFCJ2v1g07vRdVskdOaOnRd3oMa4JEkaK
 wvTwSe+kt10At+Ig65H/WzrWifOR9+zFkm8hrCxhEw95adFkzQ03ndWpucevzc906Me4
 3RTD33WPK91uot6H6H2FCY8Ptku/LVCLfEMkqtbKHTNcqpSrg8jx3wvFhVjskFN358KF
 P7QQ==
X-Gm-Message-State: APjAAAXyZPaZMURQmcXsoJOZQ+Q2StuvsMGOSqNtOOOYScTm49Wdj46Z
 NgTE30KyOtTT+3jXsRH4UIReaQyfnwqCZxUq2W4=
X-Google-Smtp-Source: APXvYqwTUdB7shxOS4rXjGY3LzQ5g5vxaMeFuAKrmIWZE276jx6rgxNywpeZ8xz+3nwB47wo2f2ILJqeJhEMUder9SQ=
X-Received: by 2002:a05:651c:95:: with SMTP id
 21mr11879143ljq.40.1573833114436; 
 Fri, 15 Nov 2019 07:51:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
 <5773984ae9308500183adde21cf25837bba39f7f.1570456846.git.rosbrookn@ainfosec.com>
 <ce6a58af-d269-5b70-b1bc-df5a7620c4b5@citrix.com>
 <CAEBZRSeDo2RO-VptW8hYOzh93M04pxxVL16dqoAcrLGm0MbFuA@mail.gmail.com>
 <9576102c-c20f-7d65-5b93-bd2632fde462@citrix.com>
 <CAEBZRSe_jGO3Gi1DPb9-mGoLKODTP4i02EPogSN5xD-sgvcUig@mail.gmail.com>
 <08de2754-c742-06df-3ac9-72ca81019e08@citrix.com>
In-Reply-To: <08de2754-c742-06df-3ac9-72ca81019e08@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Fri, 15 Nov 2019 10:51:43 -0500
Message-ID: <CAEBZRSdEVLOjEAsOntzkz4A82H+nm2=EPq5KXTx39BU7rQForA@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH 11/24] golang/xenlight: define
 CpuidPolicyList builtin type
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, kerriganb@ainfosec.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBZZXMsIGxldCdzIGRvIHRoYXQuCgpPa2F5LCB3aWxsIGRvLgoKQXMgYSBwb2ludCBvZiBjbGFy
aWZpY2F0aW9uLCBzaG91bGQgSSBiZSB3YWl0aW5nIHVudGlsIHlvdSd2ZSByZXZpZXdlZAphbGwg
cGF0Y2hlcyBpbiB2MSBiZWZvcmUgSSBzZW5kIHYyIG9mIHRoaXMgc2VyaWVzPyBPciBkbyB5b3Ug
cHJlZmVyCnRoYXQgSSBzZW5kIGEgdjIgdGhhdCBhZGRyZXNzZXMgeW91ciByZXZpZXcgc28gZmFy
PwoKVGhhbmtzLAotTlIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
