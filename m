Return-Path: <SRS0=aHxP=YC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E24C47404
	for <xen-devel@archiver.kernel.org>; Wed,  9 Oct 2019 14:20:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51D4020B7C
	for <xen-devel@archiver.kernel.org>; Wed,  9 Oct 2019 14:20:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyEkZZc7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51D4020B7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iICpP-0007V5-J3; Wed, 09 Oct 2019 14:20:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Wiy=YC=gmail.com=joculator@srs-us1.protection.inumbo.net>)
 id 1iICpN-0007US-Ml
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 14:20:33 +0000
X-Inumbo-ID: efd55e20-ea9f-11e9-80e3-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efd55e20-ea9f-11e9-80e3-bc764e2007e4;
 Wed, 09 Oct 2019 14:20:26 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f5so2680728ljg.8
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2019 07:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ymknUH33Rb304RHiPhugySmwwZfHcvQEz4Gc9cR3kzs=;
 b=TyEkZZc7KLZ7vLnhxPb7d3+md3FwkBDIr070bOPKHI2BKuBvsRzjX6JmcwiV2YjXvr
 pCFNz+SAtNm8ueOyMenJRz4FnKKbWTOvj3/10pdX0ZrycNIfSs2DJjNBAve7h+bdgvx5
 kMdmOmB9N9DNBQg5gjEf65/qI0eDy0hDmChG61BhIbhvaKHfm/Qfn11WIhiJtoMkvt6F
 VC2tCTEaIwH+wQobhWasI54GfMxXApBu5hJbRJ9UsBoOB8X8h7SyNGbRk5thGJHgcAoG
 jKBPnpxlSlsQnfjVw+bo1Xo4I47wgtauNUbihXffnHK57b+UzkHv+jv1db+tvd8m7Esi
 aJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ymknUH33Rb304RHiPhugySmwwZfHcvQEz4Gc9cR3kzs=;
 b=YJncX4kEO2hwwPIMCef5yW6XqXiKXNdNE86hPYj2oG85wvShiyiYhiVoZEUZBe6G5w
 kAEAZtI6xvhcCGOEJeyHIW7fvGPjUEQDH5uHiaEchc7tUu1CE8Jm+7qxCwC8b+QxG0Db
 uBcQ285tygPLAO4waV3UUQwbMngEIQlaJF3de7sgtA794++zktKRz3TAY5xfXFgbd2zc
 HQI/v0Ej+h2jvg+SLPkpr5kAOFiX4BU4LiFn7iDB3Cgz7Q2LS/6e37wRWv7Ly6u3/G2w
 mdf3Q8I76NPXbG8Oehr3xV0O62jW8A/aNIcPkJjiR9kW6PlQph9d1Dm6vbDv3qj2Mx2s
 paOg==
X-Gm-Message-State: APjAAAVGTS3i7SpYbHOuNO6sXDMocXfmjSZ82TsJs6BZ9gWXYd3FjXpn
 tztAs2wOFpLRRAwa8VhokEgdoXCVcca5VQ==
X-Google-Smtp-Source: APXvYqx3EwmXWBXQ7J7TctRrteRPwO0+dyyFwa7GuYX/5e1+IdEI9Q+GyjO9T0rIfkBgXM9QrUkmyA==
X-Received: by 2002:a2e:9759:: with SMTP id f25mr2560650ljj.173.1570630824242; 
 Wed, 09 Oct 2019 07:20:24 -0700 (PDT)
Received: from EPUAKYIW0594.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id i142sm526702lfi.5.2019.10.09.07.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 07:20:23 -0700 (PDT)
From: Artem Mygaiev <joculator@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  9 Oct 2019 17:20:16 +0300
Message-Id: <bfa088ac3fc17b90c2ba953e56294e9b26e8f5cc.1570628924.git.artem_mygaiev@epam.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1570628924.git.artem_mygaiev@epam.com>
References: <cover.1570628924.git.artem_mygaiev@epam.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/3] Remove useless ASSERT condition
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
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <joculator@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Y250IGlzIHVuc2lnbmVkLCBzbyBhbHdheXMgPj0wCgpDb3Zlcml0eS1JRDogMTM4MTg0OApTaWdu
ZWQtb2ZmLWJ5OiBBcnRlbSBNeWdhaWV2IDxhcnRlbV9teWdhaWV2QGVwYW0uY29tPgotLS0KIHhl
bi9kcml2ZXJzL2NoYXIvc2NpZi11YXJ0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9jaGFyL3Nj
aWYtdWFydC5jIGIveGVuL2RyaXZlcnMvY2hhci9zY2lmLXVhcnQuYwppbmRleCBmYTBiODI3NGNh
Li45ZDNmNjZiNTViIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9jaGFyL3NjaWYtdWFydC5jCisr
KyBiL3hlbi9kcml2ZXJzL2NoYXIvc2NpZi11YXJ0LmMKQEAgLTIwNSw3ICsyMDUsNyBAQCBzdGF0
aWMgaW50IHNjaWZfdWFydF90eF9yZWFkeShzdHJ1Y3Qgc2VyaWFsX3BvcnQgKnBvcnQpCiAKICAg
ICAgLyogQ2hlY2sgbnVtYmVyIG9mIGRhdGEgYnl0ZXMgc3RvcmVkIGluIFRYIEZJRk8gKi8KICAg
ICBjbnQgPSBzY2lmX3JlYWR3KHVhcnQsIFNDSUZfU0NGRFIpID4+IDg7Ci0gICAgQVNTRVJUKCBj
bnQgPj0gMCAmJiBjbnQgPD0gcGFyYW1zLT5maWZvX3NpemUgKTsKKyAgICBBU1NFUlQoIGNudCA8
PSBwYXJhbXMtPmZpZm9fc2l6ZSApOwogCiAgICAgcmV0dXJuIChwYXJhbXMtPmZpZm9fc2l6ZSAt
IGNudCk7CiB9Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
