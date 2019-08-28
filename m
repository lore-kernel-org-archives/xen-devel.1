Return-Path: <SRS0=zV8R=WY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD3CC3A5A1
	for <xen-devel@archiver.kernel.org>; Wed, 28 Aug 2019 07:50:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCC6320679
	for <xen-devel@archiver.kernel.org>; Wed, 28 Aug 2019 07:50:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QnQgrVVW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCC6320679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2siR-0008KU-3z; Wed, 28 Aug 2019 07:50:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zl4Q=WY=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1i2siP-0008D3-RO
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 07:50:01 +0000
X-Inumbo-ID: 7013b8ec-c968-11e9-951b-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7013b8ec-c968-11e9-951b-bc764e2007e4;
 Wed, 28 Aug 2019 07:50:01 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id z17so1700946ljz.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2019 00:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=unfCf2a7pZi7A8ypubsraAEz1WMd7Cv01j2d9P75Hb4=;
 b=QnQgrVVWBOe/LIVSQud6HAewleR7pzO9b4Dm01RbcLjFwVcoUIExne1rE6Ac8SI7TY
 nsCAzoObbAdgvUM0p6LTGzrG+0T76Eft+zZA/QIgbsWldxCT0UwdWeK9rww/fbecB5Oz
 m8aX976L33xTWcRygkrD6SxqbJvHyY8chpUC9Gla7LEdAvjb15x7FeDfb94ij4wCemU6
 AKZCMzZLZ8mCogo9r7zMjKbCv/+5xb+uhxpQdpPjIQiSnXlJSLYiZ/HIFY5nJaAOb4RN
 ckziwvLQpwcRPvPAtjicMpbJ+3/rsFZ63mMNkOs4uphUfC2G9Cx7nTCl3CxHg3n2KAuE
 mSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=unfCf2a7pZi7A8ypubsraAEz1WMd7Cv01j2d9P75Hb4=;
 b=t85idCfM+ylcmb96raN1KAw3F5mGWGg+awo0QQaTl8lmvBjqfQC4A4JFncx/aTyUsd
 r9tNZ5P/LGUgeEHybw6cVvnp+sRhvwU2OXsfSz/v2b51L3peYZlefkUS1Pzm09oKhije
 GciiPkZAuUOgrQtkRfvdB29H8P3Gvd3w+y/SBhkVAcmb4Vay83DW9OsUVtBps1Fa+qZf
 1kXBY89jZo4nI5nYiLjbazE6jEHvvAaj9t1zEnQDk4jl48W03Df/WbxUb34P/XbCmEoS
 I4+L/pRkUvUy6dSJig13TR0nlQEvlqLrwnu0N2WsbakP/H+r/MTqpMHoqUscjGSILi0k
 Zogw==
X-Gm-Message-State: APjAAAUhqI8xsfeDvWLmogJGYOSutge1fsm/i16j8MJjAPhwZfGkmg29
 SSyvQKbhGIOIBeT7Xw9WL63aHgqBfAA=
X-Google-Smtp-Source: APXvYqyHEmzXJ1R1jCL5bi+dVj7Z2Q1p9fNVUSfUjh7NxCZOnGMUYDl751HS/Iih53eMIDBOxK+BGw==
X-Received: by 2002:a2e:3608:: with SMTP id d8mr1337077lja.140.1566978599397; 
 Wed, 28 Aug 2019 00:49:59 -0700 (PDT)
Received: from [10.17.180.84] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 b2sm416298lje.98.2019.08.28.00.49.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Aug 2019 00:49:58 -0700 (PDT)
To: Julien Grall <Julien.Grall@arm.com>
References: <1566923614-12503-1-git-send-email-andrii.anisov@gmail.com>
 <b16ba4e7-fc3c-2546-6442-6ad32255e5ff@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <77348510-78b8-f2a9-f035-3d29fc799915@gmail.com>
Date: Wed, 28 Aug 2019 10:49:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b16ba4e7-fc3c-2546-6442-6ad32255e5ff@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] arm/traps.c: Adjust HPFAR_EL2 representation
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, nd <nd@arm.com>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyNy4wOC4xOSAyMDoxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgoKPiBBIG1vcmUgY29tcGxl
dGUgcGF0Y2ggKGZpeCBhbm90aGVyIHBsYWNlKSBoYXMgYWxyZWFkeSBiZWVuIHNlbnQgb24gdGhl
Cj4gbWFpbGluZyBsaXN0IChzZWUgWzFdKS4gSXQgaXMgd2FpdGluZyBvbiBTdGVmYW5vJ3MgYWNr
IGF0IHRoZSBtb21lbnQuLi4KPiAKPiBDaGVlcnMsCj4gCj4gWzFdCj4gaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA4L21zZzAxNDM5Lmh0
bWwKCkFoLCB5ZXMuIE1pc3NlZCBpdC4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
