Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CB7C282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 15:00:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9BF5217F4
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 15:00:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NMNVl8Q/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9BF5217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGm2Y-0004YH-3L; Wed, 17 Apr 2019 14:59:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O1DL=ST=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hGm2W-0004Xo-6R
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 14:59:56 +0000
X-Inumbo-ID: 757ea258-6121-11e9-92d7-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 757ea258-6121-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 14:59:55 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id t11so14631597lfl.12
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2019 07:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sYhlxjtx4Sgld5uQLxETuiOyAQru8QknI0i+nVxVUAo=;
 b=NMNVl8Q/3vT4P0KaAWs5nA8M4hLLkDTz8yAF/987fGtQ1XVhuDHU0BEjL7Ec8vm5Ba
 Ii4vglZcqIwsn8gtIwGL+vVNV3ZzxN3HhF50Zh44wLWCCMEDzLfoSZJHpCmtX4JIi2yj
 GEcP40BoxdNKlQGdec6Ebrwz9S+eWSiP5tw/xtUuPxb+494tqu3/LhkbtiGuAtoAs2eb
 iM3XAGKVl4xw+KUt90OW+lDkc46IcBbvgrafVgQQFv3SaK99wHJDkPykzxkfAbsJDUOl
 jYDSUq2J6jsoCyjus8DtiapKDCbST0aj5XS+eLcPcHPY0BqJIN/zKlqYibhzImxMm9cD
 fVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sYhlxjtx4Sgld5uQLxETuiOyAQru8QknI0i+nVxVUAo=;
 b=I1ietDbpb3LQuoM4tqP9t8T89/QMqJddS8v5ors+6Mp9I6VYnfieJGlLFipFUtpkmS
 sTVi1Q3AvDab5/JscV31f0e6ixbIRWf3s0hUBbzDrPNIL6iq2WPOWCoD8jF4K69qw1ej
 GY7Ilwjn5ZWnDwQ6N5dA4aHGgoKsOPZc84BHE1yw83sAv2niGVgzTf5qFgeq/3eRm9nk
 FESt+Kw7cz8FyHNxoHP6QPg2mzL5G4uW2Ov3AN9iHT+3jIBKjdW5Iz5m53L3pYhTXUAf
 F4wMET7CIzdE+yYxO2Gv6gBNAFgH7J8bZ1/E37fU0oCUvPgQH+0wEnu7ZBpSXngXo883
 LgHQ==
X-Gm-Message-State: APjAAAUENSsNTEJ/I4L9g5NoMh5c5sKq9qeMTAsEoyGSlny4kLvfBjXD
 q0alnWXGRZH0/6LIusPkGKIkeIv8sE4=
X-Google-Smtp-Source: APXvYqzQP8lrFnWupvy+X6RVblWVVow9Vdo2Y2uLoNC9cqSq9sHDSmMi4/9vqa1BwLow3OJMUxPCiA==
X-Received: by 2002:a19:3f09:: with SMTP id m9mr15315708lfa.36.1555513193648; 
 Wed, 17 Apr 2019 07:59:53 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id u8sm950273lfi.83.2019.04.17.07.59.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 17 Apr 2019 07:59:52 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 17 Apr 2019 17:59:34 +0300
Message-Id: <1555513175-7596-5-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555513175-7596-1-git-send-email-olekstysh@gmail.com>
References: <1555513175-7596-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [PATCH V4 4/5] xen/arm: Extend SCIF early prink code to
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
Message-ID: <20190417145934.jZykGz_jhzSt_ONb4dujDQTndeYmHBQg-TvINu2SLBo@z>

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
ICAgICAgICAgIGFuZCBvbmx5IHJld29ya3MgYSBjb2RlCgogICAgICAgIENoYW5nZXMgaW4gdjQ6
CiAgICAgICAgLSBVcGRhdGUgZG9jcy9taXNjL2FybS9lYXJseS1wcmludGsudHh0IHdpdGggdGhl
IG5ldyBvcHRpb24KLS0tCiBkb2NzL21pc2MvYXJtL2Vhcmx5LXByaW50ay50eHQgICAgfCAgNiAr
KysrKysKIHhlbi9hcmNoL2FybS9SdWxlcy5tayAgICAgICAgICAgICB8ICA3ICsrKysrKysKIHhl
bi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1zY2lmLmluYyB8IDEzICsrKysrKysrKy0tLS0KIDMgZmls
ZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kb2NzL21pc2MvYXJtL2Vhcmx5LXByaW50ay50eHQgYi9kb2NzL21pc2MvYXJtL2Vhcmx5LXBy
aW50ay50eHQKaW5kZXggYjIzYzU0Zi4uYzA1NDY3NCAxMDA2NDQKLS0tIGEvZG9jcy9taXNjL2Fy
bS9lYXJseS1wcmludGsudHh0CisrKyBiL2RvY3MvbWlzYy9hcm0vZWFybHktcHJpbnRrLnR4dApA
QCAtMjcsNiArMjcsMTIgQEAgQ09ORklHX0VBUkxZX1BSSU5USz08SU5DPiw8QkFTRV9BRERSRVNT
Piw8T1RIRVJfT1BUSU9OUz4KICAgICAgIElmIDxCQVVEX1JBVEU+IGlzIG5vdCBnaXZlbiB0aGVu
IHRoZSBjb2RlIHdpbGwgbm90IHRyeSB0bwogICAgICAgaW5pdGlhbGl6ZSB0aGUgVUFSVCwgc28g
dGhhdCBib290bG9hZGVyIG9yIGZpcm13YXJlIHNldHRpbmdzIGNhbgogICAgICBiZSB1c2VkIGZv
ciBtYXhpbXVtIGNvbXBhdGliaWxpdHkuCisgIC0gc2NpZiw8QkFTRV9BRERSRVNTPiw8VkVSU0lP
Tj4KKyAgICAtIDxWRVJTSU9OPiBpcyBhIG9wdGlvbiB0byBjaG9vc2Ugd2hpY2ggaW50ZXJmYWNl
IHZlcnNpb24gc2hvdWxkIGJlIHVzZWQKKyAgICAgIG9uIGEgdGFyZ2V0IGJvYXJkLgorCisgICAg
ICBJZiA8VkVSU0lPTj4gaXMgbm90IGdpdmVuIHRoZW4gYSBkZWZhdWx0IGludGVyZmFjZSB2ZXJz
aW9uIChTQ0lGKQorICAgICAgd2lsbCBiZSB1c2VkLgogICAtIEZvciBhbGwgb3RoZXIgdWFydHMg
dGhlcmUgYXJlIG5vIGFkZGl0aW9uYWwgb3B0aW9ucy4KIAogQXMgYSBjb252ZW5pZW5jZSBpdCBp
cyBhbHNvIHBvc3NpYmxlIHRvIHNlbGVjdCBmcm9tIGEgbGlzdCBvZgpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL1J1bGVzLm1rIGIveGVuL2FyY2gvYXJtL1J1bGVzLm1rCmluZGV4IGYyNjQ1OTIu
LjNkOWEwZWQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9SdWxlcy5taworKysgYi94ZW4vYXJj
aC9hcm0vUnVsZXMubWsKQEAgLTY4LDYgKzY4LDEzIEBAIEVBUkxZX1BSSU5US19JTklUX1VBUlQg
Oj0geQogRUFSTFlfUFJJTlRLX0JBVUQgOj0gJCh3b3JkIDMsJChFQVJMWV9QUklOVEtfQ0ZHKSkK
IGVuZGlmCiBlbmRpZgoraWZlcSAoJChFQVJMWV9QUklOVEtfSU5DKSxzY2lmKQoraWZuZXEgKCQo
d29yZCAzLCQoRUFSTFlfUFJJTlRLX0NGRykpLCkKK0NGTEFHUy15ICs9IC1ERUFSTFlfUFJJTlRL
X1ZFUlNJT05fJCh3b3JkIDMsJChFQVJMWV9QUklOVEtfQ0ZHKSkKK2Vsc2UKK0NGTEFHUy15ICs9
IC1ERUFSTFlfUFJJTlRLX1ZFUlNJT05fTk9ORQorZW5kaWYKK2VuZGlmCiAKIGlmbmVxICgkKEVB
UkxZX1BSSU5US19JTkMpLCkKIEVBUkxZX1BSSU5USyA6PSB5CmRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vYXJtMzIvZGVidWctc2NpZi5pbmMgYi94ZW4vYXJjaC9hcm0vYXJtMzIvZGVidWctc2Np
Zi5pbmMKaW5kZXggMTQzZjA1ZC4uYThkMmVhZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2Fy
bTMyL2RlYnVnLXNjaWYuaW5jCisrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1zY2lmLmlu
YwpAQCAtMTksNiArMTksMTEgQEAKIAogI2luY2x1ZGUgPGFzbS9zY2lmLXVhcnQuaD4KIAorI2lm
ZGVmIEVBUkxZX1BSSU5US19WRVJTSU9OX05PTkUKKyNkZWZpbmUgU1RBVFVTX1JFRyAgICBTQ0lG
X1NDRlNSCisjZGVmaW5lIFRYX0ZJRk9fUkVHICAgU0NJRl9TQ0ZURFIKKyNlbmRpZgorCiAvKgog
ICogU0NJRiBVQVJUIHdhaXQgVUFSVCB0byBiZSByZWFkeSB0byB0cmFuc21pdAogICogcmI6IHJl
Z2lzdGVyIHdoaWNoIGNvbnRhaW5zIHRoZSBVQVJUIGJhc2UgYWRkcmVzcwpAQCAtMjYsNyArMzEs
NyBAQAogICovCiAubWFjcm8gZWFybHlfdWFydF9yZWFkeSByYiByYwogMToKLSAgICAgICAgbGRy
aCAgIFxyYywgW1xyYiwgI1NDSUZfU0NGU1JdICAgLyogPC0gU0NGU1IgKHN0YXR1cyByZWdpc3Rl
cikgKi8KKyAgICAgICAgbGRyaCAgIFxyYywgW1xyYiwgI1NUQVRVU19SRUddICAgLyogUmVhZCBz
dGF0dXMgcmVnaXN0ZXIgKi8KICAgICAgICAgdHN0ICAgIFxyYywgI1NDRlNSX1RERkUgICAgICAg
ICAgLyogQ2hlY2sgVERGRSBiaXQgKi8KICAgICAgICAgYmVxICAgIDFiICAgICAgICAgICAgICAg
ICAgICAgICAgLyogV2FpdCBmb3IgdGhlIFVBUlQgdG8gYmUgcmVhZHkgKi8KIC5lbmRtCkBAIC0z
NywxMCArNDIsMTAgQEAKICAqIHJ0OiByZWdpc3RlciB3aGljaCBjb250YWlucyB0aGUgY2hhcmFj
dGVyIHRvIHRyYW5zbWl0CiAgKi8KIC5tYWNybyBlYXJseV91YXJ0X3RyYW5zbWl0IHJiIHJ0Ci0g
ICAgICAgIHN0cmIgICBccnQsIFtccmIsICNTQ0lGX1NDRlREUl0gICAgICAgICAgICAgICAgICAv
KiAtPiBTQ0ZURFIgKGRhdGEgcmVnaXN0ZXIpICovCi0gICAgICAgIGxkcmggICBccnQsIFtccmIs
ICNTQ0lGX1NDRlNSXSAgICAgICAgICAgICAgICAgICAvKiA8LSBTQ0ZTUiAoc3RhdHVzIHJlZ2lz
dGVyKSAqLworICAgICAgICBzdHJiICAgXHJ0LCBbXHJiLCAjVFhfRklGT19SRUddICAgICAgICAg
ICAgICAgICAgLyogV3JpdGUgZGF0YSByZWdpc3RlciAqLworICAgICAgICBsZHJoICAgXHJ0LCBb
XHJiLCAjU1RBVFVTX1JFR10gICAgICAgICAgICAgICAgICAgLyogUmVhZCBzdGF0dXMgcmVnaXN0
ZXIgKi8KICAgICAgICAgYW5kICAgIFxydCwgXHJ0LCAjKH4oU0NGU1JfVEVORCB8IFNDRlNSX1RE
RkUpKSAgIC8qIENsZWFyIFRFTkQgYW5kIFRERkUgYml0cyAqLwotICAgICAgICBzdHJoICAgXHJ0
LCBbXHJiLCAjU0NJRl9TQ0ZTUl0gICAgICAgICAgICAgICAgICAgLyogLT4gU0NGU1IgKHN0YXR1
cyByZWdpc3RlcikgKi8KKyAgICAgICAgc3RyaCAgIFxydCwgW1xyYiwgI1NUQVRVU19SRUddICAg
ICAgICAgICAgICAgICAgIC8qIFdyaXRlIHN0YXR1cyByZWdpc3RlciAqLwogLmVuZG0KIAogLyoK
LS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
