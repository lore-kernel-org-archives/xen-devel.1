Return-Path: <SRS0=BdeL=TQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBA4C04AAF
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 10:31:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3609206BF
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 10:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3609206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRDfR-0004fL-JX; Thu, 16 May 2019 10:31:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRDfQ-0004fG-I5
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 10:31:16 +0000
X-Inumbo-ID: bb6f89c0-77c5-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bb6f89c0-77c5-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 10:31:15 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 16 May 2019 04:31:14 -0600
Message-Id: <5CDD3BF2020000780022F8AD@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 16 May 2019 04:31:14 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Alistair Francis" <alistair.francis@wdc.com>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
In-Reply-To: <20190516000212.13468-1-alistair.francis@wdc.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/3] config.sub: Update config.sub to latest
 version
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, alistair23@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190516103114.SALuPRhQqZ0lCS9ODjS7EBOqKPOMSOXvC5pXnOup0mk@z>

Pj4+IE9uIDE2LjA1LjE5IGF0IDAyOjAyLCA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPiB3cm90
ZToKPiBTaWduZWQtb2ZmLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHdk
Yy5jb20+CgpBdCBsZWFzdCB0byBtZSBpdCBpcyBmYXIgZnJvbSBvYnZpb3VzIHdoeSB3ZSB3b3Vs
ZCB3YW50L25lZWQgdG8KZG8gdGhpcyB1cGRhdGUsIG9yIHdoZXJlIHRoZSBjYW5vbmljYWwgImxh
dGVzdCB2ZXJzaW9uIiBsaXZlcyBhbmQKaGVuY2Ugd2hlcmUgdGhpcyBpcyBjb21pbmcgZnJvbS4g
QW5vdGhlciBxdWVzdGlvbiBtaWdodCBiZQp3aGV0aGVyIGl0IGlzIGEgZ29vZCB0aGluZyB0byBw
dWxsIHRoaXMgaW4gYXMgYSBzaW5nbGUgYmxvYiAoY292ZXJpbmcKYSBnYXAgb2YgNyB5ZWFycyks
IHRodXMgcHJlc3VtYWJseSBhbHNvIGRpc2NhcmRpbmcgYXV0aG9yc2hpcApvZiBkb3plbnMgb2Yg
cGVvcGxlLiBCdXQgb2YgY291cnNlLCBpbiB0aGUgZW5kIGl0J3MgdGhlIHBlb3BsZQp5b3UndmUg
Q2MtZWQgd2hvIG5lZWQgdG8gZGVjaWRlIHdoZXRoZXIgdGhpcyBpcyBmaW5lIHRvIHRha2UgaW4K
dGhpcyBzaGFwZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
