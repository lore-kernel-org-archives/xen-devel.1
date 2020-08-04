Return-Path: <SRS0=QSaH=BO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D74CC433DF
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2020 09:26:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2083D2086A
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2020 09:26:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="L9k1eWw6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2083D2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2tDN-0001sk-1r; Tue, 04 Aug 2020 09:26:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FaF5=BO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1k2tDM-0001sf-DF
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 09:26:32 +0000
X-Inumbo-ID: 86032adc-4d69-477a-a118-c0ab5446eb94
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86032adc-4d69-477a-a118-c0ab5446eb94;
 Tue, 04 Aug 2020 09:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596533191;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BGtV4buQLSV4kVsmhw15UWdyjLxZS1wmHPQnT8rh4jE=;
 b=L9k1eWw6zNvMJQh+TF0r5ZQwzsL/avFvCL7k2NSLVa76x4vzhdjj52+u
 3hv1dfAXJGC8zeBjVt1EJkjy+TrYTTxccAKPweJyFUluAUJYHz4zayVyA
 tKRhmWYWLeeVSmLRgexqzu1j7wDF375vd+IAMbpzTz39DrK/FAehW2Yaq Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 186U1PMTFN/6mFC++GOTqG77LsGWlYBb5SaonSm0/OhiP55JNb3TbJV9WIGWBcsA2EzDXE7EcR
 ZKeELt/7IBjcwB48D0IjIvy36wydjXxWJ8gmdCvuvT4fVCoPp5hu8e8YQgle6nIdF33xB9aiVQ
 g6t2T5HRpE8QYtyX/Xjo7oVrXl8aEoC/5BIYIQOdsatvvlVU9QsNo4+3UaLQhA3GerGUMlI0iz
 QVd/rm+VE6TwOGp2eoHUD8km/jI2Ed8Lz77C4ri2Rbrv8cFG3zrZjA44Pt8vQTHO420qV5AJzr
 se4=
X-SBRS: 3.7
X-MesageID: 23979476
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,433,1589256000"; d="scan'208";a="23979476"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PULL 0/1] xen queue 2020-08-04
Date: Tue, 4 Aug 2020 10:26:23 +0100
Message-ID: <20200804092624.1126013-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Peter Maydell <peter.maydell@linaro.org>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The following changes since commit 5c1c3e4f02e458cf280c677c817ae4fd1ed9bf10:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200803' into staging (2020-08-03 20:34:26 +0100)

are available in the Git repository at:

  https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20200804

for you to fetch changes up to 8e0ef068942e4152f0d23e76ca1f5e35dc4456f7:

  accel/xen: Fix xen_enabled() behavior on target-agnostic objects (2020-08-04 10:21:35 +0100)

----------------------------------------------------------------
xen patch

Bug fix.

----------------------------------------------------------------
Philippe Mathieu-Daudé (1):
      accel/xen: Fix xen_enabled() behavior on target-agnostic objects

 accel/stubs/xen-stub.c |  2 ++
 accel/xen/xen-all.c    |  7 +------
 include/sysemu/xen.h   | 18 ++++++++++++++----
 3 files changed, 17 insertions(+), 10 deletions(-)

