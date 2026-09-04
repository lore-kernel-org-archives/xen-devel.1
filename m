Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6496DC624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 11:22:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408277.1640911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2RzX-0000wb-EF; Fri, 04 Sep 2026 11:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408277.1640911; Fri, 04 Sep 2026 11:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2RzX-0000wT-BK; Fri, 04 Sep 2026 11:21:55 +0000
Received: by outflank-mailman (input) for mailman id 1408277;
 Fri, 04 Sep 2026 11:21:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06c27448d000c4f3@swg.vates.tech>)
 id 1x2RzW-0000wM-0h
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 11:21:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2RzV-005TRd-7W
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 13:21:53 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06c27448d000c4f3@swg.vates.tech>)
 id 6a9aa9c6-8faa-0a2a0a5109dd-0a2a4504ba36-20
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:21:53 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06c27448d000c4f3@swg.vates.tech>)
 id 6a9aa9d0-b57f-0a2a45040019-b9ff1c2280f9-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:21:53 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a06c27448d000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 04 Sep 2026 11:21:47 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 16EC781EB6;
 Fri,  4 Sep 2026 13:21:47 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=ex+LLQWjh+o/Lj8IoMloIXbAquyBJWjayQlF3PobzhI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=pF/Kz0NbQ26c8szqn9Mv4qbK55srubm/fhWYHlozirnSAfltMuqxxk7jZ86oZ2SvWTidh1pPI
 AaNADRRgby6AXvSJxCE60MbAVraA1+R2g1xEzEHLu1wHoFbi+GcFWJte5Wecj8fr7MBkVUjeCQu
 /+T29Jzh1xIasvQbRsjZU3znmN7ljZVpdb5Wmm1CNY9fey2hDbcWm5WLCItG4OC/fnc/SBiyxbs
 COwU06aXczzUS4W57iE2F48W5uxZ/uoanHwk8uZjJgbbGHQrdONj7Kw3qj9LRIGc94str/hQkKX
 bWEAc2QbSZKSs6KIi/WIiyM0c0EB0/I0fa3vHnLG6aPw==
X-Zone-Loop: 3cfa604e0028f6eb007d8766b94f03a96dce402f3533
x-campaign-type: default
x-transaction-id: 4a3bd6b0-86d5-4b70-b7a4-7a47cc5e63a8
x-swg-uid: 01-8614883e-b248-4cd1-b057-3b1f2222cf6a
X-Mailer: Sweego
Message-ID:
 <1788520907.8631fc262581453bbf619ec5b2062170.1a06c27448d000c4f3@vates.tech>
x-swg-bid: 1788520907.8631fc262581453bbf619ec5b2062170.1a06c27448d000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 4 Sep 2026 13:21:46 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Julian Vetter <julian.vetter@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v5 10/11] hvm/ioreq: Negotiate extended destination ID
 support per ioreq server
References: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
 <1788444859.8631fc262581453bbf619ec5b2062170.1a0679edcb9000c4f3@vates.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1788444859.8631fc262581453bbf619ec5b2062170.1a0679edcb9000c4f3@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.367a.437e12dfad5d5ca4.1a06c274222.6f0667637e7e1364=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788520907298
X-purgate-ID: tlsNG-ebf023/1788520913-C38C1B50-283442CE/0/0
X-purgate-type: clean
X-purgate-size: 1692

---=Part.367a.437e12dfad5d5ca4.1a06c274222.6f0667637e7e1364=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2026 at 04:14:08PM +0200, Julian Vetter wrote:
> diff --git a/tools/include/xendevicemodel=2Eh b/tools/include/xendevicem=
odel=2Eh
> index 698d719119=2E=2E72994d1313 100644
> --- a/tools/include/xendevicemodel=2Eh
> +++ b/tools/include/xendevicemodel=2Eh
> @@ -44,12 +44,13 @@ int xendevicemodel_close(xendevicemodel_handle *dmod=
);
>   * @parm domid the domain id to be serviced
>   * @parm handle_bufioreq how should the IOREQ Server handle buffered
>   *                       requests (HVM_IOREQSRV_BUFIOREQ_*)?
> + * @parm flags bitmask of XEN_DMOP_IOREQ_SERVER_* capability flags (0 i=
f none)=2E
>   * @parm id pointer to an ioservid_t to receive the IOREQ Server id=2E
>   * @return 0 on success, -1 on failure=2E
>   */
>  int xendevicemodel_create_ioreq_server(
>      xendevicemodel_handle *dmod, domid_t domid, int handle_bufioreq,
> -    ioservid_t *id);
> +    uint8_t flags, ioservid_t *id);

You can't do that=2E libxendevicemodel is supposed to have a stable ABI so
we can't change the prototype of existing functions=2E I think this will
need a new function, with suffix "_v2", or any other different name=2E

Then, why limit "flags" to 8bits ? Just change that to 64bits at no cost
(maybe a little to check that all flags exist) and we won't need to look
back, hopefully=2E

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.367a.437e12dfad5d5ca4.1a06c274222.6f0667637e7e1364=---

