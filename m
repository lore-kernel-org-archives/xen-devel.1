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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531EEC10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:15:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23B5620880
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:15:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tD7Pi+qd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23B5620880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDRIt-0003mO-9o; Mon, 08 Apr 2019 10:15:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=agIW=SK=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hDRIr-0003lr-R0
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 10:15:01 +0000
X-Inumbo-ID: 2ac39585-59e7-11e9-92d7-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2ac39585-59e7-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 10:15:01 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f23so10726286ljc.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2019 03:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qucunmK9xgz8gtRcruJM1bVATnlVA3EmGKtWXeWisWY=;
 b=tD7Pi+qdvjqpW3r9aG8gWFuhH51F8205ntSRehtwQMoqkin6/PSv1Em/uPw38b7H+G
 aX4PLvwQQnWFKPYBWoe6GXezbMaLokdlSm3sEAPUkeXmHt/pvh8x4t2cxK5A/IjvALgJ
 rnpQY1QDEzE9saoWZu9vDZhItpucLu8F8bYcH6LD50bJX/CwY87297ik3xRrO4TyMrv9
 IPmQOi5bwMitCF42d4XPkO6s8E0fMgk/zITPKriYCxUdQ6Tb0Dfg2Xe3UQ9uXSUBuNK2
 b4zapqW4214mM05p9/X8E22QhONAb7DtBVh6vEjsQbRHboQ52AFMDdWl4GBQrD/xwgVi
 CtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qucunmK9xgz8gtRcruJM1bVATnlVA3EmGKtWXeWisWY=;
 b=KWjRtq7rkNsoQyjQbpSrhu8eZMfi8SJtemdqsCA3ZFHtlbUQrMU7/Anvo5lzRnAmMq
 CDEs98eoZqCCJ+n4lxSD4t/0cwiJUgTSEei4/0eAUR4b73/eBg4mfvGKSMOUhOgfrzv/
 Usg3D4tSIYGK7yQwG34rk28U6ITdLqMBW6GurdKiczWzwQUzlZVm3brA495q72CedpDm
 IvQb+kq6n30h2Dc9lW4AIPnXUDipo46Ehu38uh/3Da5XW2fmOBTY/agp8yge9OXyvA+B
 nuiJpWPOI+PzRgnh2lfs86DRwBQ67/WQO7RMeSRwfDyWzsKKBsMRh/KKCcUOuQmmZHhK
 sqkQ==
X-Gm-Message-State: APjAAAVMQOqCsdVttATCEwKHiXIe6iKFZJKuseA+3OgWJBogCLSRdjhB
 kE1Nl3G7DsrKEf0qYSiKKSWml/H9qXo=
X-Google-Smtp-Source: APXvYqzOHJlMDJzxx5EXMO9HRIPvtrfrHsasNXQ9m8hakWs/d89GG3Q7ClPVkerUrq0i/TXU23OCgg==
X-Received: by 2002:a2e:9843:: with SMTP id e3mr381201ljj.28.1554718499494;
 Mon, 08 Apr 2019 03:14:59 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id x30sm6275717ljd.38.2019.04.08.03.14.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 08 Apr 2019 03:14:58 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  8 Apr 2019 13:14:45 +0300
Message-Id: <1554718489-11318-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554718489-11318-1-git-send-email-olekstysh@gmail.com>
References: <1554718489-11318-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [PATCH V3 1/5] xen/arm: Clarify usage of earlyprintk
 for Lager board
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
Message-ID: <20190408101445.DnrXBXAccZ2fZXwfooWM4YjaxxbWAAdNIsFphvKAKss@z>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKQ3VycmVudCBzZW50ZW5jZSBpcyBub3QgZW50aXJlbHkgY29ycmVjdC4gU2luY2UgU0NJRjAg
aW50ZXJmYWNlIGlzCmFwcGxpY2FibGUgZm9yIExhZ2VyIGJvYXJkLCBidXQgaXMgbm90IGFwcGxp
Y2FibGUgZm9yIGFsbCBSLUNhciBIMgpiYXNlZCBib2FyZHMuIEZvciBleGFtcGxlLCBTdG91dCBi
b2FyZCB1c2VzIFNDSUZBMCBpbnRlcmZhY2UuCgpTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlz
aGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+CkFja2VkLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIGRvY3MvbWlzYy9hcm0vZWFybHktcHJp
bnRrLnR4dCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9hcm0vZWFybHktcHJpbnRrLnR4dCBiL2RvY3Mv
bWlzYy9hcm0vZWFybHktcHJpbnRrLnR4dAppbmRleCBmNzY1ZjU5Li5iMjNjNTRmIDEwMDY0NAot
LS0gYS9kb2NzL21pc2MvYXJtL2Vhcmx5LXByaW50ay50eHQKKysrIGIvZG9jcy9taXNjL2FybS9l
YXJseS1wcmludGsudHh0CkBAIC0zOSw3ICszOSw3IEBAIHRoZSBuYW1lIG9mIHRoZSBtYWNoaW5l
OgogICAtIGZhc3Rtb2RlbDogcHJpbnRrIG9uIEFSTSBGYXN0bW9kZWwgc29mdHdhcmUgZW11bGF0
b3JzCiAgIC0gaGlrZXk5NjA6IHByaW50ayB3aXRoIHBsMDExIHdpdGggSGlrZXkgOTYwCiAgIC0g
anVubzogcHJpbnRrIHdpdGggcGwwMTEgb24gSnVubyBwbGF0Zm9ybQotICAtIGxhZ2VyOiBwcmlu
dGsgd2l0aCBTQ0lGMCBvbiBSZW5lc2FzIFItQ2FyIEgyIHByb2Nlc3NvcnMKKyAgLSBsYWdlcjog
cHJpbnRrIHdpdGggU0NJRjAgb24gUmVuZXNhcyBMYWdlciBib2FyZCAoUi1DYXIgSDIgcHJvY2Vz
c29yKQogICAtIG1pZHdheTogcHJpbnRrIHdpdGggdGhlIHBsMDExIG9uIENhbHhlZGEgTWlkd2F5
IHByb2Nlc3NvcnMKICAgLSBtdmVidTogcHJpbnRrIHdpdGggdGhlIE1WRUJVIGZvciBNYXJ2ZWxs
IEFybWFkYSAzNzAwIFNvQ3MKICAgLSBvbWFwNTQzMjogcHJpbnRrIHdpdGggVUFSVDMgb24gVEkg
T01BUDU0MzIgcHJvY2Vzc29ycwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
