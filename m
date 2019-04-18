Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E8CC10F14
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 10:07:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDB222183F
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 10:07:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=onedefence.com header.i=@onedefence.com header.b="ODvAvJCO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=thegrail.co header.i=@thegrail.co header.b="ZKTVIePP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDB222183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thegrail.co
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH3wc-0001q8-G2; Thu, 18 Apr 2019 10:07:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=htIB=SU=onedefence.com=dylanger@srs-us1.protection.inumbo.net>)
 id 1hH2qm-000417-Ib
 for xen-devel@lists.xen.org; Thu, 18 Apr 2019 08:56:56 +0000
X-Inumbo-ID: ea50ca79-61b7-11e9-92d7-bc764e045a96
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ea50ca79-61b7-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 08:56:55 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 4so1862460wmf.1
 for <xen-devel@lists.xen.org>; Thu, 18 Apr 2019 01:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=onedefence.com; s=google;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rnNg8yB10HP5qigFgaGF2kVI5iBBKotXuN+a391uFeQ=;
 b=ODvAvJCOiGRWpSOCoTrxPLhrQHK9XF/jYkxlpoUWz6XEFnpC1E8MMGusqvwcEI/VwI
 AoLtSV29HJIb5gHGHBERXGLgea/c8oMfnC4yhtdZ7vLrgYPd+teftt9SzjCZGye7HElp
 wsqx18cDqJalQi1KO8VyBzhT6VHH9ZUVKCgBM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thegrail.co; s=google;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rnNg8yB10HP5qigFgaGF2kVI5iBBKotXuN+a391uFeQ=;
 b=ZKTVIePPDVDl9G4nglNyen9dvvARownEQaTAE0WJxqet0FnGgqIixYACSNT/Ksqv8n
 xcgU1tkElamzuxdABqKpZKThwMvZvxCoinPajJjCwc6/mrFdVUvCSDrSgaahrL2Px9sj
 n2uk8o+nE8dYC2mPTdOQ9fQ+yvCopzUAwchgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=rnNg8yB10HP5qigFgaGF2kVI5iBBKotXuN+a391uFeQ=;
 b=FjFj7zJYoXCFQ5cKWuSh54TZ7ASFf0LakJq1lE0f1WJlOfMLd7N8lEbZ3B2PxwnWkd
 fOAlkg/+/byu5x0BN1+K3dnB3KcegJdEFoda5/1x7Wat8bpl7h/CV7BXra227WSvlTa6
 NKKYdoun1bAaio8zOm/EBsoIZ1r0O0joDmhz51Aj17S+er2WfAVzCMp3pWGYYgBNPgYv
 PwZ5am1LWm76nWegSGln2PSw3GkSDRYk/QUj2nHnhZwuteBsHw7tuLf7cW+2Oc/oEKd9
 gElx5MOE0B1LPqKpifaCMR00tc6z3cVTShLDkew6LABz4aIf8+dfrxl/U7CG0qaNwFnl
 Nfrg==
X-Gm-Message-State: APjAAAUqN+0LgQweEwfcZ0sqPt4rxeLKikL58cD3QKNJcC5mvs9i5hlp
 UIWa0xkFALZXBbxTnys314rPUg==
X-Google-Smtp-Source: APXvYqxZvxDOh4RhnfIBPuLqAp5sLzDSjGH9L7KbirIdsMNmO+rXe2gVMyiUdX+6rfjra1bBGFhq2Q==
X-Received: by 2002:a1c:f310:: with SMTP id q16mr2327541wmq.102.1555577813640; 
 Thu, 18 Apr 2019 01:56:53 -0700 (PDT)
Received: from localhost.localdomain ([81.17.24.202])
 by smtp.gmail.com with ESMTPSA id 67sm1348428wmz.41.2019.04.18.01.56.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Apr 2019 01:56:52 -0700 (PDT)
From: Dylanger Daly <dylanger@thegrail.co>
To: xen-devel@lists.xenproject.org
Date: Thu, 18 Apr 2019 09:56:34 +0100
Message-Id: <20190418085634.3629-1-dylanger@thegrail.co>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Apr 2019 10:07:01 +0000
Subject: [Xen-devel] [PATCH] Add Undervolt MSRs to wrmsr function.
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
Cc: Dylanger Daly <dylanger@thegrail.co>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418085634.6K38_qhlHmjQf77CPWrPtxQDAaffi3H92fE0QsxyfHM@z>

R2l2aW5nIExhcHRvcCBVc2VycyB0aGUgYWJpbGl0eSB0byBVbmRlcnZvbHQgYW5kIGNoYW5nZSBU
ZW1wIFRocm90dGxlIExpbWl0cy4KClNpZ25lZC1vZmYtYnk6IER5bGFuZ2VyIERhbHkgPGR5bGFu
Z2VyQHRoZWdyYWlsLmNvPgotLS0KIHhlbi9hcmNoL3g4Ni90cmFwcy5jICAgICAgICAgICAgfCA4
ICsrKysrKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2L21zci1pbmRleC5oIHwgMiArKwogMiBmaWxl
cyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3Ry
YXBzLmMgYi94ZW4vYXJjaC94ODYvdHJhcHMuYwppbmRleCAxYTIyODk1OTA3Li40NzVhMmE1NzIw
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvdHJhcHMuYworKysgYi94ZW4vYXJjaC94ODYvdHJh
cHMuYwpAQCAtMjY4NCw2ICsyNjg0LDE0IEBAIHN0YXRpYyBpbnQgcHJpdl9vcF93cml0ZV9tc3Io
dW5zaWduZWQgaW50IHJlZywgdWludDY0X3QgdmFsLAogICAgICAgICAgICAgZ290byBpbnZhbGlk
OwogICAgICAgICByZXR1cm4gWDg2RU1VTF9PS0FZOwogCisgICAgY2FzZSBNU1JfSUEzMl9WT0xU
QUdFX09GRlNFVDoKKyAgICBjYXNlIE1TUl9JQTMyX1RFTVBfQ09OVFJPTDoKKyAgICAgICAgaWYg
KCBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgIT0gWDg2X1ZFTkRPUl9JTlRFTCApCisgICAgICAg
ICAgICBicmVhazsKKyAgICAgICAgaWYgKCB3cm1zcl9zYWZlKHJlZywgdmFsKSA9PSAwICkKKyAg
ICAgICAgICAgIHJldHVybiBYODZFTVVMX09LQVk7CisgICAgICAgIGJyZWFrOworCiAgICAgY2Fz
ZSBNU1JfSUEzMl9NSVNDX0VOQUJMRToKICAgICAgICAgaWYgKCByZG1zcl9zYWZlKHJlZywgdGVt
cCkgKQogICAgICAgICAgICAgYnJlYWs7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2
L21zci1pbmRleC5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tc3ItaW5kZXguaAppbmRleCA3YmIz
ODJmNDU2Li43NWRhZDNmZTQzIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21zci1p
bmRleC5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbXNyLWluZGV4LmgKQEAgLTM0Niw2ICsz
NDYsOCBAQAogI2RlZmluZSBNU1JfSUEzMl9USEVSTV9JTlRFUlJVUFQJMHgwMDAwMDE5YgogI2Rl
ZmluZSBNU1JfSUEzMl9USEVSTV9TVEFUVVMJCTB4MDAwMDAxOWMKICNkZWZpbmUgTVNSX0lBMzJf
TUlTQ19FTkFCTEUJCTB4MDAwMDAxYTAKKyNkZWZpbmUgTVNSX0lBMzJfVk9MVEFHRV9PRkZTRVQJ
CTB4MDAwMDAxNTAKKyNkZWZpbmUgTVNSX0lBMzJfVEVNUF9DT05UUk9MCQkweDAwMDAwMWEyCiAj
ZGVmaW5lIE1TUl9JQTMyX01JU0NfRU5BQkxFX1BFUkZfQVZBSUwgICAoMTw8NykKICNkZWZpbmUg
TVNSX0lBMzJfTUlTQ19FTkFCTEVfQlRTX1VOQVZBSUwgICgxPDwxMSkKICNkZWZpbmUgTVNSX0lB
MzJfTUlTQ19FTkFCTEVfUEVCU19VTkFWQUlMICgxPDwxMikKLS0gCjIuMjAuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
