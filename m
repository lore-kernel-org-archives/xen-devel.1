Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0D5C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 15:07:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6B51205F4
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 15:07:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="tQqVunSn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6B51205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH8dV-0002c8-A6; Thu, 18 Apr 2019 15:07:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4jFc=SU=amazon.de=prvs=004ea77d3=samcacc@srs-us1.protection.inumbo.net>)
 id 1hH8aT-0002W9-Es
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 15:04:29 +0000
X-Inumbo-ID: 4245dbf0-61eb-11e9-aa78-57c0116151ac
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4245dbf0-61eb-11e9-aa78-57c0116151ac;
 Thu, 18 Apr 2019 15:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1555599866; x=1587135866;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=2/7Z0DntIByuVC+ip+4cZHM41CW/L/J5BIrkmKAQcS0=;
 b=tQqVunSnjmuO+mxhcCCCgLZJFGElVsZnQZw9byX7y0JcmFpgjeghPWNR
 H03qMOZN2Mf2J6XyHcd6/SnPKYtpTEBCRXI+e8SpjGFcshsUGFBnujPsj
 tnV3MzyDAXRRFIamMLRwfsmMkAcEFWuawBxW8enUKw5QCsNNn0dagmJe7 E=;
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="397724373"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 18 Apr 2019 15:04:17 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (8.14.7/8.14.7) with
 ESMTP id x3IF37VY117992
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 18 Apr 2019 15:03:08 GMT
Received: from EX13D08UEE004.ant.amazon.com (10.43.62.182) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 18 Apr 2019 15:03:08 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D08UEE004.ant.amazon.com (10.43.62.182) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 18 Apr 2019 15:03:07 +0000
Received: from uc2253769c0055c.ant.amazon.com (10.28.85.98) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 18 Apr 2019 15:03:06 +0000
From: Sam Caccavale <samcacc@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 17:02:38 +0200
Message-ID: <20190418150238.15352-1-samcacc@amazon.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
X-Mailman-Approved-At: Thu, 18 Apr 2019 15:07:35 +0000
Subject: [Xen-devel] [PATCH fuzzer v1] Added the --ignore-sigill option for
 AFL fuzzing
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Sam Caccavale <samcacc@amazon.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Martin Pohlack <mpohlack@amazon.de>,
 Pawel Wieczorkiewicz <wipawel@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>,
 Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>,
 Bjoern Doebel <doebel@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418150238.xfyV-HgbjqZJ2vBfRE5t7I04xi5LY787RfczOdH5pHQ@z>

QXMgb2Ygbm93LCB0aGUgeDg2X2luc3RydWN0aW9uX2VtdWxhdG9yIHdpbGwgZXhlY3V0ZSBvcGNv
ZGVzCmJlbG9uZ2luZyB0byBDUFUgZXh0ZW5zaW9ucyB0aGF0IHRoZSBob3N0IG1heSBub3QgaGF2
ZS4KU3BlY2lmeWluZyAtLWlnbm9yZS1zaWdpbGwgd2hlbiBydW5uaW5nIGFmbC1oYXJuZXNzIHdp
bGwgaWdub3JlCmFsbCBTSUdfSUxMIGluY2x1ZGluZyB0aG9zZSBnZW5lcmF0ZWQgYnkgdGhlIGFi
b3ZlIGlzc3VlLgotLS0KIC4uLi9mdXp6L3g4Nl9pbnN0cnVjdGlvbl9lbXVsYXRvci9hZmwtaGFy
bmVzcy5jIHwgMTcgKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZnV6ei94ODZfaW5zdHJ1
Y3Rpb25fZW11bGF0b3IvYWZsLWhhcm5lc3MuYyBiL3Rvb2xzL2Z1enoveDg2X2luc3RydWN0aW9u
X2VtdWxhdG9yL2FmbC1oYXJuZXNzLmMKLS0tIGEvdG9vbHMvZnV6ei94ODZfaW5zdHJ1Y3Rpb25f
ZW11bGF0b3IvYWZsLWhhcm5lc3MuYworKysgYi90b29scy9mdXp6L3g4Nl9pbnN0cnVjdGlvbl9l
bXVsYXRvci9hZmwtaGFybmVzcy5jCkBAIC0xLDQgKzEsNSBAQAogI2luY2x1ZGUgPGFzc2VydC5o
PgorI2luY2x1ZGUgPHNpZ25hbC5oPgogI2luY2x1ZGUgPHN0ZGludC5oPgogI2luY2x1ZGUgPHN0
ZGlvLmg+CiAjaW5jbHVkZSA8c3RkbGliLmg+CkBAIC04LDExICs5LDE3IEBACiAKIHN0YXRpYyB1
aW50OF90IGlucHV0W0lOUFVUX1NJWkVdOwogCit2b2lkIFNJR0lMTF9oYW5kbGVyKGludCBzaWdu
bykgeworICAgIHByaW50ZigiRXhpdGluZyBkdWUgdG8gZXhlY3V0aW5nIGFuIHVuc3VwcG9ydGVk
IG9wY2RvZGUuXG4iKTsKKyAgICBleGl0KDApOworfQorCiBpbnQgbWFpbihpbnQgYXJnYywgY2hh
ciAqKmFyZ3YpCiB7CiAgICAgc2l6ZV90IHNpemU7CiAgICAgRklMRSAqZnAgPSBOVUxMOwogICAg
IGludCBtYXgsIGNvdW50OworICAgIHN0cnVjdCBzaWdhY3Rpb24gc2EsIG9zYTsKIAogICAgIHNl
dGJ1ZihzdGRpbiwgTlVMTCk7CiAgICAgc2V0YnVmKHN0ZG91dCwgTlVMTCk7CkBAIC0yMCw5ICsy
NywxMSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAgICAgd2hpbGUgKCAxICkK
ICAgICB7CiAgICAgICAgIGVudW0geworICAgICAgICAgICAgSUdOT1JFX1NJR0lMTCwKICAgICAg
ICAgICAgIE9QVF9NSU5fU0laRSwKICAgICAgICAgfTsKICAgICAgICAgc3RhdGljIGNvbnN0IHN0
cnVjdCBvcHRpb24gbG9wdHNbXSA9IHsKKyAgICAgICAgICAgIHsgImlnbm9yZS1zaWdpbGwiLCBu
b19hcmd1bWVudCwgTlVMTCwgSUdOT1JFX1NJR0lMTCB9LAogICAgICAgICAgICAgeyAibWluLWlu
cHV0LXNpemUiLCBub19hcmd1bWVudCwgTlVMTCwgT1BUX01JTl9TSVpFIH0sCiAgICAgICAgICAg
ICB7IDAsIDAsIDAsIDAgfQogICAgICAgICB9OwpAQCAtMzMsMTMgKzQyLDE5IEBAIGludCBtYWlu
KGludCBhcmdjLCBjaGFyICoqYXJndikKIAogICAgICAgICBzd2l0Y2ggKCBjICkKICAgICAgICAg
eworICAgICAgICBjYXNlIElHTk9SRV9TSUdJTEw6CisgICAgICAgICAgICBzYS5zYV9mbGFncyA9
IDA7CisgICAgICAgICAgICBzYS5zYV9oYW5kbGVyID0gU0lHSUxMX2hhbmRsZXI7CisgICAgICAg
ICAgICBzaWdhY3Rpb24oU0lHSUxMLCAmc2EsICZvc2EpOworICAgICAgICAgICAgYnJlYWs7CisK
ICAgICAgICAgY2FzZSBPUFRfTUlOX1NJWkU6CiAgICAgICAgICAgICBwcmludGYoIiV1XG4iLCBm
dXp6X21pbmltYWxfaW5wdXRfc2l6ZSgpKTsKICAgICAgICAgICAgIGV4aXQoMCk7CiAgICAgICAg
ICAgICBicmVhazsKIAogICAgICAgICBjYXNlICc/JzoKLSAgICAgICAgICAgIHByaW50ZigiVXNh
Z2U6ICVzICRGSUxFIFskRklMRS4uLl0gfCBbLS1taW4taW5wdXQtc2l6ZV1cbiIsIGFyZ3ZbMF0p
OworICAgICAgICAgICAgcHJpbnRmKCJVc2FnZTogJXMgJEZJTEUgWyRGSUxFLi4uXSBbLS1pZ25v
cmUtc2lnaWxsXSB8IFstLW1pbi1pbnB1dC1zaXplXVxuIiwgYXJndlswXSk7CiAgICAgICAgICAg
ICBleGl0KC0xKTsKICAgICAgICAgICAgIGJyZWFrOwogCi0tIAoyLjE3LjEKCgoKCkFtYXpvbiBE
ZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxp
bgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApV
c3QtSUQ6IERFIDI4OSAyMzcgODc5CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0
ZW5idXJnIEhSQiAxNDkxNzMgQgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
