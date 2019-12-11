Return-Path: <SRS0=IGyV=2B=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C7EC43603
	for <xen-devel@archiver.kernel.org>; Wed, 11 Dec 2019 10:59:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C34C02073B
	for <xen-devel@archiver.kernel.org>; Wed, 11 Dec 2019 10:59:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="nrXEPDHP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C34C02073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iezhe-0005gC-Di; Wed, 11 Dec 2019 10:58:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SbsP=2B=amazon.com=prvs=241424563=hongyxia@srs-us1.protection.inumbo.net>)
 id 1iezhc-0005g1-Ui
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 10:58:44 +0000
X-Inumbo-ID: 31e05e46-1c05-11ea-a914-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31e05e46-1c05-11ea-a914-bc764e2007e4;
 Wed, 11 Dec 2019 10:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576061924; x=1607597924;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=io835R3o7ahHB+R5NFra8z6rIj8HJ2mI+egH6cUjZOw=;
 b=nrXEPDHPJYfnB5hvHrqdAalCYUBbClTYxXr9VxQFjq14UQKWPudH1Xny
 cANxi7kQQKHPGJ3u//dEv6M7+f0lsp5jTBJDOONsyjQpdCiZwP7B6M5kZ
 xm6hAML05cECCLIHgNp47siV3Q2apSb1n9gMxFRACs2YJgreIabITA8Ar Q=;
IronPort-SDR: YJ80ejIz51KDRSuHD7YYqwuogzF39yHzrkFySGqAYiXbDOyAu8fv0HNhuTXqh0/g+avELx+3ke
 lyI9maRR/1aA==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; d="scan'208";a="14255737"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 11 Dec 2019 10:58:33 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with ESMTPS
 id D1DE2A2656; Wed, 11 Dec 2019 10:58:31 +0000 (UTC)
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 10:58:31 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 10:58:30 +0000
Received: from u60d575063b1f53.ant.amazon.com (10.125.106.64) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 11 Dec 2019 10:58:27 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 11 Dec 2019 10:58:25 +0000
Message-ID: <cover.1576061451.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 0/2] Refactor super page shattering
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jgrall@amazon.com,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bWFwX3BhZ2VzX3RvX3hlbiBhbmQgbW9kaWZ5X3hlbl9tYXBwaW5ncyB1c2UgYWxtb3N0IGV4YWN0
bHkgdGhlIHNhbWUKcGFnZSBzaGF0dGVyaW5nIGxvZ2ljLCBhbmQgdGhlIGNvZGUgaXMgbWluZ2xl
ZCB3aXRoIG90aGVyIFBURQptYW5pcHVsYXRpb25zIHNvIGl0IGlzIGxlc3Mgb2J2aW91cyB0aGF0
IHRoZSBpbnRlbnRpb24gaXMgcGFnZQpzaGF0dGVyaW5nLiBGYWN0b3Igb3V0IHRoZSBmdW5jdGlv
bnMgdG8gbWFrZSB0aGVtIHJldXNhYmxlIGFuZCB0byBtYWtlCnRoZSBpbnRlbnRpb24gbW9yZSBv
YnZpb3VzLgoKT2YgY291cnNlLCB0aGVyZSBpcyBub3QgbXVjaCBkaWZmZXJlbmNlIGJldHdlZW4g
dGhlIHNoYXR0ZXJpbmcgbG9naWMgb2YKZWFjaCBsZXZlbCwgc28gd2UgY291bGQgZnVydGhlciB0
dXJuIHRoZSBwZXItbGV2ZWwgZnVuY3Rpb25zIGludG8gYQpzaW5nbGUgbWFjcm8sIGFsdGhvdWdo
IHRoaXMgaXMgbm90IHRoYXQgc2ltcGxlIHNpbmNlIHdlIGhhdmUgcGVyLWxldmVsCmZ1bmN0aW9u
cyBhbmQgbWFjcm9zIGFsbCBvdmVyIHRoZSBwbGFjZSBhbmQgdGhlcmUgYXJlIHNsaWdodCBkaWZm
ZXJlbmNlcwpiZXR3ZWVuIGxldmVscy4gS2VlcCBpdCBwZXItbGV2ZWwgZm9yIG5vdy4KCnRyZWU6
Cmh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9oeDI0Mi94ZW4uZ2l0IHNo
YXR0ZXItcmVmYWN0b3IKCi0tLQpDaGFuZ2VzIGluIHYzOgotIHN0eWxlIGFuZCBpbmRlbnRhdGlv
biBmaXhlcy4KCkNoYW5nZXMgaW4gdjI6Ci0gcmViYXNlLgotIGltcHJvdmUgYXNtIGNvZGUuCi0g
YXZvaWQgc3RhbGUgdmFsdWVzIHdoZW4gdGFraW5nIHRoZSBsb2NrLgotIG1vdmUgYWxsb2NhdGlv
biBvZiBQVEUgdGFibGVzIGluc2lkZSB0aGUgc2hhdHRlciBmdW5jdGlvbi4KCkhvbmd5YW4gWGlh
ICgyKToKICB4ODYvbW06IGZhY3RvciBvdXQgdGhlIGNvZGUgZm9yIHNoYXR0ZXJpbmcgYW4gbDMg
UFRFCiAgeDg2L21tOiBmYWN0b3Igb3V0IHRoZSBjb2RlIGZvciBzaGF0dGVyaW5nIGFuIGwyIFBU
RQoKIHhlbi9hcmNoL3g4Ni9tbS5jIHwgMTk0ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5OCBpbnNlcnRpb25zKCspLCA5NiBk
ZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
