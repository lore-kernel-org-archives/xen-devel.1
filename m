Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18085C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5B6320850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5B6320850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAD-0006Er-QB; Wed, 10 Apr 2019 14:25:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAB-0006C5-Nh
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:19 +0000
X-Inumbo-ID: 7755ce70-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7755ce70-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227658"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:12 +0100
Message-ID: <20190410142408.22848-7-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 06/62] Debian.pm: use sysvinit-core
 instead of systemd
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
Cc: Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142312.aSyXdYhWdEeAXGQPj9Ti0rFyTCLdJ66BqZpf7pCDHF0@z>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkluc3RhbGwgdGhhdCBwYWNrYWdl
cyBmb3Igc3VpdGVzID53aGVlenksIGJlY2F1c2UgdGhleSB1c2Ugc3lzdGVtZCBhcwp0aGUgZGVm
YXVsdCBpbml0LgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
QWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9z
c3Rlc3QvRGViaWFuLnBtIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9EZWJpYW4ucG0gYi9Pc3N0ZXN0L0Rl
Ymlhbi5wbQppbmRleCA1OWM2MGQ0MC4uODJiNWZiNDAgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvRGVi
aWFuLnBtCisrKyBiL09zc3Rlc3QvRGViaWFuLnBtCkBAIC04MTIsNyArODEyLDcgQEAgc3ViIHBy
ZXNlZWRfYmFzZSAoJCQkO0ApIHsKIAogICAgICMgU3lzdGVtZCBkb2Vzbid0IGhvbm9yIG9zc3Rl
c3QtY29uZmlybS1ib290ZWQgc2VydmljZSwgd2hpY2gKICAgICAjIGJyZWFrcyB0cy1sZWFrLWNo
ZWNrLiAgRmFsbCBiYWNrIHRvIFN5c1YgaW5pdCBmb3Igbm93LgotICAgIGlmICggJHN1aXRlID1+
IC9qZXNzaWUvICkgeworICAgIGlmICggJHN1aXRlICF+IC9zcXVlZXplfHdoZWV6eS8gKSB7CiAg
ICAgICAgcHJlc2VlZF9ob29rX2NvbW1hbmQoJGhvLCAnbGF0ZV9jb21tYW5kJywgJHNmeCwgPDxF
TkQpCiBpbi10YXJnZXQgYXB0LWdldCBpbnN0YWxsIC15IHN5c3Zpbml0LWNvcmUKIEVORAotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
