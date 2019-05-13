Return-Path: <SRS0=55t9=TN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01622C04AA7
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 10:50:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1263208C2
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 10:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1263208C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ8XI-0006QK-3N; Mon, 13 May 2019 10:50:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxsn=TN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQ8XG-0006QF-Fn
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 10:50:22 +0000
X-Inumbo-ID: e762021e-756c-11e9-ba48-f3ec432a2a2c
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e762021e-756c-11e9-ba48-f3ec432a2a2c;
 Mon, 13 May 2019 10:50:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8893D374;
 Mon, 13 May 2019 03:50:20 -0700 (PDT)
Received: from [10.37.12.148] (unknown [10.37.12.148])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43F453F703;
 Mon, 13 May 2019 03:50:19 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <fa126315-31af-854e-817a-8640b431c82b@arm.com>
 <CAC1WxdiMzAq5hRC-mhRQuFDs7z_Hj5w7VAy52ec87SJQOGmp3w@mail.gmail.com>
 <a28f95a1-d9da-2caf-f4b4-013100176b02@arm.com>
 <090ce8cc-f329-fe54-4894-b7f12e3cd5a6@gmail.com>
 <3d5ccdcb-d777-e75b-f4bd-38d2d470a754@arm.com>
 <0bd113db-7851-df02-90d1-2a79bd4bedaf@gmail.com>
 <98200ea9-c21e-9d58-498d-468764209972@arm.com>
 <b7cb8324-45ae-8840-b73e-c7dd508e954e@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e10c8cb6-da7f-1ce3-f5b6-4c68a2d85a95@arm.com>
Date: Mon, 13 May 2019 11:50:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b7cb8324-45ae-8840-b73e-c7dd508e954e@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] Introduce runstate area registration
 with phys address
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190513105017.oAp_aH83Qmi-NErllfIgs4DWkJoNC6Rk6LVAxf2cAS0@z>

SGksCgpPbiA1LzgvMTkgNTowMSBQTSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBPbiAwOC4wNS4x
OSAxNzozMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBJIGhhdmVuJ3Qgc2VlbiB0aGVtIHdpdGgg
bm9rcHRpIHBsYXRmb3JtIHNvIGZhci4gSSBhbSBjdXJpb3VzIHRvIGtub3cgCj4+IHdoYXQgaXMg
eW91ciBjb25maWd1cmF0aW9uIGhlcmUuCj4gCj4gWEVOIDQuMTIgd2l0aCBvdXIgcGF0Y2hlcy4g
VGhpbiBEb20wIGlzIGEgZ2VuZXJpYyBhcm12OCBMaW51eCwgTEsgCj4gNC4xNC43NSB3aXRoIHBh
dGNoZXMgZnJvbSBSZW5lc2FzIGFuZCB1cy4KPiBEb21EIGlzIExLIDQuMTQuNzUgd2l0aCBIVyBh
c3NpZ25lZCBhbmQgZHJpdmVycy4gTEsgY29uZmlncyB5b3UgY2FuIGZpbmQgCj4gb24gbXkgZ29v
Z2xlIGRyaXZlIFsxXS4KPiAKPiBUaG9zZSBmYXVsdHMgZmlyZSBvbmx5IGZvciBEb21EIChvbiBp
dHMgc3RhcnQpLgo+IAo+PiB2Y3B1X3Nob3dfZXhlY3V0aW9uX3N0YXRlKGN1cnJlbnQpIHNob3Vs
ZCBkbyB0aGUgam9iIGhlcmUuCj4gCj4gSGVyZSBpdCBpczoKPiAKPiAoWEVOKSBkMXYyIHBhciAw
eDgwOQo+IChYRU4pIGQxdjI6IEZhaWxlZCB0byB3YWxrIHBhZ2UtdGFibGUgdmEgMHhmZmZmODAw
MDJmZjY2MzU3Cj4gKFhFTikgKioqIER1bXBpbmcgRG9tMSB2Y3B1IzIgc3RhdGU6ICoqKgo+IChY
RU4pIC0tLS1bIFhlbi00LjEyLjDCoCBhcm02NMKgIGRlYnVnPW7CoMKgIE5vdCB0YWludGVkIF0t
LS0tCj4gKFhFTikgQ1BVOsKgwqDCoCAyCj4gKFhFTikgUEM6wqDCoMKgwqAgMDAwMGZmZmZiZDI4
ZGM4OAo+IChYRU4pIExSOsKgwqDCoMKgIDAwMDBmZmZmYmQyOGU2NzQKPiAoWEVOKSBTUF9FTDA6
IDAwMDBmZmZmZTk4OTA0MTAKPiAoWEVOKSBTUF9FTDE6IGZmZmYwMDAwMDgwM2MwMDAKPiAoWEVO
KSBDUFNSOsKgwqAgNDAwMDAwMDAgTU9ERTo2NC1iaXQgRUwwdCAoR3Vlc3QgVXNlcikKClRoaXMg
b25lIGlzIGhhcHBlbmluZyB3aGVuIHRoZSBndWVzdCB3YXMgcnVubmluZyBpbiB1c2VyIG1vZGUu
IElzIGl0IAphbHdheXMgdGhlIGNhc2U/CgpBbHNvLCB5b3VyIERvbUQgLmNvbmZpZyBoYXMgQ09O
RklHX1VOTUFQX0tFUk5FTF9BVF9FTDAuIFNvIGhvdyBkbyB5b3UgCmRpc2FibGUga3B0aT8KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
