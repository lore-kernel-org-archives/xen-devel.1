Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6063C282CE
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 21:00:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92E7320835
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 21:00:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8Ltu/mc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92E7320835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJP0V-0003FO-8u; Wed, 24 Apr 2019 21:00:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aie0=S2=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hJP0T-0003FJ-Cn
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 21:00:41 +0000
X-Inumbo-ID: 03fc488a-66d4-11e9-92d7-bc764e045a96
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 03fc488a-66d4-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 21:00:40 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id c1so6328172wml.4
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2019 14:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dRgBFH7TUnlBqmduyuKx2zVy59Mbn5qoD/IYZg/qabA=;
 b=a8Ltu/mcReI5y31iTOKLGe/J74yQ+k/CgmsVKrFweCc0qh7ly9hdjmL6U/hZ/Il7hA
 ip0PQ1OsOAbr6Ex77EqDuh5ZYPiQv/f1wadqKrUdgO/SsW9tFscGQw7irb+rI/01uSZ0
 4oBtwovIUhaQV5Iu3CBBQ1m+qnLuc82ii1CTt5jujKYDmpKNrz6o6/hqaPjxOAWcM05S
 aMO2BXQ/lmX7XMhkhv7xQMgOnXMzl2o74ytsy+P+T7Yo6unt1EZxKQviiRir8rOioXVU
 7lYlvaZGRslxKX09k/mOcinibXtI5zLrhL9Da4LRBkFzl5yUSynnl8bbFBA5Alh/MheU
 MNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dRgBFH7TUnlBqmduyuKx2zVy59Mbn5qoD/IYZg/qabA=;
 b=Pa5tC4TAgjhyzyEBh0zYj/0crMorgSVoBriWo7ImuX3Wkp5I5jCzBhPBl80RC4tCfT
 wEUuS9oSyXYq3R3uBxJa3Qds3jerMxqZgHNqTx2PGdEgtEavPwrsuOlJclbKo+P+ujuP
 iHyHfGyI10W4IeJy0FpmgpwyGRDnZe10JgsiPqFjIwfsjWI1wUw0wovjes0n1vh0RrUJ
 hVHCxaB0iCplL3VZTkYrrK2mTlvf+V4DALbcxZ97gKmGd1oqSnSTLLES0raeS7ZHRyER
 TtUCmJ/+oYPElwRi+E7LoOR7gKl/NafQIT0cz5R4VVIk6CzQ1KmntqkdVMzRDCkNT8lp
 gtVg==
X-Gm-Message-State: APjAAAXbZEJpxOWk77cnvhOHGASAMRoWyo6adqqZ7jUN4WibhGPdXiX5
 QKuQpOaV9kFAefjNO2nr1eX7WeEVh67lzR5Yu2k=
X-Google-Smtp-Source: APXvYqyPkF5e0xaUuUxXC3XHLxYp1IjcNdOf/0650bpPSSEvXlMN1faEYIJL29glv3Frsm1uAHqsMtp1DivThkRmy4c=
X-Received: by 2002:a1c:35c3:: with SMTP id c186mr779395wma.135.1556139639326; 
 Wed, 24 Apr 2019 14:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
 <CABfawhkQyqM6Ha0xhR=riEqwof-HRc3JiD3+pwZ6pb-tdpxWpg@mail.gmail.com>
 <dNMprIJQt_VFLi2bN_es-dUvhfPOax5QRlF7bS1qa2QEHuX3NP_-61r03tgzIo0Y_qYuTE_VRkW8WcmugvuNDNb6gOCFTdcuEnDdYsq6RwQ=@protonmail.com>
In-Reply-To: <dNMprIJQt_VFLi2bN_es-dUvhfPOax5QRlF7bS1qa2QEHuX3NP_-61r03tgzIo0Y_qYuTE_VRkW8WcmugvuNDNb6gOCFTdcuEnDdYsq6RwQ=@protonmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 24 Apr 2019 15:00:02 -0600
Message-ID:
 <CABfawhnsxNnwrKLvk6uXK5hFMxFv131jVogwe2pba5HQXf0jXQ@mail.gmail.com>
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
Message-ID: <20190424210002.ac2vMhcxchD0Vaqd6nPqgrb1UmAJg8RdWswA-ZeimN0@z>

PiA+IEknbSBub3QgZW50aXJlbHkgc3VyZSB3aGF0IHlvdSBtZWFuIGhlcmUgKGFuZCBwZXJoYXBz
IHRoYXQncyBhCj4gPiBkaXNjdXNzaW9uIHRvIGJlIG1vdmVkIHRvIHRoZSBMaWJWTUkgaXNzdWVz
IHBhZ2UpLiBJZiB5b3UgYWxyZWFkeSBoYXZlCj4gPiBhbiBldmVudCByZWdpc3RlcmVkIGZvciBz
aW5nbGVzdGVwcGluZyB3aHkgd291bGQgeW91IHdhbnQgdG8gZGlzYWJsZQo+ID4gaXQganVzdCB0
byByZS1lbmFibGUgaXQ/IElmIGl0J3MgYmVjYXVzZSB5b3UganVzdCBoYXZlIHRoZSBoYW5kbGVy
Cj4gPiByZWdpc3RlcmVkIHdpdGhvdXQgTVRGIGFjdHVhbGx5IGFjdGl2ZSwgdGhhdCdzIHNwZWNp
ZmljYWxseSBtYWRlIGZvcgo+ID4gdGhlIHNpdHVhdGlvbiB3aGVyZSB0dXJuIG9uL29mZiBNVEYg
dXNpbmcgdGhlIFZNX0VWRU5UX1JFU1BPTlNFX0ZMQUcuCj4KPiBUaGUgcmVhc29uIGlzIGJlY2F1
c2UgaSBuZWVkZWQgYW4gb24tZGVtYW5kIGFjdGl2YXRpb24gb2YgTVRGLCB3aXRob3V0IGJlaW5n
IGluIGFuIGV2ZW50IGNhbGxiYWNrLgo+Cj4gTGV0J3Mgc2F5IG15IEdEQiBjbGllbnQgYXNrcyBt
ZSB0byBkbyBvbmUgc2luZ2xlc3RlcC4KPiBJIHdpbGwgbmVlZCB0byByZWdpc3RlciBhIG5ldyBz
aW5nbGVzdGVwIGV2ZW50LCBlbmFibGVkLCBsaXN0ZW4KPiBvbmUgZXZlbnQgYW5kIHRoZW4gcmV0
dXJuLgo+Cj4gVGhlIHByb2JsZW0gaXMgdGhhdCBJIGFscmVhZHkgaGF2ZSBteSBzaW5nbGVzdGVw
IGV2ZW50IGZvciBicmVha3BvaW50IHJlY29pbGluZyBwdXJwb3NlcyB3aGljaCBpcyByZWdpc3Rl
cmVkLgo+Cj4gVGhhdCdzIHRoZSByZWFzb24gSSdtIHVucmVnaXN0ZXJpbmcgdGhpcyByZWNvaWwg
c2luZ2xlc3RlcCBldmVudCBhbmQgcmVyZWdpc3RlcmluZyBpdCBhZnRlcndhcmRzLCBiZWNhdXNl
IEkgY2FuJ3QgInJldXNlIiBpdDoKPiBodHRwczovL2dpdGh1Yi5jb20vV2VuemVsL3B5dm1pZGJn
L2Jsb2IvbWFzdGVyL3ZtaWRiZy9icmVha3BvaW50LnB5I0w3OQoKWWVhLCB0aGF0IHNlZW1zIHN1
Ym9wdGltYWwuIFByb3ZpZGVkIHRoZXJlIGlzIGFscmVhZHkgYQp2bWlfc3RvcF9zaW5nbGVfc3Rl
cF92Y3B1IGZ1bmN0aW9uIGluIExpYlZNSSB3aGljaCBqdXN0IHJlbW92ZXMgdGhlCk1URiBmcm9t
IGEgZ2l2ZW4gdkNQVSwgSSB3b3VsZCByZWNvbW1lbmQgcmVwbGFjaW5nIHRoYXQgZnVuY3Rpb24g
d2l0aAphIGdlbmVyaWMgb25lIHRoYXQgeW91IGNhbiB1c2UgdG8gYm90aCBlbmFibGUvZGlzYWJs
ZSBNVEYgb24gYQpwZXItdkNQVSBiYXNlLgoKPgo+IEkgYWN0dWFsbHkgZGlzY3Vzc2VkIGl0IHdp
dGggeW91IGhlcmU6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2xpYnZtaS9saWJ2bWkvaXNzdWVzLzY2
NQoKSSBzZWUgSSBhY3R1YWxseSBtYWRlIGEgdmVyeSBzaW1pbGFyIHJlY29tbWVuZGF0aW9uIGlu
IHRoYXQgZGlzY3Vzc2lvbgp0aGVuIHdoYXQgSSBqdXN0IGRlc2NyaWJlZCBhYm92ZSA7KQoKQ2hl
ZXJzLApUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
