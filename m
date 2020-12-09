Return-Path: <SRS0=Zv5g=FN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A86C4361B
	for <xen-devel@archiver.kernel.org>; Wed,  9 Dec 2020 16:00:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A211123433
	for <xen-devel@archiver.kernel.org>; Wed,  9 Dec 2020 16:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A211123433
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.48420.85619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn1sw-0001tt-Jy; Wed, 09 Dec 2020 16:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48420.85619; Wed, 09 Dec 2020 16:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn1sw-0001tm-GM; Wed, 09 Dec 2020 16:00:10 +0000
Received: by outflank-mailman (input) for mailman id 48420;
 Wed, 09 Dec 2020 16:00:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NJeK=FN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kn1sv-0001th-VF
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 16:00:09 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd73d7aa-f145-43ba-9dec-01c1250e9d71;
 Wed, 09 Dec 2020 16:00:08 +0000 (UTC)
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
X-Inumbo-ID: bd73d7aa-f145-43ba-9dec-01c1250e9d71
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607529608;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=ZApL8V1v0OtWA7YuFI4qL9rpovu2jonLWpRVf2y2jTg=;
  b=if2b1TLLcxi2b1DQYhz7SNd7wMShOmWeRocIse7qwN7aQmnipGJ+iQvQ
   eEpnCHepD+JNAFhjBTIvhUxVfWTNpBM6G7ErBTxJ+Opaxbi8SHhvb0rtz
   z8FGYY34s7y7KC6dyZwihwS1Olj75ENtX87QKF7ivXxXja8WG9AofkKnB
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: qAAMO42tiHbdG3unZHWa1BN7kCR2vVzwvIjP1g0jNOlWDlXLhRc7u609aSWX6+L2cFmYmxltU1
 xvj1u+ZWjuDmTWtbfW/B5pXngGkSDJAI5dBt7wQM8t73WW6VPeDfZeIYBhhpj4ewtQrf9vhSFn
 ckmBqUzpSiP4DUoKsFO/guQqPbCY0OJss/dilmU0uMkabvhUkrf+nwo7Ij0JhfZQi5Hxs51b1P
 4UdLhC/Tzw5+yLMdyTBAcukcVHp4LxBKgHP+r0k2agXY54OFiGkSfBhA9rIFTrVi8IJi/otkG9
 X6w=
X-SBRS: 5.2
X-MesageID: 34066157
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,405,1599537600"; 
   d="scan'208";a="34066157"
Subject: Re: dom0 PV looping on search_pre_exception_table()
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
References: <20201208175738.GA3390@antioche.eu.org>
 <e73cc71d-c1a6-87c8-1b82-5d70d4f52eaa@citrix.com>
 <20201209101512.GA1299@antioche.eu.org>
 <3f7e50bb-24ad-1e32-9ea1-ba87007d3796@citrix.com>
 <20201209135908.GA4269@antioche.eu.org>
 <c612616a-3fcd-be93-7594-20c0c3b71b7a@citrix.com>
 <20201209154431.GA4913@antioche.eu.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <52e1b10d-75d4-63ac-f91e-cb8f0dcca493@citrix.com>
Date: Wed, 9 Dec 2020 16:00:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201209154431.GA4913@antioche.eu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 09/12/2020 15:44, Manuel Bouyer wrote:
> On Wed, Dec 09, 2020 at 02:41:23PM +0000, Andrew Cooper wrote:
>> Huh, so it is the LDT, but we're not getting as far as inspecting the
>> target frame.
>>
>> I wonder if the LDT is set up correctly.
> I guess it is, otherwise it wouldn't boot with a Xen 4.13 kernel, isn't it ?

Well - you said you always saw it once on 4.13, which clearly shows that
something was wonky, but it managed to unblock itself.

>> How about this incremental delta?
> Here's the output
> (XEN) IRET fault: #PF[0000]                                                    
> (XEN) %cr2 ffff820000010040, LDT base ffffc4800000a000, limit 0057             
> (XEN) *** pv_map_ldt_shadow_page(0x40) failed                                  
> (XEN) IRET fault: #PF[0000]                                                    
> (XEN) %cr2 ffff820000010040, LDT base ffffc4800000a000, limit 0057             
> (XEN) *** pv_map_ldt_shadow_page(0x40) failed                                  
> (XEN) IRET fault: #PF[0000]                                                 

Ok, so the promotion definitely fails, but we don't get as far as
inspecting the content of the LDT frame.  This probably means it failed
to change the page type, which probably means there are still
outstanding writeable references.

I'm expecting the final printk to be the one which triggers.

~Andrew

diff --git a/xen/arch/x86/pv/mm.c b/xen/arch/x86/pv/mm.c
index 5d74d11cba..2823dc2894 100644
--- a/xen/arch/x86/pv/mm.c
+++ b/xen/arch/x86/pv/mm.c
@@ -87,14 +87,23 @@ bool pv_map_ldt_shadow_page(unsigned int offset)
 
     gl1e = guest_get_eff_kern_l1e(linear);
     if ( unlikely(!(l1e_get_flags(gl1e) & _PAGE_PRESENT)) )
+    {
+        printk(XENLOG_ERR "*** LDT: gl1e %"PRIpte" not present\n",
gl1e.l1);
         return false;
+    }
 
     page = get_page_from_gfn(currd, l1e_get_pfn(gl1e), NULL, P2M_ALLOC);
     if ( unlikely(!page) )
+    {
+        printk(XENLOG_ERR "*** LDT: failed to get gfn %05lx reference\n",
+               l1e_get_pfn(gl1e));
         return false;
+    }
 
     if ( unlikely(!get_page_type(page, PGT_seg_desc_page)) )
     {
+        printk(XENLOG_ERR "*** LDT: bad type: caf %016lx, taf=%016lx\n",
+               page->count_info, page->u.inuse.type_info);
         put_page(page);
         return false;
     }


