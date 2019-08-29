Return-Path: <SRS0=9cJ5=WZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABA0C3A59F
	for <xen-devel@archiver.kernel.org>; Thu, 29 Aug 2019 13:29:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2F9E2339E
	for <xen-devel@archiver.kernel.org>; Thu, 29 Aug 2019 13:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2F9E2339E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3KUG-0004Sz-QS; Thu, 29 Aug 2019 13:29:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3KUF-0004Su-J3
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 13:29:15 +0000
X-Inumbo-ID: fe204968-ca60-11e9-ae67-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe204968-ca60-11e9-ae67-12813bfff9fa;
 Thu, 29 Aug 2019 13:29:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 679E6B653;
 Thu, 29 Aug 2019 13:29:13 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
 <20190816172001.3905-8-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f2b799eb-49d7-7b3b-0da9-ee82efbfcdfe@suse.com>
Date: Thu, 29 Aug 2019 15:29:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816172001.3905-8-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 07/10] use is_iommu_enabled() where
 appropriate...
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
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel@lists.xenproject.org, DanielDe Graaf <dgdegra@tycho.nsa.gov>,
 Brian Woods <brian.woods@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDguMjAxOSAxOToxOSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC4uLnJhdGhlciB0aGFu
IHRlc3RpbmcgdGhlIGdsb2JhbCBpb21tdV9lbmFibGVkIGZsYWcgYW5kIG9wcyBwb2ludGVyLgo+
IAo+IE5vdyB0aGF0IHRoZXJlIGlzIGEgcGVyLWRvbWFpbiBmbGFnIGluZGljYXRpbmcgd2hldGhl
ciB0aGUgZG9tYWluIGlzCj4gcGVybWl0dGVkIHRvIHVzZSB0aGUgSU9NTVUgKHdoaWNoIGRldGVy
bWluZXMgd2hldGhlciB0aGUgb3BzIHBvaW50ZXIgd2lsbAo+IGJlIHNldCksIG1hbnkgdGVzdHMg
b2YgdGhlIGdsb2JhbCBpb21tdV9lbmFibGVkIGZsYWcgYW5kIG9wcyBwb2ludGVyIGNhbgo+IGJl
IHRyYW5zbGF0ZWQgaW50byB0ZXN0cyBvZiB0aGUgcGVyLWRvbWFpbiBmbGFnLiBTb21lIG9mIHRo
ZSBvdGhlciB0ZXN0cyBvZgo+IHB1cmVseSB0aGUgZ2xvYmFsIGlvbW11X2VuYWJsZWQgZmxhZyBj
YW4gYWxzbyBiZSB0cmFuc2xhdGVkIGludG8gdGVzdHMgb2YKPiB0aGUgcGVyLWRvbWFpbiBmbGFn
Lgo+IAo+IE5PVEU6IFRoZSBjb21tZW50IGluIGlvbW11X3NoYXJlX3AybV90YWJsZSgpIGlzIGFs
c28gZml4ZWQ7IG5lZWRfaW9tbXUoKQo+ICAgICAgIGRpc2FwcGVhcmVkIHNvbWUgdGltZSBhZ28u
IEFsc28sIHdoaWxzdCB0aGUgc3R5bGUgb2YgdGhlICdpZicgaW4KPiAgICAgICBmbGFza19pb21t
dV9yZXNvdXJjZV91c2VfcGVybSgpIGlzIGZpeGVkLCBJIGhhdmUgbm90IHRyYW5zbGF0ZWQgYW55
Cj4gICAgICAgaW5zdGFuY2VzIG9mIHUzMiBpbnRvIHVpbnQzMl90IHRvIGtlZXAgY29uc2lzdGVu
Y3kuIElNTyBzdWNoIGEKPiAgICAgICB0cmFuc2xhdGlvbiB3b3VsZCBiZSBiZXR0ZXIgZG9uZSBn
bG9iYWxseSBmb3IgdGhlIHNvdXJjZSBtb2R1bGUgaW4KPiAgICAgICBhIHNlcGFyYXRlIHBhdGNo
Lgo+ICAgICAgIFRoZSBjaGFuZ2UgaW4gdGhlIGluaXRpYWxpemF0aW9uIG9mIHRoZSAnaGQnIHZh
cmlhYmxlIGluIGlvbW11X21hcCgpCj4gICAgICAgYW5kIGlvbW11X3VubWFwKCkgaXMgZG9uZSB0
byBrZWVwIHRoZSBQViBzaGltIGJ1aWxkIGhhcHB5LiBXaXRob3V0Cj4gICAgICAgdGhpcyBjaGFu
Z2UgaXQgd2lsbCBmYWlsIHRvIGNvbXBpbGUgd2l0aCBlcnJvcnMgb2YgdGhlIGZvcm06Cj4gCj4g
aW9tbXUuYzozNjE6MzI6IGVycm9yOiB1bnVzZWQgdmFyaWFibGUg4oCYaGTigJkgWy1XZXJyb3I9
dW51c2VkLXZhcmlhYmxlXQo+ICAgICAgY29uc3Qgc3RydWN0IGRvbWFpbl9pb21tdSAqaGQgPSBk
b21faW9tbXUoZCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+CgpX
aHkgd291bGQgdGhhdCBiZT8gQWZhaWN0IHRoZXJlJ3Mgbm8gc2hvcnQtY2lyY3VpdGluZyBvZgpp
c19pb21tdV9lbmFibGVkKCkgKGFsYmVpdCB0aGVyZSBjb3VsZCBiZSwgYXMgd2UgZG9uJ3QgbWVh
biB0aGUgc2hpbQp0byBoYXZlL3VzZSBhbiBJT01NVSkuIE9oIC0gSSBndWVzcyBJIHNlZSBpdDog
SW5zdGVhZCBvZiB0aGlzIGNoYW5nZQp3aGF0IEkgdGhpbmsgd2Ugd2FudCBpcyBmb3IgeDg2J3Mg
aW9tbXVfY2FsbCgpIHRvIGV2YWx1YXRlIGl0cyAxc3QKYXJndW1lbnQuIE90aGVyd2lzZSB3ZSdy
ZSBsaWFibGUgdG8gcnVuIGludG8gdGhlIHNhbWUgaXNzdWUgZWxzZXdoZXJlCmFnYWluLgoKPiAt
LS0gYS94ZW4veHNtL2ZsYXNrL2hvb2tzLmMKPiArKysgYi94ZW4veHNtL2ZsYXNrL2hvb2tzLmMK
PiBAQCAtODg2LDcgKzg4Niw3IEBAIHN0YXRpYyBpbnQgZmxhc2tfbWFwX2RvbWFpbl9tc2kgKHN0
cnVjdCBkb21haW4gKmQsIGludCBpcnEsIGNvbnN0IHZvaWQgKmRhdGEsCj4gICNlbmRpZgo+ICB9
Cj4gIAo+IC1zdGF0aWMgdTMyIGZsYXNrX2lvbW11X3Jlc291cmNlX3VzZV9wZXJtKHZvaWQpCj4g
K3N0YXRpYyB1MzIgZmxhc2tfaW9tbXVfcmVzb3VyY2VfdXNlX3Blcm0oc3RydWN0IGRvbWFpbiAq
ZCkKCmNvbnN0PwoKV2l0aCB0aGVzZSBhZGp1c3RtZW50cwpSZXZpZXdlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
