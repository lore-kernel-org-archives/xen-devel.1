Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F94C88E65
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 10:52:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420752.1646985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x64I2-0007VX-EW; Mon, 14 Sep 2026 10:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420752.1646985; Mon, 14 Sep 2026 10:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x64I2-0007VQ-Bf; Mon, 14 Sep 2026 10:51:58 +0000
Received: by outflank-mailman (input) for mailman id 1420752;
 Mon, 14 Sep 2026 10:51:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1x64I0-0007VI-So
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 10:51:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x64I0-00Aa2z-5q
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 12:51:56 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aa7d1c0-2eae-0a2a0a5409dd-0a2a4508abd4-42
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 12:51:56 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aa7d1cb-f659-0a2a45080019-a237832faf18-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 12:51:55 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id BF81A4EE00AD;
 Mon, 14 Sep 2026 12:51:54 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1789383115;
	b=LTDIOYct3sI4In+uKmvU78owhQTUqUzyeZ9ptMZCtMArMSraXIKLsV95hZZxBn0upZtf
	 p9cIFzJdDdnjkJSqMmMqjIkvdPagVDLKt9SZvr5iMr9Kz0BZWnNw++t1JnBRWaHZ2Camf
	 SF9MuI4MxGUI/H6NdQCKL+lje7CsSHPcCaxeHd3IHNhhT3QCXlKt7FxNd1niI93b864Kb
	 UEMMSGQ688ggDZsYQS7JXbmSGz/sutSkklmOX59Mm363se47VuyUewDarELyHsDzA32Y5
	 rD1zH77/KBF+I6DNzxpsD75Em/Gy54rJRDDPG0bWLlaWqu+pYexqSukFEvTeXGEBFTFOo
	 jpO9xOkeuZkwQ3/m/oFxSpdaLmOTEwVWlY9srW24ZGx1WvQ4k5XahVeLixnP9GKEGz7GY
	 wVvWeW+57jiSeAFCvlfzbQaIwUhh4hgPotugKXuHWGJubj31uQOJVt51MxtG3lXTA8y5Y
	 nHaItVYiHyobzH96shQee5YZ4IxZd7y9ern2zFyLOpPg9KESEKIPeV9+t/epX9mlpe+eE
	 KXrBw47dRrp87vTRTax3idoOb47D7ekIWip2LvcCzfvwNjm9MR5TQEttCWoOl+llGdRdU
	 +1vruPE+xEXKDC3PbRcr1WvuKi6goFkfempuIDXQtz8qrFMFN9JlSkb0I5dlDc0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789383115;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=SgNyosp90VH7eDQuiqttRwIXiW7vZ1s+1MzF9mXojdU=;
	b=zlLEW+L9x4CfRq2onNhjk0ZOsqUYsS2rOl3slHb2ZNTNdUsIqt3ZelYIVSj46mSbf3y5
	 TUFIQplr7bP3F3h9EZOcaaVdNLiJ8/amaSLjsSIQtvLBIFBanaT9hXxIszQFTuPaSuy0D
	 3KexA3JknT1NsjrH2AOvIbRwyRN2dRu9aef5m8Q6ARsKsxZ55gMZfRXCDoH5Ku6kHPlxr
	 fMwQ2BmehRCDHE+dWiev+DGGhx+snK+sjqcz/jVRpYVnzdjchXqxibLO589u38YSYEBZ2
	 E+IPrF7LKWrb2BZyhrFI1Ms/CffryehEK/3vMqvEXJPJwEL/h9EFJMzwD6pJVaMb80uLY
	 HOa3dWPXPy791ofaEA4wCKrR551sM0ch3eib0/F4CDVUqzo5HCBDSfdtlT378lRgPwVrd
	 KeYs+wxWoGRWJXuL2P7FGFn6qYVNrchDe6OpkB2BSEaZ4Kb53vcb/GMvyIFTiZHT5sXLG
	 zTXKiRLm3aspjP7ts6BHjmzS3SgRpFA42ZFDGqF5aQZ4y6qlwClrSSVCIauv5Dqn6QU2y
	 7qmwNwVWmjHxEZC8we3XpY8wJIrSMaZT6xF5YuFzJjuyfK77xGjcRdG8SRY+TGDQw31sv
	 Km/vR1AcABeMOgqJrXFI5Hhym2cRu6BhrV61M0eLvDim3RErwn2pA5eDslwbMXc=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 12:51:54 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH 2/4] Eclair: relax long <-> function-pointer conversion
 deviation
In-Reply-To: <3b6b2796-b532-4b6b-8b04-8edce203ad3d@suse.com>
References: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
 <fca27ac3-95c9-4177-a9cd-673f07230889@suse.com>
 <43e412de9e5165f33c572841bfc58dc9@bugseng.com>
 <3b6b2796-b532-4b6b-8b04-8edce203ad3d@suse.com>
Message-ID: <1410bb68c5bf5715690a542585834e9f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1789383115-D5B4987B-170C9A70/0/0
X-purgate-type: clean
X-purgate-size: 516


>> Same as above
> 
> Okay, I'll happily adjust. As I have no reference for the syntax, I 
> just
> have to guess when making changes.
> 

We'd be glad to share the ECLAIR User Manual with the Xen maintainers. 
In fact, the ECLAIR installation on the testing machines has already a 
copy of it. Anthony should be able to make it available to you and 
others.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

