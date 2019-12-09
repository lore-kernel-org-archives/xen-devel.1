Return-Path: <SRS0=O6u+=2A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A152DC3F68F
	for <xen-devel@archiver.kernel.org>; Tue, 10 Dec 2019 05:30:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CD62206E0
	for <xen-devel@archiver.kernel.org>; Tue, 10 Dec 2019 05:30:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haEST2d9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CD62206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieY5n-0003lF-TZ; Tue, 10 Dec 2019 05:29:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kHo1=Z7=gmail.com=natechancellor@srs-us1.protection.inumbo.net>)
 id 1iePQn-0006mY-BO
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 20:14:57 +0000
X-Inumbo-ID: 9165813e-1ac0-11ea-88e7-bc764e2007e4
Received: from mail-ot1-x343.google.com (unknown [2607:f8b0:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9165813e-1ac0-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 20:14:56 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id a15so13424576otf.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2019 12:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G4ssoJVMzXYKSaITeXCbCdqWsNm++w07wgKnILG/bgg=;
 b=haEST2d94B5TmCZrM6JPC6BcdhKhvdNK1ez37JXwt8b1vTyX2uql97OBBZepl9hgh0
 Aro/zgnNe+82W8KdhOviCVboGuBF+/B+4B7jckmAQv6Mh9eBErJy3v7HYwHq6JhnAOr5
 ugOcjw3VtBQQmYiDrZGc2CN8wAPAmsmDcerXFTMLly5hGp6hwPdTG73Pb3ioBIJuwcmH
 LVCx9Uj3EuqWgw0pQdq7eFZe4uUGrR9B1sDYT/FqU6Sq9rBSWnfKp7AllvGgkamAyY1D
 XK1AjGS6WuGZw7vyiKOcEp7zfHtx6DmahqOQJqm0QS045g61YP/46rE9GcmDW8qIsQgn
 cpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G4ssoJVMzXYKSaITeXCbCdqWsNm++w07wgKnILG/bgg=;
 b=j/rEABfwdKgPpyHKAjAhjjR+1BWviJ3nDuYyYCYfisBtlY5g8d7+O7WNqPEB8aJeW2
 qeHx+fiOJMnzspt2egPkNgfreu4X0MaOdbZ07WhRUgbe50iZ9Ymab8NlYzOTGnmoEXd1
 ArqaG7A13khudSSEb5Wir8P+5PmY1MpVDjd5Kt05Wdo3T95gC+wlZr4UnmQZUC6h8Wzh
 LKsw/lgYoiKoQp8Wp2lAYz91upxkihLJPz/EK4HluwZnnT5j4wXX0eZCE3QdWv5TyELs
 b6Frf6pliW1MhLvOmJcFDtnfmbBPXH8cKE6i1HCC8P7YyNg/YBQz2ftOzv4L/uuhi4m7
 AORg==
X-Gm-Message-State: APjAAAU2b+10R1AfWyn+QPlc2B0/HvZVxTfya46DA81q0Fhw0hCgsOv2
 YHtqLsCBinOFNwF3d5T2AVY=
X-Google-Smtp-Source: APXvYqwtJH5AIBsowE8iyT5Wwd/+RpbfvNZzd2/T/yaZlpHGDcKsUA8xSbkAO2wxxt1C7Oi7XlTpyg==
X-Received: by 2002:a9d:6f11:: with SMTP id n17mr22298966otq.126.1575922495982; 
 Mon, 09 Dec 2019 12:14:55 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id z21sm339576oto.52.2019.12.09.12.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 12:14:55 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>
Date: Mon,  9 Dec 2019 13:14:44 -0700
Message-Id: <20191209201444.33243-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Tue, 10 Dec 2019 05:29:50 +0000
Subject: [Xen-devel] [PATCH] xen/blkfront: Adjust indentation in
 xlvbd_alloc_gendisk
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
Cc: Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 clang-built-linux@googlegroups.com, xen-devel@lists.xenproject.org,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2xhbmcgd2FybnM6CgouLi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jOjExMTc6NDogd2Fy
bmluZzogbWlzbGVhZGluZyBpbmRlbnRhdGlvbjsKc3RhdGVtZW50IGlzIG5vdCBwYXJ0IG9mIHRo
ZSBwcmV2aW91cyAnaWYnIFstV21pc2xlYWRpbmctaW5kZW50YXRpb25dCiAgICAgICAgICAgICAg
ICBucl9wYXJ0cyA9IFBBUlRTX1BFUl9ESVNLOwogICAgICAgICAgICAgICAgXgouLi9kcml2ZXJz
L2Jsb2NrL3hlbi1ibGtmcm9udC5jOjExMTU6Mzogbm90ZTogcHJldmlvdXMgc3RhdGVtZW50IGlz
IGhlcmUKICAgICAgICAgICAgICAgIGlmIChlcnIpCiAgICAgICAgICAgICAgICBeCgpUaGlzIGlz
IGJlY2F1c2UgdGhlcmUgaXMgYSBzcGFjZSBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoaXMgbGluZTsg
cmVtb3ZlCml0IHNvIHRoYXQgdGhlIGluZGVudGF0aW9uIGlzIGNvbnNpc3RlbnQgYWNjb3JkaW5n
IHRvIHRoZSBMaW51eCBrZXJuZWwKY29kaW5nIHN0eWxlIGFuZCBjbGFuZyBubyBsb25nZXIgd2Fy
bnMuCgpXaGlsZSB3ZSBhcmUgaGVyZSwgdGhlIHByZXZpb3VzIGxpbmUgaGFzIHNvbWUgdHJhaWxp
bmcgd2hpdGVzcGFjZTsgY2xlYW4KdGhhdCB1cCBhcyB3ZWxsLgoKRml4ZXM6IGM4MGE0MjA5OTVl
NyAoInhlbi1ibGtmcm9udDogaGFuZGxlIFhlbiBtYWpvciBudW1iZXJzIG90aGVyIHRoYW4gWEVO
VkJEIikKTGluazogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9saW51eC9pc3N1
ZXMvNzkxClNpZ25lZC1vZmYtYnk6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRlY2hhbmNlbGxvckBn
bWFpbC5jb20+Ci0tLQogZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYyB8IDQgKystLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJv
bnQuYwppbmRleCBhNzRkMDM5MTM4MjIuLmMwMmJlMDZjNTI5OSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ibG9jay94ZW4tYmxrZnJvbnQuYworKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5j
CkBAIC0xMTEzLDggKzExMTMsOCBAQCBzdGF0aWMgaW50IHhsdmJkX2FsbG9jX2dlbmRpc2soYmxr
aWZfc2VjdG9yX3QgY2FwYWNpdHksCiAJaWYgKCFWREVWX0lTX0VYVEVOREVEKGluZm8tPnZkZXZp
Y2UpKSB7CiAJCWVyciA9IHhlbl90cmFuc2xhdGVfdmRldihpbmZvLT52ZGV2aWNlLCAmbWlub3Is
ICZvZmZzZXQpOwogCQlpZiAoZXJyKQotCQkJcmV0dXJuIGVycjsJCQotIAkJbnJfcGFydHMgPSBQ
QVJUU19QRVJfRElTSzsKKwkJCXJldHVybiBlcnI7CisJCW5yX3BhcnRzID0gUEFSVFNfUEVSX0RJ
U0s7CiAJfSBlbHNlIHsKIAkJbWlub3IgPSBCTEtJRl9NSU5PUl9FWFQoaW5mby0+dmRldmljZSk7
CiAJCW5yX3BhcnRzID0gUEFSVFNfUEVSX0VYVF9ESVNLOwotLSAKMi4yNC4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
