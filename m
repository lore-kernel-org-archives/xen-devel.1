Return-Path: <SRS0=UVjy=BV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C25D2C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2020 10:16:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90D562054F
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2020 10:16:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Keg/L7cc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90D562054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5RKM-0007pR-7j; Tue, 11 Aug 2020 10:16:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WNGP=BV=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1k5RKK-0007pM-DR
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 10:16:16 +0000
X-Inumbo-ID: e8ef0613-e4c3-4e0d-b4bc-5e3b33a59cc9
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8ef0613-e4c3-4e0d-b4bc-5e3b33a59cc9;
 Tue, 11 Aug 2020 10:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597140975;
 h=from:to:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=fKElvlIiZjyWWqbhK0N7I4nPHrssp+FFnAXqo+f/iZM=;
 b=Keg/L7ccOEiFC1W63WuauHDvwAPoVcx5ePX6GWAUHMWbFJmkjRKgfwIA
 xzSj8QBEuDdGyowRK+3l8yIXj4N9EAJ97j7ryFaIO1RyXrGqPfYKW1lgD
 me2fd1lJ6vPUlKP5xviilAcWgY9/0HbedgfHyXZN4LmPTxezeQpzmbyFm U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: o1FIqUiX21DXnM0qA4ZC5ut7r7ZOuPJGaN835SUV4vIiSGp0u1od2JRKx4ucG5CJhIqp7tTKsB
 5BCu6AQxFo6nC37cPln5XHMocOirTX+f3ie3RLAebhoOZkZw1OOHwPmp6AUm8vTK0bDLQM2Fcq
 AuqycWiVzIK+fTiJOpEJBAk+PGlJ1fLsjm1YGtoEDbqBCvRZ5HT5G9ojgk+jM2zycYwhsKGGK2
 FRidaiVHAbOD4DeZwSvZVDPrwbJGxkFVXUL39Dyb8LYnare8a/5pysStZEdBtnkNFt3KjguBwW
 oEs=
X-SBRS: 2.7
X-MesageID: 24271129
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,460,1589256000"; d="scan'208";a="24271129"
From: George Dunlap <George.Dunlap@citrix.com>
To: "open list:X86" <xen-devel@lists.xenproject.org>
Subject: XenSummit videos available
Thread-Topic: XenSummit videos available
Thread-Index: AQHWb8hvnDEuLEETYk2R3yxlFfVZcw==
Date: Tue, 11 Aug 2020 10:16:11 +0000
Message-ID: <4C9CF9E8-1FD3-45C9-A352-FB09F6E03BED@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <144DC0CC1DF6934FA367CB40DC88DD21@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

The videos for the XenSummit have all been posted on our YouTube channel:

https://www.youtube.com/playlist?list=3DPLYyw7IQjL-zFYmEoZEYswoVuXrHvXAWxj

 -George

