Return-Path: <SRS0=1L59=T6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF38FC28CC0
	for <xen-devel@archiver.kernel.org>; Thu, 30 May 2019 15:20:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAA5F25CC3
	for <xen-devel@archiver.kernel.org>; Thu, 30 May 2019 15:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAA5F25CC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWMqF-0000PX-Le; Thu, 30 May 2019 15:19:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IneZ=T6=codethink.co.uk=ben.hutchings@srs-us1.protection.inumbo.net>)
 id 1hWMnp-0000KY-He
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 15:17:13 +0000
X-Inumbo-ID: fe8c5e60-82ed-11e9-9098-7fbf87543bdf
Received: from imap1.codethink.co.uk (unknown [176.9.8.82])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe8c5e60-82ed-11e9-9098-7fbf87543bdf;
 Thu, 30 May 2019 15:17:10 +0000 (UTC)
Received: from [167.98.27.226] (helo=xylophone)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hWMnY-0008Bg-0Q; Thu, 30 May 2019 16:16:56 +0100
Message-ID: <1559229415.24330.2.camel@codethink.co.uk>
From: Ben Hutchings <ben.hutchings@codethink.co.uk>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Thu, 30 May 2019 16:16:55 +0100
Organization: Codethink Ltd.
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
X-Mailman-Approved-At: Thu, 30 May 2019 15:19:41 +0000
Subject: [Xen-devel] [stable] xen/pciback: Don't disable PCI_COMMAND on PCI
 device reset.
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
Cc: Prarit Bhargava <prarit@redhat.com>, Juergen Gross <jgross@suse.com>,
 stable <stable@vger.kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSdtIGxvb2tpbmcgYXQgQ1ZFLTIwMTUtODU1MyB3aGljaCBpcyBmaXhlZCBieToKCmNvbW1pdCA3
NjgxZjMxZWM5Y2RhY2FiNGZkMTA1NzBiZTkyNGYyY2VmNjY2OWJhCkF1dGhvcjogS29ucmFkIFJ6
ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpEYXRlOsKgwqDCoFdlZCBGZWIg
MTMgMTg6MjE6MzEgMjAxOSAtMDUwMAoKwqDCoMKgwqB4ZW4vcGNpYmFjazogRG9uJ3QgZGlzYWJs
ZSBQQ0lfQ09NTUFORCBvbiBQQ0kgZGV2aWNlIHJlc2V0LgoKSSdtIGF3YXJlIHRoYXQgdGhpcyBj
aGFuZ2UgaXMgaW5jb21wYXRpYmxlIHdpdGggcWVtdSA8IDIuNSwgYnV0IHRoYXQncwpub3cgcXVp
dGUgb2xkLiAgRG8geW91IHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIGFwcGx5IHRoaXMgY2hhbmdl
IHRvCnNvbWUgc3RhYmxlIGJyYW5jaGVzPwoKQmVuLgoKLS0gCkJlbiBIdXRjaGluZ3MsIFNvZnR3
YXJlIERldmVsb3BlciAgICAgICAgICAgICAgICDCoCAgICAgICAgQ29kZXRoaW5rIEx0ZApodHRw
czovL3d3dy5jb2RldGhpbmsuY28udWsvICAgICAgICAgICAgICAgICBEYWxlIEhvdXNlLCAzNSBE
YWxlIFN0cmVldAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTWFuY2hlc3Rl
ciwgTTEgMkhGLCBVbml0ZWQgS2luZ2RvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
