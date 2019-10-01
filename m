Return-Path: <SRS0=k/ot=X2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6972CC352AA
	for <xen-devel@archiver.kernel.org>; Tue,  1 Oct 2019 07:39:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B9D521783
	for <xen-devel@archiver.kernel.org>; Tue,  1 Oct 2019 07:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B9D521783
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFCjw-0002kt-DL; Tue, 01 Oct 2019 07:38:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hN/W=X2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFCjv-0002ko-QR
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 07:38:31 +0000
X-Inumbo-ID: 7662f64c-e41e-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 7662f64c-e41e-11e9-8628-bc764e2007e4;
 Tue, 01 Oct 2019 07:38:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F2BC3AD77;
 Tue,  1 Oct 2019 07:38:28 +0000 (UTC)
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20190927154920.13713-1-ross.lagerwall@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a10784e1-843d-90a0-8cfa-8ccc6004dc4b@suse.com>
Date: Tue, 1 Oct 2019 09:38:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927154920.13713-1-ross.lagerwall@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/efi: Set nonblocking callbacks
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Russell King <linux@armlinux.org.uk>, IngoMolnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMTkgMTc6NDksIFJvc3MgTGFnZXJ3YWxsIHdyb3RlOgo+IE90aGVyIHBhcnRzIG9m
IHRoZSBrZXJuZWwgZXhwZWN0IHRoZXNlIG5vbmJsb2NraW5nIEVGSSBjYWxsYmFja3MgdG8KPiBl
eGlzdCBhbmQgY3Jhc2ggd2hlbiBydW5uaW5nIHVuZGVyIFhlbi4gU2luY2UgdGhlIGltcGxlbWVu
dGF0aW9ucyBvZgo+IHhlbl9lZmlfc2V0X3ZhcmlhYmxlKCkgYW5kIHhlbl9lZmlfcXVlcnlfdmFy
aWFibGVfaW5mbygpIGRvIG5vdCB0YWtlIGFueQo+IGxvY2tzLCB1c2UgdGhlbSBmb3IgdGhlIG5v
bmJsb2NraW5nIGNhbGxiYWNrcyB0b28uCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9zcyBMYWdlcndh
bGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpQdXNoZWQgdG8geGVuL3RpcC5naXQgZm9y
LWxpbnVzLTUuNAoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
