Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739F2C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 06:40:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D2242073F
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 06:40:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=correo-udistrital-edu-co.20150623.gappssmtp.com header.i=@correo-udistrital-edu-co.20150623.gappssmtp.com header.b="QCIy9A0i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D2242073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=correo.udistrital.edu.co
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGHlL-00066E-BO; Tue, 16 Apr 2019 06:40:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lFdp=SS=correo.udistrital.edu.co=daparrag@srs-us1.protection.inumbo.net>)
 id 1hGHlJ-000663-O1
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 06:40:09 +0000
X-Inumbo-ID: 7970c4c0-6012-11e9-92d7-bc764e045a96
Received: from mail-lj1-x232.google.com (unknown [2a00:1450:4864:20::232])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7970c4c0-6012-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 06:40:08 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id h16so17988892ljg.11
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2019 23:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=correo-udistrital-edu-co.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=5s8MQoBp93WCNf+EWXzeJcO97IhD6o/wSIT4Bwnyp1k=;
 b=QCIy9A0iSCKhhKb6tqw8oLbnKsyq1xS2cqTxJcf62XTAytQ0NV0vJD/+kqtO7AB064
 3MEdTEy6qx+a60ijvuoJK2KYxEDneIIQ6lIx53ewiK9NnqyuKdYst3vn6AMeFEtTJnR6
 9Hwl62Joshy/CV9boHYCrzQ/oTF8ocAxMDWuxqWBJ+G5ZLsFw/p/Woo77vtw6KiGDBpd
 Mft/8iEzwjOBfRPr8QfAAnq9MXcJs7HwXptdX+vT3nu5fLyTnJfkV3X71EwSydwpHnLG
 3joR/AfpeDvwzuiKx6qH18IGkFNa7fpTMiW7ch8n3bsO2mBvqBIoQyuVmBt4+2di650e
 /R5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=5s8MQoBp93WCNf+EWXzeJcO97IhD6o/wSIT4Bwnyp1k=;
 b=bXF6A7HoJND7qVaOe01/+acteMcJGIfitOjYJJ0XZ5BgUdE8+Q8ULBPgwTeSob87eg
 snKvyCHqcOa/V5KzERfmKIsBVkxu8OLB+L53NuKvtr0BuWVBxdKdqisyTu/W16k7P9KW
 DEhOtsFUiRPj7jiiMFmOsAbWBy6IXdcEJPJFHy2eEzKQjHRdR1F7hmjZUmEtpS8LWmPA
 VD4T1PuCy8HpdvommY0mO0J3wBK2ukM0cHWtoIb5n6mazNMdgAqhsK3tduM9W3J3FchO
 RiuA5v7GLt6B7uklM/jiFH+9WD6LqgnTyNoFs52QkC5B70T4+Hi1CHwGroJqWqtpNxLE
 4TEw==
X-Gm-Message-State: APjAAAUMkUd9/HHH9F2L2+VMyq0NR+wiUF0zBhS4aim4zBfQSDQy1uM/
 WEzxk+c/LFq6pILgxyMzrzZ41+DEs8Znm071kdEWtIqtL3g=
X-Google-Smtp-Source: APXvYqyXbvB6FC/6YDu0cYlDLgnpgSUe7YqE9qEw4ItwsTaHxGfyQSGA49vyR1FErFSVNjhHnWlsRCGXmz/oTy2lrdE=
X-Received: by 2002:a2e:960b:: with SMTP id v11mr29942373ljh.135.1555396806718; 
 Mon, 15 Apr 2019 23:40:06 -0700 (PDT)
MIME-Version: 1.0
From: Diego Alejandro Parra Guzman <daparrag@correo.udistrital.edu.co>
Date: Tue, 16 Apr 2019 08:39:56 +0200
Message-ID:
 <CAMWmVVCqj0b1ck-WNJmUjerHqA5N2JoTOMNsLd_Lni_gES+cXw@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [Xen-devel] xen COMPAT definition
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416063956.KPaPNGNibdlSlrFKtkgFKRtsCJpFVPFOfnoz6Wj7xTI@z>

SGkgZ3V5cy4KCkN1cnJlbnRseSBJbSB3b3JraW5nIHdpdGggeGVuIHNvdXJjZSBjb2RlLCB0cmlu
ZyB0byBpbmNsdWRlIG5ldwpmdW5jdGlvbmFsaXR5OyBpbiBzcGVjaWZpY3QsIEltIHdvcmtpbmcg
d2l0aCB4ZW5vcHJvZi4gQnV0LCBJJ3ZlIGZvdW5kCnNvbWUgY29tcGlsYXRpb24gcHJvYmxlbXMg
IGR1ZSB0byB0aGUgZmxhZyAjZGVmaW5lIENPTVBBVC4KCmhlcmUgbXkgcXVlc3Rpb25zOgoKV2hh
dCAgdGhlIENPTVBBVCBkZWZpbml0aW9uIGRvZXM/ClByb3MgYW5kIENvbnMgb2YgQ09NUEFUIGVu
YWJsZS9kaXNhYmxlPwpIb3cgdG8gRU5BQkxFL0RJU0FCTEUgdGhhdCBmbGFnPwpob3cgQ09NUEFU
IGFmZmVjdHMgeGVub3Byb2Y/CmhvdyBDT01QQVQgYWZmZWN0cyBhcm02NCBjcm9zcyBjb21waWxh
dGlvbj8KClRoYW5rIHlvdS4KCmNoZWVycwpEaWVnbwoKCgoKLS0gCkRpZWdvIEFsZWphbmRybyBQ
YXJyYSBHdXptw6FuCkVzdHVkaWFudGUgZGUgaW5nZW5pZXLDrWEgZWxlY3Ryw7NuaWNhClVuaXZl
cnNpZGFkIGRpc3RyaXRhbCBGSkMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
