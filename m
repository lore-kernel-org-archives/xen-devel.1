Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096EEC624D3
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 16:01:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404838.1638508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1QvJ-0006LD-G5; Tue, 01 Sep 2026 16:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404838.1638508; Tue, 01 Sep 2026 16:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1QvJ-0006L6-CX; Tue, 01 Sep 2026 16:01:21 +0000
Received: by outflank-mailman (input) for mailman id 1404838;
 Tue, 01 Sep 2026 16:01:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1QvI-0006Kt-Nw
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 16:01:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1QvH-00F4kI-Pq
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 18:01:19 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a96f6cf-8faa-0a2a0a5109dd-0a2a4502a60c-2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 18:01:19 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a96f6cf-6ca4-0a2a45020019-d155dd33b0d9-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 18:01:19 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-484415c8cb1so47376f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 09:01:19 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442d6e9cfsm6093550f8f.22.2026.09.01.09.01.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 09:01:18 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788278479; x=1788883279; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uxs4dwxHLDrtpiehWQZcP6/OkQeIFJi5v0FYqUxYdnc=;
        b=nB38xEYMcSjGlnTkv426FbLxZd3cM++3MZ5URx4z/gYfIWglW6LJJBeh9JsQb0FkpT
         jLPdIaGeDY66ZOe47uCDSZVE0T3tNBDWeSXbe+98twnquQmMW3fdcBFPozhCPUrnlju5
         kc9fx2H7Dqa56jdECk/iaVS2KbtVGT84qWUsfcFR+HF4xNMENflMJbEStBLOW1Kc3jtg
         hmijjC0f6ElcQ2RUQAx1vSLPdex7lCf5zkYBu9HkzYWe4TcYKjO4B7cXK5NNCBhLEHgI
         xmT2IUo5H/gTjgVv7DjGHzTNS5zVuIZBAal2vv+U3ciODv1880rbaT4Oe3GBnlntj9CM
         gmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278479; x=1788883279;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uxs4dwxHLDrtpiehWQZcP6/OkQeIFJi5v0FYqUxYdnc=;
        b=MWmiIo7M5hJnocagO5aHGonLXEUQB12FFnGAMlA/wA+80WW1MFpWZ/n+g2hfqJ1s89
         3wXy01CIK1L9MOOQDV4luBEiU+sSQ/UihoKS+zTd9wTnSaJACPovyYaCbfXSifOYqUT5
         dvcmfztDaD3N6c+AkYO7wMIcIw+43j9gMNJWmZwR3Mq7r3YCmzLl/ny7XdlsGCuI5EpK
         PA4IRTnH429F2kGXsoeJeJP1iKbAJGrhX5H6fJsA5PHPvTWXvpPdEsGI6jT6a+sh60H5
         fxvKCNTAymaEvL5w0GDYF0fkwNhmBjElHz9y1GZBdfTsocVLC64XNgqPR5wmgwGCz2le
         WuQg==
X-Gm-Message-State: AFuF++mx+ScJJ4ro2tno1sVaYRpi+hV6mQvawcPqZu62FALLRfQE9u3D
	dDCPvTEwzIPPHbe056eV/hg9z037KxdxAFb1XA76w37IOR+JrLE+kNylhdfdtg==
X-Gm-Gg: AYBFou28gQATqc5wf0P6AS6hlPUGup+A1PEUEU8Gyj8yLKSc5a+XOMUvtupcwgogcan
	n5kk5L5nYhoFZZAEbT5oyZ4hAqhfBh3gTGMtNbLgzDiKgt6RE1NNkN3wZM1ec11QQ4lWqDwvXZJ
	cLQ6qwpOu/Y4GDDLX5KoIKBw5ABbyYcC1Tib8c93PzTP88AKLie/iuv8+Un5CVtpIhhjN+F4Xcr
	xKjzwqvdLjKaVf0vUYrM6L0819Hl6twpB3yS2lhxXL5zRn8+MsB5gfUItJwTH6SYbjGxMQYzfVG
	nr784kL1/yq4Seosx/D4J9eHx8KNfmjXroChep1cj/QxO8HZbsKl9z5VMWgnYHofi/knIEVbpyP
	iGxCg7gx3qQW0WMziNxNsLOMsfwe+dJyVP/dyI1Sh8GkCGDvt/V4VEImP7/3dWS/fKpYS+y2cp9
	5IHovLLsK1F+ZI5yf1wC/GBTjB8QczHm1gDlnhdO2Ckg2oxPcJT6wJ6QA0lT+bmaxlR+u6HtAbU
	RZOPYTwC4nLayTJC0jRrX8YtlJFqnHujuJD4NCUNQ==
X-Received: by 2002:a05:6000:27c6:b0:484:3310:710b with SMTP id ffacd0b85a97d-48441025c15mr13724662f8f.23.1788278478991;
        Tue, 01 Sep 2026 09:01:18 -0700 (PDT)
Message-ID: <74fb7d16-7042-4311-a39b-d00e5a0560f8@gmail.com>
Date: Tue, 1 Sep 2026 18:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: xen-users@lists.xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Xen 4.23 release schedule proposal
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1788278479-30DC12AC-4D8DEC12/10/73395122804
X-purgate-type: spam
X-purgate-size: 2884

Hello everyone,

Following the 8-month release cycle, and taking into account that Xen 
4.22 was released on July 30, 2026, the next "good" month for a release
should be March, according to:
https://lists.xen.org/archives/html/xen-devel/2018-07/msg02240.html

I have two options in mind:

Option A:

Proposed release date: Wednesday, March 17, 2027
(~8 months after the Xen 4.22 release)

Last posting date: Friday, December 25, 2026
(~16 weeks from now)

Patches adding new features are expected to be posted to the mailing 
list by this date, although they do not necessarily need to be in their 
final version.

Feature freeze: Friday, January 15, 2027
(+3 weeks from the Last posting date)

Patches adding new features should be committed by this date.
Straightforward bug fixes may continue to be accepted by maintainers.

Code freeze: Friday, February 5, 2027
(+3 weeks from the Feature freeze)

Bug fixes only.

Hard code freeze: Friday, February 26, 2027
(+3 weeks from the Code freeze)

Only bug fixes for serious bugs (including regressions) and low-risk 
fixes should be accepted.

Final commits: Friday, March 12, 2027
(+2 weeks from the Hard code freeze)

Branch off staging-4.23.

Release: Wednesday, March 17, 2027

Considering that there are several holidays at the end of December and 
in January, I would also consider the following schedule:

Option B:

Proposed release date: Wednesday, March 24, 2027
(~8 months after the Xen 4.22 release)

Last posting date: Friday, January 8, 2027

Patches adding new features are expected to be posted to the mailing 
list by this date, although they do not necessarily need to be in their 
final version.

Feature freeze: Friday, January 22, 2027
(+2 weeks from the Last posting date)

Patches adding new features should be committed by this date.
Straightforward bug fixes may continue to be accepted by maintainers.

Code freeze: Friday, February 12, 2027
(+3 weeks from the Feature freeze)

Bug fixes only.

Hard code freeze: Friday, March 5, 2027
(+3 weeks from the Code freeze)

Only bug fixes for serious bugs (including regressions) and low-risk 
fixes should be accepted.

Final commits: Friday, March 19, 2027
(+2 weeks from the Hard code freeze)

Branch off staging-4.23.

Release: Wednesday, March 24, 2027

I slightly prefer Option B.

Please don't hesitate to provide your feedback.

If there are no objections to Option B, I plan to update the Wiki page
Xen_Project_X.YY_Release_Notes to make it easier to find our final schedule,
especially for people who are not following the xen-devel mailing list.

As an additional benefit, it will also be accessible via SUPPORT.md (in the
Wiki at https://xenbits.xen.org/docs/unstable-staging/support-matrix.html).

Thanks, and have a good weekend.

Best regards,
Oleksii

