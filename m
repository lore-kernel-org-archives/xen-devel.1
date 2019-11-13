Return-Path: <SRS0=Sbqy=ZF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E19EC43141
	for <xen-devel@archiver.kernel.org>; Wed, 13 Nov 2019 23:10:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB1F6206EC
	for <xen-devel@archiver.kernel.org>; Wed, 13 Nov 2019 23:10:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="Y4h6fuhi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB1F6206EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iV1mS-0000Cp-1C; Wed, 13 Nov 2019 23:10:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AePr=ZF=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1iV1mP-0000Ck-W5
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 23:10:30 +0000
X-Inumbo-ID: c7417a48-066a-11ea-b678-bc764e2007e4
Received: from mout02.posteo.de (unknown [185.67.36.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7417a48-066a-11ea-b678-bc764e2007e4;
 Wed, 13 Nov 2019 23:10:27 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 12D0C2400FC
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2019 00:10:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1573686626; bh=ZU3F7Zh0SEyz2r+RK7vt8gvykvwqNna1+4Ue3bkYhRs=;
 h=Subject:From:To:Date:From;
 b=Y4h6fuhipU7eTRXR7+nTd/tRgmWqC/yYgHre9ipeVZAdw6HcnQesqcSk/5d7beVUd
 mz1FPEehd4pQxVvfXzNbP475qOGKlzx1tk8Y5FhsDVMXN6MEnM03lwKBfgSZe8Y28x
 8hJEQN+81N4/RfhfrnqO0haT28yBtyC1M8RvQKwuOPs42/N5BDRbjmK8DfIDAHPxRt
 UpaNlDYlSYIq7mppmXRH1cSbiYtX7YSnZxtEaY2zGcsqjXaLD9nrOaL3zfLT4Kbyx1
 SBXaWmoIn7PtXkiejHFZ2zq/Nvptx6V2zK2Y7YdaC4NrG/nIWJiODkkPjwjZ0BzD1L
 +Y10LXNoFfR5Q==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 47D0hJ5ZwFz9rxK;
 Thu, 14 Nov 2019 00:10:24 +0100 (CET)
From: Andreas Kinzler <hfp@posteo.de>
To: xen-devel@lists.xenproject.org, Paul Durrant <Paul.Durrant@citrix.com>
References: <4bc44777-103b-ada5-839a-809da33ba00c@posteo.de>
Message-ID: <10fe632c-0f08-5399-0342-f6dfd9ca9b19@posteo.de>
Date: Thu, 14 Nov 2019 00:10:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <4bc44777-103b-ada5-839a-809da33ba00c@posteo.de>
Content-Language: en-US
Subject: Re: [Xen-devel] wall clock drift on Coffee Lake / C24x mainboard
 (HPET broken?), best practices
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gQWxsLAoKSSBjYW1lIGFjcm9zcyB0aGUgZm9sbG93aW5nOiBodHRwczovL2xrbWwub3Jn
L2xrbWwvMjAxOS84LzI5LzUzNgoKQ291bGQgdGhhdCBiZSB0aGUgcmVhc29uIGZvciB0aGUgcHJv
YmxlbSBtZW50aW9uZWQgYmVsb3c/IFhlbiBpcyB1c2luZyAKSFBFVCBhcyBjbG9ja3NvdXJjZSBv
biB0aGUgcGxhdGZvcm0vbWFpbmJvYXJkLiBJcyB0aGVyZSBhbiAoZWFzeSkgd2F5IHRvIAp2ZXJp
ZnkgaWYgWGVuIHVzZXMgUEMxMD8KClJlZ2FyZHMgQW5kcmVhcwoKT24gMTIuMTAuMjAxOSAyMDo0
NywgQW5kcmVhcyBLaW56bGVyIHdyb3RlOgo+IEhlbGxvIGFsbCwgaGVsbG8gUGF1bCwKPgo+IE9u
IGEgY2VydGFpbiBuZXcgbWFpbmJvYXJkIHdpdGggY2hpcHNldCBDMjQyIGFuZCBJbnRlbCBYZW9u
IEUtMjEzNiBJIAo+IG5vdGljZSBhIHNldmVyZSBjbG9jayBkcmlmdC4gVGhpcyBpcyBmcm9tIGRv
bTA6Cj4KPiAjIHVwdGltZQo+IMKgMjA6MTM6NTIgdXAgODEgZGF5cyzCoCAxOjQxLMKgIDEgdXNl
cizCoCBsb2FkIGF2ZXJhZ2U6IDAuMDAsIDAuMDAsIDAuMDAKPiAjIGh3Y2xvY2sKPiAyMDE5LTEw
LTEyIDIwOjI3OjM3LjIwNDk2NiswMjowMAo+ICMgZGF0ZQo+IFNhdCBPY3QgMTIgMjA6MDc6MTkg
Q0VTVCAyMDE5Cj4KPiBLZXJuZWwgaXMgNC4xMy4xNiB2YW5pbGxhLCBYZW4gNC4xMC4yCj4KPiBT
byBhZnRlciA4MSBkYXlzIHVwdGltZSB0aGVyZSBpcyBhIGRpZmZlcmVuY2Ugb2Ygb3ZlciAyMCBt
aW51dGVzIAo+IGJldHdlZW4gImRhdGUiIGFuZCAiaHdjbG9jayIuIEkgb3BlcmF0ZSBtYW55IFhl
biBzZXJ2ZXJzIGFuZCBoYXZlIAo+IG5ldmVyIHNlZW4gc3VjaCBhIGdyZWF0IGRyaWZ0IGV4Y2Vw
dCBvbiB0aGlzIHR5cGUgb2YgbWFpbmJvYXJkLiBXaGF0IAo+IGNvdWxkIGJlIHRoZSByZWFzb24/
Cj4KPiBJbiBnZW5lcmFsLCB3aGF0IGlzIHRoZSBjdXJyZW50IGJlc3QgcHJhY3RpY2UgZm9yIE5U
UCBzeW5jPyBSdW4gaXQgaW4gCj4gZG9tMD8gSW4gZG9tVT8gQm90aD8gSG93IGRvZXMgdGhlIGRv
bVUgdHlwZSAoTGludXggSFZNL1BWTS9QVkggb3IgCj4gV2luZG93cyBIVk0gd2l0aCBXaW5QViBk
cml2ZXJzKSBtYWtlIGEgZGlmZmVyZW5jZT8KPgo+IFJlZ2FyZHMgQW5kcmVhcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
