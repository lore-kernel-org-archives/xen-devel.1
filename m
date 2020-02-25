Return-Path: <SRS0=r37Z=4N=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36672C35E04
	for <xen-devel@archiver.kernel.org>; Tue, 25 Feb 2020 16:52:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14B7E2084E
	for <xen-devel@archiver.kernel.org>; Tue, 25 Feb 2020 16:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14B7E2084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6dR5-0003FS-Lf; Tue, 25 Feb 2020 16:51:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6dR3-0003FN-Gg
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 16:51:53 +0000
X-Inumbo-ID: 1f848a3a-57ef-11ea-933c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f848a3a-57ef-11ea-933c-12813bfff9fa;
 Tue, 25 Feb 2020 16:51:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2F0CBADB5;
 Tue, 25 Feb 2020 16:51:52 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200224104645.96381-1-roger.pau@citrix.com>
 <20200224104645.96381-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b8a41c96-f20e-b806-230a-27db8903be09@suse.com>
Date: Tue, 25 Feb 2020 17:51:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224104645.96381-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/5] x86: track when in #NMI context
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDIuMjAyMCAxMTo0NiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEBAIC0xOCw2ICsx
OCwxMSBAQCB0eXBlZGVmIHN0cnVjdCB7Cj4gICNkZWZpbmUgaXJxX2VudGVyKCkJKGxvY2FsX2ly
cV9jb3VudChzbXBfcHJvY2Vzc29yX2lkKCkpKyspCj4gICNkZWZpbmUgaXJxX2V4aXQoKQkobG9j
YWxfaXJxX2NvdW50KHNtcF9wcm9jZXNzb3JfaWQoKSktLSkKPiAgCj4gKyNkZWZpbmUgbm1pX2Nv
dW50KGNwdSkJX19JUlFfU1RBVCgoY3B1KSwgbm1pX2NvdW50KQoKT2gsIGJ0dyAobm90aWNlZCBv
bmx5IHdoaWxlIGFscmVhZHkgbG9va2luZyBhdCB0aGUgbmV4dApwYXRjaCkgLSBubyBuZWVkIGZv
ciB0aGUgcGFyZW50aGVzZXMgYXJvdW5kICJjcHUiIGFmYWljdC4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
