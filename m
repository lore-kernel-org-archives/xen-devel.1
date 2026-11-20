Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA45060A6F7A
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 05:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=npnk2DhE
Received: from list by lists.xenproject.org with outflank-mailman.1497714.1695849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUHda-0007RK-Hy; Fri, 20 Nov 2026 05:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497714.1695849; Fri, 20 Nov 2026 05:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUHda-0007RD-F0; Fri, 20 Nov 2026 05:58:18 +0000
Received: by outflank-mailman (input) for mailman id 1497714;
 Fri, 20 Nov 2026 05:58:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <haoxiang_li2024@163.com>) id 1xUHdY-0007R6-AX
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 05:58:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUHdW-006r1O-U7
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 06:58:15 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <haoxiang_li2024@163.com>)
 id 6affe15e-8faa-0a2a0a5109dd-0a2a450ccf96-20
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 06:58:13 +0100
Received: from [220.197.31.4] (helo=m16.mail.163.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <haoxiang_li2024@163.com>)
 id 6affe172-f479-0a2a450c0019-dcc51f04b779-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 06:58:12 +0100
Received: from haoxiang_li2024$163.com (
 [240e:604:311:b4ab:8f9f:ca5d:948e:2fcd] ) by ajax-webmail-wmsvr-40-129
 (Coremail) ; Fri, 20 Nov 2026 13:56:55 +0800 (CST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=s110527 header.d=163.com header.i="@163.com" header.h="Date:From:To:Subject:Content-Type:MIME-Version:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=sbd//bs2bSiS9ya3onVON/g2DIspX3vWG1ebZrilzPw=; b=n
	pnk2DhEj723ZvWEkcKFx1JOlRBaA2uA/ex+0YxEcLhHRyR2+ackC0KB1+pPXxFaA
	v0otHyFjkrUX5/MJRjZmXcaS4cDZ/VuGURgFTIIb4jkaZcccYMTMjZt0/rcmaS1a
	TGpmslZS2mQxQXIU6mhw8+/+VlTtGHHQ5fAfbqXDcA=
Date: Fri, 20 Nov 2026 13:56:55 +0800 (CST)
From: "Haoxiang Li" <haoxiang_li2024@163.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "jgross@suse.com" <jgross@suse.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"bp@alien8.de" <bp@alien8.de>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"Ostrovsky, Boris" <boris.ostrovsky@oracle.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"david.vrabel@citrix.com" <david.vrabel@citrix.com>,
	"hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
	"linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/grant-table: fix resource leak in gnttab_init()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <6e3ed5bd9de1764058a257dca9e8fd6ca9fa1175.camel@intel.com>
References: <20261117084325.1241735-1-haoxiang_li2024@163.com>
 <6e3ed5bd9de1764058a257dca9e8fd6ca9fa1175.camel@intel.com>
X-NTES-SC: AL_Qu2SB/2eu0oq4yiRY+kfmUwSj+s8WsO0vf4i245fO5B+jADp1Soae3ppF1/T886DEg+AkSSGUQdHzsB0fqBWdZwGNOdTQvvnJBFy826TJLKPNw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <78fc4539.482c.1a1f78783e1.Coremail.haoxiang_li2024@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gSgvCgD3Fyko4f9qWLBxAA--.133W
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7ggdi2r-4SjBkgAA3-
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-purgate-ID: tlsNG-d25034/1795154293-5290EA5B-3BD424AD/0/0
X-purgate-type: clean
X-purgate-size: 1254
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgpBdCAyMDI2LTExLTIwIDA3OjE4OjAzLCAiRWRnZWNvbWJlLCBSaWNrIFAiIDxyaWNrLnAuZWRn
ZWNvbWJlQGludGVsLmNvbT4gd3JvdGU6Cj4KPklmIHRoZSBQViBndWVzdCBoaXRzIHRoaXMgc2Nl
bmFyaW8gY2FuIGl0IHN1cnZpdmU/IEkgZG9uJ3Qga25vdyB4ZW4gcHYgdmVyeQo+d2VsbC4gRG9l
cyB0aGlzIG1lYW5zIHRoYXQgdGhlIFBWIGd1ZXN0IGhhcyBubyBkaXNrIG9yIG5ldHdvcmsuIElm
IHNvLCB0aGUgdXNlcgo+aXMgcHJvYmFibHkgbm90IGNvbmNlcm5lZCB3aXRoIGEgb25lIHRpbWUg
bWVtb3J5IGxlYWsuCgpUaGFua3MgZm9yIHJhaXNpbmcgdGhpcy4gSSB0ZXN0ZWQgYW4geDg2LTY0
IFBWIERvbTAgdW5kZXIgWGVuIDQuMTcuNyBpbiBRRU1VLAp1c2luZyBhdGFfcGlpeCBmb3Igc3Rv
cmFnZSBhbmQgZTEwMDAgZm9yIG5ldHdvcmtpbmcuCgpJIGluamVjdGVkIC1FTk9NRU0gaW1tZWRp
YXRlbHkgYmVmb3JlIHRoZSBpbml0aWFsIE1GTi1hcnJheSBhbGxvY2F0aW9uIGluCmdudHRhYl9t
YXAoKSwgYWZ0ZXIgYXJjaF9nbnR0YWJfaW5pdCgpIGhhZCBzdWNjZWVkZWQuIFdpdGggYW5kIHdp
dGhvdXQgdGhlCnBhdGNoLCBnbnR0YWJfaW5pdCgpIHJldHVybmVkIC1FTk9ERVYsIGJ1dCBEb20w
IHN0aWxsIGJvb3RlZCB0byB1c2Vyc3BhY2UuCkluIGJvdGggY2FzZXMsIGRpc2sgSS9PIHdvcmtl
ZCwgYW5kIHRoZSBuZXR3b3JrIGludGVyZmFjZSBjb3VsZCByZWFjaCB0aGUKUUVNVSBnYXRld2F5
LgoKSG93ZXZlciwgSSBhZ3JlZSB0aGF0IHRoaXMgaXMgYSBvbmUtdGltZSBsZWFrIHdpdGggbGlt
aXRlZCBpbXBhY3QuIEkgaGF2ZSBub3QKZGVtb25zdHJhdGVkIGFueSBmdXJ0aGVyIHVzZXItdmlz
aWJsZSBjb25zZXF1ZW5jZXMgZnJvbSB0aGUgbGVhay4KClJlZ2FyZHMsCkhhb3hpYW5nIExpCgoK
Cg==

