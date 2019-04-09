Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711DBC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 09:33:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DED220833
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 09:33:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ulTtk/ld"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DED220833
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDn8Q-00064g-0p; Tue, 09 Apr 2019 09:33:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PY99=SL=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1hDn8O-00064b-CR
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 09:33:40 +0000
X-Inumbo-ID: 8e08ebd5-5aaa-11e9-92d7-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8e08ebd5-5aaa-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 09:33:39 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v22so13817266lje.9
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2019 02:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=bpEoroqe8Vp8JLe+a+fB4DDSJyjMUy4xWQYTUs11Mmk=;
 b=ulTtk/ldw8xNleyN3RVmoSUh+pryf5vYaxnMBc7yrLdV2lD5r4uN4c7PGg87IIXPEV
 cS4KKVbcPR7pyV67YkQRGRl0fx2gEDj1DBYti7JqSosJQ4Dzq0lrl0s5hwineeOvWUTt
 hhw/6o8wKDZUTCb/hfqvGsVaNRPC8sK9yS6pDgc+RDrtGM1lak29gs1TSQgjrmVdhcob
 MDvKQ/kwJkcY3KyzCKqz+z5/OU4sAr4CIgjzwoNTSbWyvJmVPghVMrpYTx226hu+S/Nw
 AB65htVdPEDo1eTWkSrSYVcrvVN910btnUMtMb6nm+7CNAIaVNgyC67cBZpgoIrhpp8d
 dWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bpEoroqe8Vp8JLe+a+fB4DDSJyjMUy4xWQYTUs11Mmk=;
 b=UKCWN5nnxSgQKubQv4axCPGmXNsqZE8zjB54QADNy7gSksjkDlHeSHTvz2PM9jfTZi
 72GT11U0hrDaOtsnoTasfwd6NHKr14HRYmPkNzcnrIbosYqILK+QWUVsZa6alCNsGppG
 67ZanG5WF0aFlQFkCKbd66cwxQM11CdXy7vPkuiikVmKUGFkY5Ucr0CEPL/XO69XqX7S
 FEr+2xt5jQeo1sSzlYPeVFN6ird2TotVti7EtGaBHACXAbU9A4kRAwKNGbrb2EZG3kz1
 QubcsBy4r89yq7rbDwAeMM9dmleUWqtQpmKOICl/EzVQig6d9Y5B/uEAcXwNLioko/7T
 jTIw==
X-Gm-Message-State: APjAAAUvUoa/pRO9A8VvZXZM5Hqgd1qwdUe92Y58Qz8QlkIEJorypSly
 kxsFVYlxDpoyNUvMpJKNsVI=
X-Google-Smtp-Source: APXvYqxekaf2DHxVXGAH2Dwda6xobUOhybMUtpuSHHOTSQK0kCJME2+6aS3ngvsCpi9qdcBI+kHdtQ==
X-Received: by 2002:a2e:128a:: with SMTP id 10mr18570150ljs.170.1554802417981; 
 Tue, 09 Apr 2019 02:33:37 -0700 (PDT)
Received: from [10.17.182.20] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 a7sm6398830lfo.8.2019.04.09.02.33.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Apr 2019 02:33:37 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 konrad.wilk@oracle.com, hverkuil@xs4all.nl, boris.ostrovsky@oracle.com
References: <20190409091546.9606-1-andr2000@gmail.com>
 <9b9ba6b9-f045-80e2-fe8a-595728fb1ec0@suse.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <5bb8c828-b0ae-86c3-dacf-88bf6032dd6f@gmail.com>
Date: Tue, 9 Apr 2019 12:33:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9b9ba6b9-f045-80e2-fe8a-595728fb1ec0@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/cameraif: add ABI for para-virtual
 camera
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
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNC85LzE5IDEyOjI4IFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDA5LzA0LzIwMTkg
MTE6MTUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBGcm9tOiBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4+Cj4+IFRo
aXMgaXMgdGhlIEFCSSBmb3IgdGhlIHR3byBoYWx2ZXMgb2YgYSBwYXJhLXZpcnR1YWxpemVkCj4+
IGNhbWVyYSBkcml2ZXIgd2hpY2ggZXh0ZW5kcyBYZW4ncyByZWFjaCBtdWx0aW1lZGlhIGNhcGFi
aWxpdGllcyBldmVuCj4+IGZ1cnRoZXIgZW5hYmxpbmcgaXQgZm9yIHZpZGVvIGNvbmZlcmVuY2lu
ZywgSW4tVmVoaWNsZSBJbmZvdGFpbm1lbnQsCj4+IGhpZ2ggZGVmaW5pdGlvbiBtYXBzIGV0Yy4K
Pj4KPj4gVGhlIGluaXRpYWwgZ29hbCBpcyB0byBzdXBwb3J0IG1vc3QgbmVlZGVkIGZ1bmN0aW9u
YWxpdHkgd2l0aCB0aGUKPj4gZmluYWwgaWRlYSB0byBtYWtlIGl0IHBvc3NpYmxlIHRvIGV4dGVu
ZCB0aGUgcHJvdG9jb2wgaWYgbmVlZCBiZToKPj4KPj4gMS4gUHJvdmlkZSBtZWFucyBmb3IgYmFz
ZSB2aXJ0dWFsIGRldmljZSBjb25maWd1cmF0aW9uOgo+PiAgIC0gcGl4ZWwgZm9ybWF0cwo+PiAg
IC0gcmVzb2x1dGlvbnMKPj4gICAtIGZyYW1lIHJhdGVzCj4+IDIuIFN1cHBvcnQgYmFzaWMgY2Ft
ZXJhIGNvbnRyb2xzOgo+PiAgIC0gY29udHJhc3QKPj4gICAtIGJyaWdodG5lc3MKPj4gICAtIGh1
ZQo+PiAgIC0gc2F0dXJhdGlvbgo+PiAzLiBTdXBwb3J0IHN0cmVhbWluZyBjb250cm9sCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVz
aGNoZW5rb0BlcGFtLmNvbT4KPj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
Pj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPj4g
Q2M6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWxAeHM0YWxsLm5sPgo+IEknbSBpbiBwcmluY2lwbGUg
ZmluZSB3aXRoIHRoaXMgcGF0Y2gsIGJ1dCBpdCBzaG91bGQgYmUgc2VudCBhcyBwYXJ0IG9mCj4g
YSBzZXJpZXMgdXNpbmcgdGhhdCBoZWFkZXIuIEluIGNhc2UgdGhlIHJlbGF0ZWQgZHJpdmVyIGlz
bid0IGFjY2VwdGVkCj4gd2UnZCBlbmQgdXAgd2l0aCBhIHN0YWxlIGhlYWRlciBmaWxlLgpIbSwg
SSBhbSBkb2luZyB0aGlzIGFzIEkgZGlkIGZvciB0aGUgcmVzdCBvZiBwcm90b2NvbHMgYmVmb3Jl
OgoxLiBHZXQgdGhlIHByb3RvY29sIGluIFhlbgoyLiBHZXQgdGhlIGNvcHkgaW4gTGludXgKMy4g
VXBzdHJlYW0gZHJpdmVyICh1c2UgaGVhZGVyKQoKRXZlbiBpZiB0aGUgZHJpdmVyIGlzIG5vdCBh
Y2NlcHRlZCAoaG9wZSB0aGlzIHdvbid0IGhhcHBlbikKdGhlbiB0aGlzIHBhdGNoIG1ha2VzIFhl
biBhbmQgTGludXggcHJvcGVybHkgYWxpZ25lZCBhbnl3YXkuCldoaWNoIGlzIElNTyBnb29kCj4K
PiBKdWVyZ2VuClRoYW5rIHlvdSwKT2xla3NhbmRyCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
