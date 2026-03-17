Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2286EFD706D
	for <xen-devel@archiver.kernel.org>; Tue, 17 Mar 2026 10:22:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1255894.1550670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2RZB-0004vO-MX; Tue, 17 Mar 2026 10:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255894.1550670; Tue, 17 Mar 2026 10:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2RZB-0004vH-Jm; Tue, 17 Mar 2026 10:22:25 +0000
Received: by outflank-mailman (input) for mailman id 1255894;
 Tue, 17 Mar 2026 10:22:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rXng=BR=bounce.vates.tech=bounce-md_30504962.69b92b5c.v1-02b8f13e50e84a3b8a35fff1d9082418@srs-se1.protection.inumbo.net>)
 id 1w2RZA-0004vB-GT
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2026 10:22:24 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f12a997-21eb-11f1-b164-2bf370ae4941;
 Tue, 17 Mar 2026 11:22:22 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fZp1853Kmz5QkLq0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2026 10:22:20 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 02b8f13e50e84a3b8a35fff1d9082418; Tue, 17 Mar 2026 10:22:20 +0000
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
X-Inumbo-ID: 2f12a997-21eb-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773742940; x=1774012940;
	bh=SB8tee7BVwumhyB+qrZNJF8OpTB0mvIkzO0/xMyjFX4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XypLha3UJXljlUm3pYPBdTokSnEI5jZTHCvocl9ntTCjUlLW6+fRhqufXlDSFGZ5F
	 9THjqrIu8PFUZ85EGt0/sggJh+iVazOO/nfMdT1k2syDtKWhYlfUj2rpVrjDmp6RgA
	 AyMI1311UCZU0wsZUOVH3GkXTxFI+BVGGqlrUv0IlTwfDx6lUF7WI5cPBs23hX5ogs
	 tzuOPBWE7pzRi8ln59F/jxjzDA2UR7bg5yjif6o33KTEqNW+JXrTMHMi3dhmk7VwrY
	 DZlTArXhnmUCbzsukDUEfy4RKUWJMZieZy4ObW4RAYWB78FR+fZm+/iI8rpNUgGC/V
	 +coCciOMkehiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773742940; x=1774003440; i=julian.vetter@vates.tech;
	bh=SB8tee7BVwumhyB+qrZNJF8OpTB0mvIkzO0/xMyjFX4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=minwlhCbxB8zHxzKqsjQhu83U4EpTfy8i+W4n2pfR9/BcLyUegx8+PkBDytBzUaw+
	 mQ7j6I5VSpHd5L5QUh7Gwk7xUQwOsdS7vja0OXqxSuvVcKkriYUrmCfIObzwQxfPjl
	 A/bCOW6r1uI1ECf6div4mOfIGfcddrAHgCDH/MfCPtw8VMlEJbWGQD7bJ6Tb2CuPI1
	 abhO0hWFEzrA2QqQJlYyOx6odEvEfu5J8LERl43rCcVyNegaX6ZswHvrbRgXFiBQeM
	 DYkzmVdmcrfo5zKxoy3YmTcp/Pp8MAqUMdTl8/rWgZTB2MLcBly0hQntH9VJECneYo
	 0iDv76pGWoOpQ==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=206/7]=20x86/dmop:=20Add=20XEN=5FDMOP=5Fenable=5Fext=5Fdest=5Fid=20DM=20op?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773742939233
Message-Id: <1124b3b3-6593-4ef0-ad9a-28d21e06bbfd@vates.tech>
To: "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>, "Julien Grall" <julien@xen.org>
References: <20260309123055.880050-1-julian.vetter@vates.tech> <20260309123055.880050-6-julian.vetter@vates.tech> <aa7KcQQoc3-HwlcE@macbook.local>
In-Reply-To: <aa7KcQQoc3-HwlcE@macbook.local>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.02b8f13e50e84a3b8a35fff1d9082418?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260317:md
Date: Tue, 17 Mar 2026 10:22:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 3/9/26 14:29, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 09, 2026 at 12:31:03PM +0000, Julian Vetter wrote:
>> Xen cannot simply advertise XEN_HVM_CPUID_EXT_DEST_ID to the guest
>> without knowing that the device model will handle extended destination
>> IDs correctly for passthrough MSIs. A device model that still uses
>> XEN_DOMCTL_bind_pt_irq would pass only the low 8 bits of the destination
>> ID, misrouting interrupts to vCPUs with APIC IDs greater than 255. So,
>> add a DM op XEN_DMOP_enable_ext_dest_id that the device model can call
>> during domain setup (before vCPUs are started) to signal that it will
>> use XEN_DMOP_bind_pt_msi_irq for all passthrough MSI bindings. When
>> called, Xen sets ext_dest_id_enabled in struct hvm_domain, so it's
>> visible to the guest via CPUID.
> 
> Have you considered whether you could re-use the padding in
> XEN_DMOP_create_ioreq_server to signal whether the device model
> supports Extended ID parsing?
> 
> Also, you might want some negotiation between multiple ioreq servers
> on the same domain.  IOW: is multiple ioreq servers are registered
> ahead of the domain having finished creation you could level whether
> extended ID should be announced.  For ioreqs that are registered after
> the domain have started you need to enforce the currently set Extended
> ID support.  If the domain is running, and Extended ID is advertised
> you must prevent registering any new ioreq that doesn't support
> Extended ID.
> 

Thank you Roger for your feedback! It's very appreciated! This was a 
good idea. I have implemented this now. I have used one of the reserved 
bytes and use it as a flag field.

But I have a remaining question/concern, which maybe you can clarify.
If server A (e.g., a secondary emulator) registers WITH ext_dest_id 
before the domain starts, hvm_ext_dest_id_enabled() returns true and the 
guest will be advertised XEN_HVM_CPUID_EXT_DEST_ID. If QEMU's primary 
ioreq server then registers WITHOUT the flag and goes on to use 
XEN_DOMCTL_bind_pt_irq, pass-through MSIs will be misrouted (or rejected 
if I then refuse calls to XEN_DOMCTL_bind_pt_irq for that domain). My 
implementation allows this combination before 'd->creation_finished'.

I have added a check in ioreq_server_dm_op() for the 
XEN_DMOP_create_ioreq_server case for the "runtime" case as you 
suggested. If one of the existing ioreq servers announces it, and a new 
server wants to join, that doesn't have this flag set, it will be 
rejected with -EINVAL:

if ( d->creation_finished && hvm_ext_dest_id_enabled(d) &&
      !(data->flags & XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID) )
     break;

But what happens to the first case I described, how can I reasonably 
negotiate between different ioreq servers or determine who is the "main" 
server? In practice, usually if QEMU ("the only" server that matters for 
pass-through) opted in, the feature is enabled. If it didn't, no other 
server would have opted in either, no? The only "sort of" issue would be 
if someone wrote a secondary emulator that sets ext_dest_id to basically 
"lock out" a QEMU that doesn't support the new XEN_DMs?

Thank you!

Julian

> Thanks, Roger.
> 



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



