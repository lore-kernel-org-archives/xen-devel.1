Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61632C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 20:55:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EB052183E
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 20:55:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glXtRpHy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EB052183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJOuk-0002RU-CT; Wed, 24 Apr 2019 20:54:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aie0=S2=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hJOuj-0002RK-9x
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 20:54:45 +0000
X-Inumbo-ID: 2ef697c8-66d3-11e9-92d7-bc764e045a96
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2ef697c8-66d3-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 20:54:43 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h4so27018400wre.7
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2019 13:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HhWPF805DWX6T56laL6JIzbIs1dS1lrJQWPrxv1XmGE=;
 b=glXtRpHykPQEI6dfxd4l2Gdzh0Yu/X12tT15t4B4SvzPGOYp+xN2RMeGT2DrH8Idkt
 vX3aSo1FfvUARI9RwWPMwSAOzGJ1IRMGR7nbzeGgPEycgIv1pnlaO5kYnh87S4PWfMEY
 Gj8zdUi/q+T+PCmjukk72i1EpulUYNQ+lKcjXrvXu2/dq06DOpQWoKVOb3loAiEjaw1b
 FKasqlJjKQ0H5kprO0EU6RGzNats5CQrR9SF94pr3qVh0Xb+0NIEzfthYlFDnmtjtyJE
 ZRABNuAN370iYuuiSqlpe4OSTRrz+WdiP5kpi8dZZF0N1A5T/hDBGASUlFBe3iznlYUl
 Ni5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HhWPF805DWX6T56laL6JIzbIs1dS1lrJQWPrxv1XmGE=;
 b=t/39D2TgCDHBrF3tMLgqv/2OrwTl6IhLbZzSfj49WYASgaiNvBl0vWvcHhRaI6EjgY
 VOZmduqGzcgxj86iUVhEhmbe1E2bnJIg3i8sRYQ+5mm+cFQv4XjxL22vzN4cIyNwNg8J
 T2UWf2mmww4EGh4EhYcFpFs4Mig8LhfWX6/SE3O53Jdy6TpYbLyws9zWJ9YpN4gITONs
 cLBydco4JEsglbbUpECJYw3WXp357WoRATW+M/4QWNQYLBjovX/e9Z7Bm4xDHeT/nBmC
 o61AAWBtJdpreuRn53nacM6vi50G5zQJhugMDVEPVzgKFPOh4mt5AvFP7t/bABl51c+7
 4jWQ==
X-Gm-Message-State: APjAAAWLc3y/eG4HRG0a1zgBY5/pCNFwQCYXkREF2/jDa5DAWF+X3eqq
 bm/aGwVfb3LT/VJaYzlcAVtVjXzVaxJ1x7Rs/g0=
X-Google-Smtp-Source: APXvYqzSEOKOENOLZI8Lm5mKBBqZSFVqqy7gOqM8IRieDWS8VwlifBlhx9Fs7G+JQOvgU3+6DFaCkOAMBrUvYmLs9eU=
X-Received: by 2002:adf:dec5:: with SMTP id i5mr1753451wrn.157.1556139281908; 
 Wed, 24 Apr 2019 13:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
 <CABfawhkQyqM6Ha0xhR=riEqwof-HRc3JiD3+pwZ6pb-tdpxWpg@mail.gmail.com>
 <dNMprIJQt_VFLi2bN_es-dUvhfPOax5QRlF7bS1qa2QEHuX3NP_-61r03tgzIo0Y_qYuTE_VRkW8WcmugvuNDNb6gOCFTdcuEnDdYsq6RwQ=@protonmail.com>
In-Reply-To: <dNMprIJQt_VFLi2bN_es-dUvhfPOax5QRlF7bS1qa2QEHuX3NP_-61r03tgzIo0Y_qYuTE_VRkW8WcmugvuNDNb6gOCFTdcuEnDdYsq6RwQ=@protonmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 24 Apr 2019 14:54:04 -0600
Message-ID:
 <CABfawhkeUi+65kOySNbQVki=vMiGLoGHiNw-8rcng9oigCTLgA@mail.gmail.com>
To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Subject: Re: [Xen-devel] VMI: singlestep event not received
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424205404.6swiXcEUj6ySYyJXvy8qIdy8yQ967mtLgwJ6Ltx-MBk@z>

PiBBbnl3YXksIGkgd291bGQgbmVlZCB0byBpbnRlcmNlcHQgYSBNT1YtVE8tRFJ4IHRvIHByZXZl
bnQgV2luZG93cyBmcm9tIGRpc2FibGluZyBteSBoYXJkd2FyZSBicmVha3BvaW50cyA6KQo+Cj4g
QXMgSSB1bmRlcnN0b29kLCB0aGlzIHdhcyBub3QgZXhwb3NlZCBieSB0aGUgWGVuIFZNSSBBUEkg
eWV0Ogo+IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtm
PXhlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVudC5oO2g9YjJiYWZjMGQ3N2Y5NzU4ZTQyYjBkNTNj
MDVhN2U2YmI4NmM4NjY4NjtoYj1IRUFEI2wxNTQKCkNvcnJlY3QsIGJ1dCBub3RoaW5nIHN0b3Bz
IHlvdSBmcm9tIGFkZGluZyB0aGUgZ2x1ZSB0aGF0IGVuYWJsZXMgdGhhdAo7KSBUaGUgaGFyZHdh
cmUgaXMgZnVsbHkgY2FwYWJsZSBvZiB0cmFwcGluZyBvbiB0aGF0IGV2ZW50LCBpdCdzIGp1c3QK
YSBtYXR0ZXIgb2Ygd2lyaW5nIGl0IGFsbCB1cC4gU2hvdWxkIGJlIGxhcmdlbHkgYSBjb3B5LXBh
c3RlIGpvYiBpZgp5b3UgZm9sbG93IHRoZSBleGFtcGxlIG9mIG90aGVyIHZtX2V2ZW50IGVuYWJs
ZS9kaXNhYmxlIGZ1bmN0aW9ucy4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
