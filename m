Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C2E606A685
	for <xen-devel@archiver.kernel.org>; Sat, 21 Nov 2026 06:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ML9A+ras
Received: from list by lists.xenproject.org with outflank-mailman.1498804.1696254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUene-0000k2-C6; Sat, 21 Nov 2026 06:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498804.1696254; Sat, 21 Nov 2026 06:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUene-0000ji-5d; Sat, 21 Nov 2026 06:42:14 +0000
Received: by outflank-mailman (input) for mailman id 1498804;
 Sat, 21 Nov 2026 06:42:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <haoxiang_li2024@163.com>) id 1xUenc-0000jc-Ia
 for xen-devel@lists.xenproject.org; Sat, 21 Nov 2026 06:42:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUenb-00EzkO-A2
 for xen-devel@lists.xenproject.org; Sat, 21 Nov 2026 07:42:11 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <haoxiang_li2024@163.com>)
 id 6b013d09-e002-0a2a0a5209dd-0a2a450ae728-30
 for <xen-devel@lists.xenproject.org>; Sat, 21 Nov 2026 07:42:08 +0100
Received: from [117.135.210.4] (helo=m16.mail.163.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <haoxiang_li2024@163.com>)
 id 6b013d3e-f2d2-0a2a450a0019-7587d204d18e-3
 for <xen-devel@lists.xenproject.org>; Sat, 21 Nov 2026 07:42:07 +0100
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
	Message-ID; bh=k5BKq+xslui1xiJuqhlDdIUc8BouYoKQVy88v5Nuwjk=; b=M
	L9A+rasjEd09mRq4I+ha2qCnc4a4TFNHzYt7WNniPk9Eq0fXLlOhmKiAzbGhGEwU
	oObqNvLpFxB0zO7ja5ZPKhEwR/yyrPVs3JLodx2QAGZeGIAtZxNfpWVqpoxJYdyn
	fwtUOyBNVmILMM6tUrugIQzW91h6KIMhFSzeQb7E9w=
Date: Sat, 21 Nov 2026 14:40:51 +0800 (CST)
From: "Haoxiang Li" <haoxiang_li2024@163.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Ostrovsky, Boris" <boris.ostrovsky@oracle.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"david.vrabel@citrix.com" <david.vrabel@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "bp@alien8.de" <bp@alien8.de>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"jgross@suse.com" <jgross@suse.com>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH] xen/grant-table: fix resource leak in gnttab_init()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <ceade382ab685f63b90b5bda405363db01f486e7.camel@intel.com>
References: <20261117084325.1241735-1-haoxiang_li2024@163.com>
 <6e3ed5bd9de1764058a257dca9e8fd6ca9fa1175.camel@intel.com>
 <78fc4539.482c.1a1f78783e1.Coremail.haoxiang_li2024@163.com>
 <ceade382ab685f63b90b5bda405363db01f486e7.camel@intel.com>
X-NTES-SC: AL_Qu2SB/6fvEou5ymYbOkfmUwSj+s8WsO0vf4i245fO5B+jDjp1T4OT1F4NHjp+uW9ICG1iDO4agVRzeJlcaxVXYswkxcUb8ZW/LSkWCV2SnAgaQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <57e13adb.164a.1a1fcd618cf.Coremail.haoxiang_li2024@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bygvCgD3v6H0PAFryAVzAA--.60W
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7RRn1WsBPPS5OwAA3r
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-purgate-ID: tlsNG-4011c0/1795243328-5A9D9CFC-C63EC002/0/0
X-purgate-type: clean
X-purgate-size: 728
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CkF0IDIwMjYtMTEtMjEgMDY6MDY6NTgsICJFZGdlY29tYmUsIFJpY2sgUCIgPHJpY2sucC5lZGdl
Y29tYmVAaW50ZWwuY29tPiB3cm90ZToKPgo+SSBndWVzcyBzaW5jZSB5b3UgaW5qZWN0ZWQgdGhl
IGVycm9yIHlvdSBkaWRuJ3QgaGl0IHRoaXMgaW4gcHJhY3RpY2U/IElmIHNvLCBJJ2QKPnRoaW5r
IHRoaXMgd291bGQgYmUgYSBwcmV0dHkgbG93IHByaW9yaXR5IGZpeC4gVGhlIGNvbWJvIG9mIHJh
cmUgc2NlbmFyaW8gYW5kCj5jbG9zZSB0byB6ZXJvIHVzZXIgaW1wYWN0LiBGaW5lIHRvIGJlIGNv
cnJlY3RlZCB0aG91Z2guCgpJIGFncmVlIHRoYXQgdGhpcyBmYWlsdXJlIGlzIHVubGlrZWx5IHRv
IGhhcHBlbi4gSSBmb3VuZCB0aGUgbWlzc2luZyBjbGVhbnVwIHVzaW5nIGEKc3RhdGljIGFuYWx5
c2lzIHRvb2wgYW5kIGNoZWNrIHRoZSBsZWFrIHdpdGggZmF1bHQgaW5qZWN0aW9uLiBCdXQgaGFy
ZCB0byBwcm92ZQp0aGF0IGl0IHdpbGwgaGFwcGVuIGluIG5vcm1hbCB1c2Vyc3BhY2UuCgpSZWdh
cmRzLApIYW94aWFuZyBMaQ==

