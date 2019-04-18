Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE78C282DA
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 01:52:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82FC0217FA
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 01:52:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Psn37fPs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82FC0217FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGwDn-0001tF-0t; Thu, 18 Apr 2019 01:52:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3KQ4=SU=gmail.com=dpsmith.dev@srs-us1.protection.inumbo.net>)
 id 1hGwDm-0001tA-3b
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 01:52:14 +0000
X-Inumbo-ID: 95723b1e-617c-11e9-92d7-bc764e045a96
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 95723b1e-617c-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 01:52:12 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id f13so192132qto.6
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2019 18:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ivI26akOyzNjxb/QZJE9El9S7eMR9ZQApKzypjYBa4Y=;
 b=Psn37fPswbl51YS7/4HLVAg/EzduT3uwpp/vrBcGa2RciSuyhorIhFgqKvmJuL2m1u
 u2vuWJzhP5xsXBXIvn10CfvEdVDJj5qzPMzl8GRIoILt/mRFILmEDK7e8P5euPZe3whD
 ahVxbfQZuUp6b6K4G2/potIO43rHN7IYyyG4KOPBHpkWfECI4vMpt1evixZQHp7wEz/T
 lTCCbq8ey2npLAjlPNWhXV+cc+Lgq3C9cN7q9y/ijiIBv1oQfDNE88ZHYiraLMyZ4WJx
 FdK5MJhK+DG0LmeAT7UTyUK6efQ7gVfmacCPEQtdiqg+8FT14BK0sQdTO0XsSyDn4h7e
 Zoig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ivI26akOyzNjxb/QZJE9El9S7eMR9ZQApKzypjYBa4Y=;
 b=bTyv0GM2xFn/klyqQnCOvYn0Dzy2Fkzewbmxz40rJNQPlWD+ofuLEIc0HTryDsT2gX
 tg9DBv5iWnEvizE+muAsx/1BXlHxIGJ7SVTQv+D/GakjE7qWE0sZ7MQVeUHj8o58dS3H
 ekr9x7Al6tjEdOq1LKGZW+qGOcvK78+pxUB8th/d2407zU74+2QslV7+2bWys6A+WF7n
 vunqzIWU+hALie9DBGc12rWP5H3srisroZBrD5NWbcXdXnID16oPUEBas4gKzMQo6sJS
 mOKgCRpkd7za4rUgNen3yhPeecNcV89q/rHwXHFPBlUpRFPcr3um10w0PaKr/4fOc7ZE
 rWXg==
X-Gm-Message-State: APjAAAW7Q6eGwmC9Sn6OUfrkTT4z4b3Yecode4ZrXjEg2pk1lWMIA+Kd
 gn9DsryIMdP1YrY3RX4ge10cm4a+
X-Google-Smtp-Source: APXvYqzJtssLQ/w/NWyYAO397w71b+NcVMpFJGDy5L8da8OxgEGn94ZV4j5c0mdUg1wiyDrw6O5zaQ==
X-Received: by 2002:a0c:b107:: with SMTP id q7mr76029715qvc.77.1555552331778; 
 Wed, 17 Apr 2019 18:52:11 -0700 (PDT)
Received: from localhost.localdomain (c-73-129-199-244.hsd1.md.comcast.net.
 [73.129.199.244])
 by smtp.gmail.com with ESMTPSA id j93sm323892qtd.82.2019.04.17.18.52.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Apr 2019 18:52:11 -0700 (PDT)
From: "Daniel P. Smith" <dpsmith.dev@gmail.com>
X-Google-Original-From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 17 Apr 2019 21:52:03 -0400
Message-Id: <20190418015203.1636-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH] golang/xenlight: Fixing compilation for go 1.11
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418015203.lHJWlmJDeRw_x0XUt4wTQADrNTZR21vpaiEXUFu1MiU@z>

VGhpcyBkZWFscyB3aXRoIHR3byBjYXN0aW5nIGlzc3VlcyBmb3IgY29tcGlsaW5nIHVuZGVyIGdv
IDEuMTE6Ci0gZXhwbGljaXRseSBjYXN0IHRvICpDLnhlbnRvb2xsb2dfbG9nZ2VyIGZvciBDdHgu
bG9nZ2VyIHBvaW50ZXIKLSBhZGQgY2FzdCB0byB1bnNhZmUuUG9pbnRlciBmb3IgdGhlIEMgc3Ry
aW5nIGNwYXRoCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgUC4gU21pdGggPGRwc21pdGhAYXBlcnR1
c3NvbHV0aW9ucy5jb20+Ci0tLQogdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIHwg
OCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gYi90b29s
cy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KaW5kZXggOWMzN2U1OWVjMC4uNDdiYjI3YTBm
OSAxMDA2NDQKLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCisrKyBiL3Rv
b2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwpAQCAtODU0LDcgKzg1NCw3IEBAIGZ1bmMg
KEN0eCAqQ29udGV4dCkgT3BlbigpIChlcnIgZXJyb3IpIHsKIAl9CiAKIAlyZXQgOj0gQy5saWJ4
bF9jdHhfYWxsb2MoJkN0eC5jdHgsIEMuTElCWExfVkVSU0lPTiwKLQkJMCwgdW5zYWZlLlBvaW50
ZXIoQ3R4LmxvZ2dlcikpCisJCTAsICgqQy54ZW50b29sbG9nX2xvZ2dlcikodW5zYWZlLlBvaW50
ZXIoQ3R4LmxvZ2dlcikpKQogCiAJaWYgcmV0ICE9IDAgewogCQllcnIgPSBFcnJvcigtcmV0KQpA
QCAtODY5LDcgKzg2OSw3IEBAIGZ1bmMgKEN0eCAqQ29udGV4dCkgQ2xvc2UoKSAoZXJyIGVycm9y
KSB7CiAJaWYgcmV0ICE9IDAgewogCQllcnIgPSBFcnJvcigtcmV0KQogCX0KLQlDLnh0bF9sb2dn
ZXJfZGVzdHJveSh1bnNhZmUuUG9pbnRlcihDdHgubG9nZ2VyKSkKKwlDLnh0bF9sb2dnZXJfZGVz
dHJveSgoKkMueGVudG9vbGxvZ19sb2dnZXIpKHVuc2FmZS5Qb2ludGVyKEN0eC5sb2dnZXIpKSkK
IAlyZXR1cm4KIH0KIApAQCAtMTE3MCw3ICsxMTcwLDcgQEAgZnVuYyAoQ3R4ICpDb250ZXh0KSBD
b25zb2xlR2V0VHR5KGlkIERvbWlkLCBjb25zTnVtIGludCwgY29uVHlwZSBDb25zb2xlVHlwZSkg
KHAKIAkJZXJyID0gRXJyb3IoLXJldCkKIAkJcmV0dXJuCiAJfQotCWRlZmVyIEMuZnJlZShjcGF0
aCkKKwlkZWZlciBDLmZyZWUodW5zYWZlLlBvaW50ZXIoY3BhdGgpKQogCiAJcGF0aCA9IEMuR29T
dHJpbmcoY3BhdGgpCiAJcmV0dXJuCkBAIC0xMTkwLDcgKzExOTAsNyBAQCBmdW5jIChDdHggKkNv
bnRleHQpIFByaW1hcnlDb25zb2xlR2V0VHR5KGRvbWlkIHVpbnQzMikgKHBhdGggc3RyaW5nLCBl
cnIgZXJyb3IpCiAJCWVyciA9IEVycm9yKC1yZXQpCiAJCXJldHVybgogCX0KLQlkZWZlciBDLmZy
ZWUoY3BhdGgpCisJZGVmZXIgQy5mcmVlKHVuc2FmZS5Qb2ludGVyKGNwYXRoKSkKIAogCXBhdGgg
PSBDLkdvU3RyaW5nKGNwYXRoKQogCXJldHVybgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
