Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7BAC10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:15:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B89620880
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:15:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2FPfUNd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B89620880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDRIy-0003r4-6G; Mon, 08 Apr 2019 10:15:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=agIW=SK=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hDRIw-0003pk-OR
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 10:15:06 +0000
X-Inumbo-ID: 2d640ea3-59e7-11e9-92d7-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2d640ea3-59e7-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 10:15:05 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u21so9080210lfu.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2019 03:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=P3l/nj+0GS/vwoC9GtsDqRnHHzqQeOcfUGS3QkNpkeE=;
 b=s2FPfUNdji8HAwA/0j0wCrWRJbbH+rpSgAjGRXp+DOu5a4CCWazaU+AnuFpEonhmT1
 1Ho+HY+Col9sOt1HY8w9l8uJetNII5bh8s39CSfnkHQQ7MRyhjm+WyZodKC+IRASZRs4
 j3i7XDwWxdfTcL2MpDh0nmqUR/gfv5EuadkxxwhiuI4y8S77CfmoKUsevLeJgn/daVIu
 4Ni+1OzJfVemp7gpsrj0tXO0NRlfwsZJk95AiEK9qN4zcb+BdMTzi/hDPOkjLzjbNoOL
 4weDUx2QqnGMH9yJU/8/vgZ7KcwxMVVgaszOyP830VcPHdvnK7yYt1og6qP0Jot+XLyI
 n5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=P3l/nj+0GS/vwoC9GtsDqRnHHzqQeOcfUGS3QkNpkeE=;
 b=WB4iQmCChoCASl2RzWJguDAz+0CbtsKzRlb3xq7TxhuvDCoftBSEJ3ZCtdBRbu3eT5
 blJBewGXp2JOSqzsPd18IM2oTO+6Uwg057pkNmUexrZd4bILVDZcaGdAdfJ6Le2RMfG1
 zmGuutVw2PbszJAyEpF+g+XLKDKqrUZOW1BuMEJl/T/93KS9R9g7w3pz44m0cMT2sIem
 5yNdVYss2qZgOQJ2CsJCq1Lhp3Tmpz3P9xiBcVps7wmIKO7XdVq/8VE8WIuuCaqAA0tc
 CzE3mN3ir2IPY+mg3QrgpwD6z1vet6+mcern3HX972/hIaPgjavWNafs2QPS166qly/W
 IHMA==
X-Gm-Message-State: APjAAAXaPAaiw1EJaGtqOyXWBp8DFLxzr93Zqx3zQAwmXI93K5j65VZH
 UcFFHldX5gtdBZs+CX/Qi7D+rY8ll7s=
X-Google-Smtp-Source: APXvYqyx9CeZBktJ6SRWIEZl1FD+8/eXAwTLcTknnmzFeUotIHkCmIhns/Q+ZMfhZjGKPabO1d5v9Q==
X-Received: by 2002:ac2:43c4:: with SMTP id u4mr10090557lfl.35.1554718503878; 
 Mon, 08 Apr 2019 03:15:03 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id x30sm6275717ljd.38.2019.04.08.03.15.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 08 Apr 2019 03:15:03 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  8 Apr 2019 13:14:49 +0300
Message-Id: <1554718489-11318-6-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554718489-11318-1-git-send-email-olekstysh@gmail.com>
References: <1554718489-11318-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [PATCH V3 5/5] xen/arm: Add early printk support for
 SCIFA compatible UARTs
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408101449.etKgNwjIbP9CQ65JzcoQqgVPlLbz0J4WI9MJl1Km-PI@z>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKVGhpcyBwYXRjaCBtYWtlcyBwb3NzaWJsZSB0byB1c2UgZXhpc3RpbmcgZWFybHkgcHJpbmsg
Y29kZQpmb3IgUmVuZXNhcyAiU3RvdXQiIGJvYXJkIGJhc2VkIG9uIFItQ2FyIEgyIFNvQyAoU0NJ
RkEpLgoKVGhlICJFQVJMWV9QUklOVEtfVkVSU0lPTiIgZm9yIHRoYXQgYm9hcmQgc2hvdWxkIGJl
ICdBJzoKQ09ORklHX0VBUkxZX1BSSU5USz1zY2lmLDB4ZTZjNDAwMDAsQQoKU2lnbmVkLW9mZi1i
eTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgpD
QzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBp
biB2MzoKICAgICAgICAtIEl0IHdhcyBkZWNpZGVkIG5vdCB0byBpbnRyb2R1Y2UgbmV3IGRlYnVn
LXNjaWZhLmluYwogICAgICAgICAgZm9yIGhhbmRsaW5nIFNDSUZBIGludGVyZmFjZSwgYnV0IHRv
IGV4dGVuZCBleGlzdGluZwogICAgICAgICAgZGVidWctc2NpZi5pbmMgZm9yIGhhbmRsaW5nIGJv
dGggaW50ZXJmYWNlcy4KICAgICAgICAgIFRoaXMgcGF0Y2ggaXMgYSByZXN1bHQgb2Ygc3BsaXR0
aW5nIGFuIGluaXRpYWwgcGF0Y2gKICAgICAgICAgICJ4ZW4vYXJtOiBBZGQgU0NJRkEgVUFSVCBz
dXBwb3J0IGZvciBlYXJseSBwcmludGsiCiAgICAgICAgICBhbmQgb25seSBhZGRzIGEgc3VwcG9y
dC4KLS0tCiB4ZW4vYXJjaC9hcm0vYXJtMzIvZGVidWctc2NpZi5pbmMgfCA5ICsrKysrKy0tLQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvZGVidWctc2NpZi5pbmMgYi94ZW4vYXJjaC9hcm0vYXJt
MzIvZGVidWctc2NpZi5pbmMKaW5kZXggYThkMmVhZS4uOTRhMThlYSAxMDA2NDQKLS0tIGEveGVu
L2FyY2gvYXJtL2FybTMyL2RlYnVnLXNjaWYuaW5jCisrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9k
ZWJ1Zy1zY2lmLmluYwpAQCAtMSw3ICsxLDcgQEAKIC8qCiAgKiB4ZW4vYXJjaC9hcm0vYXJtMzIv
ZGVidWctc2NpZi5pbmMKICAqCi0gKiBTQ0lGIHNwZWNpZmljIGRlYnVnIGNvZGUKKyAqIFNDSUYo
QSkgc3BlY2lmaWMgZGVidWcgY29kZQogICoKICAqIE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVr
c2FuZHIudHlzaGNoZW5rb0BnbG9iYWxsb2dpYy5jb20+CiAgKiBDb3B5cmlnaHQgKEMpIDIwMTQs
IEdsb2JhbGxvZ2ljLgpAQCAtMjIsMTAgKzIyLDEzIEBACiAjaWZkZWYgRUFSTFlfUFJJTlRLX1ZF
UlNJT05fTk9ORQogI2RlZmluZSBTVEFUVVNfUkVHICAgIFNDSUZfU0NGU1IKICNkZWZpbmUgVFhf
RklGT19SRUcgICBTQ0lGX1NDRlREUgorI2VsaWYgRUFSTFlfUFJJTlRLX1ZFUlNJT05fQQorI2Rl
ZmluZSBTVEFUVVNfUkVHICAgIFNDSUZBX1NDQVNTUgorI2RlZmluZSBUWF9GSUZPX1JFRyAgIFND
SUZBX1NDQUZURFIKICNlbmRpZgogCiAvKgotICogU0NJRiBVQVJUIHdhaXQgVUFSVCB0byBiZSBy
ZWFkeSB0byB0cmFuc21pdAorICogU0NJRihBKSBVQVJUIHdhaXQgVUFSVCB0byBiZSByZWFkeSB0
byB0cmFuc21pdAogICogcmI6IHJlZ2lzdGVyIHdoaWNoIGNvbnRhaW5zIHRoZSBVQVJUIGJhc2Ug
YWRkcmVzcwogICogcmM6IHNjcmF0Y2ggcmVnaXN0ZXIKICAqLwpAQCAtMzcsNyArNDAsNyBAQAog
LmVuZG0KIAogLyoKLSAqIFNDSUYgVUFSVCB0cmFuc21pdCBjaGFyYWN0ZXIKKyAqIFNDSUYoQSkg
VUFSVCB0cmFuc21pdCBjaGFyYWN0ZXIKICAqIHJiOiByZWdpc3RlciB3aGljaCBjb250YWlucyB0
aGUgVUFSVCBiYXNlIGFkZHJlc3MKICAqIHJ0OiByZWdpc3RlciB3aGljaCBjb250YWlucyB0aGUg
Y2hhcmFjdGVyIHRvIHRyYW5zbWl0CiAgKi8KLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
