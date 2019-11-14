Return-Path: <SRS0=jwRU=ZG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87608C432C3
	for <xen-devel@archiver.kernel.org>; Thu, 14 Nov 2019 16:07:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48FC420672
	for <xen-devel@archiver.kernel.org>; Thu, 14 Nov 2019 16:07:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxB3YsoP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48FC420672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVHeW-0001Hl-K6; Thu, 14 Nov 2019 16:07:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v7RF=ZG=gmail.com=2rushikeshj@srs-us1.protection.inumbo.net>)
 id 1iVHeV-0001Hg-6a
 for xen-devel@lists.xen.org; Thu, 14 Nov 2019 16:07:23 +0000
X-Inumbo-ID: d6fb52d6-06f8-11ea-b678-bc764e2007e4
Received: from mail-ed1-x532.google.com (unknown [2a00:1450:4864:20::532])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6fb52d6-06f8-11ea-b678-bc764e2007e4;
 Thu, 14 Nov 2019 16:07:22 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id m13so5444411edv.9
 for <xen-devel@lists.xen.org>; Thu, 14 Nov 2019 08:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=gl9tNAoqxLPiExbYe0LH93xrpYOXlqH6GXT56sWhnPY=;
 b=lxB3YsoPwSNYvNPEsQW+t88V5cAinxceoCWaOA7EgQBJaab41zI9R+g1hhrv8GAbxq
 faVFJcqrmYcffl97xrii8LtwxkUqXd+DHvD+0qCS0FWg3DPUMGG+iQvdrvbiMH2bTlhe
 CecXZBSuUpAo1C9QN9Al4f0PFjmeC21Xsp4g7Rt+NAK0PbOYCPc+b8cvdrJBhVK6soCV
 PaTYXqWydcZSqOkpJusT7kaQN0Rqow7HQZnJfWlAVW/xCHiKfgQxW6GBry0k77zTH1Bo
 7jLQJ6gSRW3/lDJmzjscIBg8cKd2hCAuQubFns+FB+BsBkBdW0lpIbGlklOnck1jvn7+
 QaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gl9tNAoqxLPiExbYe0LH93xrpYOXlqH6GXT56sWhnPY=;
 b=hpNGRDL/UayTz0r9q92XroJwojmlsG1HqkEPc2fTSNmJD3t/JvqYwJvdSZ7//UKrM8
 26DOVb9VMF1Hs5eLyw9dqzCnLO4astq6k//JqHDSBmRJeASJrMqQ0ukOmSbHAqkn/NAn
 6uafhqNLd+joq81DbyVXGoA1AbIaDWGyhxQoLiKzzjjZOz4Kbj2mGT5pr431q/2BDR0X
 eTiGxUgU73r7LQJEkybWjo29G27hdeM37jGdc7mxVbja50EaJ1PVaSjYCyEjnP4mDNjZ
 wsnixCUftA6icukulhNsW5besSi46l+mrKbwlTkX8VCsdvm7UZktNik5IygIzARYPdX6
 toXg==
X-Gm-Message-State: APjAAAX5DC6k7Uw3Ic6o+J4nMmIU4TaY37VAs/PmlQ0VjuRYTVlysq4v
 cq0nfYY3QImngk+Coqn9h77l0A6O9CyF/Q9ChmYwssMN
X-Google-Smtp-Source: APXvYqz4txdlda8aMg8m1juMprdcwNmTrihE9m0Qx9VtXD2mCB90IZo9AKttL5EqJHZtUCFII2hbpSgZi32cYrQdoLQ=
X-Received: by 2002:a05:6402:502:: with SMTP id
 m2mr2124167edv.65.1573747641038; 
 Thu, 14 Nov 2019 08:07:21 -0800 (PST)
MIME-Version: 1.0
From: Rishi <2rushikeshj@gmail.com>
Date: Thu, 14 Nov 2019 21:37:10 +0530
Message-ID: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
To: xen-devel@lists.xen.org
Subject: [Xen-devel] Xen hiding thermal capabilities from Dom0
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

SGksCgpJbiBzb21lIG9mIG91ciBob3N0cywgWGVuIGlzIG5vdCBjb3JyZWN0bHkgZXhwb3Npbmcg
cHJvY2Vzc29yIHRoZXJtYWwKY2FwYWJpbGl0aWVzIHRvIERvbTAuClBsZWFzZSByZWZlcjogaHR0
cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUzNDcKClRoZSBmbGFn
Ci8qIFRoZXJtYWwgYW5kIFBvd2VyIE1hbmFnZW1lbnQgTGVhZiwgQ1BVSUQgbGV2ZWwgMHgwMDAw
MDAwNiAoRUFYKSwgd29yZCAxNCAqLwpYODZfRkVBVFVSRV9EVEhFUk0gKDE0KjMyKyAwKQoKaXMg
cmV0dXJuZWQgMCB2aWEgUFZPUF9WQ0FMTDQgdnMgcmV0dXJucyAxIHZpYSBuYXRpdmVfY3B1aWQo
KSBjYWxsIGZyb20gRG9tMC4KClNhbXBsZSBvdXRwdXQgdmlhIFBWQ0FMTCB2cyBOYXRpdmUgY2Fs
bC4KWzYzMjkxLjY4ODc1NV0gY3B1aWRfZWF4IDYgOiAgYSAwCls2MzI5MS42ODg3NTldIG5hdGl2
ZV9jcHVpZCA6IGEgNzcKCklzIHRoaXMgYSBidWcgb3IgbmVlZHMgc29tZSBzcGVjaWFsIGZlYXR1
cmUgdG8gYmUgZW5hYmxlZCBmcm9tIFhlbiBjb21tYW5kIGxpbmU/CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
