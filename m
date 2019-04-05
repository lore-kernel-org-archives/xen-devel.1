Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C326C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 08:17:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 615E021855
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 08:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 615E021855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCK29-000075-07; Fri, 05 Apr 2019 08:17:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NmJK=SH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hCK27-000070-Rt
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 08:17:07 +0000
X-Inumbo-ID: 33800b74-577b-11e9-b746-6f088484c11a
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 33800b74-577b-11e9-b746-6f088484c11a;
 Fri, 05 Apr 2019 08:17:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93B341993;
 Fri,  5 Apr 2019 01:17:06 -0700 (PDT)
Received: from [10.37.12.206] (unknown [10.37.12.206])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B29663F721;
 Fri,  5 Apr 2019 01:17:05 -0700 (PDT)
To: Diego Alejandro Parra Guzman <daparrag@correo.udistrital.edu.co>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <CAMWmVVANRaJX_Cx6OEHuKYR=v7nNfvPpW738_2hbhB+1s7w4LQ@mail.gmail.com>
 <7ed4f8ed-2317-5cee-e25c-69debc379fd8@arm.com>
 <CAMWmVVAMYMa-csRVL3kz3KcafEzjRnQqz=0F5f_JLxy0_FQJew@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <386502bb-5c8a-54a7-764d-3298da1de88a@arm.com>
Date: Fri, 5 Apr 2019 09:17:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMWmVVAMYMa-csRVL3kz3KcafEzjRnQqz=0F5f_JLxy0_FQJew@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Performance Monitor and Profiling tools for ARM64
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
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405081703.BRgJxa6ZU2eYT68FLTs-gS_L0QgxbhpDDxMT9l_6gJ4@z>

T24gNC8zLzE5IDc6NTcgQU0sIERpZWdvIEFsZWphbmRybyBQYXJyYSBHdXptYW4gd3JvdGU6Cj4g
Cj4gICAgICAgSGVsbG8gSnVsaWVuIEdyYWxsCgpIaSBEaWVnbywKCj4gCj4gdGhhbmsgeW91IGZv
ciB5b3VyIHJlcGxpZWQswqAgeW91IGhhdmUgY2xhcmlmaWVkIG1hbnkgb2YgbXkgZG91YnRzLgo+
IAo+IEkgaGF2ZSBiZWVuIGltcGxlbWVudGluZyBzb21lIGJhc2ljIGZ1bmN0aW9uYWxpdHkgZm9y
IHRoZSBQTVUgOgo+IAo+IEhlcmUgc21hbGwgZGVzY3JpcHRpb246Cj4gCj4gICAqIGdldHBtdWlu
Zm9fYXR0ciA6wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBA
YnJpZWbCoCBnZXQgUE1VCj4gICAgIGluZm8sIGluY2x1ZGluZyBudW1iZXIgb2YgQ291bnRlcnMs
IGFuZCBjb250cm9sIGNvdW50ZXJzICovCj4gICAqIGVuYWJsZV9hbGxfcG11X2NvdW50ZXJzOsKg
IMKgIMKgIMKgIMKgIMKgIMKgIC8qIEBicmllZsKgIEVuYWJsZSB0aGUgY3ljbGUKPiAgICAgY291
bnRlciByZWdpc3RlciBQTUNDTlRSX0VMMCwgYW5kIGFueSBpbXBsZW1lbnRlZCBldmVudCBjb3Vu
dGVyCj4gICAgIFBNRVZDTlRSPG4+X0VMMCAqLwo+ICAgKiBkaXNhYmxlX2FsbF9wbXVfY291bnRl
cnMgLyogQGJyaWVmwqAgRGlzYWJsZSB0aGUgY3ljbGUgY291bnRlcgo+ICAgICByZWdpc3RlciBQ
TUNDTlRSX0VMMCzCoGFuZCBhbnkgaW1wbGVtZW50ZWQgZXZlbnQgY291bnRlcgo+ICAgICBQTUVW
Q05UUjxuPl9FTDAuICovCj4gICAqIHJlc2V0X2FsbF9wbXVfY291bnRlcnPCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCAvKiBAYnJpZWbCoCBSZXNldCB0aGUgY3ljbGUKPiAgICAgY291bnRlciBy
ZWdpc3RlciBQTUNDTlRSX0VMMCzCoMKgYW5kIGFueSBpbXBsZW1lbnRlZCBldmVudCBjb3VudGVy
Cj4gICAgIFBNRVZDTlRSPG4+X0VMMC4qLwo+ICAgKiBlbmFibGVfdXNlcl9wbXVfYWNjZXNzwqAg
wqAgwqAgwqAgwqAgwqAgwqAgLyogQGJyaWVmwqAgRW5hYmxlIHVzZXItbW9kZQo+ICAgICBhY2Nl
c3MgdG8gY291bnRlcnMuKi8gCj4gCj4gSSB0aGluayB0aGVzZSBjYW4gYmUgdXNlZCBhcyBwcmlt
aXRpdmVzIGZvciBYRU46Cj4gCj4gTm93IEkgaGF2ZSBzb21lIGFkZGl0aW9uYWwgcXVlc3Rpb25z
IGFib3V0IFhFTjoKPiAKPiAgICogaG93IGNhbiBJIGluY2x1ZGUgdGhhdCBwcmltaXRpdmVzIGFz
IGEgZHJpdmVyIGZvciBBUk02NCBpbiBYRU4/CgpUaGUgaW5jbHVzaW9uIGluIFhlbiB3aWxsIGRl
cGVuZCBvbiB5b3VyIHVzZSBjYXNlcy4gSW4gbXkgcHJldmlvdXMgCmUtbWFpbCwgSSBkZXNjcmli
ZWQgMiB1c2VzIGNhc2VzOgoKICAgIDEpIEEgZ3Vlc3QgcHJvZmlsaW5nIGl0c2VsZgogICAgMikg
VGhlIGh5cGVydmlzb3IgcHJvZmlsaW5nIHRoZSBzeXN0ZW0gKGkuZSBndWVzdHMgYW5kIGl0c2Vs
ZikKCldoaWNoIG9uZSBhcmUgeW91IGltcGxlbWVudGluZz8KCj4gCj4gSSd2ZSBub3RpY2VkIHRo
YXQgaW4gbGludXgga2VybmVsIDQuMTQgLSA0LjE1wqAgJFNPVVJDRS9kcml2ZXJzL3BlcmYgOgo+
IAo+ICAgKiB0aGVyZSBpcyBhbmQgaW1wbGVtZW50YXRpb24gZm9yIGFybV9wbXXCoCB3aGljaCBp
cyBmYXIgYmV0dGVyIHRoYW4KPiAgICAgd2hhdCBJJ3ZlIGltcGxlbWVudGVkLCBpcyBpdCBoYXJk
IHRvIGltcG9ydCB0aGF0IGRyaXZlciB0byBYRU4gPwoKYXJtX3BtdSBpcyBiYXNlZCBvbiB0aGUg
TGludXggUGVyZiBzdWJzeXN0ZW0uIFNvIEkgZG9uJ3QgdGhpbmsgeW91IGNhbiAKcmUtdXNlZCB0
aGUgZHJpdmVyIGRpcmVjdGx5LiBBbHRob3VnaCwgeW91IGNvdWxkIHJlLXVzZSBzb21lIHBhcnRz
IGF0IAp5b3VyIGNvbnZlbmllbmNlLgoKPiAgICogYWdhaW4gaG93IGNhbiBJIGluY2x1ZGUgdGhh
dCBwcmltaXRpdmVzIGFzIGEgZHJpdmVyIGZvciBBUk02NCBpbiBYRU4/CgpUaGUgZmlyc3Qgc3Rl
cCBpcyB0byBkZWZpbmUgeW91ciB1c2UgY2FzZS4gVGhlbiB3ZSBjYW4gZGlzY3VzcyBob3cgd2Ug
CmNhbiBpbXBsZW1lbnQgUE1VIHN1cHBvcnQgaW4gWGVuLgoKPiAgICogUE1VIGlzIGltcGxlbWVu
dGVkIGZvciBlYWNoIENQVSBzbyBob3cgdG8gZGVhbCB3aXRoIHRoYXQ/CgpJdCBkZXBlbmRzIG9u
IHdoYXQgeW91IGFyZSB0cnlpbmcgdG8gYWNoaWV2ZS4gSWYgeW91IGFyZSBleHBvc2luZyB0aGUg
ClBNVSB0byB0aGUgZ3Vlc3QsIHRoZW4gaXQgaXMgcHJvYmFibHkgc3VmZmljaWVudCB0byBzdG9y
ZSB0aGUgY29udGV4dCBpbiAKdGhlIGd1ZXN0IHZDUFUgc3RhdGUuCgpJZiB5b3UgbmVlZCB0byBo
b2xkIHN0YXRlIGluIFhlbiBhcyB3ZWxsLCB0aGVuIHlvdSBjYW4gdXNlIGEgcGVyLWNwdSAKc3Rv
cmFnZSAoc2VlIGluY2x1ZGUveGVuL3BlcmNwdS5oKS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
