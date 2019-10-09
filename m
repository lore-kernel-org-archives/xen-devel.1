Return-Path: <SRS0=aHxP=YC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C65ECE58C
	for <xen-devel@archiver.kernel.org>; Wed,  9 Oct 2019 20:40:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1CD020B7C
	for <xen-devel@archiver.kernel.org>; Wed,  9 Oct 2019 20:40:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="HvUoCFYr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1CD020B7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIIkl-0000im-Kc; Wed, 09 Oct 2019 20:40:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oEee=YC=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iIIkk-0000ic-G3
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 20:40:10 +0000
X-Inumbo-ID: fb8e0bba-ead4-11e9-97f9-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb8e0bba-ead4-11e9-97f9-12813bfff9fa;
 Wed, 09 Oct 2019 20:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570653610;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=9Sy2/nDg4X8VpPhSCv1IZ+7twXgCig9ROPF8mnoEMoo=;
 b=HvUoCFYrbU9ypMkOAQJglEI/Ps2ZiIrSKR/QOWUOoufugrdEM7LtuQ4c
 d9w7Xb/jq6FmfVhL27Fxy2mINyeyXWDelYWCnBh6UUYJdfTZVl1i6BLLI
 kMq/2kVoDm5L3jqRRo6tT7ZmUsOZPaySJ/fXtHMjPIXOvXktg1df0vulQ U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rGkUwTnrBjXa5TOxaEecgh8XLQjhjbiNnxeJmLzcrMipPdk27ntR35ZBKhTyXvQ9DA4fzeiPu7
 XIv+ZjO99WyhxwrOtphFp5erQejR73ShcNnOpxi23Q9rxmD7eYAPK13q4f9mhPbsYm14+Vql1m
 l1Dh0QtW4wCaPDtf93bEt5fBNsh5JVeJBYrl2la6j9iDy4mnoOA/t4GjKUfY/YgXLHw9NonPQQ
 JLgnC55f6b0Tm/szg6GBa0u4+er0moyXKse1YJeZJCHwhAESv8VBcnqys/jSeX42cPz/FriSjG
 4tQ=
X-SBRS: 2.7
X-MesageID: 6682087
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,277,1566878400"; 
   d="scan'208";a="6682087"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 9 Oct 2019 21:40:00 +0100
Message-ID: <1570653603-9889-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v2 0/3] EFI GOP fixes
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
Cc: jgross@suse.com, Igor Druzhinin <igor.druzhinin@citrix.com>, wl@xen.org,
 andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWdvciBEcnV6aGluaW4gKDMpOgogIGVmaS9ib290OiBhZGQgbWlzc2luZyBwb2ludGVyIGRlcmVm
ZXJlbmNlIGluIHNldF9jb2xvcgogIHg4Ni9lZmk6IHByb3Blcmx5IGhhbmRsZSAwIGluIHBpeGVs
IHJlc2VydmVkIGJpdG1hc2sKICBlZmkvYm9vdDogbWFrZSBzdXJlIGdyYXBoaWNzIG1vZGUgaXMg
c2V0IHdoaWxlIGJvb3RpbmcgdGhyb3VnaCBNQjIKCiB4ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290
LmggfCAxMiArKysrKysrKystLS0KIHhlbi9jb21tb24vZWZpL2Jvb3QuYyAgICAgICB8IDEwICsr
KysrKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
