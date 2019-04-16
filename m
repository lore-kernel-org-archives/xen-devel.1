Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BF9C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 13:32:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CDFD20870
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 13:32:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMfXJ35P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CDFD20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGOBo-0008UE-QJ; Tue, 16 Apr 2019 13:31:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WqAW=SS=gmail.com=kevin.buckley.ecs.vuw.ac.nz@srs-us1.protection.inumbo.net>)
 id 1hGOBn-0008U9-Dw
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 13:31:55 +0000
X-Inumbo-ID: ff2c5694-604b-11e9-92d7-bc764e045a96
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ff2c5694-604b-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 13:31:53 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id y197so13681886wmd.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2019 06:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LFFVWNpbfbkl/7OdVHS4GjZDGLlySjeP4I7vOVQrE4E=;
 b=CMfXJ35Pe0dadJhZNwoUjlljvXtx/KH2QXNktxpHlNjYPHgyyPHp+zomagz6+RNXHJ
 u6cQbHkMf8RdxrHdilYdTky1IWHCxgA8gaGHIJ+dAY7+L9jqzk2m5Dak40VjOuEcYMGP
 NA4ODw+JRXsstg9ko8Lemw73OzmPIF2G8fHUyhn5IygmfgU192hE0KKtLd9EW2Q3na4u
 2juxbroUBZi6oQj60886dy8f/c9LyCp2NBEZOTW+tHh4D33RnKbZjRCW8fmW4nQ0GjPm
 PVqIZlzD65nqQ2b5eZsvrA5uX/1MXyydWq6c1+OQbxb6qq2BNWDVl3cmjnEpUGnBT1tq
 of5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LFFVWNpbfbkl/7OdVHS4GjZDGLlySjeP4I7vOVQrE4E=;
 b=jp8uzZXty7Hk726FCDkW7Ris8eN/ewXHWn969ZS2JbA5nMPNJ3fDLFOAW0mhc2JRT8
 djRZJgy9mGp1Vq5j8oKbQi04JsIkcBtlhxiUuqr2eUEi9tKX5uCA1TWRl9CpM7QjCtW3
 8WitowS4oRQmx+YmMRexOx1/oi4dedlWGNanniNF1I7xDssaDtddfBKnlCLlsaQN9wIF
 UIIL6w//Gv05zETwGPHKvmoYSAJvGC6m048rq3oGQlCgbyrlJNVDdUtfsG2BHmYaDcCI
 QF7mg2lVGUwM4ttDqN82glbGrKH3bm8RZpQtSJUMpUQYvczJVg2kfmY+6z9fAoljK4qs
 ek7w==
X-Gm-Message-State: APjAAAUIwMNK4tpcs7DmTCMkXDksQ+1YC67L3sFWaR419XK+FN3NiMO2
 r1ByP1Rd2Ai7qB/W3Od04DBEMc6yOYQTChSOaAQ=
X-Google-Smtp-Source: APXvYqzo41daM4hjdBO7vQ5zBNF8B+RHviy+ydZbrIv0x69EdhpJzones58jOtePmWdQYtjk7oWf8qcrjcBbahvBdeM=
X-Received: by 2002:a05:600c:28b:: with SMTP id
 11mr3085525wmk.129.1555421512782; 
 Tue, 16 Apr 2019 06:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <CABwOO=dhCrnZpRNpLr7rDrNdSh9GCH=fqq_50+YScWT4BE-xjQ@mail.gmail.com>
 <20190411102843.GE30543@zion.uk.xensource.com>
 <CABwOO=cOxxk7sbscGRzZ1LuiH8JJnCoBJ2d19ZmaSeu5DBi6iw@mail.gmail.com>
 <20190415092358.GM30543@zion.uk.xensource.com>
 <20190415093632.GN30543@zion.uk.xensource.com>
In-Reply-To: <20190415093632.GN30543@zion.uk.xensource.com>
From: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Date: Tue, 16 Apr 2019 21:31:41 +0800
Message-ID:
 <CABwOO=cyX0PcuvbfYu1ZyN384604sT2HPAoJR+cknFqWH-e7PQ@mail.gmail.com>
To: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [Xen-devel] Xen commit 9b0bc91b3 possibly removed too much info
 from README
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416133141.O5tvrRmpc39A-FSFIOdhTpfbeX_N3vz_QBzdcVt8xZ4@z>

PiBPaCB3YWl0LCBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGFueXRoaW5nIHRvIGZpeCB0aGVyZS4g
VGhvc2Ugc2VudGVuY2VzCj4gbG9vayByZXBldGl0aXZlIGJ1dCB0aGV5IGRvIHNheSBkaWZmZXJl
bnQgdGhpbmdzOiBpbiB0b29scyBjYXNlLCBpdCBzYXlzCj4gInJlcG9zIHdpbGwgYmUgY2xvbmVk
IjsgaW4gc3R1YmRvbSBjYXNlLCBpdCBzYXlzICJleHRlcm5hbCBwYWNrYWdlcwo+IHdpbGwgYmUg
ZG93bmxvYWRlZC4gU28gdGhleSBkbyByZWZsZWN0IGNvcnJlY3RseSB3aGF0IHdpbGwgaGFwcGVu
Lgo+CgpMZXQgbWUgbmFycm93IHRoaW5ncyBkb3duIGEgYml0IGZ1cnRoZXIgdG8gaGlnaGxpZ2h0
IHRoZSBkdXBsaWNhdGlvbgoKLS0tLTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0t
LS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tLS0KRHVyaW5nIHRvb2xzIGJ1
aWxkIGV4dGVybmFsIHJlcG9zIHdpbGwgYmUgY2xvbmVkIGludG8gdGhlIHNvdXJjZSB0cmVlLiAg
ICA8PT09IDEKVGhpcyB2YXJpYWJsZSBjYW4gYmUgdXNlZCB0byBwb2ludCB0byBhIGRpZmZlcmVu
dCBnaXQgYmluYXJ5IHRvIGJlIHVzZWQuCkdJVD0KCkR1cmluZyB0b29scyBidWlsZCBleHRlcm5h
bCByZXBvcyB3aWxsIGJlIGNsb25lZCBpbnRvIHRoZSBzb3VyY2UgdHJlZS4gICAgPD09PSAyCkR1
cmluZyBzdHViZG9tIGJ1aWxkIGV4dGVybmFsIHBhY2thZ2VzIHdpbGwgYmUgZG93bmxvYWRlZCBp
bnRvIHRoZQpzb3VyY2UgdHJlZS4gVGhlc2UgdmFyaWFibGVzIGNhbiBiZSB1c2VkIHRvIHBvaW50
IHRvIGEgZGlmZmVyZW50CmxvY2F0aW9ucy4KIFhFTl9FWFRGSUxFU19VUkw9Ck9WTUZfVVBTVFJF
QU1fVVJMPQotLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0t
LS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLQoKSG9wZSB0aGF0J3MgY2xlYXJlciA/Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
