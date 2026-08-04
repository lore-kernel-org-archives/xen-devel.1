Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CA3C55838
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:31:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382237.1625588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrH6e-00043a-Q2; Tue, 04 Aug 2026 15:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382237.1625588; Tue, 04 Aug 2026 15:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrH6e-00043T-Mh; Tue, 04 Aug 2026 15:31:04 +0000
Received: by outflank-mailman (input) for mailman id 1382237;
 Tue, 04 Aug 2026 15:31:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1wrH6d-00043N-P7
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:31:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1wrH6d-004pGb-2q
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:31:03 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1wrH6d-00AukV-1u
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:31:03 +0000
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5b013aa02b2so1298592e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:31:03 -0700 (PDT)
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
	From:MIME-Version; bh=wUnWfLwtyqKHjxc5MZcvpzA2F49Qe7vEZ46gubm6ZLI=; b=0UzYp0W
	OJVmRrw3XaohqaeIDfpxYTdqiMx/jYZxPmQgvohnJMlghlOx8oar0Pjm4ZB+1N+ulPQnS8Oz1DEtc
	JegPQ/l5Om4AiEoHEU/S2SENKfVDHq8HTaZUah0EjTb4IFI/O6Mia3kxevCO2MnYUWb5x0widSwFc
	Ec9TIvYFU4=;
X-Gm-Message-State: AOJu0Yxap6+y+HvC260fpNqEBXBFd+91DRr27+E/aMSm6so7sKPXsv8J
	RDFMggEggYJiyE/J9PqN23K2te8hF3M/TaCvZHbFF2VMkTkteyVqhVgI/28OLu9IcPbI/5ZlbzO
	wfZi5MULUTX28OFUhpqvgfAizM+g5Fbg=
X-Received: by 2002:a05:6512:3b90:b0:5b0:1e26:7751 with SMTP id
 2adb3069b0e04-5b2ee5e4dbbmr1249418e87.8.1785857462436; Tue, 04 Aug 2026
 08:31:02 -0700 (PDT)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Tue, 4 Aug 2026 17:30:50 +0200
X-Gmail-Original-Message-ID: <CAJbE=KznNsrNRN=pUaDj7-TVW4uCMVBdrPpei_z5nBdjdHnVag@mail.gmail.com>
X-Gm-Features: AUfX_mz1wVMRUzsBvMVX98GLu2pW70C6sFQH8l8wnmnEUy5iBrUe5l1BBD3W3oM
Message-ID: <CAJbE=KznNsrNRN=pUaDj7-TVW4uCMVBdrPpei_z5nBdjdHnVag@mail.gmail.com>
Subject: [ANNOUNCE] - Call for agenda items for August 6 Xen Community Call @
 15:00 UTC
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000ab072206583a57bb"

--000000000000ab072206583a57bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

It's time for the August Xen Project Community Call, happening this
Thursday, 6 August at 15:00 UTC.

Whether you have updates to share or just want to listen in, we'd love to
have you join. It's a great opportunity to hear what the community has been
working on, discuss ongoing project activities, and catch up on recent
developments.

*Preparation*

=F0=9F=91=89 Please take a few minutes to review and update the agenda befo=
re the
call:

https://cryptpad.fr/pad/#/2/pad/edit/eqPXghB7GwT4OuySCjSQRyVD/

Feel free to:
- Add topics or project updates
- Suggest anything we can drop or defer
- Include links to patches, mailing list threads, or documentation where
helpful

The agenda also includes the meeting link and a link to find your local
meeting time.


*Call Details*
Date: Thursday, 6 August 2026
Time: 15:00 UTC (agenda starts at 15:05 UTC)
Join: https://meet.jit.si/XenProjectCommunityCall

We'll open the room at 15:00 UTC and begin the agenda at 15:05 UTC to give
everyone a few minutes to join.

Want to be CC'd on future community call announcements?

Add or remove yourself from our sign-up sheet:
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/

See you on Thursday!

Best regards,

Cody Zuschlag
Xen Project - Community Manager

--000000000000ab072206583a57bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,<br><br>It&#39;s time for the August Xen =
Project Community Call, happening this Thursday, 6 August at 15:00 UTC.<br>=
<br>Whether you have updates to share or just want to listen in, we&#39;d l=
ove to have you join. It&#39;s a great opportunity to hear what the communi=
ty has been working on, discuss ongoing project activities, and catch up on=
 recent developments.<br><br><b>Preparation</b><br><br>=F0=9F=91=89 Please =
take a few minutes to review and update the agenda before the call:<br><br>=
<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/eqPXghB7GwT4OuySCjSQRyVD/">=
https://cryptpad.fr/pad/#/2/pad/edit/eqPXghB7GwT4OuySCjSQRyVD/<br></a><br>F=
eel free to:<br>- Add topics or project updates<br>- Suggest anything we ca=
n drop or defer<br>- Include links to patches, mailing list threads, or doc=
umentation where helpful<br><br>The agenda also includes the meeting link a=
nd a link to find your local meeting time.<br><br><b>Call Details<br></b><b=
r></div><div>Date: Thursday, 6 August 2026<br>Time: 15:00 UTC (agenda start=
s at 15:05 UTC)<br>Join: <a href=3D"https://meet.jit.si/XenProjectCommunity=
Call">https://meet.jit.si/XenProjectCommunityCall</a><br><br>We&#39;ll open=
 the room at 15:00 UTC and begin the agenda at 15:05 UTC to give everyone a=
 few minutes to join.<br><br>Want to be CC&#39;d on future community call a=
nnouncements?<br><br>Add or remove yourself from our sign-up sheet:<br><a h=
ref=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/">http=
s://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a><br><br>See y=
ou on Thursday!<br><br>Best regards,<br><br></div><div><img src=3D"https://=
ci3.googleusercontent.com/mail-sig/AIorK4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36Jr=
wBCQtitBSW_0NeDS6mBmJ2F4vZVE2oBOqnY6IaJUrl12" style=3D"background-color: tr=
ansparent;"></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr"><div>Cody Zuschlag</div><div>Xen=
 Project - Community Manager</div></div></div></div></div>

--000000000000ab072206583a57bb--

