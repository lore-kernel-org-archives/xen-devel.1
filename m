Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F17C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 08:46:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDB0A20693
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 08:46:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=eikelenboom.it header.i=@eikelenboom.it header.b="EZcTEKTl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDB0A20693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eikelenboom.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFxFv-0002dH-T1; Mon, 15 Apr 2019 08:46:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=itpO=SR=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1hFxFu-0002dC-Fv
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 08:46:22 +0000
X-Inumbo-ID: ef1c1ebf-5f5a-11e9-92d7-bc764e045a96
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ef1c1ebf-5f5a-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 08:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fdab5lLEgtk9HMpqattztcmKnq0nytHCfwilDlSU/as=; b=EZcTEKTlrtqVL/TO2F+W+QGnih
 qFTwr1+kSOrY10xnhF3ns/ppXcVDu4v0Nzgbt7cZjiCzkGLKwRw7TTPlGGl2rVIlk1wm+Fgo44LrV
 rKC1ScumOtDtGnocStEBDdk6K1dHhntQ8+3+1hNc1L/Rv6kpeQGVwKRt2hqL/3skjjAs=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:1554
 helo=[10.97.34.6]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <linux@eikelenboom.it>)
 id 1hFxFq-0005or-3P; Mon, 15 Apr 2019 10:46:18 +0200
To: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <5c7df313-2454-817f-41be-6ae5a09085f0@eikelenboom.it>
Date: Mon, 15 Apr 2019 10:48:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] xen-stable-4.12 branch,
 few commits short and hasn't got the RELEASE-4.12.0 tag.
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415084841.m7063IhPWK6LicQkrWDMHxvib4UL6y8YZ0rq17ACJPY@z>

SGkgSnVlcmdlbiwKCkFsdGhvdWdoIHhlbi1zdGFibGUtNC4xMiBpcyByZWxlYXNlZCBub3cgZm9y
IHNvbWUgdGltZSAodGhhbmtzIGZvciB0aGUgdGltZWx5IHJlbGVhc2UgISksIAp0aGUgcmVsZWFz
ZSB0YWcgICJSRUxFQVNFLTQuMTIuMCIgaXMgc3RpbGwgb25seSBhdmFpbGFibGUgaW4gdGhlICJz
dGFnaW5nLTQuMTIiIGJyYW5jaCBvZiB0aGUgWGVuIGdpdCB0cmVlLgpUaGUgInN0YWJsZS00LjEy
IiBpcyBzdGlsbCBhIGZldyAocmVsZWFzZS0pIGNvbW1pdHMgc2hvcnQsIGl0IHNlZW1zIGEgYml0
IGF3a3dhcmQuCgotLQpTYW5kZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
