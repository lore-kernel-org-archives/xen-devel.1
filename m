Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D62C88E72
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 10:00:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423841.1648727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x78uc-0003TX-6f; Thu, 17 Sep 2026 10:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423841.1648727; Thu, 17 Sep 2026 10:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x78uc-0003TQ-3Z; Thu, 17 Sep 2026 10:00:14 +0000
Received: by outflank-mailman (input) for mailman id 1423841;
 Thu, 17 Sep 2026 10:00:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1x78ua-0003TK-7e
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 10:00:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x78uZ-000q11-HX
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 12:00:11 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aabba26-bab6-0a2a0a5309dd-0a2a4506e9e4-16
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 12:00:11 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aabba2a-195a-0a2a45060019-a237832f8542-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 12:00:10 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 741554EE002F;
 Thu, 17 Sep 2026 12:00:10 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1789639210;
	b=pLbJh0q1Qk4JM9ksumZnsImVcsUfKSWzhQh062FH2RsZ+fGckQqe0MhtknUVLxlfZPKk
	 EbZS+Y1kwmFPsTx2H4agBPQc8R0U3l+H8zQNKgOXNVxjRzULV+fXsh7siavzJIVZkEqd7
	 b0y96//Bf3Oc5w7sFOH4NbzoZLq2yAdb0T9CvdlWkbUONrBkjdyAJhdNOjJvN4s5iBO3d
	 hgJKHx8os7u9BgLfaCJmKYWz5C+ibzC4i/TtBQd1U92cqaWC36bROQdsY8E42MPJKFluu
	 feEHQEHCauGnyFw8h+PD37RyKHI3J9kGCo4ZtA1VozVlAOETmvkLTSx43X5F/onLOvSkn
	 1FwSqK0IQV6V6TrXv8jmjohUoUChTlnxPnD92I54tuvcQpIEcC2piNZ0LNlV/E1PJmUKC
	 3s9vtxZQYp3TJdPTu1WwcK5RleMa/l999azEypjTw/JhLXpdwRO6/uMyBGD7DFo15rGvQ
	 6IaqVsW4JrQA0W0Y8aBTDuaKbG4OCPOq3es+/XlSk5eZu3H0c/4cFO/XSs/vzkDptU417
	 ipsfG/rpIp+aYX4H8bHS4GN7lmDD1sd0VZ9ydXAGTvgnuWfQLv7Pl6QjLB3IjI+HefcI7
	 /COIt5NBauAeinTVNdrCJFIWeXuK7GSqovonaQkayEiQbB0GskwDFpcQOpqfk5M=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789639210;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=jzBEGJUFucDzR5aOP7bbez8UwKFcuiJLcZvMhjGbk3M=;
	b=hhGI0O/gn68VfTPLygyawQM8xaPcR19w62v/MGWcMfMpNO9lny0gq8ALzuGJHNwg2/2i
	 CBU3hWTXKTODhZPB4Q/O62kInJ+r7tqpcCWOXctWYYjw6x0q+BMIb5jQc08CFMFBFtKS/
	 xJv8HB9pPk5KnDZzAZ6O5hY2DFj8spjTpr6i3aYgChn1mzHY8W+HjsqAt3hv3x3bcbdA3
	 bRLqlQ61uNLVzaEM4UQ9sqT2pIkQCw4auuOh23JrwqV1etQpiZ5FE3xP7E+dhnpQdy3ct
	 ifj5iihBDkWzv2i35HcefdYlCIl5HRrrPDbXdGxWw2N2y+Rz5P4xi4oWDDhJYDvji93f7
	 mCaM1ZCOe50G/gNgDAbOouT/SnxqvW1ngAEGtoyLpqZGwKLhrC0kfdSgu2KfxUbLLi/YO
	 1PA49n2+/wQ+nKG9XV/1UW2X1YCVHhWitZwj/xfhcx2uQ+bpG4HGJ+l7Jag5SNR0zslJQ
	 w5Te+mXVJUErxPZkp1QzFcgRpbVTCcW6xPca0tmpRjU3Xfiql5Vz7yfSx6PVMEurD3YHm
	 yX4zrjqIt74p0Ayknwe5o0gx/LoGTBhZy50lURIt+wN+LQ0cDesCWrspmKIulOMfOii7/
	 66f2JCKM2M60twF/EoImA4aPU4PleWmS+hlxvI08dLGMWxm2gpJQRywcCCFTLZk=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Thu, 17 Sep 2026 12:00:10 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH 4/4] automation/Eclair: tag rule 13.1 as clean
In-Reply-To: <4952eacf-06ad-433e-8d0a-14b704888d21@suse.com>
References: <db6f62c4-0631-43d0-a501-9667af6242ec@suse.com>
 <4952eacf-06ad-433e-8d0a-14b704888d21@suse.com>
Message-ID: <7c9167bafa25ae9fc359e13787b270a9@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1789639210-FC60277B-ABA733C4/0/0
X-purgate-type: clean
X-purgate-size: 679

On 2026-09-03 13:54, Jan Beulich wrote:
> Remaining violations were addressed.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Supposing of course all previous patches are ready to go in

> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -66,6 +66,7 @@ MC3A2.R11.7||
>  MC3A2.R11.9||
>  MC3A2.R12.2||
>  MC3A2.R12.5||
> +MC3A2.R13.1||
>  MC3A2.R13.2||
>  MC3A2.R13.6||
>  MC3A2.R14.1||

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

