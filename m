Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C599C10F14
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:15:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C7C120880
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:15:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GA2YmRkR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C7C120880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDRIw-0003pl-Qj; Mon, 08 Apr 2019 10:15:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=agIW=SK=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hDRIv-0003np-1G
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 10:15:05 +0000
X-Inumbo-ID: 2cb6dbfc-59e7-11e9-92d7-bc764e045a96
Received: from mail-lj1-x231.google.com (unknown [2a00:1450:4864:20::231])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2cb6dbfc-59e7-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 10:15:04 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id f23so10726425ljc.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2019 03:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=g4VY56t8BGvGmnz7boqdc1qWXBW9wwBLZMsTzOiTdoU=;
 b=GA2YmRkR+F8KBoUnZBodsxhUOyaxGBEvufPFnq4SE7W740lrNHNud97oPSD59c6kfM
 +w1RpGxv/vmMj/MEl7NlE+5EYjelOGdpSw6qX0Hf2O7qXhBweNlnJhR6AUGT75BWu0MJ
 kdO0C2h+mhDNDUlnIRHLIiOteM35RU563u2qC5WSuRGL9LvziQD8mGPgpvvA5GebZIxI
 TSfIDfuUfbjQIXwmGDDQ1bW6bTvUiOTihFkPcLf139us41RAF19hOJiPuHSNTEKof+Md
 mfKzkQGFcUB9umhyCx6HyyAkwTtz/eDFUD0L85ckZJGD6ljI/o9xt6wW3wsKp4gCXz3s
 aheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=g4VY56t8BGvGmnz7boqdc1qWXBW9wwBLZMsTzOiTdoU=;
 b=P5T8rAdx9pChSWOysbgLODHCKyW6nil7PbS29ifje11SqeVIguEmDACU01kMbO0/Ke
 GjSqaallPJztxkO9AQduS125jnuicBi2uHHOc4nFl0sk+so487w3MlLqz2PmV6jFCg8f
 6ZASLj0VH6BDoH5XYagfj0xvgC+oMUMd+7kntwTyO1A6vtuelKHm8ndLlR6m4bRpozeB
 r9cp2NVIT9rEH/uqsGXMMACl50kF92ujy3D7mzC9YHBxPCetvSmRpSszb9RM7IxIERlA
 Fap9C7oNgbnE8jcjKwetNiFezGYxtTj38E8jZU6Jdr9PVAS6/ER4mm2AidBzRgQWTStG
 9wmw==
X-Gm-Message-State: APjAAAUBoX7RqiL3GS/kyG7NZrQrkbkrd9raxPyvGjJbiDNoqnDFjkmA
 WJ+lYJ8kxTWMJD8QdJkz9s9V1Booksw=
X-Google-Smtp-Source: APXvYqwDcyuOSVRGe3iBDGMnW8XEuqvEgVkWINoL7qQjBbsi5Hl9poQFOHDAopc1rtQFdy4k9+lFbw==
X-Received: by 2002:a2e:8156:: with SMTP id t22mr15017899ljg.77.1554718502742; 
 Mon, 08 Apr 2019 03:15:02 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id x30sm6275717ljd.38.2019.04.08.03.15.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 08 Apr 2019 03:15:02 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  8 Apr 2019 13:14:48 +0300
Message-Id: <1554718489-11318-5-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554718489-11318-1-git-send-email-olekstysh@gmail.com>
References: <1554718489-11318-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [PATCH V3 4/5] xen/arm: Extend SCIF early prink code to
 handle other interfaces
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408101448.1sZ2JWWyQBAdykOXXwt6JIuuN3UFqkm3dN-afU-V0c4@z>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKRXh0ZW5kIGVhcmx5IHByaW5rIGNvZGUgdG8gYmUgYWJsZSB0byBoYW5kbGUgb3RoZXIgU0NJ
RihYKQpjb21wYXRpYmxlIGludGVyZmFjZXMgYXMgd2VsbC4gVGhlc2UgaW50ZXJmYWNlcyBoYXZl
IGxvdCBpbiBjb21tb24sCmJ1dCBtb3N0bHkgZGlmZmVyIGluIG9mZnNldHMgYW5kIGJpdHMgZm9y
IHNvbWUgcmVnaXN0ZXJzLgoKSW50cm9kdWNlICJFQVJMWV9QUklOVEtfVkVSU0lPTiIgY29uZmln
IG9wdGlvbiB0byBjaG9vc2Ugd2hpY2gKaW50ZXJmYWNlIHZlcnNpb24gc2hvdWxkIGJlIHVzZWQg
KHRvIHByb3Blcmx5IGFwcGx5IHJlZ2lzdGVyIG9mZnNldHMpLgoKUGxlYXNlIG5vdGUsIG5vdGhp
bmcgaGFzIGJlZW4gdGVjaG5pY2FsbHkgY2hhbmdlZCBmb3IgUmVuZXNhcyAiTGFnZXIiCmFuZCBv
dGhlciBzdXBwb3J0ZWQgYm9hcmRzIChTQ0lGKS4KClRoZSAiRUFSTFlfUFJJTlRLX1ZFUlNJT04i
IG9wdGlvbiBmb3IgdGhhdCBib2FyZCBzaG91bGQgYmUgZW1wdHk6CkNPTkZJR19FQVJMWV9QUklO
VEs9c2NpZiwweGU2ZTYwMDAwCgpTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8
b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+CkNDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYzOgogICAgICAgIC0gSXQgd2FzIGRl
Y2lkZWQgbm90IHRvIGludHJvZHVjZSBuZXcgZGVidWctc2NpZmEuaW5jCiAgICAgICAgICBmb3Ig
aGFuZGxpbmcgU0NJRkEgaW50ZXJmYWNlLCBidXQgdG8gZXh0ZW5kIGV4aXN0aW5nCiAgICAgICAg
ICBkZWJ1Zy1zY2lmLmluYyBmb3IgaGFuZGxpbmcgYm90aCBpbnRlcmZhY2VzLgogICAgICAgICAg
VGhpcyBwYXRjaCBpcyBhIHJlc3VsdCBvZiBzcGxpdHRpbmcgYW4gaW5pdGlhbCBwYXRjaAogICAg
ICAgICAgInhlbi9hcm06IEFkZCBTQ0lGQSBVQVJUIHN1cHBvcnQgZm9yIGVhcmx5IHByaW50ayIK
ICAgICAgICAgIGFuZCBvbmx5IHJld29ya3MgYSBjb2RlCi0tLQogeGVuL2FyY2gvYXJtL1J1bGVz
Lm1rICAgICAgICAgICAgIHwgIDcgKysrKysrKwogeGVuL2FyY2gvYXJtL2FybTMyL2RlYnVnLXNj
aWYuaW5jIHwgMTMgKysrKysrKysrLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9SdWxlcy5tayBi
L3hlbi9hcmNoL2FybS9SdWxlcy5tawppbmRleCBmMjY0NTkyLi4zZDlhMGVkIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC9hcm0vUnVsZXMubWsKKysrIGIveGVuL2FyY2gvYXJtL1J1bGVzLm1rCkBAIC02
OCw2ICs2OCwxMyBAQCBFQVJMWV9QUklOVEtfSU5JVF9VQVJUIDo9IHkKIEVBUkxZX1BSSU5US19C
QVVEIDo9ICQod29yZCAzLCQoRUFSTFlfUFJJTlRLX0NGRykpCiBlbmRpZgogZW5kaWYKK2lmZXEg
KCQoRUFSTFlfUFJJTlRLX0lOQyksc2NpZikKK2lmbmVxICgkKHdvcmQgMywkKEVBUkxZX1BSSU5U
S19DRkcpKSwpCitDRkxBR1MteSArPSAtREVBUkxZX1BSSU5US19WRVJTSU9OXyQod29yZCAzLCQo
RUFSTFlfUFJJTlRLX0NGRykpCitlbHNlCitDRkxBR1MteSArPSAtREVBUkxZX1BSSU5US19WRVJT
SU9OX05PTkUKK2VuZGlmCitlbmRpZgogCiBpZm5lcSAoJChFQVJMWV9QUklOVEtfSU5DKSwpCiBF
QVJMWV9QUklOVEsgOj0geQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2RlYnVnLXNj
aWYuaW5jIGIveGVuL2FyY2gvYXJtL2FybTMyL2RlYnVnLXNjaWYuaW5jCmluZGV4IDE0M2YwNWQu
LmE4ZDJlYWUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1zY2lmLmluYwor
KysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvZGVidWctc2NpZi5pbmMKQEAgLTE5LDYgKzE5LDExIEBA
CiAKICNpbmNsdWRlIDxhc20vc2NpZi11YXJ0Lmg+CiAKKyNpZmRlZiBFQVJMWV9QUklOVEtfVkVS
U0lPTl9OT05FCisjZGVmaW5lIFNUQVRVU19SRUcgICAgU0NJRl9TQ0ZTUgorI2RlZmluZSBUWF9G
SUZPX1JFRyAgIFNDSUZfU0NGVERSCisjZW5kaWYKKwogLyoKICAqIFNDSUYgVUFSVCB3YWl0IFVB
UlQgdG8gYmUgcmVhZHkgdG8gdHJhbnNtaXQKICAqIHJiOiByZWdpc3RlciB3aGljaCBjb250YWlu
cyB0aGUgVUFSVCBiYXNlIGFkZHJlc3MKQEAgLTI2LDcgKzMxLDcgQEAKICAqLwogLm1hY3JvIGVh
cmx5X3VhcnRfcmVhZHkgcmIgcmMKIDE6Ci0gICAgICAgIGxkcmggICBccmMsIFtccmIsICNTQ0lG
X1NDRlNSXSAgIC8qIDwtIFNDRlNSIChzdGF0dXMgcmVnaXN0ZXIpICovCisgICAgICAgIGxkcmgg
ICBccmMsIFtccmIsICNTVEFUVVNfUkVHXSAgIC8qIFJlYWQgc3RhdHVzIHJlZ2lzdGVyICovCiAg
ICAgICAgIHRzdCAgICBccmMsICNTQ0ZTUl9UREZFICAgICAgICAgIC8qIENoZWNrIFRERkUgYml0
ICovCiAgICAgICAgIGJlcSAgICAxYiAgICAgICAgICAgICAgICAgICAgICAgIC8qIFdhaXQgZm9y
IHRoZSBVQVJUIHRvIGJlIHJlYWR5ICovCiAuZW5kbQpAQCAtMzcsMTAgKzQyLDEwIEBACiAgKiBy
dDogcmVnaXN0ZXIgd2hpY2ggY29udGFpbnMgdGhlIGNoYXJhY3RlciB0byB0cmFuc21pdAogICov
CiAubWFjcm8gZWFybHlfdWFydF90cmFuc21pdCByYiBydAotICAgICAgICBzdHJiICAgXHJ0LCBb
XHJiLCAjU0NJRl9TQ0ZURFJdICAgICAgICAgICAgICAgICAgLyogLT4gU0NGVERSIChkYXRhIHJl
Z2lzdGVyKSAqLwotICAgICAgICBsZHJoICAgXHJ0LCBbXHJiLCAjU0NJRl9TQ0ZTUl0gICAgICAg
ICAgICAgICAgICAgLyogPC0gU0NGU1IgKHN0YXR1cyByZWdpc3RlcikgKi8KKyAgICAgICAgc3Ry
YiAgIFxydCwgW1xyYiwgI1RYX0ZJRk9fUkVHXSAgICAgICAgICAgICAgICAgIC8qIFdyaXRlIGRh
dGEgcmVnaXN0ZXIgKi8KKyAgICAgICAgbGRyaCAgIFxydCwgW1xyYiwgI1NUQVRVU19SRUddICAg
ICAgICAgICAgICAgICAgIC8qIFJlYWQgc3RhdHVzIHJlZ2lzdGVyICovCiAgICAgICAgIGFuZCAg
ICBccnQsIFxydCwgIyh+KFNDRlNSX1RFTkQgfCBTQ0ZTUl9UREZFKSkgICAvKiBDbGVhciBURU5E
IGFuZCBUREZFIGJpdHMgKi8KLSAgICAgICAgc3RyaCAgIFxydCwgW1xyYiwgI1NDSUZfU0NGU1Jd
ICAgICAgICAgICAgICAgICAgIC8qIC0+IFNDRlNSIChzdGF0dXMgcmVnaXN0ZXIpICovCisgICAg
ICAgIHN0cmggICBccnQsIFtccmIsICNTVEFUVVNfUkVHXSAgICAgICAgICAgICAgICAgICAvKiBX
cml0ZSBzdGF0dXMgcmVnaXN0ZXIgKi8KIC5lbmRtCiAKIC8qCi0tIAoyLjcuNAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
