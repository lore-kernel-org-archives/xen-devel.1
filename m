Return-Path: <SRS0=1L59=T6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BA4C28CC0
	for <xen-devel@archiver.kernel.org>; Thu, 30 May 2019 15:28:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A5E425CB5
	for <xen-devel@archiver.kernel.org>; Thu, 30 May 2019 15:28:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="P9Sdk6E4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A5E425CB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWMyE-0001Ao-EQ; Thu, 30 May 2019 15:27:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JXhs=T6=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hWMyC-0001Aj-L4
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 15:27:56 +0000
X-Inumbo-ID: 7f2e8d96-82ef-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7f2e8d96-82ef-11e9-8980-bc764e045a96;
 Thu, 30 May 2019 15:27:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1559230075; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=A3Yj2fdGcuhWM7RTkdpR6bqVQyDuzzOMYA905qIaYSU=;
 b=P9Sdk6E4ooulDfUbj7W+E+4ce18aQP8R33hKlvFh0wfYgJ0jOCCz52Cmv7PU5/JNoNy3WMi1
 Pn4/XjYM2nJ6dTJ0x3w87ixjqCMYtVp33B8c2l0bzOjz+03mBJNp2eCPS8uy1oDdlxk5qc+8
 7jyPSRSxUkU9iomIOHLtXMMpNUE=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mxa.mailgun.org with ESMTP id 5ceff67a.7f052c93c470-smtp-out-n03;
 Thu, 30 May 2019 15:27:54 -0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id r76so6450060lja.12
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2019 08:27:53 -0700 (PDT)
X-Gm-Message-State: APjAAAUWMShWsrILcrsrIbX/ZFxTSNnA/h+uSRezPMcIOTdKC5mfjika
 f2OxIeov5oLNiAK/RKLq9xmjCF5spYu7+SknyyM=
X-Google-Smtp-Source: APXvYqzN0hvaMAt2YwmAPGf+wvII+htxLz8OcLOlN9lLEUWIvlDirqXkCrKPmA+ha95Wy1INkkGBE/1xnD6clFQLf5M=
X-Received: by 2002:a2e:87c9:: with SMTP id v9mr761440ljj.100.1559230072142;
 Thu, 30 May 2019 08:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
In-Reply-To: <cover.1559224640.git.ppircalabu@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 30 May 2019 08:27:15 -0700
X-Gmail-Original-Message-ID: <CABfawh=ggx3sVzffdXD==Pr6kKmMH94TOqia2EnYqrXx+r-HFA@mail.gmail.com>
Message-ID:
 <CABfawh=ggx3sVzffdXD==Pr6kKmMH94TOqia2EnYqrXx+r-HFA@mail.gmail.com>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH 0/9] Per vcpu vm_event channels
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
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190530152715.c0UcE8K0CFOHLwdzGCa9TWzVCMxj1HBfgpLYgZ9ARdk@z>

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgNzoxOCBBTSBQZXRyZSBQaXJjYWxhYnUKPHBwaXJjYWxh
YnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPgo+IFRoaXMgcGF0Y2hzZXQgYWRkcyBhIG5ldyBt
ZWNoYW5pc20gb2Ygc2VuZGluZyBzeW5jaHJvbm91cyB2bV9ldmVudAo+IHJlcXVlc3RzIGFuZCBo
YW5kbGluZyB2bV9ldmVudCByZXNwb25zZXMgd2l0aG91dCB1c2luZyBhIHJpbmcuCj4gQXMgZWFj
aCBzeW5jaHJvbm91cyByZXF1ZXN0IHBhdXNlcyB0aGUgdmNwdSB1bnRpbCB0aGUgY29ycmVzcG9u
ZGluZwo+IHJlc3BvbnNlIGlzIGhhbmRsZWQsIGl0IGNhbiBiZSBzdG9yZWQgaW4gYSBzbG90dGVk
IG1lbW9yeSBidWZmZXIKPiAob25lIHBlciB2Y3B1KSBzaGFyZWQgYmV0d2VlbiB0aGUgaHlwZXJ2
aXNvciBhbmQgdGhlIGNvbnRyb2xsaW5nIGRvbWFpbi4KPgo+IFRoZSBtYWluIGFkdmFudGFnZXMg
b2YgdGhpcyBhcHByb2FjaCBhcmU6Cj4gLSB0aGUgYWJpbGl0eSB0byBkeW5hbWljYWx5IGFsbG9j
YXRlIHRoZSBuZWNlc3NhcnkgbWVtb3J5IHVzZWQgdG8gaG9sZAo+IHRoZSByZXF1ZXN0cy9yZXNw
b25zZXMgKHRoZSBzaXplIG9mIHZtX2V2ZW50X3JlcXVlc3RfdC92bV9ldmVudF9yZXNwb25zZV90
Cj4gY2FuIGdyb3cgdW5yZXN0cmljdGVkIGJ5IHRoZSByaW5nJ3Mgb25lIHBhZ2UgbGltaXRhdGlv
bikKPiAtIHRoZSByaW5nJ3Mgd2FpdHF1ZXVlIGxvZ2ljIGlzIHVubmVjZXNzYXJ5IGluIHRoaXMg
Y2FzZSBiZWNhdXNlIHRoZQo+IHZjcHUgc2VuZGluZyB0aGUgcmVxdWVzdCBpcyBibG9ja2VkIHVu
dGlsIGEgcmVzcG9uc2UgaXMgcmVjZWl2ZWQuCgpIaSBQZXRyZSwKY291bGQgeW91IHB1c2ggdGhp
cyBzZXJpZXMgYXMgYSBnaXQgYnJhbmNoIHNvbWV3aGVyZT8KClRoYW5rcywKVGFtYXMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
