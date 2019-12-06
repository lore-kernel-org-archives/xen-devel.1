Return-Path: <SRS0=WOnx=Z4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF447C2BD09
	for <xen-devel@archiver.kernel.org>; Fri,  6 Dec 2019 16:57:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4D872064B
	for <xen-devel@archiver.kernel.org>; Fri,  6 Dec 2019 16:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4D872064B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idGv1-0005ic-TG; Fri, 06 Dec 2019 16:57:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1idGv1-0005iV-88
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 16:57:27 +0000
X-Inumbo-ID: 7a854680-1849-11ea-83a1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a854680-1849-11ea-83a1-12813bfff9fa;
 Fri, 06 Dec 2019 16:57:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 48896AFBF;
 Fri,  6 Dec 2019 16:57:25 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <osstest-144289-mainreport@xen.org>
 <6278a67e-bd65-39d6-0322-32e8e7538457@suse.com>
 <24027.60461.969376.752788@mariner.uk.xensource.com>
 <24042.34572.522244.289318@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <23d38b1b-291b-4abb-07b5-66b982e758dd@suse.com>
Date: Fri, 6 Dec 2019 17:57:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <24042.34572.522244.289318@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] debina hang after "random: crng init done"
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTIuMjAxOSAxNzo1MSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gSWFuIEphY2tzb24gd3Jp
dGVzICgiUmU6IFtYZW4tZGV2ZWxdIFt4ZW4tdW5zdGFibGUgdGVzdF0gMTQ0Mjg5OiB0b2xlcmFi
bGUgRkFJTCIpOgo+PiBKYW4gQmV1bGljaCB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW3hlbi11
bnN0YWJsZSB0ZXN0XSAxNDQyODk6IHRvbGVyYWJsZSBGQUlMIik6Cj4+PiBPbiAyNS4xMS4yMDE5
IDE0OjU4LCBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3JvdGU6Cj4+IC4uLgo+Pj4+ICB0ZXN0LWFt
ZDY0LWFtZDY0LWxpYnZpcnQteHNtICA3IHhlbi1ib290ICAgICAgICAgICAgICAgICAgIGZhaWwg
cGFzcyBpbiAxNDQyODMKPj4+Cj4+PiBPdGhlciB0aGFuIHRoZSBzaGVsbCBwcm9tcHQgbm90IGFw
cGVhcmluZywgSSBjYW4ndCBzZWUgYW55Cj4+PiBpbmRpY2F0aW9uIG9mIHdoYXQgbWF5IGhhdmUg
Z29uZSB3cm9uZyBoZXJlIGZvciB3aGljaCByZWFzb24uCj4+Cj4+IFRoZSBsYXN0IG1lc3NhZ2Ug
cHJpbnRlZCB3YXMKPj4gICByYW5kb206IGNybmcgaW5pdCBkb25lCj4+Cj4+IFRoaXMgc2VlbWVk
IGZhbWlsaWFyLiAgU2VhcmNoaW5nIG15IGVtYWlsIGZvdW5kCj4+Cj4+ICAgb3NzdGVzdCBzZXJ2
aWNlIG93bmVyIHdyaXRlcyAoIltvc3N0ZXN0IHRlc3RdIDE0MzQ5MzogcmVncmVzc2lvbnMgLSBG
QUlMIik6Cj4+ICAgPiBmbGlnaHQgMTQzNDkzIG9zc3Rlc3QgcmVhbCBbcmVhbF0KPj4gICA+IGh0
dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDM0OTMvCj4+
ICAgPiAKPj4gICA+IFJlZ3Jlc3Npb25zIDotKAo+PiAgID4gCj4+ICAgPiBUZXN0cyB3aGljaCBk
aWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKPj4gICA+IGluY2x1ZGluZyB0ZXN0cyB3
aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+PiAgID4gIHRlc3QtYW1kNjQtYW1kNjQtcGFpciAgICAg
ICAgMTAgeGVuLWJvb3Qvc3JjX2hvc3QgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0MzM5Mgo+Pgo+
PiAgIEkgZG9uJ3Qga25vdyB3aGF0IHRoaXMgaXMuICBMaW51eCBmYWlscyB0byBib290IHVuZGVy
IFhlbi4gIFRoZSBsYXN0Cj4+ICAgbWVzc2FnZSBpcwo+PiAgICAgcmFuZG9tOiBjcm5nIGluaXQg
ZG9uZQo+PiAgIEJ1dCBpdCBkb2Vzbid0IHNlZW0gYXQgYWxsIHByb2JhYmxlIHRoYXQgdGhpcyBp
cyBhbnl0aGluZyB0byBkbwo+PiAgIHdpdGggb3NzdGVzdC4KPj4KPj4gVGhhdCB3YXMgd2l0aCBk
ZWJpbmExLgo+Pgo+PiBTbyBlaXRoZXIgYm90aCB0aGVzZSBob3N0cyBoYXZlIGEgc2ltaWxhciBo
YXJkd2FyZSBmYXVsdCwgb3IgdGhlcmUgaXMKPj4gc29tZXRoaW5nIGVsc2Ugd3JvbmcuCj4gCj4g
SGkuICBJcyBpdCBwb3NzaWJsZSB0aGF0IHNvbWUgeDg2IG9yIGtlcm5lbCBleHBlcnQgY291bGQg
aGVscCB0bwo+IGludmVzdGlnYXRlIHRoaXMgPwoKRm9yIGtlcm5lbCBJIGd1ZXNzIHlvdSBtZWFu
dCB0byBDYyBCb3JpcyBhbmQgSsO8cmdlbiwgbm90IHNvIG11Y2gKS29ucmFkPwoKPiBJIGhhdmUg
YSByZXBybyB3aXRoIERlYmlhbiBidXN0ZXIsIHRvbywgaGVyZToKPiAgIGh0dHA6Ly9sb2dzLnRl
c3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDQzMTIvdGVzdC1hbWQ2NC1pMzg2
LXhsLXJhdy9pbmZvLmh0bWwKCkRvZXMgInJlcHJvIiBtZWFuIHlvdSdyZSBhYmxlIHRvIHJlbGlh
YmxlIHRyaWdnZXIgdGhpcz8gSSBhc2sKYmVjYXVzZSBzbyBmYXIsIHdpdGggYWxsIGJyYW5jaGVz
IGFmZmVjdGVkIGFmYWljdCwgaXQgbG9va2VkCnByZXR0eSBzcG9yYWRpYy4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
