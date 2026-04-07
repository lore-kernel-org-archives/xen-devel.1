Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6635EFEEF25
	for <xen-devel@archiver.kernel.org>; Tue,  7 Apr 2026 12:49:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1274972.1560929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA5ro-0005Ja-1Z; Tue, 07 Apr 2026 12:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274972.1560929; Tue, 07 Apr 2026 12:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA5rn-0005JT-VH; Tue, 07 Apr 2026 12:49:15 +0000
Received: by outflank-mailman (input) for mailman id 1274972;
 Tue, 07 Apr 2026 12:49:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d4fd46.v1-4ef5e6487b0943b7995d36e71b58647b@bounce.vates.tech>)
 id 1wA5rm-0005JN-Jg
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 12:49:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA5rk-00C3ho-KC
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 14:49:12 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d4fd46.v1-4ef5e6487b0943b7995d36e71b58647b@bounce.vates.tech>)
 id 69d4fd47-e002-0a2a0a5209dd-0a2a4503e956-6
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 14:49:12 +0200
Received: from [198.2.180.46] (helo=mail180-46.suw31.mandrillapp.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d4fd46.v1-4ef5e6487b0943b7995d36e71b58647b@bounce.vates.tech>)
 id 69d4fd47-02b3-0a2a45030019-c602b42e66fe-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 14:49:12 +0200
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-46.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4fqmGt6QjVz8XS3Fp
 for <xen-devel@lists.xenproject.org>; Tue,  7 Apr 2026 12:49:10 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4ef5e6487b0943b7995d36e71b58647b; Tue, 07 Apr 2026 12:49:10 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1775566150; x=1775836150;
	bh=2dO8KJZbjBKVZqh2x7EcvVUJFpqgCoHPe/hpAMGoaRQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Mok9MVCWhAyudV2MGq9djdrWXkJHc6Vp/TvePs66UzimFGwvA9mqqF95Dk+RqxqeV
	 4lZajoBSfBgjpEGYI+A4KjabPDVZnXo7JlH/l+G7X/2P9Q3N60du/B2I4pxw+Z9TeD
	 siobFgZcMdi8Y0Dooh2/QGJb9GnNgp2KbmmYzTRKbonmZP89deiB7udFvCPcgNZbJ9
	 d0qkpjGBMs6+fYKpmMx7VhX0n6E7n7wGg7wwRvduF4LQGBJVfdr0emDitjYUtKo4Cl
	 4YlTv0uPAOOyzhzB0/40QYWv1kUTJkTNFzVVFzuLYQ1vvHK9xU6sTDnq1eiFYv5jqW
	 aBCzeu8ptP6rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775566150; x=1775826650; i=teddy.astie@vates.tech;
	bh=2dO8KJZbjBKVZqh2x7EcvVUJFpqgCoHPe/hpAMGoaRQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=XBhl/6GqAkL8d+rCqjrRRK3sBt6sW2T0Uhx1QbOr1A6z9bKKZo5Zbe+BUHswkfpRK
	 e8hBzCPj7JE6iWCidEmhHWpWsJ+qu9+IvxgbPxW9PvrszZe6lSnFY7PohrscItGvCD
	 diGOr/yAjnUphg/cRwBE3NLxECbDqbGG1Io8g5JQrzjtfnX0Uzb0XRvloqT7FmhzIQ
	 rKkWeH6MxsJ+hU1IMvNpr5MioNhcduWgfnGHWdfpLgVrtQSWidQuYmGHO0uIwt/y0Z
	 ssvfg409UVdwvYd1bOMMWiNcOUtodxHS35F8NYgfE44aezZ7UAi8S58Ew/qsDXxzak
	 z5aWWbGnd3prA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20MAINTAINERS:=20Add=20myself=20as=20x86=20reviewer?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775566148852
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <20260407124840.80174-2-teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4ef5e6487b0943b7995d36e71b58647b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260407:md
Date: Tue, 07 Apr 2026 12:49:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1775566152-CB92AC9A-193E5811/0/0
X-purgate-type: clean
X-purgate-size: 1383

I already started reviewing patches, but would like to
be more active in that area.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1ac61da59a..77f72e52f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -225,6 +225,7 @@ M:=09Jan Beulich <jbeulich@suse.com>
 M:=09Andrew Cooper <andrew.cooper3@citrix.com>
 M:=09Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
 R:=09Jason Andryuk <jason.andryuk@amd.com>
+R:=09Teddy Astie <teddy.astie@vates.tech>
 S:=09Supported
 F:=09xen/drivers/passthrough/amd/
 
@@ -233,6 +234,7 @@ M:=09Jan Beulich <jbeulich@suse.com>
 M:=09Andrew Cooper <andrew.cooper3@citrix.com>
 M:=09Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
 R:=09Jason Andryuk <jason.andryuk@amd.com>
+R:=09Teddy Astie <teddy.astie@vates.tech>
 S:=09Supported
 F:=09xen/arch/x86/cpu/vpmu_amd.c
 F:=09xen/arch/x86/hvm/svm/
@@ -613,6 +615,7 @@ X86 ARCHITECTURE
 M:=09Jan Beulich <jbeulich@suse.com>
 M:=09Andrew Cooper <andrew.cooper3@citrix.com>
 M:=09Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
+R:=09Teddy Astie <teddy.astie@vates.tech>
 S:=09Supported
 L:=09xen-devel@lists.xenproject.org
 F:=09xen/arch/x86/
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



