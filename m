Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1766EC10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 17:11:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D17E0218A3
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 17:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D17E0218A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEzhS-0000oO-Ij; Fri, 12 Apr 2019 17:10:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jvnd=SO=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1hEzhR-0000oJ-3N
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 17:10:49 +0000
X-Inumbo-ID: e85dae65-5d45-11e9-92d7-bc764e045a96
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e85dae65-5d45-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 17:10:44 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id BDA6E133EB06B;
 Fri, 12 Apr 2019 10:10:43 -0700 (PDT)
Date: Fri, 12 Apr 2019 10:10:41 -0700 (PDT)
Message-Id: <20190412.101041.259784853562829642.davem@davemloft.net>
To: dongli.zhang@oracle.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <1555052004-31855-1-git-send-email-dongli.zhang@oracle.com>
References: <1555052004-31855-1-git-send-email-dongli.zhang@oracle.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 12 Apr 2019 10:10:44 -0700 (PDT)
Subject: Re: [Xen-devel] [PATCH 1/1] xen-netback: add reference from xenvif
 to backend_info to facilitate coredump analysis
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
Cc: wei.liu2@citrix.com, netdev@vger.kernel.org, joe.jin@oracle.com,
 linux-kernel@vger.kernel.org, junxiao.bi@oracle.com, paul.durrant@citrix.com,
 jie.l.li@oracle.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRG9uZ2xpIFpoYW5nIDxkb25nbGkuemhhbmdAb3JhY2xlLmNvbT4KRGF0ZTogRnJpLCAx
MiBBcHIgMjAxOSAxNDo1MzoyNCArMDgwMAoKPiBEdXJpbmcgY29yZWR1bXAgYW5hbHlzaXMsIGl0
IGlzIG5vdCBlYXN5IHRvIG9idGFpbiB0aGUgYWRkcmVzcyBvZgo+IGJhY2tlbmRfaW5mbyBpbiB4
ZW4tbmV0YmFjay4KPiAKPiBTbyBmYXIgdGhlcmUgYXJlIHR3byB3YXlzIHRvIG9idGFpbiBiYWNr
ZW5kX2luZm86Cj4gCj4gMS4gRG8gd2hhdCB4ZW5idXNfZGV2aWNlX2ZpbmQoKSBkb2VzIGZvciB2
bWNvcmUgdG8gZmluZCB0aGUgeGVuYnVzX2RldmljZQo+IGFuZCB0aGVuIGRlcml2ZSBpdCBmcm9t
IGRldl9nZXRfZHJ2ZGF0YSgpLgo+IAo+IDIuIEV4dHJhY3QgYmFja2VuZF9pbmZvIGZyb20gY2Fs
bHN0YWNrIG9mIHhlbndhdGNoIChlLmcuLCBuZXRiYWNrX3JlbW92ZSgpCj4gb3IgZnJvbnRlbmRf
Y2hhbmdlZCgpKS4KPiAKPiBUaGlzIHBhdGNoIGFkZHMgYSByZWZlcmVuY2UgZnJvbSB4ZW52aWYg
dG8gYmFja2VuZF9pbmZvIHNvIHRoYXQgaXQgd291bGQgYmUKPiBtdWNoIG1vcmUgZWFzaWVyIHRv
IG9idGFpbiBiYWNrZW5kX2luZm8gZHVyaW5nIGNvcmVkdW1wIGFuYWx5c2lzLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IERvbmdsaSBaaGFuZyA8ZG9uZ2xpLnpoYW5nQG9yYWNsZS5jb20+CgpBcHBsaWVk
IHRvIG5ldC1uZXh0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
