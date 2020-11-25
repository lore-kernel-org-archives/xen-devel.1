Return-Path: <SRS0=CtBx=E7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D38C5519F
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 10:06:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 085FC2083E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 10:06:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.fr header.i=@mail.fr header.b="DOf137Ih"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 085FC2083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mail.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.37515.69910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khrh7-0002hw-Gj; Wed, 25 Nov 2020 10:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37515.69910; Wed, 25 Nov 2020 10:06:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khrh7-0002hp-Do; Wed, 25 Nov 2020 10:06:37 +0000
Received: by outflank-mailman (input) for mailman id 37515;
 Wed, 25 Nov 2020 10:02:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m3fp=E7=mail.fr=psarpol@srs-us1.protection.inumbo.net>)
 id 1khrd1-0002co-72
 for Xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 10:02:23 +0000
Received: from shout12.mail.de (unknown [2001:868:100:600::f154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c859bdd-2892-4abb-9665-c7e89658dd50;
 Wed, 25 Nov 2020 10:02:21 +0000 (UTC)
Received: from shout01.mail.de (unknown [10.0.120.221])
 by shout12.mail.de (Postfix) with ESMTPS id DBC041A003E
 for <Xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 11:02:19 +0100 (CET)
Received: from postfix01.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id CDB27100530
 for <Xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 11:02:19 +0100 (CET)
Received: from smtp03.mail.de (smtp03.bt.mail.de [10.0.121.213])
 by postfix01.mail.de (Postfix) with ESMTP id B69ECA008B
 for <Xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 11:02:19 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp03.mail.de (Postfix) with ESMTPSA id 84AEAA1DFD
 for <Xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 11:02:19 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=m3fp=E7=mail.fr=psarpol@srs-us1.protection.inumbo.net>)
	id 1khrd1-0002co-72
	for Xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 10:02:23 +0000
X-Inumbo-ID: 2c859bdd-2892-4abb-9665-c7e89658dd50
Received: from shout12.mail.de (unknown [2001:868:100:600::f154])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2c859bdd-2892-4abb-9665-c7e89658dd50;
	Wed, 25 Nov 2020 10:02:21 +0000 (UTC)
Received: from shout01.mail.de (unknown [10.0.120.221])
	by shout12.mail.de (Postfix) with ESMTPS id DBC041A003E
	for <Xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 11:02:19 +0100 (CET)
Received: from postfix01.mail.de (postfix02.bt.mail.de [10.0.121.126])
	by shout01.mail.de (Postfix) with ESMTP id CDB27100530
	for <Xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 11:02:19 +0100 (CET)
Received: from smtp03.mail.de (smtp03.bt.mail.de [10.0.121.213])
	by postfix01.mail.de (Postfix) with ESMTP id B69ECA008B
	for <Xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 11:02:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.fr;
	s=mailfr201610; t=1606298539;
	bh=XgxQGWScoI4a9fvBd3mlleQdIBJNzO4VjiBRlOBWePo=;
	h=From:To:Subject:Date:From;
	b=DOf137Ih3JsBp1ffmTk+wtqkvLhF6EnB85wq6QOfRWq1VjvBYn4bjDShzaZP1HAoo
	 lbT6VdQiQcp6iTFktVT46or0JZj2R4oZPZ77FtKFnT54I0JEbfp41IzFMp1ZxyTMC/
	 YslG/A+90x+jioFReXlrNUniJkqwY3RNAyrVIuH8=
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp03.mail.de (Postfix) with ESMTPSA id 84AEAA1DFD
	for <Xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 11:02:19 +0100 (CET)
From: psarpol@mail.fr
To: Xen-devel@lists.xenproject.org
Subject: Vtpm in Windows 10
X-Priority: 3
Date: Wed, 25 Nov 2020 11:02:19 +0100
Content-Type: multipart/alternative;
 boundary="=_1294934ae3dee858928fc76202b91ce9"
MIME-Version: 1.0
Message-Id: <20201125100219.84AEAA1DFD@smtp03.mail.de>
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 856
X-purgate-ID: 154282::1606298539-00000E46-177746DD/0/0

--=_1294934ae3dee858928fc76202b91ce9
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,  Is there a way to mount a vtpm 2.0 in a Windows 10 VM ? Thanks Paul

--=_1294934ae3dee858928fc76202b91ce9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<div style=3D"font-family: arial, helvetica,sans-serif; font-size: 10pt;=
 color: #000000;">Hi,&nbsp;</div>=0A<div style=3D"font-family: arial, he=
lvetica,sans-serif; font-size: 10pt; color: #000000;">Is there a way to=
 mount a vtpm 2.0 in a Windows 10 VM ?</div>=0A<div style=3D"font-family=
: arial, helvetica,sans-serif; font-size: 10pt; color: #000000;">Thanks<=
/div>=0A<div style=3D"font-family: arial, helvetica,sans-serif; font-siz=
e: 10pt; color: #000000;">Paul</div>

--=_1294934ae3dee858928fc76202b91ce9--

