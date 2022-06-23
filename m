Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D169FC433EF
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jun 2022 18:14:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.355110.582570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4RLj-0000Ce-F6; Thu, 23 Jun 2022 18:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355110.582570; Thu, 23 Jun 2022 18:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4RLj-0000CX-C8; Thu, 23 Jun 2022 18:14:39 +0000
Received: by outflank-mailman (input) for mailman id 355110;
 Thu, 23 Jun 2022 18:14:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4RLi-0000CP-8u
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 18:14:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4RLi-0002tP-0k; Thu, 23 Jun 2022 18:14:38 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.0.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4RLh-0001EE-QT; Thu, 23 Jun 2022 18:14:37 +0000
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
	bh=zhjZv/vGKQklffnindBfKOisaj4Ol9xVtANKZuxBOFk=; b=ZTmmW5DA4otNKj67DAvatpm4nf
	yhNIOLFZz08vhcLMJxw0SEupw0ZkFkX1+c0fPo/b9jLLU6VHjJ7qdVJP5bC8atQjUiSrEnI1gH9Mf
	++gl/yUOd4FUwVxSj+QDe2IHA+BAtXnjxYux7j/l4XUf5T68GrTiEoRyY1RrNx7gsxs8=;
Message-ID: <83e13fdf-7e9a-9c2d-dd44-bf0b8e1435cc@xen.org>
Date: Thu, 23 Jun 2022 19:14:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/4] tools/xenstore: modify feature bit specification
 in xenstore-ring.txt
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220527072427.20327-1-jgross@suse.com>
 <20220527072427.20327-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220527072427.20327-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 27/05/2022 08:24, Juergen Gross wrote:
> Instead of specifying the feature bits in xenstore-ring.txt as a mask
> value use bit numbers. This will make the specification easier to read
> when adding more features.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

