Return-Path: <SRS0=9rT6=SQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48653C10F13
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 14:34:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B3FA206BA
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 14:34:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="unqRINCy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B3FA206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFgCt-0002nJ-Ra; Sun, 14 Apr 2019 14:34:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F7+S=SQ=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hFgCs-0002nD-HG
 for xen-devel@lists.xenproject.org; Sun, 14 Apr 2019 14:34:06 +0000
X-Inumbo-ID: 5ad4768f-5ec2-11e9-92d7-bc764e045a96
Received: from mail-pl1-x643.google.com (unknown [2607:f8b0:4864:20::643])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5ad4768f-5ec2-11e9-92d7-bc764e045a96;
 Sun, 14 Apr 2019 14:34:05 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id y6so7298324pll.13
 for <xen-devel@lists.xenproject.org>; Sun, 14 Apr 2019 07:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=vsadhmPGMkvjoqUu6adWisTn4uP3qAbTzwFGmnFCz+E=;
 b=unqRINCyVoCvh3w2LKx0Eha9S+eyZhORDPuQoiDnfvUeXMKkIVQhfvfAvnHhvGVumr
 qqLQQHvUJTdcwT8l5R/K8D32HPUp0tApQAiY6W5JRYUFBWSLt4D5KBbYisjbbNtC5A0T
 z/eHHCX0ynzjrZK/okAK0c8xfKAjgWLMDINy6NQUVRPe+5SMN/gMmpcB4/Z7akQ8QL+O
 j6MuD9CzlkLTI17LG1NR/OW/ixsV2MTG+IJz+TVQeUi9yOkJnDKbztXTDp75iSMIdoY4
 u/JZ7yU0eeOfcVt2P8XR1MCd+UzEMM7TTdnAp4PEMCiS3Ro1waGKbrC/PPWI6VVTeyHf
 Qwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vsadhmPGMkvjoqUu6adWisTn4uP3qAbTzwFGmnFCz+E=;
 b=cKnxOB2cN7rGNqY6X7AlZ3O2n4Cpc9QnUIFr0MMS194fIOIlM/n8B2hSTC17Rmbqpj
 aGpTLPo+DptdjUPmMEPFhi90NMrVBa5Rn42t6OWatvfHkdsbe9IaXMgK0DhTWkR/Grwp
 fQs4taTr7VpW1ZcNcxOTqbA1QCEIx6dC64cCuVJC2DrTe/7rwwGur09u+aUGs8MUybrw
 Vrd6YWJBuuYszg1Ayopm4Q6O7pRmKKpC5A76UpyIf50Cw//UzV72YdHo0Dedp+2hduLj
 vM4v0ttmhCfVsnmoJDlfVEDj5vGKfoMOhcRaQl1bmGiDCWoctIMKtBUjGt/YKxJzkZDH
 5GdA==
X-Gm-Message-State: APjAAAXWz6RPrGllCcUcGh04NUMheFtVcmxEo5OeN/c4DHRt1h6qsz5+
 m7GEAd53LvrpPrTxxxLYj07ALEht
X-Google-Smtp-Source: APXvYqwYBD8xedG9CTqBZ4Okqf/qqa8RE70ubRYhqAz7Cj5TywGuFcfnkilAsG76upK9lF8VsaiK3g==
X-Received: by 2002:a17:902:2:: with SMTP id 2mr70125682pla.61.1555252443572; 
 Sun, 14 Apr 2019 07:34:03 -0700 (PDT)
Received: from localhost.localdomain ([106.215.44.17])
 by smtp.gmail.com with ESMTPSA id q80sm91486431pfa.66.2019.04.14.07.34.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 14 Apr 2019 07:34:02 -0700 (PDT)
From: Amit Singh Tomar <amittomer25@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Sun, 14 Apr 2019 20:03:39 +0530
Message-Id: <1555252419-17121-1-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH] xen/arm: Blacklist PMU with "arm,
 cortex-a53-pmu"
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
Cc: andre.przywara@arm.com, julien.grall@arm.com, sstabellini@kernel.org,
 Amit Singh Tomar <amittomer25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190414143339.jYXmpWUyM6rxhlw0KxjiqMxcAUTIsIYb7lZxJUic8Go@z>

QXQgdGhlIG1vbWVudCwgd2UgaGlkZSBQTVUncyBmcm9tIGRvbWFpbiAwIGFuZCBYRU4gYm9vdCBm
YWlscyBvbiBwbGF0Zm9ybVsxXQp3aGVyZSBEVFMgY29udGFpbnMgImFybSxjb3J0ZXgtYTUzLXBt
dSIgYXMgY29tcGF0aWJsZSBzdHJpbmcgZm9yIFBNVSBub2RlLgoKVGhpcyBwYXRjaCBzaW1wbHkg
YWRkcyAiYXJtLGNvcnRleC1hNTMtcG11IiB0byBsaXN0IG9mIGJsYWNrbGlzdGVkIFBNVXMuCgpb
MV06IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXEuZHRzaSNMMTI0CgpTaWduZWQtb2ZmLWJ5OiBB
bWl0IFNpbmdoIFRvbWFyIDxhbWl0dG9tZXIyNUBnbWFpbC5jb20+Ci0tLQogeGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMKaW5kZXggZDk4MzY3Ny4uYjU0NTkyYSAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jCisrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwpAQCAt
MTMzNCw2ICsxMzM0LDcgQEAgc3RhdGljIGludCBfX2luaXQgaGFuZGxlX25vZGUoc3RydWN0IGRv
bWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKICAgICAgICAgRFRfTUFUQ0hfQ09N
UEFUSUJMRSgiYXJtLGNvcnRleC1hMTUtcG11IiksCiAgICAgICAgIERUX01BVENIX0NPTVBBVElC
TEUoImFybSxjb3J0ZXgtYTUzLWVkYWMiKSwKICAgICAgICAgRFRfTUFUQ0hfQ09NUEFUSUJMRSgi
YXJtLGFybXY4LXBtdXYzIiksCisgICAgICAgIERUX01BVENIX0NPTVBBVElCTEUoImFybSxjb3J0
ZXgtYTUzLXBtdSIpLAogICAgICAgICBEVF9NQVRDSF9QQVRIKCIvY3B1cyIpLAogICAgICAgICBE
VF9NQVRDSF9UWVBFKCJtZW1vcnkiKSwKICAgICAgICAgLyogVGhlIG1lbW9yeSBtYXBwZWQgdGlt
ZXIgaXMgbm90IHN1cHBvcnRlZCBieSBYZW4uICovCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
