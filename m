Return-Path: <SRS0=mr7d=6K=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NO_RDNS_DOTCOM_HELO,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB0CC54FCB
	for <xen-devel@archiver.kernel.org>; Sun, 26 Apr 2020 19:19:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4698F2071C
	for <xen-devel@archiver.kernel.org>; Sun, 26 Apr 2020 19:19:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="CxGuJNDr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4698F2071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSmna-0007AH-9Q; Sun, 26 Apr 2020 19:18:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ExO4=6K=yahoo.com=akm2tosher@srs-us1.protection.inumbo.net>)
 id 1jSmnY-0007AC-KV
 for xen-devel@lists.xenproject.org; Sun, 26 Apr 2020 19:18:41 +0000
X-Inumbo-ID: bbd43e7a-87f2-11ea-ae69-bc764e2007e4
Received: from sonic301-32.consmr.mail.ne1.yahoo.com (unknown [66.163.184.201])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbd43e7a-87f2-11ea-ae69-bc764e2007e4;
 Sun, 26 Apr 2020 19:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1587928718; bh=pKjB4e1F4k6gQJpbfvWCA3uwHiFewYLBTulB8UVmSNU=;
 h=Date:From:To:Subject:References:From:Subject;
 b=CxGuJNDrhMHDq4QOIfT5Xk8pST8M34U5QpnhdP1kBXi9H23BFDY7iKsmRloaBfh9cLlAFZhU35VufQ2vMLSA5w3rI2oCjMkUDivu4vesuvpinU+v++FEIwNXTTUidXvTG7QChAOdOWaehFeln2NJmr2uDv1BcLxkcZly95BWvWwHTRoFmZj0mwkbW4U45P2NPmkwkCqd/UgpBUm5RF7ymJOM8P1SFNH55CAWw3DnYyDVmkpmQUntJUn1OGP+Zc8oZytZJPeYJkrNaQIPo92hFbc0DKeK1ICVmm3rl4ZVcDUoOmh/JvTZ1z2XV0g3zF4UfcaiNMHPUqM0p9Dh7+G7dA==
X-YMail-OSG: GK2PDk4VM1n07sRq3JSRT51S_cEflXcO8ujiQX4Y4njAfojnHWwVBoRPxBbS_fJ
 EPE8lo4r9lSLuMrxiHKgtELx.aCYD.WkyXGHi7wm8gCDhk8XpWwx7zuCQ1ymj0cJlUIZeAKp2Kk6
 L8mw7Y2I4YHw4gFuKRpkrqVnrDe9BaGOsfXAnxufz7YEF31PR7.G.r32.B4dOsy0jSNb4BUhpRZs
 _ikkbvNwIOKXVTHY_lGZuSgMb_2zsnQqPlonzVL0tB8G_L.hnLkuulh5H4wq4sbFDsk82v5jfUTB
 QZqbSW4HNDYq8OiTRheYu4i3Ubn_xtaz42oEZ6SOCMb1m.uBvnrqpRAqdM32TkAaTf7OsPIDFQUU
 Q6xe0cGlIhla_J58GZNRDqv_xHhCIVlV.QyXnniUvkABPthdbh9Upe5EPDyEPBvqwuJ90BEtDXy3
 Q3lbMYjQ2.ZWF23rnGY9hUciHS_5IvaAsD700aoLrLG4WEmVsk_KWrWrw3amvrM0XH97EeKuX9WG
 GCbD3RLIArwOxMkOdU6AK4xkSKGAaq5qAJ2nzxjj9F._zuABQ.kN5iNteNbQ9Nmy2pQ03iNMHkDd
 WmOJOgAQTIQuR8KWnL1kdtiZEC1VU22cJzCXcHV3bc5Ld1hkQgMafXC.R6j0jo_yayDMmJm9rhf2
 x5HC3E3jlb0qakv.iv9HjXtwqadugfv5ky27psrirY5usDO5BU9PVLf7QbyhX8ugWlR5diZ6YKFZ
 iCawZTdCmqlhwvtAGNSvTmmLEzA2ki4xyByTBRGSiIJgmGJeFpFZsNUJhD5Pa..bvmIme1V6JLed
 gQm9FcXn9MAKW.xuks2S8M_SjefITfskYlR0rIhaTXPz0d3FaXLsNG.E0AdbKlt3IV0sCKhPanIv
 hIL5giWo7KESi5EiQvOyaJYTnPK3Etk5.AI5gxmrpbNuCeKjwkwrICJCX7LyRu9GlAwpyEh8MSRf
 kFX7xiIurx8X_fsmzgYIRl3yQYtd6TiocUzj5r22Xsj3zDQbPyoUNdbleK9e4zyhCWMxf6lu_9Qg
 mpukpidEFvBbWLG8TH2QCeQQCRiTOGYLt02tyDGsLe4GwqBiFaHoZDY0qtaxIZecgZ8gmyzPiQtB
 G.fnJRqYeEn1qevMy4XczvYW5iGwdKJ_6zn1BBG3xegLiEbDNA.vHDmY4JN7hPedId6b23W49hVW
 pq7synpgZrV0qDZ_WmePyA6kMpDpJvdJlN0SA6EL32sD1_y.dIzZETD8.nx_mSiMGEm1.9St7aqC
 7kno3bdA9mjHia0jmVUOwuOp1z2FdRkgUfu5v1yAReg1TtQogYPxjrvi5iagKKWg1wMuDtifYd.9
 YwUrgFAdnN0LqmSTv
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.ne1.yahoo.com with HTTP; Sun, 26 Apr 2020 19:18:38 +0000
Date: Sun, 26 Apr 2020 19:18:33 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1359850718.562651.1587928713792@mail.yahoo.com>
Subject: Xen network domain performance for 10Gb NIC
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1359850718.562651.1587928713792.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15756 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64; rv:75.0) Gecko/20100101 Firefox/75.0
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

 Hi everyone,

Lately, I have been experimenting with 10Gb NIC performance on Xen domains. I have found that network performance is very poor for PV networking when a driver domain is used as a network backend.

My experimental setup is I have two machines connected by the 10Gb network: a server running the Xen hypervisor and a desktop machine working as a client. I have Ubuntu 18.04.3 LTS running on the Dom0, Domus, Driver Domain, and client desktop, where the Xen version is 4.9. I measured the network bandwidth using iPerf3.

The network bandwidth between a DomU using Dom0 as backend and the client desktop is like 9.39Gbits/sec. However, when I use a network driver domain, which has the 10Gb NIC by PCI pass through, the bandwidth between the DomU and the client desktop is like 2.41Gbit/sec is one direction and 4.48Gbits/sec in another direction. Here, by direction, I mean the client-server direction for iPerf3.

These results indicate a huge performance degradation, which is unexpected. I am wondering if I am missing any key points here which I should have taken care of or if there is any tweak that I can apply.

Thanks,
Mehrab

