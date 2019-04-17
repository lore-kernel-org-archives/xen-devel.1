Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 421C8C282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 17:55:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1118E2064B
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 17:55:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7XW5A7t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1118E2064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGomE-0003ux-Fs; Wed, 17 Apr 2019 17:55:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=d9Fk=ST=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hGomD-0003up-6P
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 17:55:17 +0000
X-Inumbo-ID: f4c09d54-6139-11e9-92d7-bc764e045a96
Received: from mail-it1-x141.google.com (unknown [2607:f8b0:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f4c09d54-6139-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 17:55:16 +0000 (UTC)
Received: by mail-it1-x141.google.com with SMTP id f22so5832076ita.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2019 10:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=jpc6sQPIkqGvfr0ZoUsvIhC3BUD+WNtujH4uh7KS7yg=;
 b=L7XW5A7t8YXIUuif/2PajkpxGOvypJY/P7Sjv7KsEtdMd6VdzgF9aDBaTGhdEawJNd
 6tIW9UCsvr7j7BunKAr2zGT1oxhWOmqWSKLCbE2k5VSCLTmhKwyrKmaVITECQUYbz4VM
 6xP9h+wAuc4dH2b9jHmOkV0Z1BJ7VcD56aka9hb/LK+x2QE8eaylIPZELaKb/+JP24XV
 I9c8hhqhO5Ev0yIB8SMkFw/0q6Tfsj0DVs71sUtsQjEAgXo11HTY+o21KqCuUOUw70pO
 dr0MYvxCLlWkDU7ab9AiANCTQw6AaRrbmEzlDFR0JgB6OJ6RahWBdiAse5AGBe5sxKTy
 eqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=jpc6sQPIkqGvfr0ZoUsvIhC3BUD+WNtujH4uh7KS7yg=;
 b=X6UVvHKHWTnv06r4+Sl2R5v1Gx1A6ehoMjyAypCdQkN7qyBgYrO7UY01ntrBOotfAn
 Nz+EmIpIE73LUPxMfcPFgsIjhbfTMQAtZpjedCADrjZCCelVnv3h2pqZEEHaVU6j97uQ
 mq86FVJUjST2blq31deoMSbbeq+L3WEYKnUg2YgzToTA8Z6nZ33agW+qDx7zvPWNmopc
 8YgVkMYav7Y8GqKMsOUI7dcTVMUAMV6/YboET7hNCILou8Q6gb3XTepnpX591fzJjF/m
 2E593rVSA9kLm4OWHdQ/59vNvYrRjwJ5XYIOmXgl4Bnl7RsXue+9Nk+EZT9qKexg4b+e
 s7mA==
X-Gm-Message-State: APjAAAV6B6NIehiWMdemxMCAADiVW9WmgJ3D6VsnX6D7fI+K1Q9GYmXy
 cK7QOLvj+0JpocX8lJQ22+w=
X-Google-Smtp-Source: APXvYqwalwu2uvbAUqI0m8XjLC+ykfqEWytZ8HZwRz8NSE1DBQlSKDAZzbK4K7AuIEVX9q85Lj5cvA==
X-Received: by 2002:a02:924d:: with SMTP id y13mr59114693jag.24.1555523715602; 
 Wed, 17 Apr 2019 10:55:15 -0700 (PDT)
Received: from [100.64.72.83] ([173.245.215.245])
 by smtp.gmail.com with ESMTPSA id c25sm19474708ioa.75.2019.04.17.10.55.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Apr 2019 10:55:14 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16E227)
In-Reply-To: <CABZSBQebNYDTSGZTMNJv6C2qvcNkW=MDMbbB2_1aUu37840yzQ@mail.gmail.com>
Date: Wed, 17 Apr 2019 13:55:14 -0400
Message-Id: <0524144E-4C73-49F6-A753-2D4797367E28@gmail.com>
References: <1554406611-11262-1-git-send-email-cjp256@gmail.com>
 <CABZSBQebNYDTSGZTMNJv6C2qvcNkW=MDMbbB2_1aUu37840yzQ@mail.gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Subject: Re: [Xen-devel] [PATCH 1/2] libxl: Add virtio vga interface support
 for qemu
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
Cc: xen-devel@lists.xenproject.org, Chris Patterson <pattersonc@ainfosec.com>,
 Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417175514.BurV0BF2fwVHghAJlsgAdVR7TVD0J6FhjNTXbGOPTNg@z>

PiBPbiBBcHIgMTAsIDIwMTksIGF0IDIwOjAyLCBDaHJpcyBQYXR0ZXJzb24gPGNqcDI1NkBnbWFp
bC5jb20+IHdyb3RlOgo+IAo+IEZvciBhbnlvbmUgbG9va2luZyBhdCB0aGlzLi4uIHdoaWxlIEkg
aGF2ZSB0ZXN0ZWQgYW5kIHZlcmlmaWVkIHRoYXQKPiBib3RoIHZpcnRpby1ncHUgYW5kIFZpckdM
IHdvcmssIGl0J3Mgbm90IHdpdGhvdXQgc29tZSBoaWNjdXAuCj4gCj4gSSBoYXZlIGJlZW4gcnVu
bmluZyBVYnVudHUgMTkuMDQgd2l0aCB0aGlzIGNvbmZpZyBmb3IgYSBmZXcgZGF5cyBhbmQgSQo+
IGhhdmUgaGFkIGEgY291cGxlIFZNIGZyZWV6ZXMuICd4bCBkbWVzZycgaXMgc3BhbW1pbmcgdGhl
IGZvbGxvd2luZwo+IHJlcGVhdGVkbHk6Cj4gKFhFTikgaXJxLmM6MjQ3OTogZG9tMzogcGlycSAx
NDMgb3IgZW11aXJxIC0zIGFscmVhZHkgbWFwcGVkCj4gCj4gU2VlbXMgdG8gYmUgcmVsYXRlZCB0
byBNU0ktWCBmb3IgdGhlIGRldmljZSwgYnV0IEkgaGF2ZW4ndCB5ZXQgaGFkIGEKPiBjaGFuY2Ug
dG8gZGlnIGludG8gaXQuICBNYXliZSBzb21lb25lIGtub3dzIGlmIHRoaXMgaXMgdG8gYmUgZXhw
ZWN0ZWQKPiBnaXZlbiB0aGUgc3RhdGUgb2YgdGhpbmdzPyA6KQoKQWRkaW5nIFBhdWwgRHVycmFu
dCAodkdQVS9ncmFwaGljcykgdG8gdGhlIHRocmVhZC4KClJpY2gKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
