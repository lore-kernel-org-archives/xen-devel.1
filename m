Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A51C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EEA82186A
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EEA82186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH9xJ-00020w-TW; Thu, 18 Apr 2019 16:32:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xI-0001zU-67
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:08 +0000
X-Inumbo-ID: 81dfbc42-61f7-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 81dfbc42-61f7-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 16:32:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83913770"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 17:31:48 +0100
Message-ID: <20190418163158.11408-12-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 11/21] JobDB::Executive: step_*: fix log
 messages to talk about "steps"
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
Message-ID: <20190418163148.e0Mb5aQ-Y8Qa7Jm-el9zWg2MucWPkieMFMwV3VcgmhI@z>

VGhlc2UgZnVuY3Rpb25zIGFyZSBhYm91dCB0byBiZSBzb21ldGltZXMgY2FsbGVkIGZvciBub24t
c3Vic3RlcApzdGVwcy4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvSm9iREIvRXhlY3V0aXZlLnBtIHwgNCArKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL09zc3Rlc3QvSm9iREIvRXhlY3V0aXZlLnBtIGIvT3NzdGVzdC9Kb2JEQi9FeGVjdXRpdmUu
cG0KaW5kZXggZWEzNDkwNTIuLjNhNjgwYzlkIDEwMDY0NAotLS0gYS9Pc3N0ZXN0L0pvYkRCL0V4
ZWN1dGl2ZS5wbQorKysgYi9Pc3N0ZXN0L0pvYkRCL0V4ZWN1dGl2ZS5wbQpAQCAtMjgxLDcgKzI4
MSw3IEBAIEVORAogCQkJICAkbG9nZmlsZSAvLyAiJHN0ZXBuby4kc2NyaXB0LmxvZyIsCiAJCQkg
ICR0ZXN0aWQsdGltZSk7CiAgICAgfSk7Ci0gICAgbG9nbSgiLS0tLS0tLS0tLSBzdWJzdGVwICRz
dGVwbm8gJHRlc3RpZCBydW5uaW5nIC0tLS0tLS0tLS0iKTsKKyAgICBsb2dtKCItLS0tLS0tLS0t
IHN0ZXAgJHN0ZXBubyAkdGVzdGlkIHJ1bm5pbmcgLS0tLS0tLS0tLSIpOwogfQogCiBzdWIgc3Rl
cF9maW5pc2ggKCQkKSB7ICNtZXRob2QKQEAgLTMxMSw3ICszMTEsNyBAQCBFTkQKIAkgICAgdW5s
ZXNzICRvbGRzdGF0dXMgZXEgJ3J1bm5pbmcnOwogCSRzZXRxLT5leGVjdXRlKCRzdGVwc3RhdHVz
LHRpbWUsICRmbGlnaHQsJGpvYiwkdGVzdGlkLCAkc3RlcG5vKTsKICAgICB9KTsKLSAgICBsb2dt
KCItLS0tLS0tLS0tIHN1YnN0ZXAgJHN0ZXBubyAkdGVzdGlkICRzdGVwc3RhdHVzIC0tLS0tLS0t
LS0iKTsKKyAgICBsb2dtKCItLS0tLS0tLS0tIHN0ZXAgJHN0ZXBubyAkdGVzdGlkICRzdGVwc3Rh
dHVzIC0tLS0tLS0tLS0iKTsKIH0KIAogc3ViIGhvc3RfY2hlY2tfYWxsb2NhdGVkICgkJCkgeyAj
bWV0aG9kCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
