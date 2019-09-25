Return-Path: <SRS0=n2L7=XU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AE8C432C2
	for <xen-devel@archiver.kernel.org>; Wed, 25 Sep 2019 16:53:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70879207E0
	for <xen-devel@archiver.kernel.org>; Wed, 25 Sep 2019 16:53:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="AztMc6O7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70879207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDAXt-0002kG-OK; Wed, 25 Sep 2019 16:53:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xMb9=XU=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iDAXs-0002k5-0J
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 16:53:40 +0000
X-Inumbo-ID: 05726c3c-dfb5-11e9-9638-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id 05726c3c-dfb5-11e9-9638-12813bfff9fa;
 Wed, 25 Sep 2019 16:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569430419;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=mUKchLj7Tk//j7NMRPXp+2CRIptwB0jQVMNF0uM+eBY=;
 b=AztMc6O7sfI4/xTj/T6QRvMRoZPFyY6QcMrM43X+EWZREJODBJtIkTy6
 Utc7uBgSVYRqZr3vkCybdaP57DQf56wEhrDb/agw3ok7gtI1EeexVA8kc
 lazK+4Wfp3CwUX90Mii3a4tXbuzFYeGBQE0cuQKa7Je08iMt8N3SWPvwr 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LDmajo32DfL7FcFxfybO0A9Ztq6OsOZJc76Mr6ZIEN8c5MAa3pkePTIyKnE8i0otknJGW9lOpR
 /hJYwgb+gX5++7c0LFs+Vhm3eNqNihBZNe2Kp9eWUXSeNQTL7FdhV4fbA5YTuIjlCRUFbKDXH5
 hy6NFmuS1qV+pHu1syiV8fEZ4f37J1NiNUbOpzjOdpbMm9yB8hjY8YpTcaa55xveaTbn2cnwdK
 EosdnZaMF8BRawftfQQtnMGfwuHbEaX4Cxr5lQ/WaZrLB9qaoFobR9Q25UGC2imgvzIgO14wUf
 kNs=
X-SBRS: 2.7
X-MesageID: 6061535
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,548,1559534400"; 
   d="scan'208";a="6061535"
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190916105945.93632-1-wipawel@amazon.de>
 <20190916105945.93632-3-wipawel@amazon.de>
 <559ee54f-c962-1f3f-8291-9b5a1a6f9591@citrix.com>
 <F77F272E-18F8-4BFC-A6B6-6999F8149884@amazon.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <4df61c64-ed7b-dc29-56ee-ee8faf831f01@citrix.com>
Date: Wed, 25 Sep 2019 17:53:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <F77F272E-18F8-4BFC-A6B6-6999F8149884@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 02/12] livepatch: Allow to override
 inter-modules buildid dependency
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, "Pohlack,
 Martin" <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xNy8xOSA5OjI3IEFNLCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3JvdGU6Cj4gCj4gCj4+
IE9uIDE2LiBTZXAgMjAxOSwgYXQgMTk6MDEsIFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2Fs
bEBjaXRyaXguY29tIAo+PiA8bWFpbHRvOnJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+PiB3cm90
ZToKPj4KPj4gT24gOS8xNi8xOSAxMTo1OSBBTSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6
Cj4+IHNuaXAKPj4+ICsvKgo+Pj4gKyAqIFBhcnNlIHVzZXIgcHJvdmlkZWQgYWN0aW9uIGZsYWdz
Lgo+Pj4gKyAqIFRoaXMgZnVuY3Rpb24gZXhwZWN0cyB0byBvbmx5IHJlY2VpdmUgYW4gYXJyYXkg
b2YgaW5wdXQgCj4+PiBwYXJhbWV0ZXJzIGJlaW5nIGZsYWdzLgo+Pj4gKyAqIEV4cGVjdGVkIGFj
dGlvbiBpcyBzcGVjaWZpZWQgdmlhIGlkeCBwYXJhbWF0ZXIgKGluZGV4IG9mIAo+Pj4gZmxhZ19v
cHRpb25zW10pLgo+Pj4gKyAqLwo+Pj4gK3N0YXRpYyBpbnQgZ2V0X2ZsYWdzKGludCBhcmdjLCBj
aGFyICphcmd2W10sIHVuc2lnbmVkIGludCBpZHgsIAo+Pj4gdWludDY0X3QgKmZsYWdzKQo+Pj4g
K3sKPj4+ICsgwqDCoMKgaW50IGksIGo7Cj4+PiArCj4+PiArIMKgwqDCoGlmICggIWZsYWdzIHx8
IGlkeCA+PSBBUlJBWV9TSVpFKGZsYWdfb3B0aW9ucykgKQo+Pj4gKyDCoMKgwqDCoMKgwqDCoHJl
dHVybiAtMTsKPj4+ICsKPj4+ICsgwqDCoMKgKmZsYWdzID0gMDsKPj4+ICsgwqDCoMKgZm9yICgg
aSA9IDA7IGkgPCBhcmdjOyBpKysgKQo+Pj4gKyDCoMKgwqB7Cj4+PiArIMKgwqDCoMKgwqDCoMKg
Zm9yICggaiA9IDA7IGogPCBBUlJBWV9TSVpFKGZsYWdfb3B0aW9uc1tpZHhdKTsgaisrICkKPj4+
ICsgwqDCoMKgwqDCoMKgwqB7Cj4+PiArIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoICFmbGFn
X29wdGlvbnNbaWR4XVtqXS5uYW1lICkKPj4+ICsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZ290byBlcnJvcjsKPj4+ICsKPj4+ICsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICggIXN0
cmNtcChmbGFnX29wdGlvbnNbaWR4XVtqXS5uYW1lLCBhcmd2W2ldKSApCj4+PiArIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB7Cj4+PiArIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpmbGFn
cyB8PSBmbGFnX29wdGlvbnNbaWR4XVtqXS5mbGFnOwo+Pj4gKyDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBicmVhazsKPj4+ICsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPj4+ICsgwqDC
oMKgwqDCoMKgwqB9Cj4+PiArCj4+PiArIMKgwqDCoMKgwqDCoMKgaWYgKCBqID09IEFSUkFZX1NJ
WkUoZmxhZ19vcHRpb25zW2lkeF0pICkKPj4+ICsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8g
ZXJyb3I7Cj4+PiArIMKgwqDCoH0KPj4+ICsKPj4+ICsgwqDCoMKgcmV0dXJuIDA7Cj4+PiArZXJy
b3I6Cj4+PiArIMKgwqDCoGZwcmludGYoc3RkZXJyLCAiVW5zdXBwb3J0ZWQgZmxhZzogJXMuXG4i
LCBhcmd2W2ldKTsKPj4+ICsgwqDCoMKgZXJybm8gPSBFSU5WQUw7Cj4+PiArIMKgwqDCoHJldHVy
biBlcnJubzsKPj4+ICt9Cj4+Cj4+IFlvdSByZXR1cm4gLTEgYWJvdmUgYnV0ICt2ZSBlcnJubyBo
ZXJlLiBQbGVhc2UgbWFrZSBpdCBjb25zaXN0ZW50Lgo+IAo+IFdlbGwsIEkgdW5kZXJzdG9vZCBm
cm9tIHRoZSBjb2RlIG9mIHRoZSBmaWxlIChlLmcuIGFjdGlvbl9mdW5jKCkpIHRoYXQgCj4gdGhl
IC0xIHZhbHVlIGluZGljYXRlcyBhIHVuZXhwZWN0ZWQgcnVudGltZSBlcnJvciAobmVnYXRpdmUg
dmFsKS4KPiBXaGVyZWFzLCBwb3NpdGl2ZSBlcnJubyB2YWx1ZXMgYXJlIGV4cGVjdGVkIGVycm9y
IHRvIGJlIGRlYWx0IHdpdGguCj4gCj4gU286Cj4gPDAgLSBmYXRhbCBlcnJvcnMKPiAwIC0gb2sK
PiAgPjAgLSBlcnJvcnMgdG8gYmUgaGFuZGxlZAo+IAo+IENvdWxkIHlvdSBjb25maXJtIHBsZWFz
ZSB0aGF0IEkgc2hvdWxkIG1ha2UgZ2V0X2ZsYWdzKCkgcmV0dXJuIG9ubHkgCj4gcG9zaXRpdmUg
ZXJyb3JzPwoKIEZyb20gd2hhdCBJIGNhbiBzZWUsIHRoZSBvbmx5IHBvc2l0aXZlIGVycm9ycyB0
aGF0IGFyZSAiaGFuZGxlZCIgYXJlIApFQUdBSU4gYW5kIEVCVVNZIHRvIHJlcG9ydCBFWElUX1RJ
TUVPVVQgYW5kIHRoZSBtaXh0dXJlIG9mIHJldHVybmluZyAtMSAKYW5kIHBvc2l0aXZlIGVycm5v
IGlzIGEgYnVnLiBCdXQgaXQncyBmaW5lIHRvIGxlYXZlIGl0IGFzIGlzIGZvciBub3cgc28gaXQu
Cgo+IAo+PiBBbHNvLCB5b3UgZG9uJ3QgbmVlZCB0byBzZXQgZXJybm8gaWYgcmV0dXJuaW5nIHRo
ZSBhY3R1YWwgZXJyb3IuCj4+Cj4gCj4gSG9uZXN0bHksIEkganVzdCBjb3BpZWQgdGhlIGNvZGUg
ZnJvbSBnZXRfbmFtZSgpIGFuZCB3YW50ZWQgdG8gdGhlIAo+IGdldF9mbGFncygpIHRvIGZvbGxv
dyBzaW1pbGFyIHBhdHRlcm4uCgpTdXJlLgoKLS0gClJvc3MgTGFnZXJ3YWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
