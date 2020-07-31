Return-Path: <SRS0=y719=BK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 502E0C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 10:41:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FB4020838
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 10:41:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="aDycFin7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FB4020838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1STy-0000OI-0C; Fri, 31 Jul 2020 10:41:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RrDm=BK=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k1STx-0000O8-1u
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 10:41:45 +0000
X-Inumbo-ID: 6c93086e-d31a-11ea-8e24-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c93086e-d31a-11ea-8e24-bc764e2007e4;
 Fri, 31 Jul 2020 10:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596192103;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ueYWH7BG9nThAJwWNZA6VQQmfXwYi+S8pEP2TJzWFRU=;
 b=aDycFin7hKdz7TzTCr707td4I1dhqyEU5WcFJKovu3fElR8bjfzg4E45
 RgtN7ZSsJca29Iq4ZiEMzbP7UwPgmYX+8NoUTnTSDgdJBFzQjdTR/U5mJ
 /i0DPa38g8ZoroHxxU3lK8nCnARshdSPrGCHtSheWjqUzDxaCSXFlpdmC Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: k3QZCc8dLZYDj6xPz2waUH76gXHfrEwNjXZNj+BM+dNfiYnaYLukQojYUs+Vbw4N6zn+Wh1L8K
 7bToiAWkQb77i7AqU012UPYt+mz92Fser6ZPFme82UT9dDfUvwgUdqTahpTnu3ohjZFNB19IPE
 bG1pF84YEms39/HreLcxYQtIzfPiAsTtCVhDqSWEssdj1XyXwuw72+FhEsaQsa5tedsh8W0kVq
 jlidcNedDT+PxKWI8X3riLY/TnHGWFWe3JHVnHShcj+3WbouTc+XyLX4IAYHVk3oCT7mpWp9jq
 E2c=
X-SBRS: 3.7
X-MesageID: 23939388
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="23939388"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24355.62818.483922.426288@mariner.uk.xensource.com>
Date: Fri, 31 Jul 2020 11:41:38 +0100
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [OSSTEST PATCH 06/14] sg-report-flight: Use WITH clause to use
 index for $anypassq
In-Reply-To: <E1356BFA-1FDF-42B8-A4E1-47C45F93D036@citrix.com>
References: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
 <20200721184205.15232-7-ian.jackson@eu.citrix.com>
 <E1356BFA-1FDF-42B8-A4E1-47C45F93D036@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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

George Dunlap writes ("Re: [OSSTEST PATCH 06/14] sg-report-flight: Use WITH clause to use index for $anypassq"):
> > On Jul 21, 2020, at 7:41 PM, Ian Jackson <ian.jackson@eu.citrix.com> wrote:
> > +    # In psql 9.6 this WITH clause makes postgresql do the steps query
> > +    # first.  This is good because if this test never passed we can
> > +    # determine that really quickly using the new index, without
> > +    # having to scan the flights table.  (If the test passed we will
> > +    # probably not have to look at many flights to find one, so in
> > +    # that case this is not much worse.)
> 
> Seems a bit weird, but OK.  The SQL looks the same, so:
> 
> Reviewed-by: George Dunlap <george.dunlap@citrix.com>

Thanks.  This business with the WITH clause as an optimisation fence
is well-known in Postgres circles, it seems.

Ian.


