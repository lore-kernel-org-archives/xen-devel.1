Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A409FC55ABF
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 13:54:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384804.1627576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wryY4-0000RS-Bs; Thu, 06 Aug 2026 13:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384804.1627576; Thu, 06 Aug 2026 13:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wryY4-0000RL-7K; Thu, 06 Aug 2026 13:54:16 +0000
Received: by outflank-mailman (input) for mailman id 1384804;
 Thu, 06 Aug 2026 13:54:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fd75a4b75000e099@swg.vates.tech>)
 id 1wryY3-0000RF-HW
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 13:54:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wryY2-00DByA-UF
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 15:54:14 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fd75a4b75000e099@swg.vates.tech>)
 id 6a7491ea-5cb7-0a2a0a5109dd-0a2a450a894c-42
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 15:54:14 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fd75a4b75000e099@swg.vates.tech>)
 id 6a749203-f2d2-0a2a450a0019-b9ff1c238685-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 15:54:11 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fd75a4b75000e099.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 06 Aug 2026 13:54:06 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3B939835D7;
 Thu,  6 Aug 2026 15:54:06 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=fRUrVE630RsEJS6ZLH/6Y7mCfFS4TvhyflfWwJQ0YOg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=kLMgsXDIZTafA0fkFQjJNbTLoLEaf7fp1foPgZ9xOQUW7urHLmD5hT9jAETdnXeNBO5iuRLdJ
 P+sXO3AQLdDG/r5smJMoMoIPnqLHya4z9Ua7aR1D9JqHtXURYzAOO+mSU7OH9ixexUA4il63yhh
 J73maPUXHSUeNT6YTHnq0rMdPpFwP4vtLrpPs8ZNH1NAaaHv2JocbkcMV4q4NXNcPtf0jVHtCC2
 fc6pPXleytR4Khjm2Fd3yDeyrkmFDQF0Xxwd/DrtPjXu6ptdomJ2WOjxll8ZvOhG5JUa7HEj9Qs
 jjAIdJ8dUacyCJAVZhiz9ktrGVjFxbidLZd6UbAkjQVg==
X-Zone-Loop: d4caa2c739aea8cb86290f11f27ffc1973338f8f1048
x-campaign-type: default
x-transaction-id: 56243759-dbbc-4dce-bb13-071b2c860a6b
x-swg-uid: 01-1f5bf399-c575-4415-aa71-d7a76acc85b8
X-Mailer: Sweego
Message-ID:
 <1786024446.8631fc262581453bbf619ec5b2062170.19fd75a4b75000e099@vates.tech>
x-swg-bid: 1786024446.8631fc262581453bbf619ec5b2062170.19fd75a4b75000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 6 Aug 2026 15:54:06 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/3] Add compile_commands.json target
References: <20260805015247.41943-1-gwd@xenproject.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260805015247.41943-1-gwd@xenproject.org>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1de0.9fcff84f069bedcf.19fd75a4985.d81b5e994d9e9a15=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786024446342
X-purgate-ID: tlsNG-4011c0/1786024451-583CCCFC-A45D6261/0/0
X-purgate-type: clean
X-purgate-size: 772

---=Part.1de0.9fcff84f069bedcf.19fd75a4985.d81b5e994d9e9a15=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2026 at 11:52:37AM +1000, George Dunlap wrote:
> Modern tools like emacs' `eglot` rely on compile_commands=2Ejson to
> gather information about the project=2E  Import the build script from Li=
nux,
> adapting it to the core Xen binary=2E

Thanks=2E I've looked at using that script, but since it wasn't going to
be useful for the tool side, I didn't do anything and just used `bear`
instead=2E

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.1de0.9fcff84f069bedcf.19fd75a4985.d81b5e994d9e9a15=---

