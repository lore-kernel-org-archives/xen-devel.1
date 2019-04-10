Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5A0C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9597420850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9597420850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAX-0006vM-2O; Wed, 10 Apr 2019 14:25:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAQ-0006eP-FA
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:34 +0000
X-Inumbo-ID: 7f86df12-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7f86df12-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227720"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:46 +0100
Message-ID: <20190410142408.22848-41-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 40/62] preseed_base: break out
 debian_overlays_fixup_cmd
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142346.Z823Vx2zR2RgFs5fOQk9UL5faXhWuhGR_p2RDc9rToE@z>

V2UgYXJlIGdvaW5nIHRvIHdhbnQgdGhpcyBmb3IgZ3Vlc3RzIHRvby4KClNpZ25lZC1vZmYtYnk6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvRGVi
aWFuLnBtIHwgMTQgKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvRGViaWFuLnBtIGIvT3Nz
dGVzdC9EZWJpYW4ucG0KaW5kZXggZDc2ZGQwM2QuLjc4ZDI0MmU0IDEwMDY0NAotLS0gYS9Pc3N0
ZXN0L0RlYmlhbi5wbQorKysgYi9Pc3N0ZXN0L0RlYmlhbi5wbQpAQCAtMzYsNyArMzYsNyBAQCBC
RUdJTiB7CiAgICAgQEVYUE9SVCAgICAgID0gcXcoZGViaWFuX2Jvb3Rfc2V0dXAKICAgICAgICAg
ICAgICAgICAgICAgICBkaV9pbnN0YWxsZXJfcGF0aCBkaV9zcGVjaWFsX2tlcm5lbAogICAgICAg
ICAgICAgICAgICAgICAgIHNldHVwYm9vdF9ib290bG9hZGVyX2VkaXRlZF9ydW5lCi0gICAgICAg
ICAgICAgICAgICAgICAgZGViaWFuX292ZXJsYXlzCisgICAgICAgICAgICAgICAgICAgICAgZGVi
aWFuX292ZXJsYXlzIGRlYmlhbl9vdmVybGF5c19maXh1cF9jbWQKICAgICAgICAgICAgICAgICAg
ICAgICBkZWJpYW5fZ3Vlc3Rfc3VpdGUgZGViaWFuX2d1ZXN0X2RpX3ZlcnNpb24KICAgICAgICAg
ICAgICAgICAgICAgICAlcHJlc2VlZF9jbWRzCiAgICAgICAgICAgICAgICAgICAgICAgcHJlc2Vl
ZF9iYXNlCkBAIC04MTUsNiArODE1LDE0IEBAIHN1YiBkZWJpYW5fb3ZlcmxheXMgKCQkKSB7CiAg
ICAgJG1heWJlLT4oIiRje092ZXJsYXlMb2NhbH0tJHN1aXRlIiwgJ292ZXJsYXktbG9jYWwtJHN1
aXRlLnRhcicpOwogfQogCitzdWIgZGViaWFuX292ZXJsYXlzX2ZpeHVwX2NtZCAoJDskKSB7Cisg
ICAgbXkgKCRobywgJHN1YmRpcikgPSBAXzsKKyAgICAkc3ViZGlyIC8vPSAnJzsKKyAgICByZXR1
cm4gPDxFTkQ7CitjaG1vZCA2MDAgJHN1YmRpci9ldGMvc3NoL3NzaF9ob3N0Xypfa2V5IHx8Ogor
RU5ECit9CisKIHN1YiBwcmVzZWVkX2Jhc2UgKCQkJDtAKSB7CiAgICAgbXkgKCRobywkc2Z4LCRl
eHRyYV9wYWNrYWdlcywleG9wdHMpID0gQF87CiAKQEAgLTg3MywxMCArODgxLDEwIEBAIEVORAog
CiAgICAgIyBIb3N0IHByaXZhdGUga2V5cyBpbiB0aGUgb3ZlcmxheXMgaGF2ZSB0byBiZSBncm91
cC1yZWFkYWJsZQogICAgICMgYXQgbGVhc3QsIG9yIG5vLW9uZSBjYW4gdXNlIHRoZW0uICBCdXQg
c3NoIGlzIHZlcnkgZnVzc3kuCi0gICAgcHJlc2VlZF9ob29rX2NvbW1hbmQoJGhvLCAnbGF0ZV9j
b21tYW5kJywgJHNmeCwgPDxFTkQpOworICAgIHByZXNlZWRfaG9va19jb21tYW5kKCRobywgJ2xh
dGVfY29tbWFuZCcsICRzZngsCisJCQkgPDxFTkQuIGRlYmlhbl9vdmVybGF5c19maXh1cF9jbWQo
JGhvLCAnL3RhcmdldCcpKTsKICMhL2Jpbi9zaAogc2V0IC1leAotY2htb2QgNjAwIC90YXJnZXQv
ZXRjL3NzaC9zc2hfaG9zdF8qX2tleSB8fDoKIEVORAogCiAgICAgbXkgJHByZXNlZWQgPSA8PCJF
TkQiOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
