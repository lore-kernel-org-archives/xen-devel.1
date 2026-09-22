Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D62FC982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:04:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428459.1651283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xMi-0005J1-R3; Tue, 22 Sep 2026 10:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428459.1651283; Tue, 22 Sep 2026 10:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xMi-0005Iu-OS; Tue, 22 Sep 2026 10:04:44 +0000
Received: by outflank-mailman (input) for mailman id 1428459;
 Tue, 22 Sep 2026 10:04:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <support@trinity-net.com>) id 1x8xMg-0005Ig-EJ
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:04:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8xMf-00FzmI-RN
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 12:04:41 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <support@trinity-net.com>)
 id 6ab252b6-e002-0a2a0a5209dd-0a2a4501e8fa-10
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 12:04:41 +0200
Received: from [46.105.55.200] (helo=6.mo563.mail-out.ovh.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <support@trinity-net.com>)
 id 6ab252b8-5984-0a2a45010019-2e6937c8b1cb-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 12:04:41 +0200
Received: from director6.derp.mail-out.ovh.net
 (director6.derp.mail-out.ovh.net [79.137.60.226])
 by mo563.mail-out.ovh.net (Postfix) with ESMTPS id 4hpwgX32ZXz5xBq;
 Tue, 22 Sep 2026 10:04:40 +0000 (UTC)
Received: from director6.derp.mail-out.ovh.net
 (director6.derp.mail-out.ovh.net. [127.0.0.1])
 by director6.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <marmarek@invisiblethingslab.com>; Tue, 22 Sep 2026 10:04:40 +0000 (UTC)
Received: from mta2.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.96.120])
 by director6.derp.mail-out.ovh.net (Postfix) with ESMTPS id
 4hpwgX1hzLz46XY; Tue, 22 Sep 2026 10:04:40 +0000 (UTC)
Received: from mailstore7.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.1.8.7])
 by mta2.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTP id
 47B7F3E1C79; Tue, 22 Sep 2026 10:04:39 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ovhmo-selector-1 header.d=trinity-net.com header.i="@trinity-net.com" header.h=From
Date: Tue, 22 Sep 2026 10:04:39 +0000 (UTC)
From: Support TRINITY <support@trinity-net.com>
To: Sasha Levin <sashal@kernel.org>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, 
	Sasha Levin <sashal@kernel.org>, 
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	regressions <regressions@lists.linux.dev>, 
	linux-acpi <linux-acpi@vger.kernel.org>, 
	linux-pm <linux-pm@vger.kernel.org>, 
	xen-devel <xen-devel@lists.xenproject.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Stable <stable@vger.kernel.org>
Message-ID: <85435495.299101679.1790071479170.JavaMail.zimbra@trinity-net.com>
In-Reply-To: <2026-09-21-daily-reply-0001-re-acpi-cpuidle-xen-dom0-6-18@kernel.org>
References: <1909296988.289641012.1790015372050.JavaMail.zimbra@trinity-net.com> <2026-09-21-daily-reply-0001-re-acpi-cpuidle-xen-dom0-6-18@kernel.org>
Subject: Re: [REGRESSION] ACPI processor/cpuidle change in 6.18.52 breaks
 bare-metal Xen dom0 boot
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [93.25.54.230]
X-Authenticated-User: support@trinity-net.com
Thread-Topic: ACPI processor/cpuidle change in 6.18.52 breaks bare-metal Xen dom0 boot
Thread-Index: K73oORQOTU57TlGFBhdBixjIo6r4Nw==
x-ovh-tracer-id: 5960514109192304155
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGW2IyZ/YhHU9dSERzRYRpzlG0d5PBjuMM0K21jz02Okjd/bCKxP1ZZRuOy/r/ltrGOr888QHzjvDzzQi0zj0e4dR+2bAR/+R5MiSycoysPZjrO4AkftF3W8vsz6sYndEZb11LXltTssTuH3cOm3NP7FMwSfLDM4TpFiRM0f8kwLKIjc1sjh1mq+V1a49WPCknOvHd+6HbFREV6QWabnMcF1iWJPn/XdJ0h2YIJrvYkDioxQiNhuucf8YCjEDugAeC6CDc9v8yBLGuRKHaDh9Y8a4rat0hJKtkf+jmC5RDEOsrwiNA929B7TyYqVi76j6YnQg/UkD3KxtM3T+NyePm/nl6lpqhjSrJb6CIlzOTm/ovxqvyM2s2w067weK8F5tLYlwMR2Q4VYJhw8iC7LtzUqXb2LH6+jU92iwCRleThQlUbC6Z0fWGXQfVKe4/w49zB011P8Ps0Iup2oL1EEdCa6P77NRQcwCybSn1jRzIEmGpOdnRHRv4ibhop54BmayavlnDMye4CjEtUYTGHMQHGopXIAm5faRbrlXNuaaotm+LIjnskpaFCxAyxdETDPsxHH6oU9AbDWl+48A9jqIizrN9dsRSHih4XBZTE8ST0EAJ+tO6BWBDGbkn26cy5ORq+weZ/21z56gDpsC6jogFYmRcUYq8kXsp3AQpEO5fC7g
DKIM-Signature: a=rsa-sha256; bh=SQqW3vRIkopO+wMee+p+HGuzJFeS+9zxJ92hnhTL4vE=;
 c=relaxed/relaxed; d=trinity-net.com; h=From; s=ovhmo-selector-1;
 t=1790071480; v=1;
 b=VaG/sPRT/5Wkmyg6O2UgpCTVF3vInOg+yIy0yxjvtzD+plqdz/3Jn8A2tgKtSc4LHHhFb9A2
 TaHW5/PY2TSRsydiH3xeLpmPt/o4ErSwqQ/dBL6rslyZnGDs5zfOTBKOuQx1dxeGg6+wTqHc6HH
 i4NejfDLPmyb8yaJHV2TSSmhLfJbbFTxt4DsXcO4PvvlJibEsebZPiZSZFWKWszTcZ/SFnE3on6
 5y2aKAVehynIDD4854CTMrOL+J7+kFigmlPlagWvJ92YgDZoMKz8t0xgKOL9me0y2n8zlWvMpG5
 6GLGQLBsnGp6ZFcqqQF64ERmSEuMxY8baALBB9axwHFtg==
X-purgate-ID: tlsNG-d62444/1790071481-BEE60757-469D8914/0/0
X-purgate-type: clean
X-purgate-size: 1533

I have now tested Linux 6.18.52 with commit:

0089ce1c056a ("ACPI: processor: Update cpuidle driver check in __acpi_proce=
ssor_start()") applied on the affected Alpine Xen dom0 bare-metal host.

Result: it boots successfully.

Xen dom0 comes up correctly, /proc/xen is mounted, xenstored starts, SSH
is reachable, and xl info, xl list, etc... work as expected.

So this confirms that 0089ce1c056a fixes the regression on this affected
Alpine system.

Thank you Rafael for identifying the missing stable dependency.

Regards,
Tony


-----Message original-----
De: Sasha Levin <sashal@kernel.org>
=C3=A0: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>; Marek Marczykowski-G=C3=B3recki <marma=
rek@invisiblethingslab.com>; regressions <regressions@lists.linux.dev>; lin=
ux-acpi <linux-acpi@vger.kernel.org>; linux-pm <linux-pm@vger.kernel.org>; =
xen-devel <xen-devel@lists.xenproject.org>; linux-kernel <linux-kernel@vger=
.kernel.org>; Stable <stable@vger.kernel.org>; Support TRINITY <support@tri=
nity-net.com>
Envoy=C3=A9: mardi 22 septembre 2026 04:23 CEST
Sujet : Re: [REGRESSION] ACPI processor/cpuidle change in 6.18.52 breaks ba=
re-metal Xen dom0 boot


> I will try testing 6.18.52 with commit 0089ce1c056a ("ACPI: processor:
> Update cpuidle driver check in __acpi_processor_start()") applied,
> instead of using my lifecycle revert.

Queued for 6.18, thanks.

Please still post the result of that test once you have it.

--=20
Thanks,
Sasha

