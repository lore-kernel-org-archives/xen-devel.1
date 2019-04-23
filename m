Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF80C282DD
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 08:10:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CC7220843
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 08:10:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdDoLCfp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CC7220843
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIqVf-0001of-Bb; Tue, 23 Apr 2019 08:10:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Dq19=SZ=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hIqVd-0001oF-KS
 for xen-devel@lists.xen.org; Tue, 23 Apr 2019 08:10:33 +0000
X-Inumbo-ID: 436fe14e-659f-11e9-92d7-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 436fe14e-659f-11e9-92d7-bc764e045a96;
 Tue, 23 Apr 2019 08:10:32 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id w23so10989323lfc.9
 for <xen-devel@lists.xen.org>; Tue, 23 Apr 2019 01:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7xzhkUbgLwFYUz+eQIQAlHxn4lZsa4B1+UaGHWaqJf8=;
 b=CdDoLCfpTGOonKphA5/jHvjLc4NJNEobq5KeRE4mjAmcTG5jawZDrl13Ra++XWhueG
 Mh1gWY1363I/aWIYG7/LUx+sgsXH8tF1f38ZcuMX5nVjYh3v1czYdFhZ/RIaH3sEbCDD
 QbdHAqQZGFi4GovY+qVlkiBnxDiIR7OtmW7D2aq3VffwaMVWvYlCt9fvDzNn3YPoKbC7
 QF55Ga5x4cDgoXHEWtmEMOc2m5JCya2S+8CUb2ud2WffIaB5a9wP2YofDH9HEWWvOa7b
 NVzIzh12r3GtQpkhE1s+nGX3gOR7/xiC80K7/YH9SB1VhdhFMEtrQHvKMKyvABaIyVQK
 r2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7xzhkUbgLwFYUz+eQIQAlHxn4lZsa4B1+UaGHWaqJf8=;
 b=GZg3Zj+zdcp8eVkbq36xKvD1svMhPuIuuJfnQayr11g8rdimBTgvkDNTdkj2e/5k5R
 gt5aaJEWzlIwhsX4zAqZ1NCKQtmBTooUhCqDTp3D8uipSgKPpP/tCrTvqnD/RJKawmSH
 QLvlaGooW5zSO5ArX67PI0pVSs5VHZYrazE9Ta5MClDRbi75Ng2oOsTHN8N65ojNW/kq
 OOyLFf9p4Lfg/9FXyNDdvDcJJyiaoMhDKPLOUwmrVe+/w9QJSQIZn9Jv+GAp9caaPQ2f
 Ed33daw2wxlaJYhPl1RddlB7hPU3DFJTG/aSTe1IyAnNdPjG3b+Lyb9fZ3eGRn06sAhL
 S49Q==
X-Gm-Message-State: APjAAAVKcGE2nZepe1NQce04f5+Q9PtqqU2Q/dxerYXaHilWZFwxrk1Z
 SQMaVxgw0/LwD+lx/+LweCPGxo3iCSioSw==
X-Google-Smtp-Source: APXvYqwu9aBvug2bpxd88OF+2Q9HyVDvZl2gfqNoHISSa7WchSZ/BvWWOWPIH4i1LIGuCy3BVPK16Q==
X-Received: by 2002:ac2:4355:: with SMTP id o21mr13676995lfl.123.1556007030738; 
 Tue, 23 Apr 2019 01:10:30 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id m28sm3533538lfc.71.2019.04.23.01.10.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 23 Apr 2019 01:10:29 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xen.org
Date: Tue, 23 Apr 2019 11:10:25 +0300
Message-Id: <1556007026-31057-2-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
Subject: [Xen-devel] [PATCH v2 1/2] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190423081025.9BH9lsHvvDclPSz7A6ckZ700vEvb8xSrWbsY4Dv1jkU@z>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClRoZSBoeXBlcmNh
bGwgZW1wbG95cyB0aGUgc2FtZSB2Y3B1X3JlZ2lzdGVyX3J1bnN0YXRlX21lbW9yeV9hcmVhCnN0
cnVjdHVyZSBmb3IgdGhlIGludGVyZmFjZSwgYnV0IHJlcXVpcmVzIHJlZ2lzdGVyZWQgYXJlYSB0
byBub3QKY3Jvc3MgYSBwYWdlIGJvdW5kYXJ5LgoKU2lnbmVkLW9mZi1ieTogQW5kcmlpIEFuaXNv
diA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KLS0tCiB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICAg
IHwgIDUgKysrKy0KIHhlbi9pbmNsdWRlL3B1YmxpYy92Y3B1LmggfCAxNSArKysrKysrKysrKysr
KysKIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2RvbWFpbi5jCmluZGV4
IDg4YmJlOTguLmFlMjIwNDkgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMKKysrIGIv
eGVuL2NvbW1vbi9kb21haW4uYwpAQCAtMTUzMiwxMCArMTUzMiwxMyBAQCBsb25nIGRvX3ZjcHVf
b3AoaW50IGNtZCwgdW5zaWduZWQgaW50IHZjcHVpZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2
b2lkKSBhcmcpCiAgICAgICAgICAgICB2Y3B1X3J1bnN0YXRlX2dldCh2LCAmcnVuc3RhdGUpOwog
ICAgICAgICAgICAgX19jb3B5X3RvX2d1ZXN0KHJ1bnN0YXRlX2d1ZXN0KHYpLCAmcnVuc3RhdGUs
IDEpOwogICAgICAgICB9Ci0KICAgICAgICAgYnJlYWs7CiAgICAgfQogCisgICAgY2FzZSBWQ1BV
T1BfcmVnaXN0ZXJfcnVuc3RhdGVfcGh5c19tZW1vcnlfYXJlYToKKyAgICAgICAgcmMgPSAtRU9Q
Tk9UU1VQUDsKKyAgICAgICAgYnJlYWs7CisKICNpZmRlZiBWQ1BVX1RSQVBfTk1JCiAgICAgY2Fz
ZSBWQ1BVT1Bfc2VuZF9ubWk6CiAgICAgICAgIGlmICggIWd1ZXN0X2hhbmRsZV9pc19udWxsKGFy
ZykgKQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL3ZjcHUuaCBiL3hlbi9pbmNsdWRl
L3B1YmxpYy92Y3B1LmgKaW5kZXggMzYyM2FmOS4uZDdkYTRhMyAxMDA2NDQKLS0tIGEveGVuL2lu
Y2x1ZGUvcHVibGljL3ZjcHUuaAorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvdmNwdS5oCkBAIC0y
MzUsNiArMjM1LDIxIEBAIHN0cnVjdCB2Y3B1X3JlZ2lzdGVyX3RpbWVfbWVtb3J5X2FyZWEgewog
dHlwZWRlZiBzdHJ1Y3QgdmNwdV9yZWdpc3Rlcl90aW1lX21lbW9yeV9hcmVhIHZjcHVfcmVnaXN0
ZXJfdGltZV9tZW1vcnlfYXJlYV90OwogREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUodmNwdV9yZWdp
c3Rlcl90aW1lX21lbW9yeV9hcmVhX3QpOwogCisvKgorICogUmVnaXN0ZXIgYSBzaGFyZWQgbWVt
b3J5IGFyZWEgZnJvbSB3aGljaCB0aGUgZ3Vlc3QgbWF5IG9idGFpbiBpdHMgb3duCisgKiBydW5z
dGF0ZSBpbmZvcm1hdGlvbiB3aXRob3V0IG5lZWRpbmcgdG8gZXhlY3V0ZSBhIGh5cGVyY2FsbC4K
KyAqIE5vdGVzOgorICogIDEuIFRoZSByZWdpc3RlcmVkIGFkZHJlc3MgbXVzdCBiZSBndWVzdCdz
IHBoeXNpY2FsIGFkZHJlc3MuCisgKiAgMi4gVGhlIHJlZ2lzdGVyZWQgcnVuc3RhdGUgYXJlYSBz
aG91bGQgbm90IGNyb3NzIHBhZ2UgYm91bmRhcnkuCisgKiAgMy4gT25seSBvbmUgc2hhcmVkIGFy
ZWEgbWF5IGJlIHJlZ2lzdGVyZWQgcGVyIFZDUFUuIFRoZSBzaGFyZWQgYXJlYSBpcworICogICAg
IHVwZGF0ZWQgYnkgdGhlIGh5cGVydmlzb3IgZWFjaCB0aW1lIHRoZSBWQ1BVIGlzIHNjaGVkdWxl
ZC4gVGh1cworICogICAgIHJ1bnN0YXRlLnN0YXRlIHdpbGwgYWx3YXlzIGJlIFJVTlNUQVRFX3J1
bm5pbmcgYW5kCisgKiAgICAgcnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZSB3aWxsIGluZGljYXRl
IHRoZSBzeXN0ZW0gdGltZSBhdCB3aGljaCB0aGUKKyAqICAgICBWQ1BVIHdhcyBsYXN0IHNjaGVk
dWxlZCB0byBydW4uCisgKiBAZXh0cmFfYXJnID09IHBvaW50ZXIgdG8gdmNwdV9yZWdpc3Rlcl9y
dW5zdGF0ZV9tZW1vcnlfYXJlYSBzdHJ1Y3R1cmUuCisgKi8KKyNkZWZpbmUgVkNQVU9QX3JlZ2lz
dGVyX3J1bnN0YXRlX3BoeXNfbWVtb3J5X2FyZWEgMTQKKwogI2VuZGlmIC8qIF9fWEVOX1BVQkxJ
Q19WQ1BVX0hfXyAqLwogCiAvKgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
