Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52578CD5BD1
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2026 16:47:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1325283.1590778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUSGT-0001ad-9M; Tue, 02 Jun 2026 16:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325283.1590778; Tue, 02 Jun 2026 16:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUSGT-0001aW-6b; Tue, 02 Jun 2026 16:46:53 +0000
Received: by outflank-mailman (input) for mailman id 1325283;
 Tue, 02 Jun 2026 16:46:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1wUSGS-0001aO-9J
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 16:46:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1wUSGS-003I5U-0d
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 16:46:52 +0000
Received: from mail-lf1-f51.google.com ([209.85.167.51])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1wUSGS-007szZ-0T
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 16:46:52 +0000
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5aa68d9d56fso2811580e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 09:46:52 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Type:To:Subject:Message-ID:Date:
	From:MIME-Version; bh=ZuEZ7VDIRlcy3Mm/2scIYVUfBwa/78iDP8jt9yxLeKw=; b=0eUB6fM
	PWakm8DPhfNYj14XEk+zgpD9eQQgBCMjBMYjRf9IQ4uVT030CZ4F9PkM0ATBwrz5PEiYYR4psX3M8
	sQ/eCWUytd2cycw49fsU0QOImjBPKpwfIHJ528U6+L61DZwS+gxwl5qqSz5z3NZKFfLBMoVzmNFd5
	6pP88rE0I8=;
X-Gm-Message-State: AOJu0Yz8czmJWUFWB5bly5mOuAare2+wIXG8pTfVMx0BwrZU7PJLObxk
	VhXVrKgayJaRaA6S8ZFElbrCIAmYvV8q8jUdHEvkixZmoPms2+Z8sYu13lQaZJvwol/1R7h8TIh
	VIov6OULxNlZqhxzks+HVwFf0CdVQdVw=
X-Received: by 2002:a05:6512:3d1a:b0:5aa:6b84:3b70 with SMTP id
 2adb3069b0e04-5aa6b843ec9mr3187603e87.6.1780418811001; Tue, 02 Jun 2026
 09:46:51 -0700 (PDT)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Tue, 2 Jun 2026 18:46:39 +0200
X-Gmail-Original-Message-ID: <CAJbE=Ky-BJ_wnDjqSBTSxooBh6FGhjmRT2toy8k5FJrVmv3Z_Q@mail.gmail.com>
X-Gm-Features: AVHnY4LUnrIE440_XRSmSbkN2N_ZQMRpeElDHxd_iq0CaBA5G3DmzQO-ARrCVz0
Message-ID: <CAJbE=Ky-BJ_wnDjqSBTSxooBh6FGhjmRT2toy8k5FJrVmv3Z_Q@mail.gmail.com>
Subject: [ANNOUNCE] - Call for agenda items for June 4 Xen Community Call @
 15:00 UTC
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000c806310653480ec6"

--000000000000c806310653480ec6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

It=E2=80=99s time for the June Xen Project Community Call, happening this T=
hursday
at 4 pm UK time.

We=E2=80=99d love to have you join. You=E2=80=99re welcome to participate o=
r just listen
in. It=E2=80=99s a great way to stay aligned, hear what others are working =
on, and
help move a few ongoing topics forward.


*Preparation:*Please take a moment to review and update the agenda ahead of
the call:
=F0=9F=91=89 Agenda <https://cryptpad.fr/pad/#/2/pad/edit/PrudcbjtZc-4btgSO=
o5ftG0b/>

Feel free to:
- Add topics or updates
- Suggest anything we can drop or defer
- Include links to patches, threads, or docs where helpful


*Call Details:*Date: Thursday, 4 June 2026
Time: 15:00 UTC (agenda starts at 15:05 UTC)
Find your local timezone here
<www.worldtimebuddy.com/?qm=3D1&lid=3D5368361,2988507,5128581,2643743,100,1=
850147,6&h=3D2988507&date=3D2026-6-4&sln=3D17-18&hf=3Dundefined&c=3D1452>

Join: https://meet.jit.si/XenProjectCommunityCall

We=E2=80=99ll open the room at 15:00 UTC and start the agenda at 15:05 UTC =
to give
everyone a few minutes to join.

Want to be CC=E2=80=99d on future calls?
Add or remove yourself from our Sign-up Sheet
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>

See you there!


Cody Zuschlag
Xen Project - Community Manager

--000000000000c806310653480ec6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,<br><br>It=E2=80=99s time for the June Xe=
n Project Community Call, happening this Thursday at 4 pm UK time.<br><br>W=
e=E2=80=99d love to have you join. You=E2=80=99re welcome to participate or=
 just listen in. It=E2=80=99s a great way to stay aligned, hear what others=
 are working on, and help move a few ongoing topics forward.<br><br><b>Prep=
aration:<br></b>Please take a moment to review and update the agenda ahead =
of the call:<br>=F0=9F=91=89 <a href=3D"https://cryptpad.fr/pad/#/2/pad/edi=
t/PrudcbjtZc-4btgSOo5ftG0b/">Agenda</a><br><br>Feel free to:<br>- Add topic=
s or updates<br>- Suggest anything we can drop or defer<br>- Include links =
to patches, threads, or docs where helpful<br><br><b>Call Details:<br></b>D=
ate: Thursday, 4 June 2026<br>Time: 15:00 UTC (agenda starts at 15:05 UTC)<=
br>Find your local timezone <a href=3D"www.worldtimebuddy.com/?qm=3D1&amp;l=
id=3D5368361,2988507,5128581,2643743,100,1850147,6&amp;h=3D2988507&amp;date=
=3D2026-6-4&amp;sln=3D17-18&amp;hf=3Dundefined&amp;c=3D1452">here</a><br><b=
r>Join: <a href=3D"https://meet.jit.si/XenProjectCommunityCall">https://mee=
t.jit.si/XenProjectCommunityCall</a><br><br>We=E2=80=99ll open the room at =
15:00 UTC and start the agenda at 15:05 UTC to give everyone a few minutes =
to join.<br><br>Want to be CC=E2=80=99d on future calls?<br>Add or remove y=
ourself from our <a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxx=
AOe6RFPz0sRCf+/">Sign-up Sheet</a><br><br>See you there!</div><div><br></di=
v><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_s=
ignature"><div dir=3D"ltr"><img src=3D"https://ci3.googleusercontent.com/ma=
il-sig/AIorK4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36JrwBCQtitBSW_0NeDS6mBmJ2F4vZVE=
2oBOqnY6IaJUrl12"><br><div>Cody Zuschlag</div><div>Xen Project - Community =
Manager</div></div></div></div></div>

--000000000000c806310653480ec6--

