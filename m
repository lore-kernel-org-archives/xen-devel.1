Return-Path: <SRS0=0XGa=2T=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAA6C2D0C0
	for <xen-devel@archiver.kernel.org>; Sun, 29 Dec 2019 23:57:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3428D20748
	for <xen-devel@archiver.kernel.org>; Sun, 29 Dec 2019 23:57:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJF9EXQ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3428D20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iliR0-0000RC-6X; Sun, 29 Dec 2019 23:57:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SRMX=2T=gmail.com=pryorm09@srs-us1.protection.inumbo.net>)
 id 1iliQz-0000R7-2A
 for xen-devel@lists.xen.org; Sun, 29 Dec 2019 23:57:21 +0000
X-Inumbo-ID: f31d8eb8-2a96-11ea-88e7-bc764e2007e4
Received: from mail-il1-x12e.google.com (unknown [2607:f8b0:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f31d8eb8-2a96-11ea-88e7-bc764e2007e4;
 Sun, 29 Dec 2019 23:57:20 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id b15so26668373iln.3
 for <xen-devel@lists.xen.org>; Sun, 29 Dec 2019 15:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=cSLLDGrw5Cz4nqHMwCSkQkw3YK69wWMr4+MWGjTG2Dk=;
 b=OJF9EXQ/GEHSF7gr+yrBp0VNZAPeQnVdTTFZ63P9SGK/aGgc6UvR+44c0hWQrcl8Dx
 miOx6loopLSzLdjCDP2whhIeI0rBV65taIkH9rUvngHII/XqCyPCbMigD9mXjpNvzIiW
 iBDlGuFKAsF5YpXSNqenckzvRUieJWXPdnrv58pB5t6j1hrKMSerxFI8b4iqNksuM29C
 K8SFeZUzCjldzMh6Fg3gj0xB1uZk98OU2tp+iU5FPMrHmnyDowOnxnsN/GyG7YwC+oXK
 uHSuE84KgEYeC0HdWSjefXXwCjwdqJSnid2qaD2HLPI1LaXmv7eQigE41Lkmt6aELMTl
 tSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=cSLLDGrw5Cz4nqHMwCSkQkw3YK69wWMr4+MWGjTG2Dk=;
 b=lCI5a335iWrOd+AfKwVWpVsvJa6fXCLkG9Bdcbazh/kdYVKYbx45qXlU/BOigPesSI
 m6pPe1YAzJlBQM+XLGnWRRWM1nJyzHxBmxqir1jFaGivO5OjqHpy4uPj75keKWKpnvkA
 rdlIQfeXrgRPUxZdiaGCB+iDPeJFWtem5Pog42NP/FLjen8hxQMyvh47LV00HXAta8n7
 VRKsvG9Z07g8H3Rj+AsKHwrldn/JhkrqbpVwswGKS51cL5CRSJiV990DDqyapwaagwOu
 umybbvjbJFQZVRkHvMCu1ahv0XqgPUkKiEGEwEHcuU71B0cJovSQYSwPX3xfPLwq8Lcv
 Ym2A==
X-Gm-Message-State: APjAAAWoATYzp7suFS+3s2j35Ivvk37SkPhZvxXBC8uPw2CrAz0LRP5Q
 +7upAjFCGHYG6AREw3p/M4vEcwN4SV/Vl7SqosTbIw==
X-Google-Smtp-Source: APXvYqwlAJXJb/N/EAKGJWUEMpnUaOVLLJXRTrhvcv+VMP0H0xos0iG8GbfPQ9b6diNklCAGR5fasMl3PGMTU0Errec=
X-Received: by 2002:a92:15c1:: with SMTP id 62mr53945647ilv.216.1577663839583; 
 Sun, 29 Dec 2019 15:57:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a02:cf8b:0:0:0:0:0 with HTTP; Sun, 29 Dec 2019 15:57:18
 -0800 (PST)
From: Pry Mar <pryorm09@gmail.com>
Date: Sun, 29 Dec 2019 15:57:18 -0800
Message-ID: <CAHnBbQ8a3Wc1Hd0ONkR3Jtczans2-7cp7b_GyF80XSzF2J6nUw@mail.gmail.com>
To: xen-devel <xen-devel@lists.xen.org>
Subject: [Xen-devel] [BUG] recent hypervisor in recent ubuntu (19.10+)
 resets host and legacy boot never starts, EFI works
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
Cc: Stefan Bader <stefan.bader@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

aGVsbG8sCgpSZWZlcmVuY2luZyB0aGlzIHJlcG9ydCBhZ2FpbnN0IGtlcm5lbC01LjMgYW5kIHhl
bi00LjkuMjoKaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvdWJ1bnR1Lytzb3VyY2UveGVuLyti
dWcvMTg1MTA5MQoKSSBzZWUgdGhlIHNhbWUgYmVoYXZpb3Igd2l0aCB0aGUgaHlwZXJ2aXNvciBm
cm9tIHhlbi00LjEyLnggYW5kIHhlbi00LjEzLjAuClVzaW5nIGxlZ2FjeSBiaW9zLCBib290IG5l
dmVyIHN0YXJ0cyBhbmQgaG9zdCByZXNldHMuCgpBZGRpbmcgbW9yZToKSWYgSSBjb3B5IGludG8g
Rm9jYWwgL2Jvb3QgdGhlIGh5cGVydmlzb3IgYnVpbHQgaW4gQnVzdGVyIG9yIHViMTkuMDQsCnVz
aW5nIHRoZSBzYW1lIGQvcnVsZXMqLCBldmVyeXRoaW5nIHdvcmtzLgoKSSd2ZSBidWlsdCB0aGUg
eGVuIGh5cGVydmlzb3Igd2l0aCBnY2M4IG9yIGdjYzksIHdpdGggb3Igd2l0aG91dCBQSUUsCmFu
ZCBiZWhhdmlvciBpcyB0aGUgc2FtZS4KCkhvd2V2ZXIsIEkndmUgbm90aWNlZCB0aGF0IGFsbCBo
eXBlcnZpc29ycyBoYXZlIDMgTFo0IGJsb2JzLiBUaGUgMgp3b3JraW5nIHZlcnNpb25zIGhhdmUg
dGhlIHNhbWUgZmlyc3QgYmxvYiBzaXplIGF0ICgwRiA4NSA1QiAwMSksCnNsaWdodGx5IHNtYWxs
ZXIgdGhhbiB0aGUgRm9jYWwgYmxvYiBzaXplICgwRiA4NSA1QyAwMSkuCgpJIGNvdW50IEx6NCBi
bG9icyBsb29raW5nIGZvciAoIDAyIDIxIDRDIDE4KS4KCkkgY2Fubm90IHRlc3QgYW4gRUZJIGJv
b3QsIGJ1dCB0aGUgbGF1bmNocGFkIHJlcG9ydCBzYXlzIEVGSSB3b3JrcyBpbiB1YjE5LjEwLgoK
Y2hlZXJzLApQcnlNYXI1NgojI3hlbi1wYWNrYWdpbmcgb24gRnJlZW5vZGUgSVJDCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
