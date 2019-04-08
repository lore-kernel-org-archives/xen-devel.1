Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=CHARSET_FARAWAY_HEADER,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BCEC10F0E
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 02:18:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95DDE20880
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 02:18:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=qq.com header.i=@qq.com header.b="wvoAF9mt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95DDE20880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=qq.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDJqr-0006p6-Gz; Mon, 08 Apr 2019 02:17:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DryA=SK=qq.com=jinchen1227@srs-us1.protection.inumbo.net>)
 id 1hDJqp-0006oM-Kj
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 02:17:36 +0000
X-Inumbo-ID: 75c39a08-59a4-11e9-92d7-bc764e045a96
Received: from smtpbgau1.qq.com (unknown [54.206.16.166])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 75c39a08-59a4-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 02:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1554689831; bh=gLNG3cACHD1DrdnsIdj0VAZW6IIH5+bt158X8eFxkPg=;
 h=From:To:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
 b=wvoAF9mtBl/M/TytLZOt01rdBTW4Ad08P5/w3hUziEclSu/7lDmXNpDpPgd8ZP7L8
 Lc01/FKEM3N7Sygl73jQG0lyvqYhfoKqnABPofo8DixUG7ufXGK12luE9GHG/ZvtDU
 cBAeecUj7TIGt5xdFRehqT6qtvDddNjghjgFRkcg=
X-QQ-FEAT: Tas2jRaQZEOS7Dhwgt9LTvHRfctZfgC++PKlhcFYajWV6wbxfslbdLZWy2TOQ
 MDEpWPNS8yMmyXXwWS3DwWI2AxMtX0zBeU1dofcBYMkjmT+UpWJYZlrPluxmOHrk5DQUmcM
 V7kZgNtzxsEriHYnZJ17xXlrxnT5IcClr1tnE/FdgzZuSCzTYhBIm7kSAFxkJ+XVI4qTXuX
 g2Wt9fg7wh6I2Nos2/KFpfQ/SY4w7HGmarbgRLOcgtLg1TyJOaRzciit+VJgjQ2qtCreZmj
 lbnDEQrfq0r3qE
X-QQ-SSF: 000000000000009000000000000000Z
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 59.46.204.244
X-QQ-STYLE: 
X-QQ-mid: webmail154t1554689830t4609150
From: "=?gb18030?B?amluY2hlbg==?=" <jinchen1227@qq.com>
To: "=?gb18030?B?eGVuLWRldmVs?=" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Date: Mon, 8 Apr 2019 10:17:10 +0800
X-Priority: 3
Message-ID: <tencent_DA6EA655E660F6F60C353F2674306A989F0A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Mon, 08 Apr 2019 10:17:10 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign4
X-QQ-Bgrelay: 1
Subject: [Xen-devel] Xen ARM dom0less use PV drivers
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
Content-Type: multipart/mixed; boundary="===============9096935334659125961=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408021710.QslPqOl-4PXdxBTDq5zS5C9mcgu3iWnQhrqN5pL2EPQ@z>

This is a multi-part message in MIME format.

--===============9096935334659125961==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5CAAAF26_0AD973C8_78685994"
Content-Transfer-Encoding: 8Bit

This is a multi-part message in MIME format.

------=_NextPart_5CAAAF26_0AD973C8_78685994
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGVsbG8gZXhwZXJ0czoNCiAgICBUaGUgeGVuIDQuMTIgc3VwcG9ydCB0aGUgRG9tMGxlc3Mg
Vk0gdGhhdCBzdGFydCBkb211IGZyb20geGVuIG5vdCB4bCwgYnV0IHRoZSBQViBkcml2ZXJz
IGhhc24ndCBiZWVuIHN1cHBvcnRlZC4NCiAgICAgRG8geW91IGhhdmUgc29tZSBndWlkYW5j
ZSBmb3IgaG93IHRvIGVuYWJsZSBQViBkcml2ZXJzIHdoZW4gdXNpbmcgZG9tMGxlc3M/IA0K
ICAgIER1ZSB0byBrZXJuZWwgdXNlIHhlbmJ1cyBhbmQgeGVuc3RvcmUgdG8gcHJvYmUgUFYg
ZHJpdmVycywgdGhlc2UgbWVjaGFuaXNtIHNob3VsZCByZW1haW4gZm9yIGNvbXBhdGliaWxp
dHk/DQogICAgUmVtb3ZhbCB0aGUgeGVuc3RvcmUgbWVjaGFuaXNtIHRvIHhlbiBpbnRlcm5h
bCBvciBzb21lIG90aGVyIHdheT8NCiAgICBUaGFuayB5b3UgdmVyeSBtdWNoo6E=

------=_NextPart_5CAAAF26_0AD973C8_78685994
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PGRpdj5IZWxsbyBleHBlcnRzOjwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwOyBUaGUgeGVuIDQu
MTIgc3VwcG9ydCB0aGUmbmJzcDs8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IHNhbnMtc2Vy
aWY7IGZvbnQtc2l6ZTogMTIuN3B4OyI+RG9tMGxlc3MgVk0gdGhhdCBzdGFydCBkb211IGZy
b20geGVuIG5vdCB4bCwgYnV0IHRoZSBQViBkcml2ZXJzIGhhc24ndCBiZWVuIHN1cHBvcnRl
ZC48L3NwYW4+PC9kaXY+PGRpdj48Zm9udCBmYWNlPSJzYW5zLXNlcmlmIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOiAxMi43cHg7Ij4mbmJzcDsgJm5ic3A7ICZuYnNwOzwvc3Bhbj48L2Zv
bnQ+RG8geW91IGhhdmUgc29tZSBndWlkYW5jZSBmb3IgaG93IHRvIGVuYWJsZSBQViBkcml2
ZXJzIHdoZW4gdXNpbmcgZG9tMGxlc3M/Jm5ic3A7PC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7
IER1ZSB0byBrZXJuZWwgdXNlIHhlbmJ1cyBhbmQgeGVuc3RvcmUgdG8gcHJvYmUgUFYgZHJp
dmVycywgdGhlc2UgbWVjaGFuaXNtIHNob3VsZCZuYnNwO3JlbWFpbiBmb3IgY29tcGF0aWJp
bGl0eT88L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgUmVtb3ZhbCB0aGUgeGVuc3RvcmUgbWVj
aGFuaXNtIHRvIHhlbiBpbnRlcm5hbCBvciBzb21lIG90aGVyIHdheT88L2Rpdj48ZGl2PiZu
YnNwOyAmbmJzcDsgVGhhbmsgeW91IHZlcnkgbXVjaKOhPC9kaXY+

------=_NextPart_5CAAAF26_0AD973C8_78685994--





--===============9096935334659125961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9096935334659125961==--




