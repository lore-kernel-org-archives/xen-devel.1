Return-Path: <SRS0=USwc=VG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BBFC606B0
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jul 2019 07:50:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E895C21537
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jul 2019 07:50:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILOZM3RY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E895C21537
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkksj-0002Qz-Ny; Tue, 09 Jul 2019 07:49:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AxFz=VG=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hkksj-0002Qu-0c
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 07:49:45 +0000
X-Inumbo-ID: 1cc61b85-a21e-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1cc61b85-a21e-11e9-8980-bc764e045a96;
 Tue, 09 Jul 2019 07:49:43 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id p17so18614992ljg.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2019 00:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=XrcNnvi02p1qwScg1CK4rrEfhSUknr/DN383no2oZM4=;
 b=ILOZM3RYgnIyqaSZA25hJ+9VfKLdh+yHPL5F33kniF7t/PLzxMOiaOgsXASJAJOuxG
 PXtsyQatyp7LaFaTRlq6TuNo7+DEq6/iNn6igrXudtGYZrPj05Aeuquo7VCTuQdTHQnI
 KsfcgMljy201l5GnrQrHO01LEK5Uu+iSyWN4BY+QOeEq86Z2uPNo7vrgaRge8ggsvCag
 kap3b6MCyw8OwbLqTDzwaYwENrERjKCIhunedD7sbMS+mFZpxW9N4AhTMG29dOsZaFr2
 YPzvSX8xIFyoNWsQIHLQSFrIqc+TlUiBhVM+ygWLhIK6+0XYaLIH2b5PJeKmWULNW3SH
 GGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=XrcNnvi02p1qwScg1CK4rrEfhSUknr/DN383no2oZM4=;
 b=DV8dji7kDBS71cA6QK3Xb15HHHGo13d1mFJ8LKoqBjkAo8DjEybIcmYS1r2KlAhQ9s
 OsQof/dN4YtqZDSakc9hG4TqEbIv7xO61U1o17iS8Iuy2lrFtLuomuv9Kkg2/Y/wo1x0
 +O4I6mLhihd4/JF0TV08FdgWjCPEmi4E8889AC4QJ/hk0+hjc7Ur6mrC0LUjVla1GXWT
 bW5+Fnd1RhQBWdl/dk6YoZDRRGiLBbmSCa6dFWYd8Wo3ThY6tVgBoaOoRfdhkA5QdKLf
 L2zY4Ttxu5K1BMWIUNsmoQnWEEsJNtuTTySuCMl4syVo90jMQDAZG9LF2fvwgAtD8nKr
 1p/Q==
X-Gm-Message-State: APjAAAUFXDJQwUFaNRWp9siRMDN/jNSOwNmrV5udj653t1avCo8Fi8yB
 p3fnepIcm7WGU0xZ9zVLWUPK9KQsvmk=
X-Google-Smtp-Source: APXvYqzeVqyZ75C6EfFLOEV6+6khub+kg9WP9oUwrzxaTU/PPS82ZBfnrjpHq0ulb1TRigfjLWtX1w==
X-Received: by 2002:a05:651c:c6:: with SMTP id
 6mr10903690ljr.127.1562658581453; 
 Tue, 09 Jul 2019 00:49:41 -0700 (PDT)
Received: from 3489.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id d21sm2363403lfc.73.2019.07.09.00.49.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 00:49:40 -0700 (PDT)
From: Viktor Mitin <viktor.mitin.19@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue,  9 Jul 2019 10:49:03 +0300
Message-Id: <20190709074903.8042-1-viktor.mitin.19@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] xen/arm: change DomU memory property size from
 u64 to u32
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <viktor_mitin@epam.com>, Viktor Mitin <viktor.mitin.19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpbGUgY2hlY2tpbmcgeGVuIGRvbTBsZXNzIGRvY3VtZW50YXRpb24gaXQgaGFzIGJlZW4gZm91
bmQKdGhhdCBkb21VIG1lbW9yeSBwcm9wZXJ0eSByZXF1aXJlcyBleHRyYSAweDAgaW4gY2FzZSBv
ZiBhcm02NC4KClRoZXJlIGlzIG5vIG5lZWQgdG8ga2VlcCBtZW1vcnkgc2l6ZSBpbiB1NjQsIDMy
IGJpdHMgaXMKZW5vdWdoIGZvciBkb21VIG1lbW9yeSBzaXplLgoKVGVzdGVkIHRoYXQgaW4gY2Fz
ZSBvZiBhcm02NCBkb20wbGVzcyBkb21VIHdvcmtzCndpdGhvdXQgYWRkaW5nIGV4dHJhIDB4MCB0
byBkb21VIG1lbW9yeSBwcm9wZXJ0eSB3aXRoIHRoaXMgcGF0Y2guCgpTaWduZWQtb2ZmLWJ5OiBW
aWt0b3IgTWl0aW4gPHZpa3Rvcl9taXRpbkBlcGFtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMg
Yi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKaW5kZXggZDk4MzY3NzlkMS4uMmMxYThjMjQz
ZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCisrKyBiL3hlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYwpAQCAtMjAxMiw5ICsyMDEyLDkgQEAgc3RhdGljIGludCBfX2lu
aXQgY29uc3RydWN0X2RvbVUoc3RydWN0IGRvbWFpbiAqZCwKIHsKICAgICBzdHJ1Y3Qga2VybmVs
X2luZm8ga2luZm8gPSB7fTsKICAgICBpbnQgcmM7Ci0gICAgdTY0IG1lbTsKKyAgICB1MzIgbWVt
OwogCi0gICAgcmMgPSBkdF9wcm9wZXJ0eV9yZWFkX3U2NChub2RlLCAibWVtb3J5IiwgJm1lbSk7
CisgICAgcmMgPSBkdF9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAibWVtb3J5IiwgJm1lbSk7CiAg
ICAgaWYgKCAhcmMgKQogICAgIHsKICAgICAgICAgcHJpbnRrKCJFcnJvciBidWlsZGluZyBEb21V
OiBjYW5ub3QgcmVhZCBcIm1lbW9yeVwiIHByb3BlcnR5XG4iKTsKQEAgLTIwMjIsNyArMjAyMiw3
IEBAIHN0YXRpYyBpbnQgX19pbml0IGNvbnN0cnVjdF9kb21VKHN0cnVjdCBkb21haW4gKmQsCiAg
ICAgfQogICAgIGtpbmZvLnVuYXNzaWduZWRfbWVtID0gKHBhZGRyX3QpbWVtICogU1pfMUs7CiAK
LSAgICBwcmludGsoIioqKiBMT0FESU5HIERPTVUgY3B1cz0ldSBtZW1vcnk9JSJQUkl4NjQiS0Ig
KioqXG4iLCBkLT5tYXhfdmNwdXMsIG1lbSk7CisgICAgcHJpbnRrKCIqKiogTE9BRElORyBET01V
IGNwdXM9JXUgbWVtb3J5PSUiUFJJeDMyIktCICoqKlxuIiwgZC0+bWF4X3ZjcHVzLCBtZW0pOwog
CiAgICAga2luZm8udnBsMDExID0gZHRfcHJvcGVydHlfcmVhZF9ib29sKG5vZGUsICJ2cGwwMTEi
KTsKIAotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
