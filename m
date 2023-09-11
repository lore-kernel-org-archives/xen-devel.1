Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34554EE7FF4
	for <xen-devel@archiver.kernel.org>; Mon, 11 Sep 2023 16:15:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.599630.935124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfjZG-0003j6-0s; Mon, 11 Sep 2023 16:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599630.935124; Mon, 11 Sep 2023 16:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfjZF-0003iz-UP; Mon, 11 Sep 2023 16:15:17 +0000
Received: by outflank-mailman (input) for mailman id 599630;
 Mon, 11 Sep 2023 16:15:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qfjZE-0003it-Kj
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 16:15:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qfjZD-0003f4-VC; Mon, 11 Sep 2023 16:15:15 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qfjZD-0004uj-Pp; Mon, 11 Sep 2023 16:15:15 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=YLiHtCXtYYGwmkaJ5h0pWjNxa7iEg+5Vud9FCw8H5T4=; b=TSX0IrV4H4ruKwB+EuWpOHpsR3
	d/sjTQmtIGcK1kHXca4M/m82eTzT/Ay4MnsfOd4udvQxBwHCGM6LiFBqdtLIxt4InLBHNGTdKd2FF
	jP+R+LFFwdHtd6RBRxs2nonaw8hHZjjuz6c1Z5Ntl+MhwjW/g6QheB9UgXCE/9vzsa+4=;
Message-ID: <b1c3c30d-a535-445f-8159-fc5e28fadd7f@xen.org>
Date: Mon, 11 Sep 2023 17:15:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] build: restrict gcc11 workaround to versions earlier than
 11.3.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <3a5913ad-c273-0ee6-11c8-9d18e9a4a84b@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3a5913ad-c273-0ee6-11c8-9d18e9a4a84b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 22/08/2023 15:40, Jan Beulich wrote:
> The fix for this issue was backported to 11.3, so let's not unduly
> engage the workaround.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

