Return-Path: <SRS0=y719=BK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF92C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 14:17:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBD9B206DA
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 14:17:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="K8nlNmVp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBD9B206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Vqs-0002y6-5M; Fri, 31 Jul 2020 14:17:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GLoN=BK=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1k1Vqr-0002xy-Cy
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 14:17:37 +0000
X-Inumbo-ID: 95360a0a-d338-11ea-abbe-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95360a0a-d338-11ea-abbe-12813bfff9fa;
 Fri, 31 Jul 2020 14:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596205056;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QyIFJ9+6z5aSNXWn+RiFboyvev1mE5/Mf7OMP9avnX8=;
 b=K8nlNmVpep2lj64s/CQhioCh9wLig7dnoqjbnWmWkcFijka6B3X/noAW
 9KJL0skHeXUjQWl6nTaHfxf6xIXCSQeitfefsXiRNFMaJKMyof6dLvFuE
 RcOLQC0ySMb2PUMuwzpaHllV2YJzEc1tmet54i6hiyjj9Fx8lntpe2Fyz U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 1xKBZ4gKgD9gFH+1jHFxj73g8j/n9jStd65somPgvlCJWF5ZpVGjwvj2AX8LiFkxpvbqy10M/b
 eGdEFkM1NclGEKVAy1L9Cmnrj8U992a20cu9DiFHU67o7ayMgEgRteqmNXl7XGT/wV14oLcY8v
 utx8borbU9COM8qusOzO5daCp+SKUDUq1swT2Frh4mhsIskaSTiamGarDvWTl1cRGDq33bFQ5A
 3MancGKCCmQ8lieqnqR6mEfzab5mfUqCTMlesN++XBRO17ftUmVH9+s5GqvtCtyyCyVrOyypVE
 aH8=
X-SBRS: 3.7
X-MesageID: 24508538
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="24508538"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [OSSTEST PATCH v2 19/41] Executive: Drop redundant AND clause
Thread-Topic: [OSSTEST PATCH v2 19/41] Executive: Drop redundant AND clause
Thread-Index: AQHWZzGIiXhuM2ONcUuWJjbNKhR3S6khmr+A
Date: Fri, 31 Jul 2020 14:17:33 +0000
Message-ID: <6745953F-B208-49CF-BEA2-0956CC30891E@citrix.com>
References: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
 <20200731113820.5765-20-ian.jackson@eu.citrix.com>
In-Reply-To: <20200731113820.5765-20-ian.jackson@eu.citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1C793E6989D8B64D921AB80437CD3BD8@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On Jul 31, 2020, at 12:37 PM, Ian Jackson <ian.jackson@eu.citrix.com> wro=
te:
>=20
> In "Executive: Use index for report__find_test" we changed an EXISTS
> subquery into a JOIN.
>=20
> Now, the condition r.flight=3Df.flight is redundant because this is the
> join column (from USING).
>=20
> No functional change.
>=20
> CC: George Dunlap <George.Dunlap@citrix.com>
> Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


