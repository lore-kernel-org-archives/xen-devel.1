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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0522BC282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 15:00:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6614217D7
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 15:00:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PITMr+MX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6614217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGm2T-0004XH-7z; Wed, 17 Apr 2019 14:59:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O1DL=ST=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hGm2S-0004XB-9W
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 14:59:52 +0000
X-Inumbo-ID: 731c5e80-6121-11e9-92d7-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 731c5e80-6121-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 14:59:51 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id f18so22748409lja.10
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2019 07:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qucunmK9xgz8gtRcruJM1bVATnlVA3EmGKtWXeWisWY=;
 b=PITMr+MXte6cMjlw6hb1w9mtzR9mkJi7ftkp7ugr9d1iMjYepdqNBFepI08rLrAmlI
 YRY3d7LYRGyu7pAsJJlHuLCliElhHer4OWXQv+q/bSBKMn7nqaXFbfLyPpzWWzkvHB71
 P0uxAFCJitnncto0OyLJTw9gdhJaqtE31CrdkIL7dcDSXfpx4Tyik49ggAMqyfmU8313
 XVMuWNClpSC2dvzI4iPepkzsoWiH+zSfSupQN0NMUqDKG22/4ZO3NONY4i57pR8rnew+
 2ZW5tgiR26ZHph1k3p7Iv2U+Glfi43Pj6Xp1rpbNUyp9n9ilY8ZQrguU6LoVxZxZPHf4
 +xUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qucunmK9xgz8gtRcruJM1bVATnlVA3EmGKtWXeWisWY=;
 b=YiGcO5T9UaaklRgj0R3qroVadlTi0AI2WYeW0FYMZsg7dlxEneXvuB/vKj6UD90Xcv
 mcMG9oMfWBcvKTtXyHcJmxff5eU2J9W+e76xgSAFTalv3dmumtCNYC/c5o7p5IT0B5Do
 bsx/Id9CV4Mfn7Uj1b6y5e7/TGz93ZXmdprQgossvXQPIpaiycvQ4NttLML7Gf3hKkP7
 wPJYwL692pJvsBbY8VG7/9pHu/8TotvUqdqVE0lP8o7Kejz1VdvDwjiRn+Cl2MhH+3PF
 LV5DvEz6V8k0Gxl5h7QWaTPy+NRi7klkHZ1dbyPo9KWEuqUPrDgFYC45xuh4ExxwXkhW
 FXYw==
X-Gm-Message-State: APjAAAW1NBHuTS8irdIKJusEzqoRM4Qt5Z0orMBF41wvApW3HAFBX0Dn
 3qEowD0EmNQG4Q2wM38QfdbDsO+ZzlE=
X-Google-Smtp-Source: APXvYqwNntwj/uvFquTpfkS4qeqayKE8ECdISVs4tXNA+tpuIng8JUIkok96MiqlYUmM4/nPVgwarg==
X-Received: by 2002:a2e:4ca:: with SMTP id a71mr48109056ljf.39.1555513189759; 
 Wed, 17 Apr 2019 07:59:49 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id u8sm950273lfi.83.2019.04.17.07.59.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 17 Apr 2019 07:59:48 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 17 Apr 2019 17:59:31 +0300
Message-Id: <1555513175-7596-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555513175-7596-1-git-send-email-olekstysh@gmail.com>
References: <1555513175-7596-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [PATCH V4 1/5] xen/arm: Clarify usage of earlyprintk
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
Message-ID: <20190417145931.a3FkzifRil0lOLROUDh_EhbZYUen-28DPYurlWqEfZs@z>

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
