Return-Path: <SRS0=mWk2=SP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF37C10F11
	for <xen-devel@archiver.kernel.org>; Sat, 13 Apr 2019 16:23:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EAA7208E3
	for <xen-devel@archiver.kernel.org>; Sat, 13 Apr 2019 16:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EAA7208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFLRJ-0005F9-DK; Sat, 13 Apr 2019 16:23:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lqlW=SP=citrix.com=prvs=9997e3fe6=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hFLRI-0005Ex-1X
 for xen-devel@lists.xenproject.org; Sat, 13 Apr 2019 16:23:36 +0000
X-Inumbo-ID: 7c0dc8c5-5e08-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7c0dc8c5-5e08-11e9-92d7-bc764e045a96;
 Sat, 13 Apr 2019 16:23:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,345,1549929600"; d="scan'208";a="83508405"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Sat, 13 Apr 2019 17:22:09 +0100
Message-ID: <1555172532-23814-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/3] x86: Fix boot time detection of SMT settings
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190413162209.ulFms4qBb4G8uH2qqVNti_f7D7kjk_q9sW7G0acF-6A@z>

SXQgdHVybnMgb3V0IHRoYXQgb24gSW50ZWwgaGFyZHdhcmUsIENQVUlELjB4Yi5zbXRfc2hpZnQg
cmVwcmVzZW50cyB0aGUKaGFyZHdhcmUgY2FwYWJpbGl0eSwgbm90IHRoZSBjdXJyZW50IGNvbmZp
Z3VyYXRpb24uICBUaGVyZWZvcmUsIHRoZSBMMVRGCm5hZ2dpbmcgd2FybmluZyB0cmlnZ2VycyBl
dmVuIHdoZW4gdGhlIGFkbWluIGhhcyBkaXNhYmxlZCBoeXBlcnRocmVhZGluZyBpbgp0aGUgZmly
bXdhcmUuCgpUaGUgd2F5IHRvIGZpeCB0aGlzIGlzIHVzaW5nIHRoZSBNU1JfSU5URUxfQ09SRV9U
SFJFQURfQ09VTlQuICBTZXZlcmFsIHVwZGF0ZXMKdG8gdGhlIEludGVsIE1TUiBkb2N1bWVudGF0
aW9uIGFyZSBleHBlY3RlZCB0byBiZSBmb3J0aGNvbWluZy4KClNlZSBpbmRpdmlkdWFsIHBhdGNo
ZXMgZm9yIGRldGFpbHMuCgpBbmRyZXcgQ29vcGVyICgzKToKICB4ODYvc3BlYy1jdHJsOiBSZXBv
c2l0aW9uIHRoZSBYUFRJIGNvbW1hbmQgbGluZSBwYXJzaW5nIGxvZ2ljCiAgeDg2L21zcjogRGVm
aW5pdGlvbnMgZm9yIE1TUl9JTlRFTF9DT1JFX1RIUkVBRF9DT1VOVAogIHg4Ni9ib290OiBEZXRl
Y3QgdGhlIGZpcm13YXJlIFNNVCBzZXR0aW5nIGNvcnJlY3RseSBvbiBJbnRlbCBoYXJkd2FyZQoK
IHhlbi9hcmNoL3g4Ni9jcHUvYW1kLmMgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9t
c3IuYyAgICAgICAgICAgICAgfCAgIDIgKwogeGVuL2FyY2gveDg2L3NwZWNfY3RybC5jICAgICAg
ICB8IDE4MiArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5j
bHVkZS9hc20teDg2L21zci1pbmRleC5oIHwgICA0ICsKIDQgZmlsZXMgY2hhbmdlZCwgMTE5IGlu
c2VydGlvbnMoKyksIDcxIGRlbGV0aW9ucygtKQoKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
