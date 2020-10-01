Return-Path: <SRS0=IV2x=DI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5AB4C4727C
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 11:22:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BD02208B6
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 11:22:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="cCpQkg5m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BD02208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1221.4111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNwf8-0004Ya-CG; Thu, 01 Oct 2020 11:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221.4111; Thu, 01 Oct 2020 11:22:14 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNwf8-0004YT-8n; Thu, 01 Oct 2020 11:22:14 +0000
Received: by outflank-mailman (input) for mailman id 1221;
 Thu, 01 Oct 2020 11:22:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LTW6=DI=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kNwf6-0004YO-DT
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 11:22:12 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17e36e31-a73e-40f2-b3d5-a46f68827c57;
 Thu, 01 Oct 2020 11:22:10 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=LTW6=DI=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
	id 1kNwf6-0004YO-DT
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 11:22:12 +0000
X-Inumbo-ID: 17e36e31-a73e-40f2-b3d5-a46f68827c57
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 17e36e31-a73e-40f2-b3d5-a46f68827c57;
	Thu, 01 Oct 2020 11:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601551330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qnExyjv72xS4XPByzvVUXHpFl+5PJR+AivecgqaXQ5o=;
  b=cCpQkg5mtQKecwDAIG0g8bjptfBRflNiI+6YHzcXSSPk6K55c6xu934n
   c9QH/qYt6NravygJqMDQ2Uq4MOX2j1Fu9R7mo4b5qdnXoLmYPqW5+u1l0
   4Vp6yqf4akiysCVltlXs/JLYI38GdmeYyJ1Q11ndL4lzBDmDO25sKEJ4a
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: pVs85hELVVepnvZSSMzlegb7wyVcQz9y9CR7mht92eybKcAka+cvI+/dTnHazZuU+Lcmo+QTz+
 ogfjKeXQANkkK3NqDNws5mJBLZXe8qjb7jT4r4gAJaoFJs6zt1JoOR7cbin/SWiI0bm25C5xzL
 Kr7mf+FIs9T2qJjnRUvz200nRwfx9qM0xNrRo+QoDBfJwZ3l3tZ/nEvYvf3CACmHopNedTsQje
 OoPALkS7I4q8xQiQsik1Zs8s/d9Bc6ZS7tlu65NLJLOo/3XqhJMOThrPIwq30g4VmWwLLdxCmK
 Jn0=
X-SBRS: None
X-MesageID: 28038335
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,323,1596513600"; 
   d="scan'208";a="28038335"
Date: Thu, 1 Oct 2020 12:22:03 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul@xen.org>
CC: <xen-devel@lists.xenproject.org>, <qemu-devel@nongnu.org>, Paul Durrant
	<pdurrant@amazon.com>, Jerome Leseinne <jerome.leseinne@gmail.com>, "Edwin
 Torok" <edvin.torok@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] xen-bus: reduce scope of backend watch
Message-ID: <20201001112203.GM2024@perard.uk.xensource.com>
References: <20201001081500.1026-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201001081500.1026-1-paul@xen.org>

On Thu, Oct 01, 2020 at 09:15:00AM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Currently a single watch on /local/domain/X/backend is registered by each
> QEMU process running in service domain X (where X is usually 0). The purpose
> of this watch is to ensure that QEMU is notified when the Xen toolstack
> creates a new device backend area.
> Such a backend area is specific to a single frontend area created for a
> specific guest domain and, since each QEMU process is also created to service
> a specfic guest domain, it is unnecessary and inefficient to notify all QEMU
> processes.
> Only the QEMU process associated with the same guest domain need
> receive the notification. This patch re-factors the watch registration code
> such that notifications are targetted appropriately.
> 
> Reported-by: Jerome Leseinne <jerome.leseinne@gmail.com>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

