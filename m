Return-Path: <SRS0=3DVc=65=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FF6C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 15 May 2020 20:29:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D80D206D4
	for <xen-devel@archiver.kernel.org>; Fri, 15 May 2020 20:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D80D206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=antioche.eu.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZgxJ-0004wg-7Z; Fri, 15 May 2020 20:29:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2khj=65=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1jZgxI-0004wb-2I
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 20:29:16 +0000
X-Inumbo-ID: bd4474a8-96ea-11ea-b9cf-bc764e2007e4
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd4474a8-96ea-11ea-b9cf-bc764e2007e4;
 Fri, 15 May 2020 20:29:13 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 04FKTCmI028947
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2020 22:29:12 +0200 (MEST)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 6D2D62810; Fri, 15 May 2020 22:29:12 +0200 (CEST)
Date: Fri, 15 May 2020 22:29:12 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Subject: IOCTL_PRIVCMD_MMAPBATCH on Xen 4.13.0
Message-ID: <20200515202912.GA11714@antioche.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3
 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]);
 Fri, 15 May 2020 22:29:12 +0200 (MEST)
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

Hello,
NetBSD works as dom0 up to Xen 4.11. I'm trying to get it working
on 4.13.0. I added the support for gntdev operations,  but I'm stuck with
privcmd IOCTL_PRIVCMD_MMAPBATCH. It seems to work fine for PV and PVH domUs,
but with HVM domUs, MMU_NORMAL_PT_UPDATE returns -22 (EINVAL) and
qemu-dm dumps core (as expected; the page is not mapped).
Of course this works fine in 4.11

In the Xen kernel, I tracked it down to arch/x86/mm.c near line 2229,
in mod_l1_entry():
        /* Translate foreign guest address. */
        if ( cmd != MMU_PT_UPDATE_NO_TRANSLATE &&
             paging_mode_translate(pg_dom) )
        {
            p2m_type_t p2mt;
            p2m_query_t q = l1e_get_flags(nl1e) & _PAGE_RW ?
                            P2M_ALLOC | P2M_UNSHARE : P2M_ALLOC;

            page = get_page_from_gfn(pg_dom, l1e_get_pfn(nl1e), &p2mt, q);

            if ( p2m_is_paged(p2mt) )
            {
                if ( page )
                    put_page(page);
                p2m_mem_paging_populate(pg_dom, l1e_get_pfn(nl1e));
                return -ENOENT;
            }

            if ( p2mt == p2m_ram_paging_in && !page )
                return -ENOENT;

            /* Did our attempt to unshare fail? */
            if ( (q & P2M_UNSHARE) && p2m_is_shared(p2mt) )
            {
                /* We could not have obtained a page ref. */
                ASSERT(!page);
                /* And mem_sharing_notify has already been called. */
                return -ENOMEM;
            }

            if ( !page ) {
                gdprintk(XENLOG_WARNING, "translate but no page\n");
                return -EINVAL;
            }                        
            nl1e = l1e_from_page(page, l1e_get_flags(nl1e));
        }

the gdprintk() I added in the ( !page) case fires, so this is the
cause of the EINVAL.
Is it expected for a HVM domU ? If so, how should the dom0 code be
changed to get it working ? I failed to see where our code is different
from linux ...

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

