Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BF9C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B3802183F
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B3802183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH9xM-000239-5J; Thu, 18 Apr 2019 16:32:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xK-00021J-Bn
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:10 +0000
X-Inumbo-ID: 80d03be8-61f7-11e9-85af-93c07e66e988
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80d03be8-61f7-11e9-85af-93c07e66e988;
 Thu, 18 Apr 2019 16:32:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83913762"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 17:31:42 +0100
Message-ID: <20190418163158.11408-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 05/21] starvation: Teach
 sg-report-flight about starved step state
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
Message-ID: <20190418163142.JfXY1__KHTzXxOPwp8ul4lAg4o0aTXeTzgkuhp4aYEI@z>

V2UgYXJlIGdvaW5nIHRvIHVzZSB0aGlzIGZvciBzaXR1YXRpb25zIHdoZXJlIHRoZSByZXNvdXJj
ZXMgdG8gcnVuIHRoZQp0ZXN0IHdlcmVuJ3QgYXZhaWxhYmxlLiAgSW4gZ2VuZXJhbCB3ZSBhcmUg
Z29pbmcgdG8gdHJlYXQgdGhpcyBhcyBub3QKYSByZWdyZXNzaW9uLgoKU2lnbmVkLW9mZi1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogc2ctcmVwb3J0LWZs
aWdodCB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NnLXJlcG9ydC1mbGlnaHQgYi9zZy1yZXBvcnQtZmxpZ2h0
CmluZGV4IGExYWRmOTUyLi4yNjc3YzQ3OSAxMDA3NTUKLS0tIGEvc2ctcmVwb3J0LWZsaWdodAor
KysgYi9zZy1yZXBvcnQtZmxpZ2h0CkBAIC04MDUsOSArODA1LDkgQEAgRU5ECiAgICAgICAgICAg
ICBuZXh0OwogICAgICAgICB9CiAKLQlpZiAoJHN0IGVxICdibG9ja2VkJykgewotCSAgICBwcmlu
dCBNUk8gImJsb2NrZWQgJHMtPntqb2J9ICRzLT57dGVzdGlkfVxuIjsKLQkgICAgcHJpbnQgREVC
VUcgIiBibG9ja2VkLCBjYWxsIGl0IGp1c3RpZmlhYmxlXG4iOworCWlmICgkc3QgZXEgJ2Jsb2Nr
ZWQnIG9yICRzdCBlcSAnc3RhcnZlZCcpIHsKKwkgICAgcHJpbnQgTVJPICIkc3QgJHMtPntqb2J9
ICRzLT57dGVzdGlkfVxuIjsKKwkgICAgcHJpbnQgREVCVUcgIiAkc3QsIGNhbGwgaXQganVzdGlm
aWFibGVcbiI7CiAJICAgICRmYWlsdi0+e1N1bW1hcnl9PSAnbi9hJzsKICAgICAgICAgICAgICRm
YWlsdi0+e0Jsb2NrZXJ9PSAnJzsKIAkgICAgbmV4dDsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
