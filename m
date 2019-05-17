Return-Path: <SRS0=3Sku=TR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B578C04AB4
	for <xen-devel@archiver.kernel.org>; Fri, 17 May 2019 11:26:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7A6F218DA
	for <xen-devel@archiver.kernel.org>; Fri, 17 May 2019 11:26:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHlde0iH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7A6F218DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRazq-0001Nt-QK; Fri, 17 May 2019 11:25:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FnXM=TR=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hRazp-0001Nn-MS
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 11:25:53 +0000
X-Inumbo-ID: 87b44642-7896-11e9-8980-bc764e045a96
Received: from mail-io1-xd2d.google.com (unknown [2607:f8b0:4864:20::d2d])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 87b44642-7896-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 11:25:53 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id s20so5173322ioj.7
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2019 04:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=izdELPPKokmrU6A/tkkkAEAYpeysJlh3IJoxlxsyyA8=;
 b=kHlde0iHf93YZ8fNHZRm3qF0behQCIZXw1jUD4Elm8ITjAqUS7Af0srsjyFXUY6o13
 GVyh72dY7jFWc27JnvCmZmFvnJGMKKaK6I15cjRQVPDXKFEzGJdogVdkLFYaNN1gY9G/
 wg5kbEmmWCq8OEeJfDbEloK67OjNguQ7fsiWE0ccuyfQu9Z/5b4KnvhKtE0ycbJV3rA9
 OELTRVT0visXeZU+MFq0TRRCOClyZJYPML6e4DwePh1iVU6/1Rh3wgDH3zFNpPGXY5e5
 etHDFAcgTbmcZXIRwgkvAKrMYlTxgF1SjwVBxAj5Jm4AC6p/hdYEiS1sbFSAX4skPHfr
 QNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=izdELPPKokmrU6A/tkkkAEAYpeysJlh3IJoxlxsyyA8=;
 b=WBwSvTZyuarQCeF68MHapOk/RR6BIWNgGSVOd3aoMMvmWaC/ofOi4p8mCfQlYeXRJ7
 UPVzWKB0vac8UXksDxSUegtFFsMwkkhtMjQ57ukwycG4Qc1YmJx6vKy2AZpgdmyMbxRL
 h+G+d5pqn+fKgaGYF5/Rlq8CWLdKlAHP4mHfFerTsYwCWb3LRlG5hPyfopKiAC0fHrhT
 XZIQXg5hNFZEdfdcQQh/2ckSESXwuTVrPuUYRFWee1zx/RfzV+aWo4C3z0VM2SVJYLBk
 YKK3Ud6cs/9jLbZR6Wo4YGkIDg4ZpaAlD620j7Df1JADGNPa1FNdVetigkh76kmsSjdR
 uwZw==
X-Gm-Message-State: APjAAAUXznzZGuN1UkcscjsEx5qIkVA/ihgEf+yrhNMIZcNOicUvg+4M
 9zdFPXKS8AMyx5m9TcCBFZKpgMTMxfyaVaqRoSA=
X-Google-Smtp-Source: APXvYqxVYwn2JUYnoXDVUrUGRBEXaoFqMS70MwNiU8jxrfQBo7w7u9E0QcJiZQ+jOfZSUmpK7m4J8MTkL9xhyle+Ppk=
X-Received: by 2002:a6b:6c07:: with SMTP id a7mr22281328ioh.256.1558092352508; 
 Fri, 17 May 2019 04:25:52 -0700 (PDT)
MIME-Version: 1.0
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Fri, 17 May 2019 14:25:41 +0300
Message-ID:
 <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
To: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Subject: [Xen-devel] libxc: Casting of xen virtual address type xen_vaddr_t
 to signed int64 type: (int64_t)vaddr
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190517112541.Yn6_mC97sBi9u0-ocYqqV3POS5QaSwvbHar-j45KAyY@z>

SGkgQWxsLAoKV2hpbGUgbG9va2luZyBhdCBjb2RlIGluIHRvb2xzL2xpYnhjL3hjX3NyX3NhdmVf
eDg2X3B2LmMsCndlIHNlZSB0aGF0IHRoZXJlIGlzIGNhc3Rpbmcgb2YgeGVuIHZpcnR1YWwgYWRk
cmVzcyB0eXBlIHhlbl92YWRkcl90CnRvIHNpZ25lZCBpbnQ2NCB0eXBlLgpJbiBjb21taXQ6IDdi
Zjc0NTgyYjM0MzYwM2NiMDgyNmQ4MDhjZDdkYTQzMzI2NDUyYTUKCisvKiBDaGVjayBhIDY0IGJp
dCB2aXJ0dWFsIGFkZHJlc3MgZm9yIGJlaW5nIGNhbm9uaWNhbC4gKi8KK3N0YXRpYyBpbmxpbmUg
Ym9vbCBpc19jYW5vbmljYWxfYWRkcmVzcyh4ZW5fdmFkZHJfdCB2YWRkcikKK3sKKyAgICByZXR1
cm4gKChpbnQ2NF90KXZhZGRyID4+IDQ3KSA9PSAoKGludDY0X3QpdmFkZHIgPj4gNjMpOworfQoK
SXQgc2VlbXMgdGhlcmUgaXMgbm8gbmVlZCB0byBjYXN0IHZhZGRyIHZhcmlhYmxlLiBJdCBsb29r
cyBsaWtlCnNoaWZ0aW5nIHZhZGRyIHNpZ25lZCA2NC1iaXQgdmFsdWUgYnkgNjMgYml0cyBpbnRy
b2R1Y2VzIHVuZGVmaW5lZApiZWhhdmlvci4gQ291bGQgeW91IHBsZWFzZSBkZXNjcmliZSB3aGF0
IGlzIHRoZSByZWFzb24gZm9yIHRoaXMKY2FzdGluZz8KClRoYW5rcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
