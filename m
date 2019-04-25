Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD300C43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 15:33:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 219CB205ED
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 15:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 219CB205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJgN2-0000ux-6A; Thu, 25 Apr 2019 15:33:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5oh2=S3=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hJgN1-0000us-5i
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 15:33:07 +0000
X-Inumbo-ID: 6bc8f479-676f-11e9-843c-bc764e045a96
Received: from mail-io1-f68.google.com (unknown [209.85.166.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6bc8f479-676f-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 15:33:06 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id h26so345127ioj.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 08:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lc21W+cP78FXS52GyrZjfGMmOgLShGWCiV6Ujqgjpw8=;
 b=kqsKLMhZy7CYc5d7qILEMrhDrq8TefCE1fOxgFGMpoSOCwuTR94wLlPYuOxpQZ3rZL
 hhYS4GnM2NLyQFfJgIXGdO2kHXABxc0MtAI+ESyjl0Fq3tTMQrEgT/d/P9dvIjUhBjFt
 EdGu/crCACDLLxchcAfR+p1keaf4IBfcrbOkpRHD7q9THDRNgrLo4oIWXFLMUMHU1j+P
 2kSAaaqCMXxxMfnilup93hjaC5g0HOpclXS4eFHE12RpbLerumlSIb8p6wzMJpF7Fu2b
 qJsvfWmvN4MMb9LIMdNUmXSLGFgX8a2jObvfh3lBl1DxatbjkMRWmTR26q2CsBoSG7Af
 tJEw==
X-Gm-Message-State: APjAAAUo3tJIj+zv0dpdFa/JNscGbBO9UadirkDQ6/SSnhejmuSYAiAt
 bJPCBHrVDpsadLIWlv7paIksyXnu
X-Google-Smtp-Source: APXvYqwVz/ysktX9rLVc2V2stAO9Sw24Ns8lq3X5Q49Y8O4RZPNLVV4EgpHtiSMfQTErj4nMR1sxKQ==
X-Received: by 2002:a05:6602:12:: with SMTP id
 b18mr13153070ioa.224.1556206385246; 
 Thu, 25 Apr 2019 08:33:05 -0700 (PDT)
Received: from localhost.localdomain (c-71-205-12-124.hsd1.co.comcast.net.
 [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id 2sm3589667ioz.77.2019.04.25.08.33.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Apr 2019 08:33:04 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 25 Apr 2019 09:32:50 -0600
Message-Id: <20190425153252.14795-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/3] x86/mem_sharing: aquire extra references
 for pages with correct domain
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425153250.Zkt1qfYjVGurMT-ScldxKdC9YdNPhG8-vj_FjmP-jG8@z>

UGF0Y2ggMDUwMmUwYWRhZTIgIng4NjogY29ycmVjdCBpbnN0YW5jZXMgb2YgUEdDX2FsbG9jYXRl
ZCBjbGVhcmluZyIgaW50cm9kdWNlZApncmFiYmluZyBleHRyYSByZWZlcmVuY2VzIGZvciBwYWdl
cyB0aGF0IGRyb3AgcmVmZXJlbmNlcyB0aWVkIHRvIFBHQ19hbGxvY2F0ZWQuCkhvd2V2ZXIsIHRo
ZXNlIHBhZ2VzIGFyZSBhY3R1YWxseSBvd25lZCBieSBkb21fY293LCByZXN1bHRpbmcgYm90aCBz
aGFyaW5nIGFuZAp1bnNoYXJpbmcgYnJlYWtpbmcuCgpTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExl
bmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNj
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KQ2M6IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgfCA0ICsrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJp
bmcuYwppbmRleCA1YWM5ZDhmNTRjLi5kZmMyNzlkMzcxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYvbW0vbWVtX3NoYXJpbmcuYworKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwpA
QCAtOTY1LDcgKzk2NSw3IEBAIHN0YXRpYyBpbnQgc2hhcmVfcGFnZXMoc3RydWN0IGRvbWFpbiAq
c2QsIGdmbl90IHNnZm4sIHNocl9oYW5kbGVfdCBzaCwKICAgICB9CiAKICAgICAvKiBBY3F1aXJl
IGFuIGV4dHJhIHJlZmVyZW5jZSwgZm9yIHRoZSBmcmVlaW5nIGJlbG93IHRvIGJlIHNhZmUuICov
Ci0gICAgaWYgKCAhZ2V0X3BhZ2UoY3BhZ2UsIGNkKSApCisgICAgaWYgKCAhZ2V0X3BhZ2UoY3Bh
Z2UsIGRvbV9jb3cpICkKICAgICB7CiAgICAgICAgIHJldCA9IC1FT1ZFUkZMT1c7CiAgICAgICAg
IG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrKHNlY29uZHBnKTsKQEAgLTExNzEsNyArMTE3MSw3IEBA
IGludCBfX21lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShzdHJ1Y3QgZG9tYWluICpkLAogICAgICAg
ICBtZW1fc2hhcmluZ19wYWdlX3VubG9jayhwYWdlKTsKICAgICAgICAgaWYgKCBsYXN0X2dmbiAp
CiAgICAgICAgIHsKLSAgICAgICAgICAgIGlmICggIWdldF9wYWdlKHBhZ2UsIGQpICkKKyAgICAg
ICAgICAgIGlmICggIWdldF9wYWdlKHBhZ2UsIGRvbV9jb3cpICkKICAgICAgICAgICAgIHsKICAg
ICAgICAgICAgICAgICBwdXRfZ2ZuKGQsIGdmbik7CiAgICAgICAgICAgICAgICAgZG9tYWluX2Ny
YXNoKGQpOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
