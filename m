Return-Path: <SRS0=mHc1=DJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA67C4363D
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 08:15:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7196620708
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 08:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="OWxoMHGd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7196620708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1734.5268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOGDc-000777-TD; Fri, 02 Oct 2020 08:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1734.5268; Fri, 02 Oct 2020 08:15:08 +0000
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
	id 1kOGDc-000770-Py; Fri, 02 Oct 2020 08:15:08 +0000
Received: by outflank-mailman (input) for mailman id 1734;
 Fri, 02 Oct 2020 08:15:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOGDb-00076v-He
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 08:15:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 184eced0-cefb-436b-857f-0d9b11c7d260;
 Fri, 02 Oct 2020 08:15:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E73C2AE37;
 Fri,  2 Oct 2020 08:15:05 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOGDb-00076v-He
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 08:15:07 +0000
X-Inumbo-ID: 184eced0-cefb-436b-857f-0d9b11c7d260
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 184eced0-cefb-436b-857f-0d9b11c7d260;
	Fri, 02 Oct 2020 08:15:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601626506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GcYjzA6eXVsPOzZWJaiz0ZrJlZpu9hPVM/+LbzGJt4w=;
	b=OWxoMHGdMH11+4eHbwo1SBp89KT7VmTdzr+U0RhMSHjuRUaQB4Hs1RWci2syUbxGOQsmdO
	shfrwNhyl8JjqlAY8vNS/+AcQAsFFZ96vCbp8kfbqCITth+F+AN+E1PyArETwrIsKhTTW7
	RaeAwmorCx2vmH8WgLoTfUFURXG4sTo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E73C2AE37;
	Fri,  2 Oct 2020 08:15:05 +0000 (UTC)
Subject: Re: [PATCH v8 1/5] efi/boot.c: add file.need_to_free
To: Trammell Hudson <hudson@trmm.net>
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, wl@xen.org
References: <20200930120011.1622924-1-hudson@trmm.net>
 <20200930120011.1622924-2-hudson@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <76a21a35-0469-6d44-564a-c0fed9bf9bfd@suse.com>
Date: Fri, 2 Oct 2020 10:15:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930120011.1622924-2-hudson@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 14:00, Trammell Hudson wrote:
> The config file, kernel, initrd, etc should only be freed if they
> are allocated with the UEFI allocator.  On x86 the ucode, and on
> ARM the dtb, are also marked as need_to_free when allocated or
> expanded.
> 
> This also fixes a memory leak in ARM fdt_increase_size() if there
> is an error in building the new device tree.
> 
> Signed-off-by: Trammell Hudson <hudson@trmm.net>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


