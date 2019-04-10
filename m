Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E3BC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E4D720850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E4D720850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAk-0007UF-Sb; Wed, 10 Apr 2019 14:25:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAW-0006up-Q7
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:40 +0000
X-Inumbo-ID: 82dfc969-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 82dfc969-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227732"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:55 +0100
Message-ID: <20190410142408.22848-50-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 49/62] Debian: Move
 preseed_backports_packages earlier
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
Message-ID: <20190410142355.svASksvkJgI01kwF_n98uDg53uHJz01vwUP2ELKaKzI@z>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L0RlYmlhbi5wbSB8IDg4ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCA0NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9P
c3N0ZXN0L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCmluZGV4IDlhYTg4ODIyLi4yNWJm
OGU4OCAxMDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysrIGIvT3NzdGVzdC9EZWJpYW4u
cG0KQEAgLTgyMyw2ICs4MjMsNTAgQEAgY2htb2QgNjAwICRzdWJkaXIvZXRjL3NzaC9zc2hfaG9z
dF8qX2tleSB8fDoKIEVORAogfQogCitzdWIgcHJlc2VlZF9iYWNrcG9ydHNfcGFja2FnZXMgKCQk
JCRAKSB7CisgICAgbXkgKCRobywgJHNmeCwgJHhvcHRzLCAkc3VpdGUsIEBwa2dzKSA9IEBfOwor
CisgICAgaWYgKCEgJHhvcHRzLT57QmFja3BvcnRzU291cmNlc0FscmVhZHlBZGRlZH0rKykgewor
CW15ICRicF91cmwgPSAkY3siRGViaWFuU25hcHNob3RCYWNrcG9ydHNfJHN1aXRlIn07CisJJGJw
X3VybCB8fD0gImh0dHA6Ly8kY3tEZWJpYW5NaXJyb3JIb3N0fS8kY3tEZWJpYW5NaXJyb3JTdWJw
YXRofSI7CisKKwlteSAkYXB0X2luc2VydD0nJzsKKwlteSAkZXh0cmFfcnVuZT0nJzsKKwlpZiAo
JHN1aXRlID1+IG0vd2hlZXp5fGplc3NpZS8pIHsKKwkgICAgIyB0aGlzIGhhcyBnbG9iYWwgZWZm
ZWN0LCB1bmZvcnR1bmF0ZWx5CisJICAgICRleHRyYV9ydW5lID0gPDxFTkQ7CitkPS90YXJnZXQv
ZXRjL2FwdC9hcHQuY29uZi5kCitta2RpciAtcCBcJGQKK2NhdCA+XCRkLzUwb3NzdGVzdHNuYXBz
aG90IDw8RU9GCitBY3F1aXJlOjpDaGVjay1WYWxpZC1VbnRpbCBmYWxzZTsKK0VPRgorRU5ECisJ
fSBlbHNlIHsKKwkgICAgJGFwdF9pbnNlcnQgPSAnW2NoZWNrLXZhbGlkLXVudGlsPW5vXSc7CisJ
fQorCisJcHJlc2VlZF9ob29rX2NvbW1hbmQoJGhvLCAnbGF0ZV9jb21tYW5kJywgJHNmeCwgPDxF
TkQpOworIyEvYmluL3NoCitzZXQgLWV4CisKK2NhdCA8PEVPRiA+Pi90YXJnZXQvZXRjL2FwdC9z
b3VyY2VzLmxpc3QKKworIyAkc3VpdGUgYmFja3BvcnRzCitkZWIgJGFwdF9pbnNlcnQgJGJwX3Vy
bCAkc3VpdGUtYmFja3BvcnRzIG1haW4KK0VPRgorJGV4dHJhX3J1bmUKK2luLXRhcmdldCBhcHQt
Z2V0IHVwZGF0ZQorRU5ECisgICAgfQorCisgICAgcHJlc2VlZF9ob29rX2NvbW1hbmQoJGhvLCAn
bGF0ZV9jb21tYW5kJywgJHNmeCwgPDxFTkQpOworIyEvYmluL3NoCitzZXQgLWV4CisKK2luLXRh
cmdldCBhcHQtZ2V0IGluc3RhbGwgLXkgLXQgJHN1aXRlLWJhY2twb3J0cyBAcGtncworRU5ECit9
CisKIHN1YiBwcmVzZWVkX2Jhc2UgKCQkJDtAKSB7CiAgICAgbXkgKCRobywkc2Z4LCRleHRyYV9w
YWNrYWdlcywleG9wdHMpID0gQF87CiAKQEAgLTk4Niw1MCArMTAzMCw2IEBAIEVORAogICAgIHJl
dHVybiAkcHJlc2VlZDsKIH0KIAotc3ViIHByZXNlZWRfYmFja3BvcnRzX3BhY2thZ2VzICgkJCQk
QCkgewotICAgIG15ICgkaG8sICRzZngsICR4b3B0cywgJHN1aXRlLCBAcGtncykgPSBAXzsKLQot
ICAgIGlmICghICR4b3B0cy0+e0JhY2twb3J0c1NvdXJjZXNBbHJlYWR5QWRkZWR9KyspIHsKLQlt
eSAkYnBfdXJsID0gJGN7IkRlYmlhblNuYXBzaG90QmFja3BvcnRzXyRzdWl0ZSJ9OwotCSRicF91
cmwgfHw9ICJodHRwOi8vJGN7RGViaWFuTWlycm9ySG9zdH0vJGN7RGViaWFuTWlycm9yU3VicGF0
aH0iOwotCi0JbXkgJGFwdF9pbnNlcnQ9Jyc7Ci0JbXkgJGV4dHJhX3J1bmU9Jyc7Ci0JaWYgKCRz
dWl0ZSA9fiBtL3doZWV6eXxqZXNzaWUvKSB7Ci0JICAgICMgdGhpcyBoYXMgZ2xvYmFsIGVmZmVj
dCwgdW5mb3J0dW5hdGVseQotCSAgICAkZXh0cmFfcnVuZSA9IDw8RU5EOwotZD0vdGFyZ2V0L2V0
Yy9hcHQvYXB0LmNvbmYuZAotbWtkaXIgLXAgXCRkCi1jYXQgPlwkZC81MG9zc3Rlc3RzbmFwc2hv
dCA8PEVPRgotQWNxdWlyZTo6Q2hlY2stVmFsaWQtVW50aWwgZmFsc2U7Ci1FT0YKLUVORAotCX0g
ZWxzZSB7Ci0JICAgICRhcHRfaW5zZXJ0ID0gJ1tjaGVjay12YWxpZC11bnRpbD1ub10nOwotCX0K
LQotCXByZXNlZWRfaG9va19jb21tYW5kKCRobywgJ2xhdGVfY29tbWFuZCcsICRzZngsIDw8RU5E
KTsKLSMhL2Jpbi9zaAotc2V0IC1leAotCi1jYXQgPDxFT0YgPj4vdGFyZ2V0L2V0Yy9hcHQvc291
cmNlcy5saXN0Ci0KLSMgJHN1aXRlIGJhY2twb3J0cwotZGViICRhcHRfaW5zZXJ0ICRicF91cmwg
JHN1aXRlLWJhY2twb3J0cyBtYWluCi1FT0YKLSRleHRyYV9ydW5lCi1pbi10YXJnZXQgYXB0LWdl
dCB1cGRhdGUKLUVORAotICAgIH0KLQotICAgIHByZXNlZWRfaG9va19jb21tYW5kKCRobywgJ2xh
dGVfY29tbWFuZCcsICRzZngsIDw8RU5EKTsKLSMhL2Jpbi9zaAotc2V0IC1leAotCi1pbi10YXJn
ZXQgYXB0LWdldCBpbnN0YWxsIC15IC10ICRzdWl0ZS1iYWNrcG9ydHMgQHBrZ3MKLUVORAotfQot
CiBzdWIgcHJlc2VlZF9jcmVhdGVfZ3Vlc3QgKCQkJDtAKSB7CiAgICAgbXkgKCRobywgJGFyY2gs
ICRzZngsICV4b3B0cykgPSBAXzsKIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
