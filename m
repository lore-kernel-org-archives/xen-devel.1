Return-Path: <SRS0=tzN1=C7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E0DC4363D
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2020 14:46:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1D982396D
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2020 14:46:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="LndNfaLz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1D982396D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKjYf-0008Eg-F4; Tue, 22 Sep 2020 14:46:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oGvm=C7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kKjYf-0008EW-15
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 14:46:17 +0000
X-Inumbo-ID: 168527b6-4948-46f1-bc11-db83b80ab355
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 168527b6-4948-46f1-bc11-db83b80ab355;
 Tue, 22 Sep 2020 14:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600785976;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EmRqnwZkNjgmrTlp2NTYJohV1w/jVZEYxakF+X9OdtA=;
 b=LndNfaLzv1GawF/3SBqpcoTfMYVNzYAs83cBhDM4cFtq2L8G0Vhsd4nK
 5rNDCorBm9eR8JexeRnMRT9OFiBQF8Afve6hdcmxDeiqoXppeZdLkKzjy
 OiafakRWPcPE3MWb3q86/XKKKkyc0rlcwG3hw0TRDUSBXyzupjhnX1Zv8 o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: hIkNa/LVZnMu/m3flefxEOm5p2LEvNpZm9vQF2cgCY3qmLAaucY99PGGuxjucQnDOnzrYcqjf9
 UrUGpN7u83iK25IeZcn/TPhDA2cLJuL70GJKzwGIxnR892Ix45R3jErAUD/tIFYx9KZWf5vEpE
 2WQt6QRyF+zZGnJlC8cjn1+D+6c/NgT2c8oxstwNWnEjkxFZq9pEBK8fiu5kf2cU/zS8kCbkn+
 Q3UIyDTdb9Axkw6l3DMqeZ4NhofBEBCJ/AkQdeJJPyGPm+7XO7PHusiFkaWlzluOySeRwM4vn1
 m8I=
X-SBRS: 2.7
X-MesageID: 27271531
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="27271531"
Date: Tue, 22 Sep 2020 16:45:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: SeongJae Park <sjpark@amazon.com>
CC: <konrad.wilk@oracle.com>, <jgross@suse.com>, SeongJae Park
 <sjpark@amazon.de>, <axboe@kernel.dk>, <aliguori@amazon.com>,
 <amit@kernel.org>, <mheyne@amazon.de>, <pdurrant@amazon.co.uk>,
 <linux-block@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] xen-blk(back|front): Let users disable persistent
 grants
Message-ID: <20200922144556.GM19254@Air-de-Roger>
References: <20200922141549.26154-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200922141549.26154-1-sjpark@amazon.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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

On Tue, Sep 22, 2020 at 04:15:46PM +0200, SeongJae Park wrote:
> From: SeongJae Park <sjpark@amazon.de>
> 
> Persistent grants feature provides high scalability.  On some small
> systems, however, it could incur data copy overheads[1] and thus it is
> required to be disabled.  But, there is no option to disable it.  For
> the reason, this commit adds module parameters for disabling of the
> feature.

With the changes requested by Jürgen you can add my:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

