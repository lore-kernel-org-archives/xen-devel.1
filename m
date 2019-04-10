Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C106BC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 10:27:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 885DC2075B
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 10:27:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="JoE9ttUT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 885DC2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEARM-0000Vb-RK; Wed, 10 Apr 2019 10:26:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rOu6=SM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hEARL-0000VS-NV
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 10:26:48 +0000
X-Inumbo-ID: 23124b73-5b7b-11e9-92d7-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::7])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 23124b73-5b7b-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 10:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1554892003;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=A3n2pyJoH5CQeUZDDG0uJ/G+gs5rW6MtRwhd69XH60A=;
 b=JoE9ttUTS7oEjmHrxpMx48EelzEHMrgQwAEY4aVUlHrUGqmc9RkzNUz6tMvHF6Zp+4
 sSv/nkC1w78Y5fvptOpzJmcAHzSQmYhDGlxtwaCsVbsDT3+OqCzNx0WydJcZg41DLhlM
 SblGE2ls1MlEiobjGG+R8kBQ8eTg0so1zRDO57hpaIHNFhVjMXCj9+3V6+gCEs97oXAo
 v/Yo7r0i2RgwF1vecAgf+PlkuIiph77mfsen7KiZePEdttQpnASbdjlBvj1KO6rlHCmr
 D80eF/+Pi9xrZ8gZQb4rhgZtkPYHRJNFRQgxz2NiTkR/aYyhuSj+S5uLJfJ0in0/yuHq
 LUPQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuznKRsvz7yq3NXHy7eI5Iw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.18 DYNA|AUTH)
 with ESMTPSA id 60a847v3AAQa4uQ
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 10 Apr 2019 12:26:36 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Wed, 10 Apr 2019 12:26:34 +0200
Message-Id: <20190410102634.1426-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1] libxl: update prototype of
 libxl__device_vkb_dm_needed
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
Cc: Wei Liu <wei.liu2@citrix.com>, Olaf Hering <olaf@aepfle.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410102634.7bjmb5ELcEXa3QAL0717ZaaOJJ-gfCAo2OQ-YT3fCZk@z>

QWxpZ24gY29kZSB0byBtYXRjaCBvdGhlciB1c2FnZSBvZiBkZXZpY2VfZG1fbmVlZGVkX2ZuX3Q6
CnJlY2lldmUgYSB2b2lkIHBvaW50ZXIsIGFzc2lnbiB0byBleHBlY3RlZCB0eXBlIGFuZCB1c2Ug
aXQgYWNjb3JkaW5nbHkuCgpObyBmdW5jdGlvbmFsIGNoYW5nZSBleHBlY3RlZC4KClNpZ25lZC1v
ZmYtYnk6IE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT4KLS0tCiB0b29scy9saWJ4bC9saWJ4
bF92a2IuYyB8IDggKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfdmtiLmMgYi90b29s
cy9saWJ4bC9saWJ4bF92a2IuYwppbmRleCBlOTI4ODM5Y2ZiLi42NGUyMGI3NzJhIDEwMDY0NAot
LS0gYS90b29scy9saWJ4bC9saWJ4bF92a2IuYworKysgYi90b29scy9saWJ4bC9saWJ4bF92a2Iu
YwpAQCAtMjYsOSArMjYsMTEgQEAgc3RhdGljIGludCBsaWJ4bF9fZGV2aWNlX3ZrYl9zZXRkZWZh
dWx0KGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLAogICAgIHJldHVybiBsaWJ4bF9fcmVz
b2x2ZV9kb21pZChnYywgdmtiLT5iYWNrZW5kX2RvbW5hbWUsICZ2a2ItPmJhY2tlbmRfZG9taWQp
OwogfQogCi1zdGF0aWMgaW50IGxpYnhsX19kZXZpY2VfdmtiX2RtX25lZWRlZChsaWJ4bF9kZXZp
Y2VfdmtiICp2a2IsIHVpbnQzMl90IGRvbWlkKQorc3RhdGljIGludCBsaWJ4bF9fZGV2aWNlX3Zr
Yl9kbV9uZWVkZWQodm9pZCAqZSwgdWludDMyX3QgZG9taWQpCiB7Ci0gICAgcmV0dXJuIHZrYi0+
YmFja2VuZF90eXBlID09IExJQlhMX1ZLQl9CQUNLRU5EX1FFTVU7CisgICAgbGlieGxfZGV2aWNl
X3ZrYiAqZWxlbSA9IGU7CisKKyAgICByZXR1cm4gZWxlbS0+YmFja2VuZF90eXBlID09IExJQlhM
X1ZLQl9CQUNLRU5EX1FFTVU7CiB9CiAKIHN0YXRpYyBpbnQgbGlieGxfX3NldF94ZW5zdG9yZV92
a2IobGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQsCkBAIC0zMjcsNyArMzI5LDcgQEAgTElC
WExfREVGSU5FX0RFVklDRV9SRU1PVkUodmtiKQogCiBERUZJTkVfREVWSUNFX1RZUEVfU1RSVUNU
KHZrYiwgVktCRCwKICAgICAuc2tpcF9hdHRhY2ggPSAxLAotICAgIC5kbV9uZWVkZWQgPSAoZGV2
aWNlX2RtX25lZWRlZF9mbl90KWxpYnhsX19kZXZpY2VfdmtiX2RtX25lZWRlZCwKKyAgICAuZG1f
bmVlZGVkID0gbGlieGxfX2RldmljZV92a2JfZG1fbmVlZGVkLAogICAgIC5zZXRfeGVuc3RvcmVf
Y29uZmlnID0gKGRldmljZV9zZXRfeGVuc3RvcmVfY29uZmlnX2ZuX3QpCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBsaWJ4bF9fc2V0X3hlbnN0b3JlX3ZrYiwKICAgICAuZnJvbV94ZW5zdG9y
ZSA9IChkZXZpY2VfZnJvbV94ZW5zdG9yZV9mbl90KWxpYnhsX192a2JfZnJvbV94ZW5zdG9yZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
