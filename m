Return-Path: <SRS0=WZDL=SX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1832DC10F14
	for <xen-devel@archiver.kernel.org>; Sun, 21 Apr 2019 17:09:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D91352077C
	for <xen-devel@archiver.kernel.org>; Sun, 21 Apr 2019 17:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D91352077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIFxL-0002DX-AM; Sun, 21 Apr 2019 17:08:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hCs2=SX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIFxJ-0002DS-NP
 for xen-devel@lists.xenproject.org; Sun, 21 Apr 2019 17:08:41 +0000
X-Inumbo-ID: 1bb6cbb6-6458-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 1bb6cbb6-6458-11e9-92d7-bc764e045a96;
 Sun, 21 Apr 2019 17:08:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F859A78;
 Sun, 21 Apr 2019 10:08:39 -0700 (PDT)
Received: from [10.37.12.14] (unknown [10.37.12.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A6863F557;
 Sun, 21 Apr 2019 10:08:36 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388740.25746.3780283868034526234.stgit@wayrath>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <082f8826-1a75-f11a-05ef-2bed4ee8023d@arm.com>
Date: Sun, 21 Apr 2019 18:08:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <155577388740.25746.3780283868034526234.stgit@wayrath>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen: sched: we never get into
 context_switch() with prev==next
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190421170834.CAbY-GudQXdKL8XkuJ85JMDhFDWgakRfu_VGswOSdTM@z>

SGkgRGFyaW8sCgpPbiA0LzIwLzE5IDQ6MjQgUE0sIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IElu
IHNjaGVkdWxlKCksIGlmIHdlIHBpY2ssIGFzIHRoZSBuZXh0IHZjcHUgdG8gcnVuIChuZXh0KSB0
aGUgc2FtZSBvbmUKPiB0aGF0IGlzIHJ1bm5pbmcgYWxyZWFkeSAocHJldiksIHdlIG5ldmVyIGdl
dCB0byBjYWxsIGNvbnRleHRfc3dpdGNoKCkuCj4gCj4gV2UgY2FuLCB0aGVyZWZvcmUsIGdldCBy
aWQgb2YgYWxsIHRoZSBgaWZgLXMgdGVzdGluZyBwcmV2IGFuZCBuZXh0IGJlaW5nCj4gZGlmZmVy
ZW50LCB0cmFkaW5nIHRoZW0gd2l0aCBhbiBBU1NFUlQoKSAob24gQVJNLCB0aGUgQVNTRVJUKCkg
d2FzIGV2ZW4KPiBhbHJlYWR5IHRoZXJlISkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBGYWdn
aW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgo+IFN1Z2dlc3RlZC1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgoKRm9yIEFybToKCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKPiAtLS0KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQ2M6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+Cj4gQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Cj4gQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4K
PiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IC0tLQo+ICAgeGVuL2FyY2gv
YXJtL2RvbWFpbi5jIHwgICAgMyArLS0KPiAgIHhlbi9hcmNoL3g4Ni9kb21haW4uYyB8ICAgMjIg
KysrKysrKystLS0tLS0tLS0tLS0tLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDE2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWlu
LmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMKPiBpbmRleCA2ZGM2MzNlZDUwLi45MTVhZTBiNGM2
IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW4uYwo+ICsrKyBiL3hlbi9hcmNoL2Fy
bS9kb21haW4uYwo+IEBAIC0zNDMsOCArMzQzLDcgQEAgdm9pZCBjb250ZXh0X3N3aXRjaChzdHJ1
Y3QgdmNwdSAqcHJldiwgc3RydWN0IHZjcHUgKm5leHQpCj4gICAgICAgQVNTRVJUKHByZXYgIT0g
bmV4dCk7Cj4gICAgICAgQVNTRVJUKCF2Y3B1X2NwdV9kaXJ0eShuZXh0KSk7Cj4gICAKPiAtICAg
IGlmICggcHJldiAhPSBuZXh0ICkKPiAtICAgICAgICB1cGRhdGVfcnVuc3RhdGVfYXJlYShwcmV2
KTsKPiArICAgIHVwZGF0ZV9ydW5zdGF0ZV9hcmVhKHByZXYpOwo+ICAgCj4gICAgICAgbG9jYWxf
aXJxX2Rpc2FibGUoKTsKPiAgIAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tYWluLmMg
Yi94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiBpbmRleCA5ZWFhOTc4Y2U1Li5kMmQ5ZjJmYzNjIDEw
MDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9k
b21haW4uYwo+IEBAIC0xNzIxLDYgKzE3MjEsNyBAQCB2b2lkIGNvbnRleHRfc3dpdGNoKHN0cnVj
dCB2Y3B1ICpwcmV2LCBzdHJ1Y3QgdmNwdSAqbmV4dCkKPiAgICAgICBjb25zdCBzdHJ1Y3QgZG9t
YWluICpwcmV2ZCA9IHByZXYtPmRvbWFpbiwgKm5leHRkID0gbmV4dC0+ZG9tYWluOwo+ICAgICAg
IHVuc2lnbmVkIGludCBkaXJ0eV9jcHUgPSBuZXh0LT5kaXJ0eV9jcHU7Cj4gICAKPiArICAgIEFT
U0VSVChwcmV2ICE9IG5leHQpOwo+ICAgICAgIEFTU0VSVChsb2NhbF9pcnFfaXNfZW5hYmxlZCgp
KTsKPiAgIAo+ICAgICAgIGdldF9jcHVfaW5mbygpLT51c2VfcHZfY3IzID0gZmFsc2U7Cj4gQEAg
LTE3MzIsMTIgKzE3MzMsOSBAQCB2b2lkIGNvbnRleHRfc3dpdGNoKHN0cnVjdCB2Y3B1ICpwcmV2
LCBzdHJ1Y3QgdmNwdSAqbmV4dCkKPiAgICAgICAgICAgZmx1c2hfbWFzayhjcHVtYXNrX29mKGRp
cnR5X2NwdSksIEZMVVNIX1ZDUFVfU1RBVEUpOwo+ICAgICAgIH0KPiAgIAo+IC0gICAgaWYgKCBw
cmV2ICE9IG5leHQgKQo+IC0gICAgewo+IC0gICAgICAgIF91cGRhdGVfcnVuc3RhdGVfYXJlYShw
cmV2KTsKPiAtICAgICAgICB2cG11X3N3aXRjaF9mcm9tKHByZXYpOwo+IC0gICAgICAgIG5wMm1f
c2NoZWR1bGUoTlAyTV9TQ0hFRExFX09VVCk7Cj4gLSAgICB9Cj4gKyAgICBfdXBkYXRlX3J1bnN0
YXRlX2FyZWEocHJldik7Cj4gKyAgICB2cG11X3N3aXRjaF9mcm9tKHByZXYpOwo+ICsgICAgbnAy
bV9zY2hlZHVsZShOUDJNX1NDSEVETEVfT1VUKTsKPiAgIAo+ICAgICAgIGlmICggaXNfaHZtX2Rv
bWFpbihwcmV2ZCkgJiYgIWxpc3RfZW1wdHkoJnByZXYtPmFyY2guaHZtLnRtX2xpc3QpICkKPiAg
ICAgICAgICAgcHRfc2F2ZV90aW1lcihwcmV2KTsKPiBAQCAtMTc5NCwxNCArMTc5MiwxMCBAQCB2
b2lkIGNvbnRleHRfc3dpdGNoKHN0cnVjdCB2Y3B1ICpwcmV2LCBzdHJ1Y3QgdmNwdSAqbmV4dCkK
PiAgIAo+ICAgICAgIGNvbnRleHRfc2F2ZWQocHJldik7Cj4gICAKPiAtICAgIGlmICggcHJldiAh
PSBuZXh0ICkKPiAtICAgIHsKPiAtICAgICAgICBfdXBkYXRlX3J1bnN0YXRlX2FyZWEobmV4dCk7
Cj4gLQo+IC0gICAgICAgIC8qIE11c3QgYmUgZG9uZSB3aXRoIGludGVycnVwdHMgZW5hYmxlZCAq
Lwo+IC0gICAgICAgIHZwbXVfc3dpdGNoX3RvKG5leHQpOwo+IC0gICAgICAgIG5wMm1fc2NoZWR1
bGUoTlAyTV9TQ0hFRExFX0lOKTsKPiAtICAgIH0KPiArICAgIF91cGRhdGVfcnVuc3RhdGVfYXJl
YShuZXh0KTsKPiArICAgIC8qIE11c3QgYmUgZG9uZSB3aXRoIGludGVycnVwdHMgZW5hYmxlZCAq
Lwo+ICsgICAgdnBtdV9zd2l0Y2hfdG8obmV4dCk7Cj4gKyAgICBucDJtX3NjaGVkdWxlKE5QMk1f
U0NIRURMRV9JTik7Cj4gICAKPiAgICAgICAvKiBFbnN1cmUgdGhhdCB0aGUgdmNwdSBoYXMgYW4g
dXAtdG8tZGF0ZSB0aW1lIGJhc2UuICovCj4gICAgICAgdXBkYXRlX3ZjcHVfc3lzdGVtX3RpbWUo
bmV4dCk7Cj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
