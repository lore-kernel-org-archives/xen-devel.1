Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B146C531D0
	for <xen-devel@archiver.kernel.org>; Sat, 25 Jul 2026 04:25:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370438.1618575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnTwS-0001Cp-1y; Sat, 25 Jul 2026 04:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370438.1618575; Sat, 25 Jul 2026 04:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnTwR-0001Ci-VG; Sat, 25 Jul 2026 04:24:51 +0000
Received: by outflank-mailman (input) for mailman id 1370438;
 Sat, 25 Jul 2026 04:24:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@netscape.net>) id 1wnTwQ-0001Ca-8c
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 04:24:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnTwK-002d9u-Hl
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 06:24:44 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@netscape.net>)
 id 6a643a74-bab6-0a2a0a5309dd-0a2a450c852e-8
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 06:24:43 +0200
Received: from [98.137.65.148] (helo=sonic309-22.consmr.mail.gq1.yahoo.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brchuckz@netscape.net>)
 id 6a643a8a-f479-0a2a450c0019-62894194b009-3
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 06:24:43 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Sat, 25 Jul 2026 04:24:41 +0000
Received: by hermes--production-bf1-5f4bf6454b-lrr4g (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID b3f7f8e4b62955cf6d54d4688d9d61da; 
 Sat, 25 Jul 2026 04:24:40 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=a2048 header.d=netscape.net header.i="@netscape.net" header.h="Date:Subject:To:Cc:References:From:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1784953481; bh=ekKaIobZZ1Xy/FIfQt3Y4wffbq3XwiaTedgBPMjLcto=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=MX93i5P0OrhWMRJGeo4/rtNiQxODYr3f8Aew6yij87XCBYZdY+PgIdmEFfkjD+B8oIOVC6qwFvOvPulcrrUSLWV5bp0qirKdb+AEv6eRyvcv0hR+kr/Nqs1CWE5x+tkt6fjWuPrTvKdHdakLRK+uOPI/85C+MjuYy0kKFymJ41cawU+zgWTRgYit7LFrG7aKRkLRnUbyhkgXxO8gemHXMmzPDBMV1IoPlA9mW7H+/p+X+BjmwHkuQVE7ekY2fWWmvsuBNYOlzW85fbulKZ/0NCsTWRoPjWFJMF12uUXKv1J9U5xD3Nh5986crmsVRpFbVTlPC1AsQWNx0v1sEIy9qQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1784953481; bh=SkWIsgEEniKXmvwCUlzMrO7W7V9Wmkp4O+XJ1oxvU3Q=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=Y9+Zd59zrlfoOe5ABgd2oiJidlwuaAZs7attgyO1QK7X5Unl6VS2l39u4hOGAwa8xWRTFvYKjfw4nVqB4PnrwF1Cyf3qDumau4cquUhoq0fXPRRmAzKOYsK2Q5BSgEXsY5U3TCjdehG/HONb/lbsWVcwqBsi8Dy1u88z3Xa1wGNmVfqicJ8/RtzDnUSVGmc1u9BYEZdo6cuyysGRzg+/3ldpDcjG7TGwpnmh1o4L3UvY4/1YpOOgEA3qEhQoK5+R6oS8aio4VtO6vcUYCjh0Be+iBebpIxSArecQwGvCzU6EzfUid0rl17fGlYLDlLJySpK0crLxNkEmTiKTYgS0qA==
X-YMail-OSG: qgbLQ4MVM1k1k0GI7kIMV_xPiXb6JuoT6.zw7s0zPowEUl3OfvoaFD4XjjONRRS
 z2UzyZ_YWeO7k_csSdHhgWABg0PCtyF0dDOq3QqjM0mDVcUoiCZcM7yVV7TX0uF8FnBI79UAawQi
 49.LImtRDVheoJPnhSI3y8F3mC2T6wx1KphjtL75.HlI8cR3Y5zVdoBCxD43fYNbdVFsvajxO8uP
 VWNc_Ti21pxtCJdffFjAro0ZZsiz0P7YVa2laB0OrkfWH2va7zSr8BxmFBGsmW3qUl5b0LeS4PYd
 bFbRopTplqPHCneXdm_wbKCyPXg7vXo0rkBkge1iDmWY0b6dvDXZAvV56c7NAubrLBEdeEXcjkCS
 wIjyopuZHst_N9HWyE7eJQZ707AjliJR73jZmdA9lfQewxsw3hVu53GvrxpJEfxrifD0oIfOo9w2
 gADJ81AlmhzFfbNAzjCZMidKqCgNwwluKTTKR3m866mFQbdpKZpJ5xJ5s22STmBw2LTRrAoyKYv7
 EMtBYDhZs3JeGnd5DC2cZ7x20uDEYOUxYFZTfIwDQmQj1yG9GzLiN1gY5ZB_rv5y24rzjTt67mKL
 ZNsV.w8tLGL_FNtHFYmvquP8FZ5UVY7ngtjWEkaB6Jm._YN9R3ikKaMycot3ngk8AxHVMOVHCnH9
 JIGe7Ip9rfvFsH23FBs..in3n41_PecgDOg8baqfoB812jpNpH6q4wv7tSjENigaKMeKGY48Vtnt
 4jZK5WAycVCenqZRH7b.uwHML.Ww3_G7HgSZSQ4jj8wnqyqBfpLecBaK4c55V.bJf5ylgCaa1hin
 gNwIROYLSqrSxNh_RRiZPWisuJTGIPDjFQ2CWWVz3602wj2oNqmFQlrHd6Sl_lOKwI3rn6evxN_M
 jKIHXuXR9GRUQooglKYg.tU7SMhD2U6XAF6ucf1vl0m718xDQDZzgqtF08PQCgta98rmd9EPkHzx
 6ON.IWN1HmdLj0DamX.79zq6asmYgjqOLsdNRCUFpPMVNqi.98_UggLgx6NibQA7s1iX5kSlBXHu
 3_0THJVZ.o0w8WZ7KsGBGb2kn.ttZsH70MSgsgQOPKVBjpbp28r8t1ISyPkA2N3GDc.k.HngPQ44
 jHgtJ4nxRZmrGYKYYT2IkHU8zAEpMlQF8uoNrcnMkfyC5Ehi4SZOGXxuM1dukAMGL1JGK4dB6MyY
 .qrpoMe1B0gmV8W5uEJH9P25jK0N3_bfPKgtZRoJEnB_goBFJOzsUboZyqBPI016c4a3QEUsL5Am
 cFXUlVLmmST.kaiep1zwBlgzrKJE5_kVxMe1DxT5qWubag5RleUyM3W9_5gqj1Yr4ds2iRqmwFu6
 aonJyEglsXXrDec60BhUHsA6piw4LZ88mOr9EIcVgSrHRCu5qUoFmBWu5076UHwiNXZ1qLK9w08S
 I2NjLqvXmQhC5gijNOyDS_LzKP8eb_oo92xOu5HwtWkyjqAqaje0ufQEGWw4pZoM7mnMi93hmPIS
 5zTYIEjPUVZHd3WJTQAjJKhUSthYNcrpcZp1uEGlWFoYWZla2Yoxb1GE8xHnbjVj2NFph0xbwowH
 tG3GWo0g23wJJPPCEPC.19sDy7AZHoOfiRcdkSdzQZwJMVWvADzZbli9zdcUmCffdnxfsmOhvF7g
 7JKttS01RTClwVPbyExLz5dbVYJv4NnCmJUrMyBFR8JAP.2dp1NusYn31kCJOtqrgYEbXdZFOQ36
 .3lVC9.7cOnIcxsDza39TNZlXW1aXRSrYwGIfQlQZ5ThAR2l0QC9GLVFnwDGjcAHmJrW76tv_zyh
 B49BkQMU2.l1T9zBPQZGmoQ3.HaXHu7IMLaTZCQo1xRKGZ8BgnchYpOmcMSAQl7EZZ04q27IoCfy
 cQMTKpzSuAvMvmnBSYpWWDNDxTG0aoL8HQfWB0rKGUplqFAtql68AkJYJNzH_snzVIdkl.T6TBhS
 FZttmumqEvm4Kn21_mC.iAa08Cwcr78vu4ffx.rX29wi4l.zkG9ryret6Y1DaJXsTOr7DIMXMPHu
 H1tsiaTLdGEl5R5ORDnlkS2dPL8hVy0NJVYrXxLAATisrFDZKChHuJvETNhfNZakCclXIF9w5fIK
 WaMyWbaqtwc.GBz7EDaqWmH1thLI5.yjURnu0foguEJ8Ub9NJGYQ4TmpkphtegHlX8tIszrvY1bN
 F6xrGR27BD8YiC1PCrF75nhJfLxfgsWkmYUw6RtNr1WXAVD58r9YJYSdiIk7x9swVF4T.j5N5UJt
 STKNyC.WGnAuv7r0_0mmPYIEYtUDW7dHz3wNwk4XoCcxOpv.lkQ--
X-Sonic-MF: <brchuckz@netscape.net>
X-Sonic-ID: 901bdd82-b497-4685-bfe1-b677888aac6d
Message-ID: <8340528e-1683-44d7-8014-937fdb9852df@netscape.net>
Date: Sat, 25 Jul 2026 00:24:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] xen/igd: don't register rom bar twice
To: Tomita Moeko <tomitamoeko@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
References: <20260709183517.25866-1-brchuckz@aol.com>
 <20260709183517.25866-3-brchuckz@aol.com>
 <f722320f-205b-40d3-a727-753506ba5473@gmail.com>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <f722320f-205b-40d3-a727-753506ba5473@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.26215 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
X-purgate-ID: tlsNG-d25034/1784953483-770D9A5B-2D27F637/0/0
X-purgate-type: clean
X-purgate-size: 604

On 7/23/2026 9:12 AM, Tomita Moeko wrote:
> 
> On 2026-07-10 02:35, Chuck Zmudzinski wrote:
>> This also fixes a failed assertion in pci [1] for Qemu
>> version 10 and higher when passing through an Intel
>> IGD with an option ROM to the guest.
>> 
>> [1] f6fc01c ("hw/pci: Assert a bar is not registered multiple times")
>> 
>> Fixes: 881213f ("xen, gfx passthrough: retrieve VGA BIOS to work")
> 
> Please follow the QEMU standard way to reference a commit
> `<at-least-12-digits-of-SHA-commit-id> (“Fixed commit subject”)`

OK, I will do that for the next version. Thanks,

Chuck

