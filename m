Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7FEC10F0B
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 07:36:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 930D12083D
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 07:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 930D12083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH1av-0005Bf-IN; Thu, 18 Apr 2019 07:36:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yEFf=SU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hH1au-0005Ba-U4
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 07:36:28 +0000
X-Inumbo-ID: ac8d8e63-61ac-11e9-92d7-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ac8d8e63-61ac-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 07:36:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4436AACBF;
 Thu, 18 Apr 2019 07:36:26 +0000 (UTC)
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ba241f11-7681-77c9-3f9a-340d7f656d6b@suse.com>
Date: Thu, 18 Apr 2019 09:36:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Question regarding swiotlb-xen in Linux kernel
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418073625.KhB18rldYd_ACCzi4hGB89gWrKtmK2noMPdp_Iuf-IU@z>

SSdtIGN1cnJlbnRseSBpbnZlc3RpZ2F0aW5nIGEgcHJvYmxlbSByZWxhdGVkIHRvIHN3aW90bGIt
eGVuLiBXaXRoIGEKc3BlY2lmaWMgZHJpdmVyIGEgY3VzdG9tZXIgaXMgY2FwYWJsZSB0byB0cmln
Z2VyIGEgc2l0dWF0aW9uIHdoZXJlIGEKTUZOIGlzIG1hcHBlZCB0byBtdWx0aXBsZSBkb20wIFBG
TnMgYXQgdGhlIHNhbWUgdGltZS4gVGhlcmUgaXMgbm8KZ3Vlc3QgaW52b2x2ZWQsIHNvIHRoaXMg
aXMgbm90IHJlbGF0ZWQgdG8gZ3JhbnRzLgoKV2l0IGEgZGVidWcga2VybmVsIEkgaGF2ZSBtYW5h
Z2VkIHRvIHRyYWNrIHRoZSBpbmNvbnNpc3RlbmN5IHRvIGEKY2FsbCBvZiB4ZW5fZGVzdHJveV9j
b250aWd1b3VzX3JlZ2lvbigpIGZyb20geGVuX3N3aW90bGJfZnJlZV9jb2hlcmVudCgpCndoZXJl
IHRoZSByZWdpb24gd2FzIG9idmlvdXNseSBub3QgY29udGlndW91cy4KCnhlbl9zd2lvdGxiX2Zy
ZWVfY29oZXJlbnQoKSBjb250YWluczoKCiAgICAgICAgaWYgKCgoZGV2X2FkZHIgKyBzaXplIC0g
MSA8PSBkbWFfbWFzaykpIHx8CiAgICAgICAgICAgIHJhbmdlX3N0cmFkZGxlc19wYWdlX2JvdW5k
YXJ5KHBoeXMsIHNpemUpKQogICAgICAgICAgICAgICAgeGVuX2Rlc3Ryb3lfY29udGlndW91c19y
ZWdpb24ocGh5cywgb3JkZXIpOwoKU2hvdWxkbid0IGl0IGJlIGVpdGhlcjoKCiAgICAgICAgaWYg
KCgoZGV2X2FkZHIgKyBzaXplIC0gMSA8PSBkbWFfbWFzaykpICYmCiAgICAgICAgICAgICFyYW5n
ZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFyeShwaHlzLCBzaXplKSkKICAgICAgICAgICAgICAgIHhl
bl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKHBoeXMsIG9yZGVyKTsKCgpvcjoKCiAgICAgICAg
aWYgKGRldl9hZGRyICsgc2l6ZSAtIDEgPD0gZG1hX21hc2spIHsKICAgICAgICAgICAgQlVHX09O
KHJhbmdlX3N0cmFkZGxlc19wYWdlX2JvdW5kYXJ5KHBoeXMsIHNpemUpKTsKICAgICAgICAgICAg
eGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24ocGh5cywgb3JkZXIpOwogICAgICAgIH0KCmFz
IGNhbGxpbmcgeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24oKSB3aXRoIGEgbm9uLWNvbnRp
Z3VvdXMgbWVtb3J5CnJlZ2lvbiBpcyBhIHBlcmZlY3QgcmVjZWlwdCBmb3IgYSBsYXRlbnQgY3Jh
c2g/CgpUaGUgcmVtYWluaW5nIHF1ZXN0aW9uIGlzIHdoeSB0aGUgZHJpdmVyIGlzIGNhbGxpbmcK
eGVuX3N3aW90bGJfZnJlZV9jb2hlcmVudCgpIGZvciBhIG5vbi1jb250aWd1b3VzIHJlZ2lvbiwg
b2YgY291cnNlLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
