Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A117C282CE
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 09:47:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D419620830
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 09:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D419620830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDnLF-0007Nk-Gq; Tue, 09 Apr 2019 09:46:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EaEz=SL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hDnLE-0007Nf-Oe
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 09:46:56 +0000
X-Inumbo-ID: 68069762-5aac-11e9-b532-537742fac0e2
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68069762-5aac-11e9-b532-537742fac0e2;
 Tue, 09 Apr 2019 09:46:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 59DA2AD03;
 Tue,  9 Apr 2019 09:46:53 +0000 (UTC)
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, konrad.wilk@oracle.com, hverkuil@xs4all.nl,
 boris.ostrovsky@oracle.com
References: <20190409091546.9606-1-andr2000@gmail.com>
 <9b9ba6b9-f045-80e2-fe8a-595728fb1ec0@suse.com>
 <5bb8c828-b0ae-86c3-dacf-88bf6032dd6f@gmail.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <303b7d57-1785-62b3-fac0-a3e947e691c4@suse.com>
Date: Tue, 9 Apr 2019 11:46:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <5bb8c828-b0ae-86c3-dacf-88bf6032dd6f@gmail.com>
Content-Language: de-DE
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDQvMjAxOSAxMTozMywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4gT24g
NC85LzE5IDEyOjI4IFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAwOS8wNC8yMDE5IDEx
OjE1LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+IEZyb206IE9sZWtzYW5kciBB
bmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPj4+Cj4+PiBU
aGlzIGlzIHRoZSBBQkkgZm9yIHRoZSB0d28gaGFsdmVzIG9mIGEgcGFyYS12aXJ0dWFsaXplZAo+
Pj4gY2FtZXJhIGRyaXZlciB3aGljaCBleHRlbmRzIFhlbidzIHJlYWNoIG11bHRpbWVkaWEgY2Fw
YWJpbGl0aWVzIGV2ZW4KPj4+IGZ1cnRoZXIgZW5hYmxpbmcgaXQgZm9yIHZpZGVvIGNvbmZlcmVu
Y2luZywgSW4tVmVoaWNsZSBJbmZvdGFpbm1lbnQsCj4+PiBoaWdoIGRlZmluaXRpb24gbWFwcyBl
dGMuCj4+Pgo+Pj4gVGhlIGluaXRpYWwgZ29hbCBpcyB0byBzdXBwb3J0IG1vc3QgbmVlZGVkIGZ1
bmN0aW9uYWxpdHkgd2l0aCB0aGUKPj4+IGZpbmFsIGlkZWEgdG8gbWFrZSBpdCBwb3NzaWJsZSB0
byBleHRlbmQgdGhlIHByb3RvY29sIGlmIG5lZWQgYmU6Cj4+Pgo+Pj4gMS4gUHJvdmlkZSBtZWFu
cyBmb3IgYmFzZSB2aXJ0dWFsIGRldmljZSBjb25maWd1cmF0aW9uOgo+Pj4gwqAgLSBwaXhlbCBm
b3JtYXRzCj4+PiDCoCAtIHJlc29sdXRpb25zCj4+PiDCoCAtIGZyYW1lIHJhdGVzCj4+PiAyLiBT
dXBwb3J0IGJhc2ljIGNhbWVyYSBjb250cm9sczoKPj4+IMKgIC0gY29udHJhc3QKPj4+IMKgIC0g
YnJpZ2h0bmVzcwo+Pj4gwqAgLSBodWUKPj4+IMKgIC0gc2F0dXJhdGlvbgo+Pj4gMy4gU3VwcG9y
dCBzdHJlYW1pbmcgY29udHJvbAo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRy
dXNoY2hlbmtvCj4+PiA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4+PiBDYzog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsg
V2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPj4+IENjOiBIYW5zIFZlcmt1aWwgPGh2ZXJr
dWlsQHhzNGFsbC5ubD4KPj4gSSdtIGluIHByaW5jaXBsZSBmaW5lIHdpdGggdGhpcyBwYXRjaCwg
YnV0IGl0IHNob3VsZCBiZSBzZW50IGFzIHBhcnQgb2YKPj4gYSBzZXJpZXMgdXNpbmcgdGhhdCBo
ZWFkZXIuIEluIGNhc2UgdGhlIHJlbGF0ZWQgZHJpdmVyIGlzbid0IGFjY2VwdGVkCj4+IHdlJ2Qg
ZW5kIHVwIHdpdGggYSBzdGFsZSBoZWFkZXIgZmlsZS4KPiBIbSwgSSBhbSBkb2luZyB0aGlzIGFz
IEkgZGlkIGZvciB0aGUgcmVzdCBvZiBwcm90b2NvbHMgYmVmb3JlOgo+IDEuIEdldCB0aGUgcHJv
dG9jb2wgaW4gWGVuCj4gMi4gR2V0IHRoZSBjb3B5IGluIExpbnV4Cj4gMy4gVXBzdHJlYW0gZHJp
dmVyICh1c2UgaGVhZGVyKQoKU29ycnkgZm9yIG5vdCBoYXZpbmcgZG9uZSB0aGUgcmV2aWV3IHBy
b3Blcmx5IGluIHRoZSBwYXN0LiA7LSkKCj4gRXZlbiBpZiB0aGUgZHJpdmVyIGlzIG5vdCBhY2Nl
cHRlZCAoaG9wZSB0aGlzIHdvbid0IGhhcHBlbikKPiB0aGVuIHRoaXMgcGF0Y2ggbWFrZXMgWGVu
IGFuZCBMaW51eCBwcm9wZXJseSBhbGlnbmVkIGFueXdheS4KPiBXaGljaCBpcyBJTU8gZ29vZAoK
SGF2aW5nIGFuIHVudXNlZCBoZWFkZXIgZmlsZSBpcyBub3QgZ29vZC4KCkJlIGFzc3VyZWQgSSdt
IGdvaW5nIHRvIGdpdmUgeW91IHRoZSBuZWVkZWQgUmV2aWV3ZWQtYnk6IHRhZyBmb3IKdGhlIHBh
dGNoIGFkZGluZyB0aGUgaGVhZGVyIGluIGEgc2VyaWVzIHVzaW5nIGl0LgoKCkp1ZXJnZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
