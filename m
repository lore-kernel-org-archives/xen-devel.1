Return-Path: <SRS0=Sbqy=ZF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006F1C432C3
	for <xen-devel@archiver.kernel.org>; Wed, 13 Nov 2019 21:51:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6383206EE
	for <xen-devel@archiver.kernel.org>; Wed, 13 Nov 2019 21:51:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T06kYRPP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6383206EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iV0XH-00012d-9o; Wed, 13 Nov 2019 21:50:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QW09=ZF=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iV0XG-00011s-9A
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 21:50:46 +0000
X-Inumbo-ID: a4e1eefc-065f-11ea-adbe-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4e1eefc-065f-11ea-adbe-bc764e2007e4;
 Wed, 13 Nov 2019 21:50:45 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id k15so4322986lja.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2019 13:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OaObC6IUuUJKSQb2fSWuIHgsp0di0gz4ydq2JiuAEKU=;
 b=T06kYRPP6ZfUionGHWfilc+MWyG33qxMHy4SbiUL3VgQh2HAEuRhZKzv/xw+SAGBWq
 sES3Hpqbiok4gOewBijeDkZ/9KuccSPDWP2f1EKpibq83b7IRXWIqaCEXoRSmXv5qWl3
 OqJ21HvmhoWsvrcHpTLSzgAjtMscuYEP76+uTHA2owanD8rTyBdMgEruKUVCYUE05P5a
 1zYnhcSzhbIW2qdD2DYb+BxEIgB+WNBDBKcVleFyJsVPYL6JmrQjTFxqEeuM+Uh0gz8H
 fyjDqY7S/1cYYr4cxOrjNdbTb+P4mCWDPVnH4UrlGzxFZdPB5DIDOiuNM+q/iIpLL/IQ
 xW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OaObC6IUuUJKSQb2fSWuIHgsp0di0gz4ydq2JiuAEKU=;
 b=eOGfZjHJikXZbKvurL46Beqx5RmPKohxz0R2ThX24G+N96JD7qsmkrGNxH/sUwmA/Z
 +cTwH46AQzO5QgpxGdqHF1/VIQlDaNydbRicyqUBhg24cLgipJ4A7rNyw68m2u/TOAzi
 bS2oiBcFd+PpWNO4OXtHdQiqScDD5134WWYswRKUtJkTYmu0/EUpzrJnLQMzYi1o/et3
 QR8SC6HTzmCUqfP9jbAM+c3upqC9f/3xcwHQYMIMdLgYLOtJ27HbtrWskTOoqjKHj9tH
 uRr0U/bKkWjOwfQFv7pnd01pDm/DdmfR1O0rc/4/YWfqZkRNOtQAY08jkJF9OmhQlGpI
 6Vwg==
X-Gm-Message-State: APjAAAXh3A12knIMt7SAQ9kofMY5mR0ugEOtP2MJtHQjTjYBGIzV0FkW
 fbi0XZuEEjz+MRPqm9fk9voOrikXKSJlHszRkj0=
X-Google-Smtp-Source: APXvYqzmdaeIFVR+ohO+nwJjuNCF7MywPAQSqMV7wk6WZp1UFx3QYwua3JulcEUlxe5RFL5FsTp2rZhhIPcPw7HMaUY=
X-Received: by 2002:a2e:9985:: with SMTP id w5mr1758834lji.162.1573681844050; 
 Wed, 13 Nov 2019 13:50:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
 <c3740e59a9c5aecb69c9b075aab23d4a427c07bf.1570456846.git.rosbrookn@ainfosec.com>
 <6cdc3ae9-89cc-7128-3a30-0edd2f68fe34@citrix.com>
In-Reply-To: <6cdc3ae9-89cc-7128-3a30-0edd2f68fe34@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Wed, 13 Nov 2019 16:50:32 -0500
Message-ID: <CAEBZRSf19GHHZBh2Uid=7QjYkktMUABiJiaX0jdEmKApT75t9g@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH 08/24] golang/xenlight: define Mac builtin
 type
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

PiBXaGF0J3MgdGhlIHBvaW50IG9mIHRoaXM/Cj4KPiBJIHJlYWxpemUgaXQncyBzbGlnaHRseSBh
bm5veWluZyB0byBoYXZlIHRvIHR5cGUgYG1hY1swXSwgbWFjWzFdLCAuLi5gLAo+IGJ1dCBJJ2Qg
cmF0aGVyIGRvIHRoYXQgb25jZSB0aGFuIG1ha2UgdGhlIHJ1bnRpbWUgY29weSBldmVyeXRoaW5n
IG92ZXIKPiBpbnRvIGEgc2xpY2Ugb2YgaW50ZXJmYWNlcyBldmVyeSBTdHJpbmcoKSBjYWxsLgoK
QXMgSSB0aGluayB5b3UgcmVhbGl6ZWQgYnkgbG9va2luZyBhdCBzdWJzZXF1ZW50IHBhdGNoZXMs
IHRoaXMgaXMgdG8KZ2V0IGFyb3VuZCB0aGUgZmFjdCB0aGF0ICJhbiBhcnJheSBvZiBhbiBpbnRl
cmZhY2UgdHlwZSAhPSBhbiBhcnJheSBvZgp0eXBlIHRoYXQgaW1wbGVtZW50cyB0aGF0IGludGVy
ZmFjZS4iIFNpbmNlIHRoaXMgaXMgYSBzbWFsbCBhcnJheSwgSSdtCmZpbmUgd2l0aCBleHBsaWNp
dGx5IHBhc3NpbmcgZWFjaCBlbGVtZW50IG9mIHRoZSBhcnJheSB0byBmbXQuU3ByaW50Zi4KCj4g
QWxzbywgSSBndWVzcyB0aGUgZm9ybWF0IHNob3VsZCBiZSAiJTAyeCIuCgpZZWFoLCB0aGFua3Mu
Cgo+IENvbnZlcnNlbHksIHNob3VsZG4ndCB0aGlzIGJlIGEgdmFsdWUgcmVjZWl2ZXIsIHNpbmNl
IHdlJ3JlIGRvbid0IHdhbnQKPiB0aGlzIGZ1bmN0aW9uIHRvIGNoYW5nZSB0aGUgY29udGVudHMg
b2YgbWFjPwoKQ29udmVudGlvbmFsbHkgcmVjZWl2ZXJzIGFyZSBrZXB0IGNvbnNpc3RlbnQgYmV0
d2VlbiBtZXRob2RzIG9mIGEKdHlwZSwgdW5sZXNzIGl0J3MgaW1wbGVtZW50aW5nIHNvbWUgaW50
ZXJmYWNlIGxpa2UgU3RyaW5nZXIuIEFuZCwgaXQncwpjb25zaXN0ZW50IHdpdGggdGhlIG90aGVy
IHRvQyBmdW5jdGlvbnMgd2hpY2ggYXJlIGRlZmluZWQgd2l0aApwb2ludGVycyBpbiB0aGUgZ2Vu
ZXJhdGVkIGZ1bmN0aW9ucyBzaW5jZSB0aGVyZSBhcmUgc29tZSBsYXJnZQpzdHJ1Y3RzLgoKQnV0
LCB5ZXMgdGhpcyBjb3VsZCBqdXN0IGJlIGEgdmFsdWUgcmVjZWl2ZXIuIEkgZG9uJ3QgaGF2ZSBh
IHN0cm9uZwpvcGluaW9uIHRvIGtlZXAgaXQgYXMgaXMsIHNvIEknbGwgY2hhbmdlIGl0LgoKLU5S
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
