Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5617EC982C3
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 11:54:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421684.1648126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6oDj-0003CQ-Fi; Wed, 16 Sep 2026 11:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421684.1648126; Wed, 16 Sep 2026 11:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6oDj-0003CJ-CM; Wed, 16 Sep 2026 11:54:35 +0000
Received: by outflank-mailman (input) for mailman id 1421684;
 Tue, 15 Sep 2026 12:56:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <rusya92266@gmail.com>) id 1x6Sho-0001GA-8e
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 12:56:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6Shn-001PeN-56
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 14:56:11 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <rusya92266@gmail.com>)
 id 6aa9406a-8faa-0a2a0a5109dd-0a2a4507980e-6
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 14:56:11 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <rusya92266@gmail.com>)
 id 6aa9406a-b4ea-0a2a45070019-4a7de14cb65e-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 14:56:11 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843f22dcb8so184994f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 05:56:11 -0700 (PDT)
Received: from 830778650420 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Sep 2026 05:56:09 -0700
Received: from 830778650420 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Sep 2026 05:56:09 -0700
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:MIME-Version:From"
ARC-Seal: i=1; a=rsa-sha256; t=1789476970; cv=none;
        d=google.com; s=arc-20260327;
        b=eSowFjY+1fRoglpik6lKl2SJqkyhe+xKwQ4HVjiJnybF4CKuOmCu9JOtctBhr91wg8
         R5YWk5EXpDQ84klSfGnGV5ct47nyb77MWI2JU+WAgZLDSn4iMJ01vovTv5ozWtKeoeWR
         YxrTIcmATRKvBSv8Qlt7Ru6gYkv3YgjVg7vWzfotNA0T2ST0cQG5TC6aBOJSQvwFTljY
         fJEY5AYCcpWmId5ZfgfQAWKjLZQonWMMprD03YStQvtub6aoxN+7M/MXyyaBBQYLFbRQ
         bB0iYL7iv0u03yEEdQwQUGM6Clo2ZceUEyjBWYbq8nWv3pBFYMxgimYLKWsfk7DFUcOI
         K8wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=NYTm+ORiuCMyxJc9UywtnBxVs5qgekVj+icnB/ZVvik=;
        fh=lPwC7CchF1+dXFOM/FzxI/B4aQd83dw89+WvzXVIKTI=;
        b=n62laoELRqMZTOUpPwut8/LmaQiAOJwhGsP5M+eus7UNQ8Xspr64GIgohKvgZV0ub5
         zF/6JCmgrxn3IktrGsGfS0MnV2l0hfq20UZWAEqTzspwKCUETej5zDFA1//wpJ90SJQI
         oR64yE16OJ/I4RMPPdBdQT+9RxzaMJs2ZDzjiYd2XZjkY1wX5E5DbmMLB0ttYZcs5ZtQ
         2+fF+Eq59LC72E/wv+SZfTfhMpCy3qZtQTPXAs7wInvzGwjA6IrcshvZQYcYTSHMVwVf
         hUo9Upgfn/FspAdhd402At0eD0uA1F0Eu8qxtcmenscIHg5eNmwNK2IQzZhGEvuyFsAF
         d6Mw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476970; x=1790081770; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NYTm+ORiuCMyxJc9UywtnBxVs5qgekVj+icnB/ZVvik=;
        b=JrwXoviZSijFTSspWmmvJmxm7mgETCqCpXgI+jAT3HZMXumndU/Ayy3fI52HfhWp7R
         oCN/BuIkk6kkM4CDummzP5Zv2il9oajzeVwCRziUnudoT8ruYfg0rhxAOWRgGf6eJ9Aw
         iMXR/kau95yM804ot75KfQbIY3YyOWR/CaqDY249wlXakJwpWGs6Q1DXvt3EuIMRPGZW
         ZE4cRZRhkbD+r192LeNmHaad7wChZ4L9dGNUpdrz3Qx4p7cBDiL6Twr+zCKp0M/nhw52
         Zia9ugFP7YLp4kI9xRrYQzUrMEsolRDb7eWP7d+uRxgWDuwxP7DiBbqOgDpNiDf+1ud4
         l63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476970; x=1790081770;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NYTm+ORiuCMyxJc9UywtnBxVs5qgekVj+icnB/ZVvik=;
        b=JKxBpDaY/b3VugrvcRymdMEGVrn6GL7vQoDmX1zIR0aBgi+UFYYPOmrfIni5DXguzn
         ssreoq5w5+vvZNx/gSZhVlh5vfLTglI7aQ9K+q00Frd0hY4KGy0U/1gETsRr+gVZfNL/
         OMZnrM9UIZyHPYYlXnIsJ1SWIXfTl9jqHw069EUI6LaPaJoGfdReCfZdg0+b/75/AE0X
         DC1Q2Rb2EbO8ZuNmB9y8OLj9ZJnnQV4LyKauZWaEa1tx/jE69q+H7xWYURCfdH22rXUj
         xaEtO44wW3kYcxPXWfeAWQrU6K/i8s1MoMJzARhls0F7tlQeBHXTnsHKxOxKUb1D450a
         H0Mg==
X-Gm-Message-State: AFuF++m5LUzDIcu6PVoH3qNVoYlDnmZZGm/e/ZjSxeSC89yk6Zdk2xix
	Zt+2bB2C45Wm0RSFnmgBoZtNoGYzIT4OCSB3/biRYnyVtlyruB73mrwUP0//WFcwZ3nEYuJXPSr
	ydPXq+QqnwHeoya4ME+3aPpThke6VFqnUz1vNG5bp47CE
X-Gm-Gg: AYBFou0z+vQUQKyVSXrF4AlWFl2ea5eVvJor4LV9P26z737+UrtRgqHmLgVDTG/T87k
	BKIDmuzX8YVLNcyXVMLevQvAZMm/89+0ZoSl/DvZnaBucARx3QICE06PYs6y4/ZaIHJTHx4piuj
	W0sKfTRH5whmmVCUgPbDtz8mOmrN0ebaWOYDFWB3GFqK+XA7Uc0nFVRZaq6u6qsCUw1E4+6DqiH
	PAp2vHxRjUxEN+P0D9QrYlDd1f43652T0Ec0I5J6zGCgxd0yEm6STMlhSNbatnJxU2yeVnVsJP0
	Og+kNL6VuKvC13tSzvnMgKyaAbWtp2UKggQLozq252UWv2jWHR7zalBa1KdeYwRn
X-Received: by 2002:adf:e18e:0:b0:487:aee:75cb with SMTP id
 ffacd0b85a97d-4870aee76aamr341482f8f.10.1789476970478; Tue, 15 Sep 2026
 05:56:10 -0700 (PDT)
From: Ruslan Vagner <rusya92266@gmail.com>
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 05:56:09 -0700
X-Gm-Features: AcwNN1XleUuyvV52uIvINjYuMpQl23DTZbfH1-4Iiz2Z6kIPWcHwstIh4TDuGDA
Message-ID: <CAF9RqJ439Cm0x9zzruXS5Dnz+5RgsAcJ0Q-gLQLpyTzWFF2ADw@mail.gmail.com>
Subject: [PATCH] xen: fix comment typo in xen.h
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Ruslan Vagner <rusya92266@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-ef75cf/1789476971-A7CD7AE4-61FE23A5/0/0
X-purgate-type: clean
X-purgate-size: 1069

Fix the spelling in comments. No functional change.

Signed-off-by: Ruslan Vagner <rusya92266@gmail.com>
---
 include/xen/interface/xen.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/xen/interface/xen.h b/include/xen/interface/xen.h
index 40c9793e9880..f9acb21875cf 100644
--- a/include/xen/interface/xen.h
+++ b/include/xen/interface/xen.h
@@ -94,7 +94,7 @@
 #define VIRQ_XENOPROF   7  /* V. XenOprofile interrupt: new sample available */
 #define VIRQ_CON_RING   8  /* G. (DOM0) Bytes received on console            */
 #define VIRQ_PCPU_STATE 9  /* G. (DOM0) PCPU state changed                   */
-#define VIRQ_MEM_EVENT  10 /* G. (DOM0) A memory event has occured           */
+#define VIRQ_MEM_EVENT  10 /* G. (DOM0) A memory event has occurred
        */
 #define VIRQ_XC_RESERVED 11 /* G. Reserved for XenClient                     */
 #define VIRQ_ENOMEM     12 /* G. (DOM0) Low on heap memory       */
 #define VIRQ_XENPMU     13  /* PMC interrupt                                 */
-- 
2.54.0.windows.1

