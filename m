Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15954C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 22:42:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D28142173C
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 22:42:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WflbbQhC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D28142173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGWmO-0002FG-DW; Tue, 16 Apr 2019 22:42:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VklA=SS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGWmM-0002FB-GJ
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 22:42:14 +0000
X-Inumbo-ID: e06dc1fc-6098-11e9-a476-53cfc19ec9f3
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e06dc1fc-6098-11e9-a476-53cfc19ec9f3;
 Tue, 16 Apr 2019 22:42:13 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 419002173C;
 Tue, 16 Apr 2019 22:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555454532;
 bh=PtuDXdLabQoQo6T1bqB2m/by0e8Eh5PuzzgU4mfnPgM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=WflbbQhCbiHxI/RQ/o5aXgRE2Scs5kMDjeGV7MUVkMRvMzLni45eInQ5ND93YBAEC
 MMrID50BVkkcsEM2VpAipdP7MTP+hxl5BDLPqoDgJLEsyRMHNSefzNxHxkru3E87HC
 GtNVjSPix7cwwgVJZjAOTARhApAkg9PeauwoKHZQ=
Date: Tue, 16 Apr 2019 15:42:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <3c0153aa-0662-c51f-039c-2beb7eaaa34d@arm.com>
Message-ID: <alpine.DEB.2.10.1904161541570.1370@sstabellini-ThinkPad-X260>
References: <20190315083439.23068-1-vishnu@os.amperecomputing.com>
 <68101da7-87b2-5514-26f6-a4e4d5f18be2@arm.com>
 <21628b60-483a-69e5-cc5e-7c5ec98f93a7@os.amperecomputing.com>
 <3c0153aa-0662-c51f-039c-2beb7eaaa34d@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: p2m: configure pa_range_info table
 to support 42 bit PA systems.
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Feng Kan OS <fengkan@os.amperecomputing.com>,
 Vishnu Pajjuri OS <vishnu@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416224212.5ZsrGVAD3gLNgtFCQWcbd_6k5lHyAPwlT29UyTNNDQQ@z>

T24gTW9uLCA4IEFwciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4gT24gMy8x
NS8xOSAxMTo1NyBQTSwgRmVuZyBLYW4gT1Mgd3JvdGU6Cj4gPiBUaGFua3MgSnVsaWVuLgo+ID4g
Cj4gPiBPbiAzLzE1LzE5IDQ6MjEgQU0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gSGksCj4g
PiA+IAo+ID4gPiBUaGFuayB5b3UgZm9yIHBvc3RpbmcgdGhlIHBhdGNoLgo+ID4gPiAKPiA+ID4g
VGl0bGU6IE5vIG5lZWQgZm9yIGZ1bGwgc3RvcCBpbiB0aGUgY29tbWl0IHRpdGxlLgo+ID4gPiAK
PiA+ID4gT24gMTUvMDMvMjAxOSAwODozNCwgVmlzaG51IFBhamp1cmkgT1Mgd3JvdGU6Cj4gPiA+
IEkgY2FuJ3QgcmVtZW1iZXIgd2hpY2ggb3RoZXIgcGxhdGZvcm1zIHN1cHBvcnQgNDItYml0cyBQ
QS4gSSB0aGluayBhdAo+ID4gPiB0aGF0IHRpbWUgaXQgd2FzIFgtR2VuZS4gQXMgbG9uZyBhcyBu
byBjdXJyZW50IGVtYmVkZGVkIHBsYXRmb3JtIHdlCj4gPiA+IHN1cHBvcnQgdXNlIDQyLWJpdCBQ
QSwgdGhpcyBjaGFuZ2UgbWF5IGJlIG9rLiBTdGVmYW5vIGRvIHlvdSByZWNhbGwgd2hhdAo+ID4g
PiB3YXMgdGhlIHBsYXRmb3JtPwo+ID4gQW1wZXJlIGVNQUcgcGxhdGZvcm0gaXMgZXNzZW50aWFs
bHkgdGhlIGNvbnRpbnVhdGlvbiBvZiBYLUdlbmUuIFRoZXNlCj4gPiBzeXN0ZW1zIGFyZSB0YXJn
ZXRlZCBhcyBzZXJ2ZXJzIHdpdGggdXB0byAxVEIgb2YgUkFNLgo+ID4gPiAKPiA+ID4gSW4gYW55
IGNhc2UsIHRoZSBuZXcgYmVoYXZpb3IgKGFuZCBjb25zZXF1ZW5jZSkgbmVlZHMgdG8gYmUgY2xl
YXJseQo+ID4gPiBleHBsYWluZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgo+ID4gR290IGl0LCB3
ZSB3aWxsIHJlc3VibWl0IGlmIFN0ZWZhbm8gaXMgb2theSB3aXRoIHRoZSBjaGFuZ2UuCj4gCj4g
VG8gbWFrZSBwcm9ncmVzcyBvbiB0aGlzIHBhdGNoLCBJIHdvdWxkIHN1Z2dlc3QgdG8gcmVzdWJt
aXQgaXQgd2l0aCB0aGUKPiBjaGFuZ2VzIHJlcXVlc3RlZC4KClllcywgcGxlYXNlIHNlbmQgdGhl
IG5ldyBwYXRjaC4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
