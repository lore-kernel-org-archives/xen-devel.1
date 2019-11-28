Return-Path: <SRS0=Vqkq=ZU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23397C43215
	for <xen-devel@archiver.kernel.org>; Thu, 28 Nov 2019 16:51:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0A6721739
	for <xen-devel@archiver.kernel.org>; Thu, 28 Nov 2019 16:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0A6721739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaN0Q-00041C-4C; Thu, 28 Nov 2019 16:51:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaN0O-000413-Dq
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 16:51:00 +0000
X-Inumbo-ID: 40f5c71e-11ff-11ea-a3d7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40f5c71e-11ff-11ea-a3d7-12813bfff9fa;
 Thu, 28 Nov 2019 16:50:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E8678AF21;
 Thu, 28 Nov 2019 16:50:58 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20191128135813.8893-1-pdurrant@amazon.com>
 <2fabb6df-0136-d20e-79a5-294f57fae255@suse.com>
 <0a9e08a2-e72a-3848-489b-ede7d40dbd6a@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <856053a6-68cb-5319-efa8-98d9d18bf4b5@suse.com>
Date: Thu, 28 Nov 2019 17:51:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <0a9e08a2-e72a-3848-489b-ede7d40dbd6a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13 v4] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAxNzo0NywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyOC4xMS4xOSAx
NzozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI4LjExLjIwMTkgMTQ6NTgsIFBhdWwgRHVy
cmFudCB3cm90ZToKPj4+IC0tLSBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwo+Pj4gKysrIGIv
eGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4+PiBAQCAtODQsMTEgKzg0LDQzIEBAIHN0cnVjdCBn
cmFudF90YWJsZSB7Cj4+PiAgICAgICBzdHJ1Y3QgZ3JhbnRfdGFibGVfYXJjaCBhcmNoOwo+Pj4g
ICB9Owo+Pj4gICAKPj4+ICtzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9nbnR0YWJfbGltaXQoY29u
c3QgY2hhciAqcGFyYW0sIGNvbnN0IGNoYXIgKmFyZywKPj4KPj4gTm8gX19pbml0IHBsZWFzZSBo
ZXJlIGFuZCBiZWxvdywgZm9yIHRoaXMgYmVpbmcgcnVudGltZSBvcHRpb24KPj4gcGFyc2luZyBm
dW5jdGlvbnMuCj4+Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCAqdmFscCkKPj4+ICt7Cj4+PiArICAgIGNvbnN0IGNoYXIgKmU7Cj4+PiArICAg
IHVuc2lnbmVkIGxvbmcgdmFsOwo+Pj4gKwo+Pj4gKyAgICB2YWwgPSBzaW1wbGVfc3RydG91bChh
cmcsICZlLCAwKTsKPj4+ICsgICAgaWYgKCAqZSApCj4+PiArICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPj4+ICsKPj4+ICsgICAgaWYgKCB2YWwgPD0gSU5UX01BWCApCj4+PiArICAgICAgICAqdmFs
cCA9IHZhbDsKPj4+ICsgICAgZWxzZQo+Pj4gKyAgICAgICAgcHJpbnRrKCJwYXJhbWV0ZXIgXCIl
c1wiIHZhbHVlIFwiJXNcIiBpcyBvdXQgb2YgcmFuZ2U7IHVzaW5nIHZhbHVlIFwiJXVcIlxuIiwK
Pj4+ICsgICAgICAgICAgICAgICBwYXJhbSwgYXJnLCAqdmFscCk7Cj4+Cj4+IEJldHRlciBzdG9y
ZSBJTlRfTUFYIGluIHRoaXMgY2FzZSByYXRoZXIgdGhhbiBsZWF2aW5nIHRoZSB2YWx1ZQo+IAo+
IE5vLCBJTlRfTUFYIGlzIG5vIGdvb2QgaWRlYS4gSW4gY2FzZSBvZiB0aGlzIGhhcHBlbmluZyBh
dCBib290IHRpbWUgd2UnZAo+IGFsbG9jYXRlIGFuIGFycmF5IG9mIDIgYmlsbGlvbiBwb2ludGVy
cyBmb3IgZG9tMC4uLgoKQnV0IHdlJ3ZlIGJlZW4gYXNrZWQgZm9yIGV2ZW4gbW9yZS4gV2Ugc2hv
dWxkIGxldCB0aGUgYWRtaW4gc2hvb3QKaXRzZWxmIGluIHRoZSBmb290LCBJIHRoaW5rLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
