Return-Path: <SRS0=mmt8=C5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E38C43463
	for <xen-devel@archiver.kernel.org>; Sun, 20 Sep 2020 11:44:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA24920EDD
	for <xen-devel@archiver.kernel.org>; Sun, 20 Sep 2020 11:44:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjbN8YJ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA24920EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=amsat.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJxlV-0004M5-NJ; Sun, 20 Sep 2020 11:44:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vT6p=C5=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1kJxlU-0004Lx-9u
 for xen-devel@lists.xenproject.org; Sun, 20 Sep 2020 11:44:20 +0000
X-Inumbo-ID: a724fad9-4292-4e63-8fac-80eb567674f5
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a724fad9-4292-4e63-8fac-80eb567674f5;
 Sun, 20 Sep 2020 11:44:19 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y15so9784513wmi.0
 for <xen-devel@lists.xenproject.org>; Sun, 20 Sep 2020 04:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v9lTKdRyWgAXgLShD6p3N0JX2tmU2Kap8fALmGmHpQ4=;
 b=FjbN8YJ/61NPb8IRHYk+tOswshfvDMH+vFGF2tVEQfN4ebDg4DXQ/9Ep609J7+l6It
 eQvyVhFuyMJJRKol3ucaDARONWEoatKlNtQkN0FTwJMlBD7hb6AwBPlijPeGkgCvgH6S
 ABzolCjZN7tBdCcnqB+88HMR/zobXGsYXy58AHYrteSdkaJmdTpHR1qyujyYIKfc/XGw
 El2Re6M31i1IBVGUWR2TQzBWgrX5p5CRonr/Pu5P3q46nt8gmbw/SoDqTXCasXzV6rEu
 bZ4xiAJ7/OO0/vEIBoJHHTRaBhgb+LrvflxHbvDs7Y/yzAag4qTD7eIouYPeDVfae30R
 e0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=v9lTKdRyWgAXgLShD6p3N0JX2tmU2Kap8fALmGmHpQ4=;
 b=VibBsFTnl46xbsuw2yETyMg/kwb9xG0u7PPlOvajhBC+boWvzLKUiE/SJUsmH16Gbx
 gZNzi3LCmfUWSvyAoJlmsxGGdXvJRxcow9wxm7ROznLJZyYnZoqJgozVwcXPEKaEg6oO
 QJFQ6B/N/ohjil5FieJMyoulmv/k3hfIfrDl+5elH99RcTozABDPJU4cNYXlFlqUeBIU
 BW/9ZX3MXKUGeZTUFZZVeC9kif0NNiCJyBoA2iTV5dXaeIzLEWNSFh8d1Na/N1/+JEEy
 HmgBujfmz2WuGfTeE7Ha3qQVkX1crcmRDD1Gcg4pVKhlRfn2GING3zM3BiywvWc0+Tkv
 SP3Q==
X-Gm-Message-State: AOAM53166hzSJQNdAPooG90dtFe4wV8qvOaLJ879aeWJYGN5cnPvLaEP
 LpoLhvNBekMoSNKY/Ft2J/w=
X-Google-Smtp-Source: ABdhPJxswx0awIIBdWi6zxkm04w3J+qmG0J90c1L5+9PcAjhA5yy+8kww9qa7QFYtODWrprNvR4UqQ==
X-Received: by 2002:a05:600c:4104:: with SMTP id
 j4mr24161783wmi.36.1600602258565; 
 Sun, 20 Sep 2020 04:44:18 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id e18sm16415708wra.36.2020.09.20.04.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 04:44:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 0/2] qdev: Let BusRealize() return a boolean value to indicate
 error
Date: Sun, 20 Sep 2020 13:44:14 +0200
Message-Id: <20200920114416.353277-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

To ease error checking in DeviceRealize handlers, let BusRealize
return a boolean value, as qbus_realize() does.

Having DeviceRealize similarly return a boolean value is left as
an exercice for volunteers :)

Philippe Mathieu-Daudé (2):
  qdev: Document qbus_realize() and qbus_unrealize()
  qdev: Let BusRealize() return a boolean value to indicate error

 include/hw/qdev-core.h | 26 +++++++++++++++++++++++++-
 hw/hyperv/vmbus.c      |  5 +++--
 hw/nubus/nubus-bus.c   |  5 +++--
 hw/pci/pci.c           | 12 +++++++++---
 hw/xen/xen-bus.c       |  5 +++--
 5 files changed, 43 insertions(+), 10 deletions(-)

-- 
2.26.2


