Return-Path: <SRS0=jwRU=ZG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5B7C432C3
	for <xen-devel@archiver.kernel.org>; Thu, 14 Nov 2019 14:59:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5F41206D8
	for <xen-devel@archiver.kernel.org>; Thu, 14 Nov 2019 14:59:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGZ6UerL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5F41206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVGa5-0002G2-JR; Thu, 14 Nov 2019 14:58:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=isnB=ZG=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVGa4-0002Fx-JQ
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 14:58:44 +0000
X-Inumbo-ID: 40380b2c-06ef-11ea-9631-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40380b2c-06ef-11ea-9631-bc764e2007e4;
 Thu, 14 Nov 2019 14:58:43 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id g3so6985897ljl.11
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2019 06:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bq2PGyDiyhFcjOAHzynjzWzgUg7wzkCsrSZ7LLxCCSE=;
 b=aGZ6UerLDX1ldwk6Mbjj6ZAfWRTacZ1UDvuFqd/LsI2FYAekvBanpVexICHmpfDaH/
 pLgNMB1Wx4pqrK2sGoXZ4thBsRL0dlOMqYtEg5vm9aD64IF542DOnPGH8UicC4FKX96P
 VeqLzcxrtJPMWjaBYqURHFd8cZeRT0Lg5Myc+9+dDktcgtYPx2YNvJfmWxwk+bzPuByc
 EQIaBOaNJdKHAd621ojS9NeAzLDRVX8HvhL/JHUK8kVTcQ3h1PLOWyiwULZ1G0n22Uh0
 vYMDDko+yvgS7PBloixFYlaZEssP3MINLQpe1Iwqg0t67GPCEXAlw72eVn/6hcuahE7O
 yOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bq2PGyDiyhFcjOAHzynjzWzgUg7wzkCsrSZ7LLxCCSE=;
 b=UYKGm5b/XM8E6ZxEPDLhc+4eMpANBgv9WITe/MdXKuHtLKMcffqL4GwmTpJMEBl9Dn
 oeF6aew5qqicbh2CjjRF5eg0AubdkAQVD+i5oZfcTnoRg9T+nNab94ffjBLl184A4avZ
 FSN1emE5rKrdZ9ZfwVZOryVinigfVT7AwxknLM8Z2AhVyim/Md0GljwVYGPOkkI/6JhM
 GjnF20neb+116ft1AWhuTt/JqMR8YaJvDZ1X/Z+oOshqkY2fdzHFsR3dCNI5Y/paRdts
 AKpg+RUtqA9Buch7KNaTclRbqIGdkP2zFSfXSB4p9eJERd3RVFnWOq1gKGE1YQq8lta4
 crDw==
X-Gm-Message-State: APjAAAUTrBfxb4Mr81/FTr9cFaFTxQ9I/vRaVckzLKPsi3T9FiNIFB/f
 YZwUldi1eCSpvIQ9gBo6SaPHpgJwuMshmL2yOoQ=
X-Google-Smtp-Source: APXvYqyGeK+IFlWOmxeQUEQ95snDQkOfBRekn0bbmwfkbZE7Aw8Hxu00rqV71W0X+8R2KGDtuwFTypep3W4qpu/v4dk=
X-Received: by 2002:a05:651c:95:: with SMTP id 21mr7073129ljq.40.1573743522751; 
 Thu, 14 Nov 2019 06:58:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
 <5773984ae9308500183adde21cf25837bba39f7f.1570456846.git.rosbrookn@ainfosec.com>
 <ce6a58af-d269-5b70-b1bc-df5a7620c4b5@citrix.com>
In-Reply-To: <ce6a58af-d269-5b70-b1bc-df5a7620c4b5@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 14 Nov 2019 09:58:31 -0500
Message-ID: <CAEBZRSeDo2RO-VptW8hYOzh93M04pxxVL16dqoAcrLGm0MbFuA@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH 11/24] golang/xenlight: define
 CpuidPolicyList builtin type
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, kerriganb@ainfosec.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBIbW0sIHRoaXMgaW50cm9kdWNlcyBhIHByZXR0eSBzaWduaWZpY2FudCByaXNrIG9mIG1lbW9y
eSBsZWFrczsgYnV0IEkKPiBkb24ndCByZWFsbHkgc2VlIGFueSB3YXkgYXJvdW5kIGl0LiAgSSBn
dWVzcyB3ZSByZWFsbHkgd2FudCB0byBkbyBzb21lCj4gU2V0RmluYWxpemVyKCkgbWFnaWMgb24g
dGhpcyB0byBjYWxsIGxpYnhsX2NwdWlkX2Rpc3Bvc2UoKT8KPgo+IFdlIG1pZ2h0IGFsc28gd2Fu
dCB0byBhZGQgc29tZXRoaW5nIGxpa2UgYSAuRGlzcG9zZSgpIG1ldGhvZCB0byBoYXZlCj4gcHJl
ZGljdGFibGUgbWVtb3J5IGVmZmVjdHMuICBCdXQgdGhlbiBkbyB3ZSB3YW50IHRvIGhhdmUgYSAu
RGlzcG9zZSgpCj4gbWV0aG9kIG9uIGFsbCB0eXBlcyB0aGF0IG1pZ2h0IGNvbnRhaW4gYSBDcHVp
ZFBvbGljeUxpc3Q/ICBUZWNobmljYWxseQo+IHdlJ3JlIHN1cHBvc2VkIHRvLCBzbyB3ZSBtaWdo
dCBoYXZlIHRvLiAoQW5kIG5vdyBJJ20gaGF2aW5nIGRlamEgdnUsCj4gbGlrZSB3ZSd2ZSBoYWQg
dGhpcyBkaXNjdXNzaW9uIGJlZm9yZSwgYnV0IEkgY2FuJ3Qgc2VlbSB0byBmaW5kIGl0LikKCkFz
IEkndmUgZXhwcmVzc2VkIGJlZm9yZSwgSSBkb24ndCB0aGluayBpdHMgYSBnb29kIGlkZWEgdG8g
bG9vayB0byB0aGUKcnVudGltZSB0byBmaXggdGhpcyBzb3J0IG9mIHByb2JsZW0sIHNvIEknZCBi
ZSBtb3JlIGluY2xpbmVkIHRvIGxvb2sKaW50byBhIERpc3Bvc2UgbGlrZSBvcHRpb24uIEJ1dCB0
aGVuIGl0IGRvZXMgc2VlbSB3ZWlyZCBmcm9tIGFuIEFQSQpwZXJzcGVjdGl2ZSB0byBvbmx5IGRl
ZmluZSBEaXNwb3NlIG9uIHNvbWUgdHlwZXMgc2luY2UgaXQgaW50cm9kdWNlcyBhCmNsb3Nlciwg
YnV0IGluY29tcGxldGUsIHNlbWFudGljIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIGxpYnhsIGFuZCB0
aGUgR28KcGFja2FnZS4KCldSVCB0aGUgZGVmaW5pdGlvbiBvZiBDcHVpZFBvbGljeUxpc3QsIGlz
IHRoZSBiZXN0IHdlIGNhbiBkbz8gT3IgaXMKdGhlcmUgYSB3YXkgd2UgY2FuIGhpZGUgdGhlIHVz
ZSBvZiB0aGUgQyB0eXBlIGJldHRlciBzbyB0aGF0IHNvbWVvbmUKdXNpbmcgdGhpcyBwYWNrYWdl
IGRvZXNuJ3QgbmVlZCB0byB3b3JyeSBhYm91dCBjYWxsaW5nIERpc3Bvc2Ugb3IKb3RoZXJ3aXNl
PyBJIHRoaW5rIFsxXSBpcyB3aGVyZSB3ZSBvcmlnaW5hbGx5IGRpc2N1c3NlZCB0aGlzLgoKLU5S
CgpbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZl
bC8yMDE5LTA5L21zZzAxMTEyLmh0bWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
