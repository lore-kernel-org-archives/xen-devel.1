Return-Path: <SRS0=QpcB=3I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B401C33CAF
	for <xen-devel@archiver.kernel.org>; Sun, 19 Jan 2020 19:25:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40ECE206B7
	for <xen-devel@archiver.kernel.org>; Sun, 19 Jan 2020 19:25:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jiqEeDco"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40ECE206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itGCT-00012o-Tz; Sun, 19 Jan 2020 19:25:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vxn9=3I=gmail.com=pryorm09@srs-us1.protection.inumbo.net>)
 id 1itGCS-00012j-46
 for xen-devel@lists.xen.org; Sun, 19 Jan 2020 19:25:32 +0000
X-Inumbo-ID: 74f0c8dc-3af1-11ea-9fd7-bc764e2007e4
Received: from mail-io1-xd33.google.com (unknown [2607:f8b0:4864:20::d33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74f0c8dc-3af1-11ea-9fd7-bc764e2007e4;
 Sun, 19 Jan 2020 19:25:31 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id i7so22972657ioo.5
 for <xen-devel@lists.xen.org>; Sun, 19 Jan 2020 11:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xSZtERXMBTJgDxFWOzFn6gbFwMRflUjBMRagdcNSl+o=;
 b=jiqEeDcowSF9jrdxY7ZkOl0V2fWaTMywZgio+kvwATJjycZnpEO8++Zyrvd6B+IyNY
 7xuyyR1c1SVAg0CeWHKSJiPql6aN8cPXwCzv1DZHG/qJ5z/0X6fEw05glgwLTcWKG6C7
 7g4JDV4G+hOciUi4ENaTVbzHA1U6VIc6ZB7jfMSX2RzVWFEB+gXSRIGgsZ5kGE3+GGze
 PcbMoMrO8GFA82d+9Tnz2PfvvLC8UGfldAhfjr0V39KxLLw8BRB8EmN6gsfbQa2eUxkV
 32Qw5vpcVwDFYBIevbXBSFd/ZLbo3ND4L41ey5o0w4aleF1hfKbP4BZrcC/Iu5GtPtmF
 ijlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xSZtERXMBTJgDxFWOzFn6gbFwMRflUjBMRagdcNSl+o=;
 b=lBgrFpkLEMyttw7V8YFcX0mdSv5USIqPrkhWMiXpSwG183a9STajhSHZIBUa5/luMl
 bU7SKTES6nm8NWS8wvFoDw5jAksCzCTRtOsHEWggsJeQsvJ2XS5FWti+hxoFpUbxbtMF
 p4RMYkyZWlhS3tIMo4br1HxEDZyfyTjlS92qsr+1JSgiVz0JhCKI++SlybxQrlDoCbtD
 /KMyhPvlIphDWn/MJHlijlrmdE3bcIRtoJiNK2pFTjAhn7zFozNwEv4VbL9GbXwhBg5t
 Py3xg8b2sQK1Q/Te4KXLCGu4mHd3F7d8G8xwWxqxWNM9RT126XDuEZsssCJbdvPDhBC9
 Srhw==
X-Gm-Message-State: APjAAAUriZ70ufu4gvfDlnTrcEqqpV1TNyl6i0K+RLNS+7w5HRT45aZ4
 AnqHJ/XuJuCwXeVdqvWOO1O5+cCsLnFO9/7ii6NkJQ==
X-Google-Smtp-Source: APXvYqxHMY0blmLN65LUCt4US/wYYdJNhoGbVfOX1zFw9Scd0goLisfNfqZQoDKO9v0erE7xf7yZx6LFJSRNvY4W43w=
X-Received: by 2002:a02:8525:: with SMTP id g34mr40053666jai.72.1579461930688; 
 Sun, 19 Jan 2020 11:25:30 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a02:cf8b:0:0:0:0:0 with HTTP; Sun, 19 Jan 2020 11:25:30
 -0800 (PST)
From: Pry Mar <pryorm09@gmail.com>
Date: Sun, 19 Jan 2020 11:25:30 -0800
Message-ID: <CAHnBbQ_Hyidiiyydk2_SUmAH6juWtEZKbNgcTe_euHO6raa2GQ@mail.gmail.com>
To: xen-devel <xen-devel@lists.xen.org>
Subject: Re: [Xen-devel] Xen Release 4.12.2 and Python 3: M4 python_devel
 module and mkheader.py issues
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

a2V2aW4sCgpodHRwOi8vcHJ5bWFyNTYub3JnL3hlbi9kZWJpYW4vYnVzdGVyLW5tdS80Y3gvc291
cmNlL3hlbl80LjEyLjItMStkZWIxMHUxLjIuZGViaWFuLnRhci54egoKZGViaWFuL3BhdGNoZXMv
bWlzYy0wMTExLXRvb2xzLXhlbm1vbi1tYWtlLXhlbm1vbi5weS1jb21wYXRpYmxlLXdpdGgtcHl0
aG9uLTItLmRpZmYKZGViaWFuL3BhdGNoZXMvbWlzYy0wMTEyLXhlbm1vbi1maXgtbWl4ZWQtdGFi
cy1hbmQtc3BhY2VzLmRpZmYKZGViaWFuL3BhdGNoZXMvbWlzYy0wMTEzLXRvb2xzLXB5dGhvbi1Q
eXRob24tMy1jb21wYXRpYmlsaXR5LmRpZmYKZGViaWFuL3BhdGNoZXMveGVuLWZsYXNrLUZpeC1Q
eXRob24zLXByb2JsZW1zLXdpdGgtZ2VuLXBvbGljeS1weS5kaWZmCmRlYmlhbi9wYXRjaGVzL3hl
bi5weXRob24zLXB0MC5wYXRjaApkZWJpYW4vcGF0Y2hlcy94ZW4ucHl0aG9uMy1wdDFhLnBhdGNo
CmRlYmlhbi9wYXRjaGVzL3hlbi5weXRob24zLXB0MWIucGF0Y2gKZGViaWFuL3BhdGNoZXMveGVu
LnB5dGhvbjMtcHQyLnBhdGNoCmRlYmlhbi9wYXRjaGVzL3hlbi5weXRob24zLXB0My5wYXRjaAoK
T25seSB4ZW4tNC4xMyBoYXMgYmVlbiBwYXRjaGVkIGZvciBweXRob24zIHN1cHBvcnQuIFRvIGdl
dCB4ZW4tNC4xMiB0bwp3b3JrIHdpdGggcHl0aG9uMyBJIHVzZSB0aGUgOSBwYXRjaGVzIGFib3Zl
LiBUaGV5IGFyZSBwYXN0ZWQgZnJvbSB0aGUKRGViaWFuIGRlbHRhIHVzZWQgdG8gYnVpbGQgaW4g
QnVzdGVyLgoKT25jZSB0aGVzZSBwYXRjaGVzIGFyZSBhcHBsaWVkIHRoZSBidWlsZGluZm8gaGFz
IG5vdGhpbmcgZm9yIHB5dGhvbjIsCm9ubHkgcHl0aG9uMy4KCmNoZWVycywKUHJ5TWFyNTYKIyN4
ZW4tcGFja2FnaW5nIG9uIEZyZWVub2RlIElSQwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
