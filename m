Return-Path: <SRS0=3Sku=TR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4A5C46460
	for <xen-devel@archiver.kernel.org>; Fri, 17 May 2019 04:40:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEC1E20873
	for <xen-devel@archiver.kernel.org>; Fri, 17 May 2019 04:40:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTo6H5UA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEC1E20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRUfS-0007p1-Hl; Fri, 17 May 2019 04:40:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pg8o=TQ=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1hRM0z-00078P-Oy
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 19:26:05 +0000
X-Inumbo-ID: 71d7ce3c-7810-11e9-8980-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 71d7ce3c-7810-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 19:26:04 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id h13so3522539lfc.7
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 12:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9TGXQVKtfs766xpBjEpSKg44EdjLg7VANuhK5XtoyHs=;
 b=MTo6H5UAQT6V5lo6/jIqRIwrv1pV4cIMOjeDiVECvbzwaovhqtHrpsEWiDC9X2fXbK
 Bsy7i6rb8vR7EZTvhtz2hXfec8TsFhSHwFRjhSfsXZPBwANdO6XzcxSJfDbl/UKtH/1L
 od55vm2rn1S9nuwV2tQSS8AYmpNgtJwtyVNeAnHvECQ9dTOm/SUPGkHxDL3R5yrWE41j
 GItS00LD7LgeDRON0CFItyoDUb4/uL+/qKewrkcAQrjBWMJ+Ibzay905uPI/0Y7oeHaY
 nfDRoZAJrbIQgAlDcB4Jg5jo3zjgAM4E2xEIzaX77t1PLk4saVGIQEQtuDPeAOjiWbb7
 RXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9TGXQVKtfs766xpBjEpSKg44EdjLg7VANuhK5XtoyHs=;
 b=F+jHtyDJulpAtL3Rqe+KNLJUBE0lxmcDoChH3ksyDhIu7rf2PsOqGPLZ3OpvInVl5Z
 XqrnH2X5+Fb4Ivvyrf1ZxpndWblYKOUYniWVIc6zzXnF8QqfOTmQtm1Pqi3epo9zjMbf
 iHkdBAg6IG9FHaBXBTB1aMrI70vX5LOy4nzNedoI1gBlggCK9YFs434AHgay/KlK0aR8
 RAgmS/VO7i5aTRlZnveqLQ2ReNEaKNSggoSZ1FzwiyhifqkbdRIDzbFeJgSDqGLtT/26
 tnqL+bCO9IdCefairzC0yV2d5BdLTARLUPLi6DQy5N4UUuLH34loepR5FoblQFGuXZuE
 QnIA==
X-Gm-Message-State: APjAAAVCQ8y/qCt18/FGximnymCybgUZpsTGh4l0T+yGfSIKt4rrNmKV
 J9MVZzH+K5FLQ8Z9BMhq1T2/O7wFbUCaOw+Cos8=
X-Google-Smtp-Source: APXvYqys0Ylj371r544wsDyTAAGZfz3RtxoUa2hiXO8nZVngdAprdgJPakaRbbcjqigb/AZY192vlOcnnsgr5iqNxcE=
X-Received: by 2002:a05:6512:309:: with SMTP id
 t9mr24681949lfp.103.1558034763170; 
 Thu, 16 May 2019 12:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <5CDD3BF2020000780022F8AD@prv1-mh.provo.novell.com>
In-Reply-To: <5CDD3BF2020000780022F8AD@prv1-mh.provo.novell.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 May 2019 12:25:36 -0700
Message-ID:
 <CAKmqyKNs8U4o9PJUF6pLMLrRMs4=f8OwDV1a=2fyatMqzdnbfA@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
X-Mailman-Approved-At: Fri, 17 May 2019 04:40:25 +0000
Subject: Re: [Xen-devel] [PATCH 1/3] config.sub: Update config.sub to latest
 version
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
Cc: Wei Liu <wei.liu2@citrix.com>, Alistair Francis <alistair.francis@wdc.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190516192536.VyEyRQFa4Ih98a7ouvoqnp6gjCdRU1_NXtDWxnjWsjc@z>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMzozMSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDE2LjA1LjE5IGF0IDAyOjAyLCA8YWxpc3RhaXIuZnJh
bmNpc0B3ZGMuY29tPiB3cm90ZToKPiA+IFNpZ25lZC1vZmYtYnk6IEFsaXN0YWlyIEZyYW5jaXMg
PGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4KPgo+IEF0IGxlYXN0IHRvIG1lIGl0IGlzIGZhciBm
cm9tIG9idmlvdXMgd2h5IHdlIHdvdWxkIHdhbnQvbmVlZCB0bwo+IGRvIHRoaXMgdXBkYXRlLCBv
ciB3aGVyZSB0aGUgY2Fub25pY2FsICJsYXRlc3QgdmVyc2lvbiIgbGl2ZXMgYW5kCj4gaGVuY2Ug
d2hlcmUgdGhpcyBpcyBjb21pbmcgZnJvbS4gQW5vdGhlciBxdWVzdGlvbiBtaWdodCBiZQo+IHdo
ZXRoZXIgaXQgaXMgYSBnb29kIHRoaW5nIHRvIHB1bGwgdGhpcyBpbiBhcyBhIHNpbmdsZSBibG9i
IChjb3ZlcmluZwo+IGEgZ2FwIG9mIDcgeWVhcnMpLCB0aHVzIHByZXN1bWFibHkgYWxzbyBkaXNj
YXJkaW5nIGF1dGhvcnNoaXAKPiBvZiBkb3plbnMgb2YgcGVvcGxlLiBCdXQgb2YgY291cnNlLCBp
biB0aGUgZW5kIGl0J3MgdGhlIHBlb3BsZQo+IHlvdSd2ZSBDYy1lZCB3aG8gbmVlZCB0byBkZWNp
ZGUgd2hldGhlciB0aGlzIGlzIGZpbmUgdG8gdGFrZSBpbgo+IHRoaXMgc2hhcGUuCgpObyBib2R5
IHNob3VsZCBiZSBlZGl0aW5nIHRoaXMgZmlsZS4gSWRlYWxseSBpdCB3b3VsZCBiZSBhdXRvZ2Vu
ZXJhdGVkCmJ5IGF1dG9jb25mLCBidXQgYXMgd2UgZGVmaW5lIEFDX0NBTk9OSUNBTF9IT1NUIHRo
ZSBmaWxlIGlzIG5vdApnZW5lcmF0ZWQgKHNlZSBbMV0pLgoKSSBoYXZlIHVwZGF0ZWQgdGhlIGNv
bW1pdCB0byBpbmNsdWRlIHRoZSB1cHN0cmVhbSBTSEEgd2hlcmUgd2UgYXJlCmdldHRpbmcgdGhl
IGZpbGUgZnJvbS4KClRoZSBjdXJyZW50IGZpbGUgaXMgc28gb2xkIHRoYXQgaXQgZG9lc24ndCBz
dXBwb3J0IG5ldyBhcmNoaXRlY3R1cmVzCnN1Y2ggYXMgUklTQy1WLgoKMTogaHR0cHM6Ly93d3cu
Z251Lm9yZy9zb2Z0d2FyZS9hdXRvY29uZi9tYW51YWwvYXV0b2NvbmYuaHRtbCNDYW5vbmljYWxp
emluZwoKQWxpc3RhaXIKCj4KPiBKYW4KPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
