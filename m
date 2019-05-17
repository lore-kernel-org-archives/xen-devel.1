Return-Path: <SRS0=3Sku=TR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7F8C04AB4
	for <xen-devel@archiver.kernel.org>; Fri, 17 May 2019 11:50:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A69CD204FD
	for <xen-devel@archiver.kernel.org>; Fri, 17 May 2019 11:50:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t1fpoZP3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A69CD204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRbN7-0003JD-77; Fri, 17 May 2019 11:49:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FnXM=TR=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hRbN6-0003J8-Qf
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 11:49:56 +0000
X-Inumbo-ID: e39309c4-7899-11e9-8980-bc764e045a96
Received: from mail-it1-x130.google.com (unknown [2607:f8b0:4864:20::130])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e39309c4-7899-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 11:49:55 +0000 (UTC)
Received: by mail-it1-x130.google.com with SMTP id q132so11404340itc.5
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2019 04:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=yC7uVczQDm3c0wn2qbPoF3YO+Jtdz23qurF3YUdiVzM=;
 b=t1fpoZP36jg910zpow98WKrXOj6UHvTMfLHlVU4xFp2ApnQ0bvU++wWygWD30j5Nlx
 rOdHnQ5xftw0XVhdhnJo9TfHZzxud5UfrVnG0TKKwISEP4VUo1Pt2ICy18mjlMOYNUId
 HnG+uhiCeviGZfu4J4fjtoV6NrzHt506w46IyqGBjgMEauAHfACpJ4pSwrQqdKRSHbR0
 /WIthkkPxovrlcpGdegG158O0NHZLRMnT4xHfLmG60UCPNkUgAVBTRz5jJlxJhOy8dqq
 2FCMGQCEuJCCTkx2QehJOYPP97/R8p4mHy5e5WGglDAoenyq9P8I0NP9plKvRG14lPUR
 zSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=yC7uVczQDm3c0wn2qbPoF3YO+Jtdz23qurF3YUdiVzM=;
 b=pE2CnlwdT8ZvEsmwH5WOV1UCGinJni+G0DhBUXDetSpPZord7YlQhiQjztb73uU/Xs
 IBNk5WU5nuZhyUkK7SXchUZLpKW0RpPrf1V2txdu9OypECZIPhZnQwFxJP1D/qll1tmU
 QIVdTT/Vx2TYUdPu/UFFWKHLSDaTb0UJjdPj9vxzToRSlzvl+wbYPzlkLoLRPocgh0h1
 fcErbbs7jqMCmLX9ouBFnr3SKxZpnXk154gzmKPhaoJdUAzXgSL2qaE+sqFB9MXERTIt
 7va7QDPJhJ7TDsAI+0NDdj1sqy47JAVVU1q9b1SNi+ViRjsuKpUMsiqbC5JCMyOXTbiu
 gsfA==
X-Gm-Message-State: APjAAAWgMbOe59ZXVn/YSwmol0GojynhyoGivzbYkUmRQtUHWWi2YZJw
 fJov73UZBg8iRw4W00rm4m2vbBjpCcwrW2+67wk=
X-Google-Smtp-Source: APXvYqymEnys5vxjmzfsColDyYVrdAOusujHoaMK0MEL0BMvCf5H0a9ZPOLbLFoKfulH9D8jloOSBUjJebKuJToO5wc=
X-Received: by 2002:a24:440c:: with SMTP id o12mr2254616ita.145.1558093795224; 
 Fri, 17 May 2019 04:49:55 -0700 (PDT)
MIME-Version: 1.0
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Fri, 17 May 2019 14:49:44 +0300
Message-ID:
 <CAOcoXZYuwoFDKexde=BJgexsv=DN5u_Y8WdLcOgveC+GvEAiuA@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Campbell <Ian.Campbell@citrix.com>, xen-devel@lists.xenproject.org
Subject: [Xen-devel] libxc: memory leak in handle_hvm_context
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190517114944.2A_RPNcAVHTirni2V6mWz205cj-lHhi01lHNDK8rKik@z>

SGkgQWxsLAoKSXQgc2VlbXMgdGhlcmUgaXMgYSBtZW1vcnkgbGVhayBpbiBsaWJ4YyBmdW5jdGlv
biBoYW5kbGVfaHZtX2NvbnRleHQKKGluIGZpbGUgdG9vbHMvbGlieGMveGNfc3JfcmVzdG9yZV94
ODZfaHZtLmMuKS4gVGhlcmUgaXMgYSBtYWxsb2Mgb2YKdmFyaWFibGUgcCB3aXRob3V0IGZyZWUu
ClBsZWFzZSB0YWtlIGEgbG9vay4KCisvKgorICogUHJvY2VzcyBhbiBIVk1fQ09OVEVYVCByZWNv
cmQgZnJvbSB0aGUgc3RyZWFtLgorICovCitzdGF0aWMgaW50IGhhbmRsZV9odm1fY29udGV4dChz
dHJ1Y3QgeGNfc3JfY29udGV4dCAqY3R4LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IHhjX3NyX3JlY29yZCAqcmVjKQoreworICAgIHhjX2ludGVyZmFjZSAqeGNoID0gY3R4
LT54Y2g7CisgICAgdm9pZCAqcDsKKworICAgIHAgPSBtYWxsb2MocmVjLT5sZW5ndGgpOworICAg
IGlmICggIXAgKQorICAgIHsKKyAgICAgICAgRVJST1IoIlVuYWJsZSB0byBhbGxvY2F0ZSAldSBi
eXRlcyBmb3IgaHZtIGNvbnRleHQiLCByZWMtPmxlbmd0aCk7CisgICAgICAgIHJldHVybiAtMTsK
KyAgICB9CisKKyAgICBmcmVlKGN0eC0+eDg2X2h2bS5yZXN0b3JlLmNvbnRleHQpOworCisgICAg
Y3R4LT54ODZfaHZtLnJlc3RvcmUuY29udGV4dCA9IG1lbWNweShwLCByZWMtPmRhdGEsIHJlYy0+
bGVuZ3RoKTsKKyAgICBjdHgtPng4Nl9odm0ucmVzdG9yZS5jb250ZXh0c3ogPSByZWMtPmxlbmd0
aDsKKworICAgIHJldHVybiAwOworfQoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
