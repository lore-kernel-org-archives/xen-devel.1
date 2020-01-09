Return-Path: <SRS0=KXiY=26=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BC0C32771
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jan 2020 06:22:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EF42206ED
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jan 2020 06:22:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWXQqwNI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EF42206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipRCq-00041w-HH; Thu, 09 Jan 2020 06:22:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J+Nm=26=gmail.com=xumengpanda@srs-us1.protection.inumbo.net>)
 id 1ipRCp-00041r-9z
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 06:22:07 +0000
X-Inumbo-ID: 5bad9b4e-32a8-11ea-b1f0-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5bad9b4e-32a8-11ea-b1f0-bc764e2007e4;
 Thu, 09 Jan 2020 06:22:06 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id c26so4635173eds.8
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 22:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CaGWQkV8xMtX4X32AN82eyvYOJOcIjL3dOB6164YQ7s=;
 b=gWXQqwNIo23TxZ+h29oRL+bZ5/q7NJA7OndQfae7PQO7c5KW5d2uPv4ckKvrQfc5Pf
 EwpfYFLq5sVmpttPqHYeeRun459vVPWvCv+U1MA7m6qPF5ShdFjST9KX8p+BETYkoXy1
 OXofA42493uDhddgmmBiwy/2WbJTdPV8VFqFFCd4HZJcvt2gO/3Kv6TZvEj8WcJmm9v7
 rYUk0x8IF7XKtRbdjCkc23ZHWdBhoyacf/8MEhgaJ66b4NZLM1cO02Qj1qDjsN/Rlcof
 R8alvcGmTTIfi5QFedP5eNTjRX2f+n5XfIm2QnZz0XhQqRRbLa3YP9UJWI8DuW/FCrA3
 toeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CaGWQkV8xMtX4X32AN82eyvYOJOcIjL3dOB6164YQ7s=;
 b=LKQxAmE/bXILuuasF0Q8OezLSnEjbqh7t03TmvjyRpbG2KjxG7ri+vSKkDhif7dt9m
 j3vS1wwlkeMnr3B/NhtLpj1SablKFkHudoOjzLwLVzveyTk+5FChWhV+p5dF/Npzml13
 NHJ/dg9gV22CAe88w1VcfmmY2pCMQW0JwCZpc1TJdHuv/kPRA/6Zbnq9B0rafuXOK58f
 d3gSL+NrGcoHNNPRW3H4sQklvCiXVD/L/MYKCo4WshuiY8a2vy09PzWheIj4H5s84R7M
 eELkT+rF6gBAnBW4MUPtcDT6ZGaC/bXMNNPPiT/vRPLFoM/WmldOBvIhwkiqDBA4pAhm
 9yCQ==
X-Gm-Message-State: APjAAAUbawDuYsZBuAO35CnYcuIqZzM/so3C2n4HCcKtXCl/mQHbGY6t
 asRnvSSULF1UPSQNThmeyY27oEe2gEM0+DCmaQ==
X-Google-Smtp-Source: APXvYqyGhnqu3/XxkJ8X+/Y3bvMAdqzJboOJcLN5R88cIfangMR58maZfXyuDLq1UuSwCsw+G8Pg77xGrvn1mAWXMxE=
X-Received: by 2002:a17:906:5604:: with SMTP id
 f4mr8608022ejq.255.1578550925799; 
 Wed, 08 Jan 2020 22:22:05 -0800 (PST)
MIME-Version: 1.0
References: <20200108152328.27194-1-jgross@suse.com>
 <20200108152328.27194-6-jgross@suse.com>
In-Reply-To: <20200108152328.27194-6-jgross@suse.com>
From: Meng Xu <xumengpanda@gmail.com>
Date: Wed, 8 Jan 2020 22:21:29 -0800
Message-ID: <CAENZ-+kbmLcGqzVF4TWn1yzRFoDoMhosuhmGC1Z7=p88hVX6kg@mail.gmail.com>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [PATCH v2 5/9] xen/sched: use scratch cpumask
 instead of allocating it on the stack
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gOCwgMjAyMCBhdCA3OjI0IEFNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBJbiBydCBzY2hlZHVsZXIgdGhlcmUgYXJlIHRocmVlIGluc3RhbmNl
cyBvZiBjcHVtYXNrcyBhbGxvY2F0ZWQgb24gdGhlCj4gc3RhY2suIFJlcGxhY2UgdGhlbSBieSB1
c2luZyBjcHVtYXNrX3NjcmF0Y2guCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+Cj4gLS0tCj4gIHhlbi9jb21tb24vc2NoZWQvcnQuYyB8IDU2ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCj4KClJldmlld2VkLWJ5
OiBNZW5nIFh1IDxtZW5neHVAY2lzLnVwZW5uLmVkdT4KCk1lbmcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
