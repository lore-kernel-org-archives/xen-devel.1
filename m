Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE1DC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 10:09:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EFAC20857
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 10:09:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vh+b/N/N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EFAC20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDngq-0000lJ-MM; Tue, 09 Apr 2019 10:09:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4LGk=SL=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hDngp-0000lE-KO
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 10:09:15 +0000
X-Inumbo-ID: 873ff889-5aaf-11e9-92d7-bc764e045a96
Received: from mail-ot1-x344.google.com (unknown [2607:f8b0:4864:20::344])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 873ff889-5aaf-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 10:09:14 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id o74so15011116ota.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2019 03:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SE/vnFSuM8p8IJDAy0dd1I2JzsrkFKc4pA1Aw02rtEw=;
 b=Vh+b/N/NnLiniqu+T9ydYn4hqlgmU2V3EOrr/pnsBkuXArmFphlEAkfE5Co47afrfp
 kTBGUzOhzsAq7EYSAKHUoy1Sss1rWKFmAh6HDPH2YR8XTsd/gsxIZtyhSnTAf2VZ8+Mx
 32oBKLW/M14mANaIA9jvriqA/e8KShN2ztkJXVxEs0lEAB9vxm0yPiKiJJj9INOSUwfW
 rtxNDhTp8tNsE8Jn0Fcn+LV/gbn73ZhMIrk8O+zCKGSl1fIs8SdCbzCQnG4ToNvBPWb9
 0585QB3RAn1gmOndpSxeT9Gj7ju7MNUtL/FDV5ZshovpPsqnkCNkqwRlXyzlp1T5f/wl
 aDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SE/vnFSuM8p8IJDAy0dd1I2JzsrkFKc4pA1Aw02rtEw=;
 b=KfP9wyWKDeNJYxhcmzuYTXI9IyQPfpwQAypw7jlCwEMcODbobdKoODQTebVBLOX95p
 /OUvRpOK3C0dEbMZyB0cYiI+D+eutN1dbR8uUHUNcyxByJ5mhsrUOEkuSS/Hd83oA/xA
 s9rTwibewe3aEvx98c2i/9awfjY9lwnHCf17dXCOBkPpuKZoBLeT/bpozEKrwfLwTn9X
 U3M2xAc6G1BZ3rTDEWrGXxH5fQZmQDSW0KMpYGSLnVGVckAd7jE031PJ+EJojb0eTN6z
 q+Tjdl8+4ofNnWo7kTkPrGkj7thKTxYHBspokw8c5/UDb25nsBreH9H9UEcbBHpkSltt
 lYhQ==
X-Gm-Message-State: APjAAAVdDvb6GPm1FFllSjlPO2M1chzxV2EtNhOY0h7MlZMMmHfn3Ea9
 HFS5/W8DGdAl5+B77xQiGut351VxPW3xbH/EMtk=
X-Google-Smtp-Source: APXvYqxmyP7t4GwXVPYx/yK6hzYu4kwNZlu2Cd/pKAZR1Y7dwPKAuscJN+s5HSqLcR7sU9e1u4Xbz+ldt8lI5dzhX0Q=
X-Received: by 2002:a05:6830:185:: with SMTP id
 q5mr22217886ota.245.1554804554093; 
 Tue, 09 Apr 2019 03:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <1553163935-12862-1-git-send-email-amittomer25@gmail.com>
 <1553163935-12862-2-git-send-email-amittomer25@gmail.com>
 <5f956c43-6885-3553-2f37-bb9ce48e981b@arm.com>
 <cd327f36-09db-f322-4675-30140839e159@arm.com>
In-Reply-To: <cd327f36-09db-f322-4675-30140839e159@arm.com>
From: Amit Tomer <amittomer25@gmail.com>
Date: Tue, 9 Apr 2019 15:39:02 +0530
Message-ID:
 <CABHD4K8R7wyA=yGdfdVvsb21Ewyb3buAbhTCsJVuFuLNvGqV6A@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH v2 2/3] xen/arm: Add MESON UART driver for
 Amlogic Meson SoCs
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
Cc: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409100902.C-RIHRNVd-TbaqI6G89ysSB36Ke3MVHcajroAvEU8ho@z>

SGVsbG8sCgpPbiBUdWUsIEFwciA5LCAyMDE5IGF0IDM6MDkgUE0gSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIDAyLzA0LzIwMTkgMjE6MDEs
IEFuZHLDqSBQcnp5d2FyYSB3cm90ZToKPiA+IE9uIDIxLzAzLzIwMTkgMTA6MjUsIEFtaXQgU2lu
Z2ggVG9tYXIgd3JvdGU6Cj4gPj4gVGhpcyBwYXRjaCBhZGRzIGRyaXZlciBmb3IgVUFSVCBjb250
cm9sbGVyIHByZXNlbnQgb24gQW1sb2dpYyBNZXNvbgo+ID4+IFNvQ3MgYW5kIGl0IGhhcyBiZWVu
IHRlc3RlZCBvbiBOYW5vcGkgSzIgYm9hcmQgYmFzZWQgb24gUzkwNSBTb0MuCj4gPj4KPiA+PiBD
b250cm9sbGVyIHJlZ2lzdGVycyBkZWZpbmF0aW9uIGlzIHRha2VuIGZyb20gTGludXggNC4yMC4K
PiA+PiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi92NC4yMC1yYzEvZHJp
dmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQW1p
dCBTaW5naCBUb21hciA8YW1pdHRvbWVyMjVAZ21haWwuY29tPgo+ID4KPiA+IFRoYW5rcyBmb3Ig
dGhlIGNoYW5nZXMhCj4gPgo+ID4gUmV2aWV3ZWQtYnk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5w
cnp5d2FyYUBhcm0uY29tPgo+Cj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+CgpUaGFua3MuCgo+IEkgaGF2ZSBjb21taXR0ZWQgdGhpcyBwYXRjaCBhbmQgdGhl
IGZvbGxvd2luZyBwYXRjaC4gUGxlYXNlIHJlc2VuZCB0aGUgZmlyc3QKPiBwYXRjaCB3aXRoIHRo
ZSBjb21tZW50cyBhZGRyZXNzZWQuCgpJcyBpdCB0aGUgcGF0Y2ggd2l0aCBmb2xsb3dpbmcgc3Vi
amVjdDoKW1BBVENIIHYyIDEvM10geGVuL2FybTogQWRkIEFtbG9naWMgTWVzb24gU29DcyBlYXJs
eXByaW50ayBzdXBwb3J0CgpSZWFsbHksIGNvdWxkbid0IGZpbmQgYW55IGNvbW1lbnRzIG92ZXIg
dGhlcmUuCgotQW1pdC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
