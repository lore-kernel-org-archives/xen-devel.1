Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B740C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 15:39:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48A3320652
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 15:39:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwjdRFAh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48A3320652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJJzN-0000Xt-Ry; Wed, 24 Apr 2019 15:39:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aie0=S2=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hJJzM-0000Xm-PQ
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 15:39:12 +0000
X-Inumbo-ID: 1afd5a4a-66a7-11e9-92d7-bc764e045a96
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1afd5a4a-66a7-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 15:39:11 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c1so5215826wml.4
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2019 08:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=64ykKLWrLz7z2lmQ/vyXJd8HI4kmO2l/+IY3fER7Gfk=;
 b=YwjdRFAhK85//RNokee8iMd6x6HHe/+0e894ryE1HEmTu3XM7JvQMjUtAEGJEj/vay
 y+jFlwIhet/Foll59u7kC5xb8h+hIr+KCMKuK8mLPM5rTkV4N0lA5cybPKMVIsBDzK9W
 ryB2YdLAt+dqllMMGNTV/BMZVb3r4ErGlkRuRNDx1fBDo14ImB4QRwGuZVu8VieZIfY3
 wlLNm2l+jw/oMwXY+y1clsVGtDGMafDSiwuz2xO1ojJ1NyVdmlrUXf/5Ne/aNcPOEua2
 LKfHyVNP+Hqb21mi8y2KAzv20ShOw6D1y1s5BDNnrxZf4ekSqy8MtWBzY4QqeigvpB36
 wWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=64ykKLWrLz7z2lmQ/vyXJd8HI4kmO2l/+IY3fER7Gfk=;
 b=STJThK38BPJoPGNcf/Sbj/5owASq97vhepwm/ueUyygTJhsc0CMnRoIRnmYdhbRNpB
 SUuwAKEgvi6mo8JBzkX5gqSN7+43GaihGlD7kVBDV9tfOh2p5GqJc3AoTYlTh/f/smtb
 mdhqjUD4ChsRFzbjhVl+AooKhiG4FFEPR+7v/ez+6LnLN5WE6//GSpkjf7sgooIP+H1h
 3ivfoFMzI2SzT29pnq5z3WvhJPxiBlTY+MFaiaT1W+nAXUBxw6ZTrCAUjykxppUOhtb9
 2NHpJJGm3ilLSoYGmL1nc/raZ6mu/NVLTObF9Ar5hCUXBbmrVUkpaUpPwguJVxLe5x3M
 fR6g==
X-Gm-Message-State: APjAAAUrwqmqxl58mSq2I+CFTI2yc6471GZHE2UNIpUkW4pj/cADUcI1
 gn9i2fh2lnEJd8+UP5jqJXl3dD01WdtTiyMPuZ4=
X-Google-Smtp-Source: APXvYqw/yB3SiFsvSIL2fFWExgioRbs1k1Gzi/xh+J5jk/RIuDNGkkQGYHekQT08JlmEOH93Hz2C4frvEqUpndCcMlE=
X-Received: by 2002:a1c:43c2:: with SMTP id q185mr7239837wma.53.1556120350518; 
 Wed, 24 Apr 2019 08:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
 <5c0480bb-24bc-81cf-066b-a66b2e83d51f@bitdefender.com>
 <jYLnqeXXkfLqocyaorTwgUHTTQ7AozmbsPb8X4HGvjuGF2shfDIkAw7G363xoRRWmSZShCUqzriK-bBF3S93QKQkXS_9wUFrlKbdjKr6tUM=@protonmail.com>
 <CABfawhmwxVTK4yq88R87JX78ZNiy5WnBjE_SGCSeUyQcBVMr1w@mail.gmail.com>
 <ddf62960-ba73-63dd-8957-7b0e17efe68c@bitdefender.com>
In-Reply-To: <ddf62960-ba73-63dd-8957-7b0e17efe68c@bitdefender.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 24 Apr 2019 09:38:33 -0600
Message-ID:
 <CABfawhkUZea1=YikfWNi=PAJi1dSVkJbzw7Kr7URksn2eASZVg@mail.gmail.com>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424153833.e9jFCPxsaWfYWcwdio3zxWkUbt7mHlRQogmURQ7xD2k@z>

T24gV2VkLCBBcHIgMjQsIDIwMTkgYXQgOTozNCBBTSBSYXp2YW4gQ29qb2NhcnUKPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDQvMjQvMTkgNjoyNSBQTSwgVGFt
YXMgSyBMZW5neWVsIHdyb3RlOgo+ID4gT24gTW9uLCBBcHIgMjIsIDIwMTkgYXQgNjowMCBQTSBN
YXRoaWV1IFRhcnJhbAo+ID4gPG1hdGhpZXUudGFycmFsQHByb3Rvbm1haWwuY29tPiB3cm90ZToK
PiA+Pgo+ID4+IE9uIE1vbmRheSAyMiBBcHJpbCAyMDE5IDExOjIyLCBSYXp2YW4gQ29qb2NhcnUg
PHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+ID4+Cj4gPj4+IE9uIDQvMjIvMTkg
MToyNiBBTSwgTWF0aGlldSBUYXJyYWwgd3JvdGU6Cj4gPj4+Cj4gPj4+PiBUaGUgcHJvYmxlbSBp
cyB0aGF0IFJ0bFVzZXJUaHJlYWRTdGFydCBpcyBwYWdlZC1vdXQsIHNvIGknbSB0cnlpbmcgdG8g
cmVhY2ggaXQgdmlhIHNpbmdsZXN0ZXBwaW5nIGFzIGEgYmFja3VwIHNvbHV0aW9uLgo+ID4+Pgo+
ID4+PiBGV0lXLCB5b3UgY2FuIGp1c3QgdXNlIHhjX2h2bV9pbmplY3RfdHJhcCgpIHdpdGggYSBU
UkFQX3BhZ2VfZmF1bHQKPiA+Pj4gcGFyYW1ldGVyIHRvIGNhdXNlIHRoZSBPUyB0byBicmluZyBh
IHBhZ2VkIG91dCBwYWdlIGJhY2sgaW50byBtYWluIG1lbW9yeS4KPiA+Pgo+ID4+IFRoZSBwcm9i
bGVtIGlzIHRoYXQgaSdtIGZ1bGx5IGJhc2VkIG9uIExpYlZNSSwgd2hpY2ggZG9lc24ndCBwcm92
aWRlIGFuIEFQSSBmb3IgcGFnZSBpbmplY3Rpb24geWV0Lgo+ID4+Cj4gPj4gSSB0aGluayBUYW1h
cyB3YXMgd2FpdGluZyBmb3IgYSBmdWxsIHN1cHBvcnQgb2YgcGFnZWZhdWx0IGluamVjdGlvbiBv
biBYZW4gYmVmb3JlIG9wZW5pbmcgYW4gQVBJLgo+ID4+Cj4gPj4gTWF5YmUgd2Ugc2hvdWxkIG9w
ZW4gYW4gaXNzdWUgdG8gdHJhY2sgdGhlIHByb2dyZXNzIGFib3V0IGl0Lgo+ID4+Cj4gPj4gVGhh
bmtzIGFueXdheSBmb3IgdGhlIHN1Z2dlc3Rpb24gIQo+ID4KPiA+IE5vdCBoYXZpbmcgYSBMaWJW
TUkgd3JhcHBlciBzaG91bGQgbm90IHByZXZlbnQgeW91IGZyb20gdXNpbmcgYSBsaWJ4Ywo+ID4g
ZnVuY3Rpb24gZGlyZWN0bHkuIFRoZXJlIGFyZSBtYW55IGNvcm5lci1jYXNlcyByZWdhcmRpbmcg
d2hlbiBpdCBpcwo+ID4gc2FmZSB0byBpbmplY3QgYSBwYWdlZmF1bHQgaW50byB0aGUgZ3Vlc3Qg
dG8gYnJpbmcgYmFjayBwYWdlcyBhbmQgdGhhdAo+ID4gbG9naWMgaXMgbm90IHRyaXZpYWwgZW5v
dWdoIHRvIGJlIGltcGxlbWVudGVkIGluIExpYlZNSS4gSXQncyB3YXkgdG9vCj4gPiBzcGVjaWZp
YyB0byB0aGUgdXNlY2FzZSB0byBkZWNpZGUgd2hlbiBpdCdzIHNhZmUgdG8gZG8gdGhhdC4gU28g
aW4KPiA+IHRoaXMgY2FzZSwgaWYgeW91IGtub3cgeW91IGFyZSBpbiByaW5nMyBvZiB5b3VyIHRh
cmdldCBwcm9jZXNzIHlvdSBjYW4KPiA+IGp1c3QgY2FsbCB0aGUgbGlieGMgZnVuY3Rpb24gZGly
ZWN0bHkuCj4KPiBUaGF0J3MgdmVyeSB2ZXJ5IHRydWUsIGhvd2V2ZXIgSSB0aGluayB3ZSBzaG91
bGQgYXNzdW1lIHRoYXQgbGlicmFyaWVzCj4gc3VjaCBhcyBsaWJ2bWkgYW5kIGxpYmJkdm1pIGFy
ZSB1c2VkIGJ5IGNsaWVudCBjb2RlIHNtYXJ0IGVub3VnaCB0bwo+IGZpZ3VyZSBvdXQsIHVzaW5n
IHNhaWQgbGlicmFyaWVzLCBlbm91Z2ggdGhpbmdzIGFib3V0IHdoYXQncyBhcHByb3ByaWF0ZQo+
IChvciBub3QpIHRvIGRvLCBhbmQgIGxldCB0aGVtIGRvIGl0IHJhdGhlciB0aGFuIHNlY29uZC1n
dWVzcyB0aGVtLgo+IEhlbmNlLCBpbiBsaWJiZHZtaSBJJ3ZlIHdyYXBwZWQgdGhhdCwgYW5kIGFk
ZGVkIGEgY29tbWVudCBiYXNpY2FsbHkKPiBzYXlpbmcgd2hhdCB5b3UncmUgc2F5aW5nIGFib3Zl
Ogo+Cj4gaHR0cHM6Ly9naXRodWIuY29tL2JpdGRlZmVuZGVyL2xpYmJkdm1pL2Jsb2IvbWFzdGVy
L3NyYy94ZW5kcml2ZXIuY3BwI0w1NDIKPgo+IElmIHdlIGVuZCB1cCBoYXZpbmcgdGhlIGNsaWVu
dCBjb2RlIGNhbGwgYmFja2VuZC1zcGVjaWZpYyBjb2RlIGRpcmVjdGx5Cj4gd2UncmUgbm90LCBh
ZnRlciBhbGwsIHJlYWxseSBhYnN0cmFjdGluZyBpdCB3aXRoIG91ciB3cmFwcGVyIGxpYnJhcmll
cy4KCklmIHNvbWVvbmUgYWRkcyB0aGF0IHdyYXBwZXIgdG8gTGliVk1JIEkgd291bGRuJ3QgdmV0
byBpdCAtIGJ1dCBpdCdzCmFsc28gYSBmdW5jdGlvbiB0aGF0IEknbSAxMDAlIGV4cGVjdGluZyB3
aWxsIGdlbmVyYXRlIGEgbG90IG9mCmNvbmZ1c2lvbiBhbmQgd2hpbmluZyBhYm91dCBpdCBub3Qg
d29ya2luZyBpbiBhbGwgY2FzZXMuIFNvIEkgY2hvc2UKbm90IHRvIGFkZCBpdCBteXNlbGYgYmVj
YXVzZSBvZiB0aGF0LiDCr1xfKOODhClfL8KvCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
