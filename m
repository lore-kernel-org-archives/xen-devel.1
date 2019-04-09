Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E3FC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 09:18:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C994220833
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 09:18:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eePaY2AF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C994220833
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDmtQ-0004Fr-P6; Tue, 09 Apr 2019 09:18:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PY99=SL=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1hDmtP-0004Fl-0D
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 09:18:11 +0000
X-Inumbo-ID: 63b7b244-5aa8-11e9-92d7-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 63b7b244-5aa8-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 09:18:09 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f23so13837745ljc.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2019 02:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=g9xvehuoZCs8mO8Frm3eeGdFaSiWTWH0MwvbkGHp+qQ=;
 b=eePaY2AFKERTrz+0Z9UUYVfY1YvbBugUFgcCFIceN5pP1Pt/bNuectb7h0OnDV3mpv
 po1M8HNFYGmo4caz6w/jZODm0a6ZQ5yO8djx99UiXkE2SckFpR5IS3gCtOO/Y0VhQhPL
 pXPiV5WxJZBBa1nX3wQd5rWyWY33ILpfpAJXhxVx+9x7byXZo9woqHoCCMgmAZsNpkLd
 9jYyyjU+FKhMrqwaZFqK8Rm98PC5WSiFblZVp4kMS92r/PWDnreG1jUZ7i2SoZEUpYFy
 /N++bVho4zdTfdGA3SSXKhS7owJNEyd7WIDwEbaDqRrmfs+FKD0BQHy0fQl7e4wr3Mwt
 7OaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=g9xvehuoZCs8mO8Frm3eeGdFaSiWTWH0MwvbkGHp+qQ=;
 b=OuoMxg2GKgGd+lD9XtArYBlvRUOxhBvj0G/FK4AWdvXc9h1J5bkevrbTii1wxe6iI4
 qa50jR5bETcb9xx0UxJfcvv/aJZno7NqzGKUndZ9htN0t8TW3eX5chpTx+kweZA6vLbt
 e8Lex+l+q+n2hfuU3CjYlwqv4n8srAZJTXWfy1ms2ftUtMoXuyuCz+Ue7XGpppipU0bR
 ulgWmzH6fkZ4SBPz3Hl8G6o/6h/0z4DVfwRvweGU19Cqc8HCQhMldrfhfAp2QVXZdZK7
 LqLMkqoGcfYOaY7U4qBV+zjxo7ZGfog+hzrOzU0NDo4GVXEn0GSD7uCjuuStvUTXSnyZ
 pa9g==
X-Gm-Message-State: APjAAAVnDBzMOXxqhBKaOtBvs9PC90e8rUikU9pzsIsx0mFy3x2FTL6s
 AZog4xuOrIkVFx37dPHav1c=
X-Google-Smtp-Source: APXvYqz5Fg+UtkdndRx+Y6d1eStsEc2weg8foTKgYd4dL9gCMUxhQ7lHn6Gr1b58EdsfhspTedov6g==
X-Received: by 2002:a2e:8991:: with SMTP id c17mr18645661lji.83.1554801488021; 
 Tue, 09 Apr 2019 02:18:08 -0700 (PDT)
Received: from [10.17.182.20] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 y17sm7357604ljd.54.2019.04.09.02.18.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Apr 2019 02:18:07 -0700 (PDT)
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, konrad.wilk@oracle.com, jgross@suse.com,
 hverkuil@xs4all.nl, boris.ostrovsky@oracle.com
References: <20190409091546.9606-1-andr2000@gmail.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <fc116cfb-833e-e734-fcb4-4f93bd9371b4@gmail.com>
Date: Tue, 9 Apr 2019 12:18:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190409091546.9606-1-andr2000@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/cameraif: add ABI for para-virtual
 camera
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
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGlzIGlzIHRoZSBzeW5jIHVwIHdpdGggdGhlIGNhbWVyYSBwcm90b2NvbCBkZWZp
bml0aW9uIGluIFhlbgoKT24gNC85LzE5IDEyOjE1IFBNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToKPiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1
c2hjaGVua29AZXBhbS5jb20+Cj4KPiBUaGlzIGlzIHRoZSBBQkkgZm9yIHRoZSB0d28gaGFsdmVz
IG9mIGEgcGFyYS12aXJ0dWFsaXplZAo+IGNhbWVyYSBkcml2ZXIgd2hpY2ggZXh0ZW5kcyBYZW4n
cyByZWFjaCBtdWx0aW1lZGlhIGNhcGFiaWxpdGllcyBldmVuCj4gZnVydGhlciBlbmFibGluZyBp
dCBmb3IgdmlkZW8gY29uZmVyZW5jaW5nLCBJbi1WZWhpY2xlIEluZm90YWlubWVudCwKPiBoaWdo
IGRlZmluaXRpb24gbWFwcyBldGMuCj4KPiBUaGUgaW5pdGlhbCBnb2FsIGlzIHRvIHN1cHBvcnQg
bW9zdCBuZWVkZWQgZnVuY3Rpb25hbGl0eSB3aXRoIHRoZQo+IGZpbmFsIGlkZWEgdG8gbWFrZSBp
dCBwb3NzaWJsZSB0byBleHRlbmQgdGhlIHByb3RvY29sIGlmIG5lZWQgYmU6Cj4KPiAxLiBQcm92
aWRlIG1lYW5zIGZvciBiYXNlIHZpcnR1YWwgZGV2aWNlIGNvbmZpZ3VyYXRpb246Cj4gICAtIHBp
eGVsIGZvcm1hdHMKPiAgIC0gcmVzb2x1dGlvbnMKPiAgIC0gZnJhbWUgcmF0ZXMKPiAyLiBTdXBw
b3J0IGJhc2ljIGNhbWVyYSBjb250cm9sczoKPiAgIC0gY29udHJhc3QKPiAgIC0gYnJpZ2h0bmVz
cwo+ICAgLSBodWUKPiAgIC0gc2F0dXJhdGlvbgo+IDMuIFN1cHBvcnQgc3RyZWFtaW5nIGNvbnRy
b2wKPgo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJf
YW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgo+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+
Cj4gQ2M6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWxAeHM0YWxsLm5sPgo+IC0tLQo+ICAgaW5jbHVk
ZS94ZW4vaW50ZXJmYWNlL2lvL2NhbWVyYWlmLmggfCAxMzY1ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEzNjUgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGluY2x1ZGUveGVuL2ludGVyZmFjZS9pby9jYW1lcmFpZi5oCj4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
