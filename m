Return-Path: <SRS0=0beg=33=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBC8C2BA83
	for <xen-devel@archiver.kernel.org>; Fri,  7 Feb 2020 17:07:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C938214AF
	for <xen-devel@archiver.kernel.org>; Fri,  7 Feb 2020 17:07:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UvW4LUQ0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C938214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j076G-0001oO-7F; Fri, 07 Feb 2020 17:07:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hdY0=33=merlin.srs.infradead.org=batv+1a18ff0851e0951751f6+6011+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1j076E-0001oI-Gf
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 17:07:26 +0000
X-Inumbo-ID: 4d5a8666-49cc-11ea-a759-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d5a8666-49cc-11ea-a759-bc764e2007e4;
 Fri, 07 Feb 2020 17:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Message-ID:From:CC:To:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=+hN7H56g0PW+ta31jqcKAbMrZ85CukZNaJo4QOdlV+w=; b=UvW4LUQ0G5vW/a/0bziAYtRdiK
 8GZQhtI6oZBfUznEkU4Ck8q6ZED5gCs/STezod9seX8pOvdcFxL7ucbxlYM14QETlARC4XzatfjMl
 GLgwfNUByfBBpln8vrxUuenvVO9ZPN9LU/beDbxn6P9FDC5J2cGofQzp2OLaX+i+sB56D2TBxCRma
 4MKvscTTR7Efej895Df35/ngx9XXJmtt/QWK029yyhfviByc4E3LWkZSHFeMcPm4LYTNc0Qd6D9Hc
 hE8yXvzP8OR0ZEOGE1VtN+crK4pArKh0/adgrGlu7DR9SHNaHuG9chUtxT9Aqup7bPiE4C4zBCjiG
 TiiQJb7g==;
Received: from [2a01:4c8:1019:135:a363:ccfb:5bcd:ec7]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j075o-0004y9-L3; Fri, 07 Feb 2020 17:07:01 +0000
Date: Fri, 07 Feb 2020 17:06:58 +0000
User-Agent: K-9 Mail for Android
In-Reply-To: <2f2368f84380dd2c81bbfa310d03bc3c3f800b94.camel@amazon.com>
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-2-dwmw2@infradead.org>
 <cdf20919a9c1afcee2d2f63631391a701cde46ef.camel@amazon.com>
 <017D4B5F-603D-42BF-94DA-B757FF27EAF8@infradead.org>
 <2f2368f84380dd2c81bbfa310d03bc3c3f800b94.camel@amazon.com>
MIME-Version: 1.0
To: "Xia, Hongyan" <hongyxia@amazon.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
From: David Woodhouse <dwmw2@infradead.org>
Message-ID: <B63B9D74-EF17-4E6F-AA5D-2BEC0C3228D7@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH 2/2] xen/mm: Introduce PG_state_uninitialised
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 "stewart.hildebrand@dornerworks.com" <stewart.hildebrand@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA3IEZlYnJ1YXJ5IDIwMjAgMTY6NDA6MDEgR01ULCAiWGlhLCBIb25neWFuIiA8aG9uZ3l4
aWFAYW1hem9uLmNvbT4gd3JvdGU6Cj5PbiBGcmksIDIwMjAtMDItMDcgYXQgMTY6MzIgKzAwMDAs
IERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4gCj4+IC4uLgo+PiAKPj4gSWRlYWxseSBub3QgYmVj
YXVzZSBpbml0X2hlYXBfcGFnZXMoKSB0aGVuIGNhbGxzIGZyZWVfaGVhcF9wYWdlcygpCj4+IGFu
ZCB0aGUgInJlY3Vyc2lvbiIgaXMgYmVzdCBhdm9pZGVkLgo+Cj5LaW5kIG9mIGRlcGVuZHMgb24g
d2hlcmUgd2UgY2hhbmdlIGl0cyBwZyB0byBpbml0aWFsaXNlZC4gSWYgd2UgZG8gdGhhdAo+aW4g
ZnJlZV9oZWFwX3BhZ2VzIHRoaXMgZG9lcyByZWN1cnNlLCBidXQgaWYgaXQgaXMgZG9uZSBpbgo+
aW5pdF9oZWFwX3BhZ2VzIGJlZm9yZSBjYWxsaW5nIGZyZWUgaXQgZG9lcyBub3QuCgpUcnVlLiBJ
dCB3b3VsZCAqbG9vayogbGlrZSBpdCBtaWdodCByZWN1cnNlLCBidXQgbmV2ZXIgc2hvdWxkIGlu
IHByYWN0aWNlLgoKLS0gClNlbnQgZnJvbSBteSBBbmRyb2lkIGRldmljZSB3aXRoIEstOSBNYWls
LiBQbGVhc2UgZXhjdXNlIG15IGJyZXZpdHkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
