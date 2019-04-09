Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C109C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 17:00:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 053D420850
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 17:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 053D420850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDu6o-0002hj-L3; Tue, 09 Apr 2019 17:00:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=62Ig=SL=citrix.com=prvs=9959cddee=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hDu6n-0002he-FD
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 17:00:29 +0000
X-Inumbo-ID: f6e63118-5ae8-11e9-a91b-07bb5069c205
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6e63118-5ae8-11e9-a91b-07bb5069c205;
 Tue, 09 Apr 2019 17:00:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,330,1549929600"; d="scan'208";a="83139271"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23724.53156.402984.872878@mariner.uk.xensource.com>
Date: Tue, 9 Apr 2019 18:00:20 +0100
To: Wei Liu <wei.liu2@citrix.com>
In-Reply-To: <20190409165210.7624-2-wei.liu2@citrix.com>
References: <20190409165210.7624-1-wei.liu2@citrix.com>
 <20190409165210.7624-2-wei.liu2@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3 1/3] tools: remove tmem code and commands
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409170020.hpMcLBNhHsVEPKQcOwyxXlOV6y6Vyi4xvNbkTmXxLiY@z>

V2VpIExpdSB3cml0ZXMgKCJbUEFUQ0ggdjMgMS8zXSB0b29sczogcmVtb3ZlIHRtZW0gY29kZSBh
bmQgY29tbWFuZHMiKToKPiBSZW1vdmUgYWxsIHRtZW0gcmVsYXRlZCBjb2RlIGluIGxpYnhjLgoK
QWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKRm9yIHRo
ZSB3aG9sZSBzZXJpZXMsIHByb3ZpZGVkIG5vIG9iamVjdGlvbnMgYXJlIGhlYXJkIHdpdGhpbiB0
aGUgbmV4dAp3ZWVrLiAgSWYgdGhlcmUgYXJlIG9iamVjdGlvbnMgd2Ugc2hvdWxkIGV2YWx1YXRl
IHRoZW0gYW5kIG1heWJlCmludml0ZSB0aGUgb2JqZWN0b3IgdG8gYmVjb21lIHRoZSBtYWludGFp
bmVyLi4uCgpIVEgsCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
