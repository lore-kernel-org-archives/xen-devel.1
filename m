Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E549CC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:27:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD9AA20830
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD9AA20830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEECD-0002Cx-4C; Wed, 10 Apr 2019 14:27:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eTPk=SM=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hEECB-0002AI-M5
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:27:23 +0000
X-Inumbo-ID: c0d18994-5b9c-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c0d18994-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:27:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 05DF130027D7;
 Wed, 10 Apr 2019 14:27:19 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-133.rdu2.redhat.com
 [10.10.121.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8862F5D719;
 Wed, 10 Apr 2019 14:27:17 +0000 (UTC)
To: Jordan Justen <jordan.l.justen@intel.com>,
 Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-3-anthony.perard@citrix.com>
 <155488970861.20447.12525571872411959890@jljusten-skl>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <a3e5b97c-6dc7-788f-99a8-769e37f3a8d5@redhat.com>
Date: Wed, 10 Apr 2019 16:27:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <155488970861.20447.12525571872411959890@jljusten-skl>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 10 Apr 2019 14:27:20 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 02/31] OvmfPkg: Create
 platform XenOvmf
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142715.GWlTQWhYGnI9wo-Pmb1NTZuhPbdg1k0N6dmvhTkda28@z>

T24gMDQvMTAvMTkgMTE6NDgsIEpvcmRhbiBKdXN0ZW4gd3JvdGU6Cj4gT24gMjAxOS0wNC0wOSAw
NDowODoxNSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+IFRoaXMgaXMgYSBjb3B5IG9mIE92bWZY
NjQsIHJlbW92aW5nIFZpcnRJTyBhbmQgc29tZSBTTU0uCj4+Cj4+IFRoaXMgbmV3IHBsYXRmb3Jt
IHdpbGwgYmUgY2hhbmdlZCB0byBtYWtlIGl0IHdvcmtzIG9uIHR3byB0eXBlcyBvZiBYZW4KPj4g
Z3Vlc3Q6IEhWTSBhbmQgUFZILgo+Pgo+PiBDb21wYXJlIHRvIE92bWZYNjQsIHRoaXMgcGF0Y2g6
Cj4+Cj4+IC0gY2hhbmdlZDogUExBVEZPUk1fR1VJRCwgT1VUUFVUX0RJUkVDVE9SWSwgRkxBU0hf
REVGSU5JVElPTgo+PiAtIHJlbW92ZWQ6IFZpcnRpb0xpYiBjbGFzcyByZXNvbHV0aW9uCj4+IC0g
cmVtb3ZlZDogYWxsIFVFRklfRFJJVkVSIG1vZHVsZXMgZm9yIHZpcnRpbyBkZXZpY2VzCj4+IC0g
cmVtb3ZlZDogRFhFX1NNTV9EUklWRVIgYW5kIFNNTV9DT1JFIGxpYiBjbGFzcyByZXNvbHV0aW9u
cwo+PiAtIHJlbW92ZWQ6IERYRV9TTU1fRFJJVkVSIGFuZCBTTU1fQ09SRSBGREYgcnVsZXMKPj4g
LSByZW1vdmVkOiBFdmVyeXRoaW5nIHJlbGF0ZWQgdG8gU01NX1JFUVVJUkU9PXRydWUKPj4gLSBy
ZW1vdmVkOiBFdmVyeXRoaW5nIHJlbGF0ZWQgdG8gU0VDVVJFX0JPT1RfRU5BQkxFPT10cnVlCj4+
IC0gcmVtb3ZlZDogRXZlcnl0aGluZyByZWxhdGVkIHRvIFRQTTJfRU5BQkxFPT10cnVlCj4+IC0g
Y2hhbmdlZDogUGNkUGNpRGlzYWJsZUJ1c0VudW1lcmF0aW9uIGR5bmFtaWMgZGVmYXVsdCBmbGlw
cGVkIHRvIFRSVUUKPj4gLSBjaGFuZ2VkOiBkZWZhdWx0IEZEX1NJWkVfSU5fS0IgdG8gMk0uCj4+
Cj4+IENvbnRyaWJ1dGVkLXVuZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0aW9uIEFncmVlbWVudCAx
LjEKPj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+Cj4+IC0tLQo+PiAgT3ZtZlBrZy97T3ZtZlBrZ1g2NC5kc2MgPT4gWGVuT3ZtZi5kc2N9
ICAgICB8IDIwMiArLS0tLS0tLS0tLS0tLS0tLS0tLQo+IAo+IEkgZ3Vlc3Mgd2UgYWxsIHdhbnQg
b3VyIG5hbWUgdG8gYmUgZmlyc3QgOiksIGJ1dCBPdm1mWGVuIHNlZW1zIG1vcmUKPiBsaWtlIHRo
ZSBwYXR0ZXJuIHRoYXQgZWRrMiB1c2VzIHdoZW4gbWFraW5nIHN1Yi1wbGF0Zm9ybXMuCj4gCj4g
QWxzbywgaW4gc29tZSBjYXNlcyB3ZSd2ZSB1c2VkICFpZmRlZiB0eXBlIHRoaW5ncyB0byBrZWVw
IGRzYyBhbmQgZmRmCj4gZmlsZXMgY29tbW9uLiBXb3VsZCB0aGF0IG5vdCBiZSB3b3JrYWJsZSBo
ZXJlPyBNYXliZSBpdCB3b3VsZCBnZXQgdG9vCj4gdWdseS4gOlwKCkkndmUgYmVlbiBoYXBweSB3
aXRoIGEgc2ltaWxhciBYZW48LT5RRU1VIHNwbGl0IHVuZGVyIEFybVZpcnRQa2cuCkR1cGxpY2F0
aW9ucyBpbiB1cGRhdGVzIGFyZSB1c3VhbGx5IG5vdCBhIGh1Z2UgYnVyZGVuLCBhbmQga2VlcGlu
ZyB0aGUKZmlsZXMgc2VwYXJhdGUgaGFzIHByb3ZlZCB2ZXJ5IGhlbHBmdWwgZm9yIGRldGVybWlu
aW5nCm1haW50YWluZXIvcmV2aWV3ZXIvdGVzdGVyIHJlc3BvbnNpYmlsaXR5LgoKPiBJdCBjb3Vs
ZCBoZWxwIHRvIHByZXZlbnQgaGF2aW5nIHRvIHN5bmMgZHNjIGNoYW5nZXMgYWNyb3NzLCBhbmQK
PiBwcmV2ZW50IGNoYW5nZXMgZnJvbSBiZWluZyBvbWl0dGVkIGZvciBYZW4gb24gYWNjaWRlbnQu
CgpUcnVlLCBidXQgaW4gbXkgZXhwZXJpZW5jZSB0aGF0J3MgYmVlbiB0aGUgc21hbGxlciBwcm9i
bGVtLiBUaGUgbGFyZ2VyCnByb2JsZW0gaGFzIGJlZW4gbW9kaWZ5aW5nIFhlbiBzdHVmZiBpbiB1
bmludGVuZGVkIHdheXMgKD0gcmVncmVzc2luZwpYZW4pLCBiZWNhdXNlIHdlIGNhbid0IHRlc3Qg
KG9yIGRvbid0IGV2ZW4gbm90aWNlKSB0aGUgWGVuLXNpZGUKaW1wbGljYXRpb25zIG9mIGNoYW5n
ZXMgbWFkZSB0byBjb21tb24gc291cmNlLgoKUGVyc29uYWxseSBJIHByZWZlciBhbm90aGVyIChE
U0MgKyBGREYpIHBhaXIgdW5kZXIgT3ZtZlBrZyAoYmV5b25kIHRoZQp0aHJlZSB3ZSBhbHJlYWR5
IGhhdmUpIHRvIGFub3RoZXIgbGF5ZXIgb2YgKGNvbmRpdGlvbmFsPykgaW5jbHVkZXMuIFRoZQoh
aWYncyB0aGF0IGFyZSBiZWluZyBlbGltaW5hdGVkIGluIHRoaXMgWGVuLWN1c3RvbWl6ZWQgY29w
eSAoaS5lLiwgaW4KdGhpcyBwYXRjaCkgYXJlIGNvbXBsZXggZW5vdWdoIGFscmVhZHkgOikKCi4u
LiBJdCdzIG5vdCB0aGF0IEkgKmdlbmVyYWxseSogcHJlZmVyIGR1cGxpY2F0aW9uOyBhcyB5b3Ug
c2F5LCB3ZSBkbwpoYXZlIGEgbnVtYmVyIG9mICFpbmNsdWRlcyBhbHJlYWR5LiBJIGRvIHByZWZl
ciBkdXBsaWNhdGlvbiBzcGVjaWZpY2FsbHkKZm9yIFhlbiB2cy4gUUVNVSBob3dldmVyLgoKVGhh
bmtzCkxhc3psbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
