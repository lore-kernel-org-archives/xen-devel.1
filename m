Return-Path: <SRS0=Sbqy=ZF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D54C432C3
	for <xen-devel@archiver.kernel.org>; Wed, 13 Nov 2019 21:15:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17CDD206EC
	for <xen-devel@archiver.kernel.org>; Wed, 13 Nov 2019 21:15:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlbCNQpo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17CDD206EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUzyT-0005us-7q; Wed, 13 Nov 2019 21:14:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QW09=ZF=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iUzyS-0005un-Lh
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 21:14:48 +0000
X-Inumbo-ID: 9efd9a7c-065a-11ea-b678-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9efd9a7c-065a-11ea-b678-bc764e2007e4;
 Wed, 13 Nov 2019 21:14:47 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v8so4212502ljh.5
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2019 13:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YmBTiS7L6bDl0YLxOPMoV1ZaSTgU6AW0PUv1e401Hdc=;
 b=jlbCNQpodw6Q3nrlbZryALrhMS1wykyrKNWP+dUvkDCg6M3Kah0ENiCcJxafTOxBlm
 No1OM4MfTa7/AXgaD7QcbXsey0cmVfrRZbfbTgwNVTvnhY75UfiyE4JWdtYeevuhNByv
 O4QtUE3J4q4WdinoxoNzsYhNGjkA+YFL+RXb2qG3P2QW6YoJs6EfOmlHJpdeXHiB4EWb
 vSUQxm6UKIskRzI0HwCRYiqk+RwIfp7ZaOEdQcUCjouxBgnTWcAFeSIl6AVr/gM0SwfN
 kxaJp9G7ASOSGbm5hjLnRnHwRBXKjRPE/FK5UguNCxg8lPlH8bq5GfYIdZiYNE6WYRgC
 I97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YmBTiS7L6bDl0YLxOPMoV1ZaSTgU6AW0PUv1e401Hdc=;
 b=DiINXowY/2prNt0YGD8hWVBElCYqEICGPkycMwolp2pjykYJgwo0Ns/nJDMsA6S4rD
 1pu1QVjQM7JSBFGUOQRnDAI61ldcKWeFaltCV272uk7wI1J6lGjzWEqlvxKgCEIuav/i
 HA8B4Ebu1q6m23TG08s/hiirsvWIBKpIwqnBi+o8QL79QB0IFBcw9y9UhdMUHRhuHgcV
 qcwsnnm+F7FcSBqKCnyRhZ2If2cBr7D8CfiCeiYWixqPXtZhPTaEoKijn76wBoMWFUQy
 f2YCzKpSUsNh4I4Z5s9YHsBjtQJkbrG5c1dNOGPc82zDnU79oR0guysZJX5qFsMgWaAZ
 eAKQ==
X-Gm-Message-State: APjAAAWP+6RFSCYJMI/SO6u2y/WHtLPUfNxl/4VbvaHkZx2bFSvHbSKv
 1TdjGkNeAMofvpxWK9ZtmSCosHUkFMcNRoUhsX0=
X-Google-Smtp-Source: APXvYqz6qhD1S11uAJ9bDbFuwMHRIju8yjOaTKpeETGx2gxmem1m+x3zJYoBAkqbMJChszEMVlRUkYXJis0GNG9O0lk=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr3662197ljh.44.1573679686802;
 Wed, 13 Nov 2019 13:14:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
 <1644cc12566ebdbcaddde8994a65dde029d0226a.1570456846.git.rosbrookn@ainfosec.com>
 <2ca88ca2-5147-9b4f-acde-16e98f98d2b0@citrix.com>
In-Reply-To: <2ca88ca2-5147-9b4f-acde-16e98f98d2b0@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Wed, 13 Nov 2019 16:14:35 -0500
Message-ID: <CAEBZRSehqZsLHS-KwYZXrPYypL_goGkwG4fqKc=RbaVy8=1ETQ@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH 07/24] golang/xenlight: define StringList
 builtin type
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

PiBEb2Vzbid0IHRoaXMgbWV0aG9kIHdhbnQgYSBwb2ludGVyIHJlY2VpdmVyPwoKWWVzLCBzaW5j
ZSBJJ20gYWxsb2NhdGluZyBhIG5ldyBzbGljZS4gSWYgSSB3YXNuJ3QgYWxsb2NhdGluZyBhIG5l
dwpzbGljZSwgdGhpcyB3b3VsZCBiZSBva2F5IHNpbmNlIHRoZSBzbGljZSBjb250YWlucyBhIHBv
aW50ZXIgdG8gdGhlCnVuZGVybHlpbmcgYXJyYXkuCgotTlIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
