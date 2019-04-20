Return-Path: <SRS0=/O7i=SW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30943C282DD
	for <xen-devel@archiver.kernel.org>; Sat, 20 Apr 2019 05:00:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8F072087F
	for <xen-devel@archiver.kernel.org>; Sat, 20 Apr 2019 05:00:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAK9ruHn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8F072087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHi6g-0004W1-50; Sat, 20 Apr 2019 05:00:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XtSH=SW=gmail.com=kevin.buckley.ecs.vuw.ac.nz@srs-us1.protection.inumbo.net>)
 id 1hHi6e-0004Jf-L3
 for xen-devel@lists.xenproject.org; Sat, 20 Apr 2019 05:00:04 +0000
X-Inumbo-ID: 270c5c20-6329-11e9-92d7-bc764e045a96
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 270c5c20-6329-11e9-92d7-bc764e045a96;
 Sat, 20 Apr 2019 05:00:02 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t17so8997491wrw.13
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2019 22:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=+rwuYNxVIs2nw0M37eq1Lobk9s9Z4pUFBCaF5oaxv+o=;
 b=SAK9ruHnhscnxh+5m5bNoOg4O/q0s9U6//DYwLFHgHVYJOcVnXeCE+SzBvcIN+govE
 WlhYL99o/MmS2cjsbwxbky4OZjbn0U/wO115WaMv1sacutPeOf+aqCaVuWRaXAzKkrjE
 4qRs/ue8kTmWmoDJr7HHPG83h9TqJj4B68qlWeLWc7YFDyQxXqile9ajmTb9eNPyMwka
 aFLyIXSClkMoCaa8pnIHpPkelHy95NS4AxJHMerLTy1o1CDd0I1DqEQqCFS7MCz1RoW+
 bl10Sx7t8VabbYciWVTOU4Bp5+u97wRzA+5cqj0UAXx1UFMnx9f4msSgThQwSR/SdGrc
 23Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=+rwuYNxVIs2nw0M37eq1Lobk9s9Z4pUFBCaF5oaxv+o=;
 b=ALzXnvAWM7byhRE1BODWT64eCxYdElj9CR3YYU3gnZqWDzY81zc0ozEftAQZZZT8kW
 7z++V0999C9dKhlmS+pcS5gaZEf2mJDeRF128z03MbDmmwPepr+0gWUOlpPS0uW8hYhM
 ETCrpyKLI/E4sNcD9MMB2zq2KI0jX4T/znfOGrSDJ9q0MXCClfgHtUybgzOXXCqdPPUA
 TqUKAJys1YGdRDQV/fV0GMT7trLHNzaxZHdxircGSJhW828Z/FQpEpeJrI8n34H/2fSn
 1/78dr4Z1ewCjDLX3q9uOlderjSrzqi5rLg7o8ax2THlCW62Pjiem8AvRby5vaXAzwT8
 Uy6w==
X-Gm-Message-State: APjAAAUMbPdfRlfnUlSMfSvPZrIbenjvu1OKbIPapZqNUjey3RzBLX0E
 KxuEBIB4QaJtC9OBGfmOijEqHfMfnUnJRX/a8Tw=
X-Google-Smtp-Source: APXvYqyBD+HopZ+7GI3Hd5+GWsMT4U5zXXOKkZpFSCTLL+QzGVQG7DlCV2AdcEs+KlbqOH6jz3AEDoMT/V6HVxzhql4=
X-Received: by 2002:adf:d848:: with SMTP id k8mr5814545wrl.185.1555736400814; 
 Fri, 19 Apr 2019 22:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190417105729.GS30543@zion.uk.xensource.com>
 <cda91b28-50c4-308a-30d8-6cecceb973c6@citrix.com>
 <20190417110356.GT30543@zion.uk.xensource.com>
 <a3576f49-eebc-6684-d043-b9511895cf1a@citrix.com>
 <20190417111635.GU30543@zion.uk.xensource.com>
 <7fe14ebe-987a-8b95-1d77-d6d40a473fa3@citrix.com>
 <20190417112645.GV30543@zion.uk.xensource.com>
 <1ff06c9a-8e81-7c00-9dab-26f3d4173714@suse.com>
 <3d698d86-c406-df10-ccb9-17d38988b0a8@citrix.com>
 <606a37f6-2158-14bf-8f49-79ea249b8f62@suse.com>
 <20190417145136.GZ30543@zion.uk.xensource.com>
 <CABwOO=fCBUWZMipjJdHFAgqjc95z6Btmk-ZFCWyGOSSmpY_EUQ@mail.gmail.com>
In-Reply-To: <CABwOO=fCBUWZMipjJdHFAgqjc95z6Btmk-ZFCWyGOSSmpY_EUQ@mail.gmail.com>
From: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Date: Sat, 20 Apr 2019 12:59:49 +0800
Message-ID:
 <CABwOO=ezRcn10LVcfKnWY4W34Om0-ebingkit+VXR1y8+ZUn4w@mail.gmail.com>
To: Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, 
 Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] Hypervisor build can't work without `python` (Was:
 Re: Xen commit 9b0bc91b3 possibly removed too much info from README)
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190420045949.FQVX3pNuhcbH0U5g_b2NZ09Zlop5fAlMOX6QqufSHSc@z>

T24gRnJpLCAxOSBBcHIgMjAxOSBhdCAxNDowNywgS2V2aW4gQnVja2xleQo8a2V2aW4uYnVja2xl
eS5lY3MudnV3LmFjLm56QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBJIGFtIGFjdHVhbGx5IHRoaW5r
aW5nIG9mIGluc3RhbGxpbmcgYSBQeXRob24gMiBhbmQgbWFraW5nIHRoZSBsaW5rIHRvCj4gdGhl
IGJhcmUgL3Vzci9iaW4vcHl0aG9uIHBvaW50IHRvIHRoYXQsIGp1c3QgdG8gc2VlIGlmIEkgY2Fu
IGdldCB0aGluZ3MKPiB0byBidWlsZC4KClNvIEkgZGlkIHRoYXQgYW5kIHRoZSBoeXBlcnZpc29y
LCB0b29scyBhbmQgZG9jcyB3ZXJlIGFsbCBidWlsdAphbmQgaW5zdGFsbGVkIGFzIGV4cGVjdGVk
LgoKSSBoYXZlIHNpbmNlIGdvbmUgYmFjaywgcmVtb3ZlZCBhbGwgdHJhY2VzIG9mIFB5dGhpbiAy
IGFuZApwZXJmb3JtZWQgdGhlIHNhbWUgYnVpbGQgYnV0IGFnYWluc3QgUHl0aG9uIDMsIGFzIGZv
bGxvd3MKdGhvdWdoIHJlY2FsbCB0aGF0IEkgYW0gYnVpbGRpbmcgdGhpcyBpbiBhIGZhaXJseSBi
YXNpYyBMRlMKc3lzdGVtIGFuZCBzbyBkb24ndCBoYXZlIEdpdCwgbm9yIGNvbm5lY3RpdnR5IHRv
IHRoZQpRRU1VIEdpdCByZXBvc2l0b3J5LgoKCk1pbWljIHRoZSBjbG9uaW5nIG9mIHRoZSBRRU1V
IEdpdCByZXBvIGV4dGVybmFsIHRvIHRoZQpMRlMgc3lzdGVtIGFuZCBjcmVhdGUgYSB0YXItYmFs
bCBmb3IgdXNlIGluc2lkZSBMRlMgdXNpbmcKdGhlIHNjcmlwdCBmcm9tIHRoZSBYZW4gdGFyLWJh
bGwuCgoKR0lUPWdpdCBzY3JpcHRzL2dpdC1jaGVja291dC5zaCBnaXQ6Ly94ZW5iaXRzLnhlbi5v
cmcvcWVtdS14ZW4uZ2l0Cm1hc3RlciBxZW11LXhlbi1kaXIKY2QgcWVtdS14ZW4tZGlyLXJlbW90
ZS8KCmdpdCBzdWJtb2R1bGUgaW5pdAoKZ2l0IHN1Ym1vZHVsZSB1cGRhdGUgZHRjCmdpdCBzdWJt
b2R1bGUgdXBkYXRlIGNhcHN0b25lLwpnaXQgc3VibW9kdWxlIHVwZGF0ZSB1aS9rZXljb2RlbWFw
ZGIKCmNkIC4uCgp0YXIgY2YgcWVtdS14ZW4tZGlyLWRlNWI2NzhjYS1zdWIudGFyIHFlbXUteGVu
LWRpci1yZW1vdGUKYnppcDIgLTkgcWVtdS14ZW4tZGlyLWRlNWI2NzhjYS1zdWIudGFyCgoKT25j
ZSBpbnNpZGUgdGhlIExGUyBzeXN0ZW0KCgp0YXIgeGYgJFhUUkFTUkMveGVuLWNiNzBhMjYudGFy
LmJ6Mgp0YXIgeGYgJFhUUkFTUkMvcWVtdS14ZW4tZGlyLWRlNWI2NzhjYS1zdWIudGFyLmJ6Mgpj
ZCB4ZW4tbWFzdGVyCgpBcyB3ZWxsIGFzIHByb3ZpZGluZyBhIGJhcmUgInB5dGhvbiIgc28gdGhh
dCBzY3JpcHRzIHdpdGhpbgp0aGUgc291cmNlcyB0aGF0IGhhdmUgc3VjaCBhIGhhc2gtYmFuZywg
SSBmb3VuZCB0aGF0IEkgYWxzbwpoYWQgdG8gb3ZlcnJpZGUgdGhpbmdzIGZvciB0aGUgY29uZmln
dXJlIHRvIGNvbXBsZXRlOgoKbG4gLXMgcHl0aG9uMyAvdXNyL2Jpbi9weXRob24KClBZVEhPTj0v
dXNyL2Jpbi9weXRob24zIFwKICAuL2NvbmZpZ3VyZSAtLXByZWZpeD0vdXNyICAgIFwKICAtLWRp
c2FibGUtc2VhYmlvcyAgICAgICAgICBcCiAgLS1kaXNhYmxlLXFlbXUtdHJhZGl0aW9uYWwgXAog
IC0tZGlzYWJsZS1yb21iaW9zICAgICAgICAgIFwKICAtLWRpc2FibGUtc3R1YmRvbSAyPiYxIHwg
dGVlIC4uL2NvbmZpZy5sb2cKCgpJc3N1aW5nIGEgIm1ha2Ugd29ybGQiIGhlcmUgY2xvYmJlcnMg
Zm91ciBkaXJlY3RvcmllcwoKIGRvYy9tYW5bMSw1LDcsOH0KCmluIHRoZSAibWFrZSBjbGVhbiIg
dGhhdCBkb24ndCBhcHBlYXIgdG8gYmUgcmUtY3JlYXRlZApkdXJpbmcgdGhlICJtYWtlIGRpc3Qi
LCBzbyB0aG9zZSB0d28gbWFrZXMiIHdlcmUgZG9uZQpzcGVyYXRlbHkgc28gYXMgdG8gcHJvdmlk
ZSBhbiBvcHBvcnR1bml0eSB0byByZS1jcmVhdGUKdGhvc2UgZGlyZWN0b3JpZXMKCk5vdGUgYWxz
byB0aGF0IG9uIGFuIExGUyBzeXN0ZW0sIHdoaWNoIGlzIDY0LWJpdCBieSBkZWZhdWx0LAp0aGVy
ZSBpcyBubyAvdXNyL2xpYjY0LCBhIHN1YmRpciBvZiB3aGljaCB3b3VsZCBiZSB0aGUgZGVmYXVs
dAp0YXJnZXQgZm9yIFhlbidzIEVGSV9ESVIgdmFyaWFibGUuCgoKbWFrZSBjbGVhbgoKbWtkaXIg
ZG9jcy9tYW4xIGRvY3MvbWFuNSBkb2NzL21hbjcgZG9jcy9tYW44CgptYWtlIFwKICBQWVRIT049
L3Vzci9iaW4vcHl0aG9uMyBcCiAgRUZJX0RJUj0vdXNyL2xpYi9lZmkgXAogIFFFTVVfVVBTVFJF
QU1fTE9DPS91c3Ivc3JjL3hlbi9xZW11LXhlbi1kaXItcmVtb3RlIFwKICAgIGRpc3QgICAgMj4m
MSB8IHRlZSAuLi9tYWtlLWRpc3QubG9nCgptYWtlIFwKICBQWVRIT049L3Vzci9iaW4vcHl0aG9u
MyBcCiAgRUZJX0RJUj0vdXNyL2xpYi9lZmkgXAogIFFFTVVfVVBTVFJFQU1fTE9DPS91c3Ivc3Jj
L3hlbi9xZW11LXhlbi1kaXItcmVtb3RlIFwKICAgIGluc3RhbGwgMj4mMSB8IHRlZSAuLi9tYWtl
LWluc3RhbGwubG9nCgoKVGhpcyBhcHBlYXJzIHRvIGJ1aWxkIGFuZCBpbnN0YWxsIHRoZSBYZW4g
aHlwZXJ2aXNvciBhbmQKdGhlIHRvb2xzIGFuZCBkb2NzIGFzIGV4cGVjdGVkLgoKSSBoYXZlIG5v
dGljZWQgdGhhdCBpbnN0YWxsZWQgZmlsZXMgc3VjaCBhcyBweWdydWIgZG8gaGF2ZQphIGhhc2gt
YmFuZyBsaW5lIHRoYXQgZXhwbGNpdGx5IHNwZWNpZmllcyAvdXNyL2Jpbi9weXRob24zLApzbyBp
dCB3b3VsZCBhcHBlYXIgdG8gaGF2ZSBkb25lIHRoZSByaWdodCB0aGluZyBhcyByZWdhcmRzCndo
YXQgaXQgZG9lcyB3aXRoIHRoZSB1c2VyJ3Mgb3ZlcnJpZGluZyBvZiAiUFlUSE9OIi4KCkhvcGUg
dGhhdCdzIG9mIHNvbWUgKG1vcmUpIHVzZSwKS2V2aW4KClBTCgpJJ2xsIGZsYWcgdXAgdGhlIGlu
dGVybmFsIGRvYyBkaXJlY3RvcnkgY2xvYmJlcmluZyBpbiBhIHNlcGVyYXRlCnRocmVhZC4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
