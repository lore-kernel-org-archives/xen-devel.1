Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CA3C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 17:57:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E64D520818
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 17:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E64D520818
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG5rS-00069V-A3; Mon, 15 Apr 2019 17:57:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DCQv=SR=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hG5rQ-00069Q-VS
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 17:57:40 +0000
X-Inumbo-ID: f5830f85-5fa7-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f5830f85-5fa7-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 17:57:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3D135307CDD6;
 Mon, 15 Apr 2019 17:57:09 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-136.rdu2.redhat.com
 [10.10.121.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DD0E19C71;
 Mon, 15 Apr 2019 17:57:06 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-26-anthony.perard@citrix.com>
 <318fa5c9-c86c-166a-ffa8-0b2219c3de2a@redhat.com>
 <938e1eb0-dfbb-e47e-e2c1-a91fa092a6ef@redhat.com>
 <20190415144043.GD1354@perard.uk.xensource.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <b7b12ebd-bf6e-ba2c-7b20-9a076abff7b5@redhat.com>
Date: Mon, 15 Apr 2019 19:57:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190415144043.GD1354@perard.uk.xensource.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 15 Apr 2019 17:57:09 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 25/31]
 OvmfPkg/PlatformBootManagerLib: Handle the absence of PCI bus on Xen PVH
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
Cc: Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415175705.0hh7UdnsrITYdF1kkvajIr8NLSPhjnzgZ4aWV-QPe60@z>

T24gMDQvMTUvMTkgMTY6NDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE9uIE1vbiwgQXByIDE1
LCAyMDE5IGF0IDAzOjQ5OjI1UE0gKzAyMDAsIExhc3psbyBFcnNlayB3cm90ZToKPj4gT24gMDQv
MTUvMTkgMTU6MzMsIExhc3psbyBFcnNlayB3cm90ZToKPj4+IE9uIDA0LzA5LzE5IDEzOjA4LCBB
bnRob255IFBFUkFSRCB3cm90ZToKPj4+PiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9MaWJyYXJ5L1Bs
YXRmb3JtQm9vdE1hbmFnZXJMaWIvQmRzUGxhdGZvcm0uYyBiL092bWZQa2cvTGlicmFyeS9QbGF0
Zm9ybUJvb3RNYW5hZ2VyTGliL0Jkc1BsYXRmb3JtLmMKPj4+PiBpbmRleCAxMjMwM2ZiMGYxLi4x
YTZkNDc3MzJlIDEwMDY0NAo+Pj4+IC0tLSBhL092bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJvb3RN
YW5hZ2VyTGliL0Jkc1BsYXRmb3JtLmMKPj4+PiArKysgYi9Pdm1mUGtnL0xpYnJhcnkvUGxhdGZv
cm1Cb290TWFuYWdlckxpYi9CZHNQbGF0Zm9ybS5jCj4+Pj4gQEAgLTEyMTMsNiArMTIxMywxMSBA
QCBQY2lBY3BpSW5pdGlhbGl6YXRpb24gKAo+Pj4+ICAgICAgICBQY2lXcml0ZTggKFBDSV9MSUJf
QUREUkVTUyAoMCwgMHgxZiwgMCwgMHg2YSksIDB4MGIpOyAvLyBHCj4+Pj4gICAgICAgIFBjaVdy
aXRlOCAoUENJX0xJQl9BRERSRVNTICgwLCAweDFmLCAwLCAweDZiKSwgMHgwYik7IC8vIEgKPj4+
PiAgICAgICAgYnJlYWs7Cj4+Pj4gKyAgICBjYXNlIFhFTl9QVkhfUENJX0hPU1RfQlJJREdFX0RF
VklDRV9JRDoKPj4gKFNpZ2guIEkgaGF2ZSB0byBhcG9sb2dpemUgZm9yIG15IGNvbW1lbnRzIHRo
YXQgbWlnaHQgbG9vayAicnVzaGVkIi4gVGhlCj4+IGZhY3QgaXMgdGhhdCwgZGVzcGl0ZSBpdCBi
ZWluZyBvbmx5IE1vbmRheSwgSSdtIGFscmVhZHkgZXhoYXVzdGVkLiBJdCdzCj4+IE1vbmRheSAq
YWZ0ZXJub29uKiwgYWZ0ZXIgYWxsLgo+Pgo+PiBBICJub3JtYWwiIG1haW50YWluZXIgaW4gbXkg
cG9zaXRpb24gd291bGQgcHJvYmFibHkgbm90IGxvb2sgYXQgcGF0Y2hlcwo+PiBmcm9tIHRoaXMg
c2VyaWVzIGZvciBkYXlzIG9uIGVuZCwgcG9zc2libHkgZm9yIG11bHRpcGxlIHdlZWtzIGV2ZW4u
IEkgb24KPj4gdGhlIG90aGVyIGhhbmQgaW50ZW5kIHRvIG1ha2UgYSBiaXQgb2YgcHJvZ3Jlc3Mg
ZXZlcnkgZGF5IEkgcG9zc2libHkKPj4gY2FuLiBUaGUgcmVzdWx0IGlzIHRoYXQgbXkgY29tbWVu
dHMgYXJlIG5vdCBhbHdheXMgMTAwJSBwb2xpc2hlZCB3aGVuIEkKPj4gc2VuZCB0aGVtLCBkdWUg
dG8gZmF0aWd1ZS4gU29ycnkgYWJvdXQgdGhhdC4pCj4gCj4gTm8gd29ycmllcywgdGFrZSB5b3Vy
IHRpbWUuIEFuZCB0aGFua3MgZm9yIHlvdSBkZXRhaWxzIHJldmlld3MuCj4gCj4+IFNvLCBteSB0
aG91Z2h0IG9uIHRoaXMgaXMgdGhhdCBYRU5fUFZIX1BDSV9IT1NUX0JSSURHRV9ERVZJQ0VfSUQg
aXMgdG9vCj4+IGdlbmVyaWMgdG8gYWNjZXB0IGhlcmUuIEl0IHdpbGwgYWxpYXMgYXQgbGVhc3Qg
KnNvbWUqIGZhaWx1cmVzIHRvIHJlYWQKPj4gdGhlIHVuZGVybHlpbmcgUENJIGNvbmZpZyBzcGFj
ZSByZWdpc3Rlci4KPj4KPj4gSW4gWGVuUGxhdGZvcm1QZWkgKHYyIDI0LzMxKSwgdGhhdCdzIG5v
dCBhbiBpc3N1ZSwgZm9yIHR3byByZWFzb25zOgo+Pgo+PiAtIHRoZXJlIGlzIGEgc3BlY2lmaWMs
IGFkZGl0aW9uYWwsIFhlblB2aERldGVjdGVkKCkgY2hlY2ssCj4+IC0gZXZlbiBpZiB0aGVyZSB3
YXMgYW4gaXNzdWUgd2l0aCB0aGUgbG9naWMsIGl0J2Qgb25seSBhZmZlY3QKPj4gWGVuUGxhdGZv
cm1QZWk7IGkuZS4gdGhlIE92bWZYZW4gcGxhdGZvcm0uCj4+Cj4+ICgyKSBDYW4geW91Cj4+Cj4+
IC0gaW50cm9kdWNlIFhFTl9QVkhfUENJX0hPU1RfQlJJREdFX0RFVklDRV9JRCB3aXRoIGEgdmFs
dWUgZGlmZmVyZW50Cj4+ICAgZnJvbSAweEZGRkYgcGVyaGFwcz8KPj4KPj4gLSBvciBrZWVwIGl0
IGFzIDB4RkZGRiwgYnV0IHJlbHkgb24gUGNkUGNpRGlzYWJsZUJ1c0VudW1lcmF0aW9uLCBhcyBh
Cj4+ICAgZnVydGhlciByZXN0cmljdGlvbj8KPj4KPj4gICAoSSB1bmRlcnN0YW5kIHRoYXQgZXhw
b3NpbmcgWGVuUHZoRGV0ZWN0ZWQoKSB0byBQbGF0Zm9ybUJvb3RNYW5hZ2VyTGliCj4+ICAgd291
bGQgcmVxdWlyZSBtb3JlIFBWSCBlbmxpZ2h0ZW5tZW50IGluICJjb21tb24iIGNvZGUsIGFuZCwg
aW5kZWVkLCBJCj4+ICAgZG9uJ3QgZGVzaXJlIHRoYXQgLS0gdGhhdCdzIHdoeSBJJ20gc3VnZ2Vz
dGluZwo+PiAgIFBjZFBjaURpc2FibGVCdXNFbnVtZXJhdGlvbikKPiAKPiBTbywgUGxhdGZvcm1C
b290TWFuYWdlckxpYiBhbHJlYWR5IGhhcyBhIFhlbkRldGVjdGVkKCkgZnVuY3Rpb24sIHNvCj4g
SSBjb3VsZCB1c2UgdGhhdCBmdW5jdGlvbi4KClJpZ2h0LCBpZiB3ZSBjYW4gZGV0ZWN0IFhlbiAo
Ym90aCBIVk0rUFZILCBvciBqdXN0IFBWSCwgd2hpY2hldmVyIGlzCmFwcHJvcHJpYXRlKSBoZXJl
LCB0aGF0IHNvdW5kcyBnb29kLiBGb3IgdGhhdCwgSSBzdWdnZXN0ZWQgZWxzZXdoZXJlIHRvCnJl
YmFzZSBQbGF0Zm9ybUJvb3RNYW5hZ2VyTGliIGZpcnN0IG9uIHRvcCBvZiBYZW5QbGF0Zm9ybUxp
YiwgdG8KZWxpbWluYXRlIHRoZSBkdXBsaWNhdGUgWGVuRGV0ZWN0ZWQoKSBmdW5jdGlvbiBkZWZp
bml0aW9uLgoKPiAKPiBJIHRoaW5rIHdlIGNvdWxkIHN0b3AgdXNpbmcgWEVOX1BWSF9QQ0lfSE9T
VF9CUklER0VfREVWSUNFX0lEIChiZWNhdXNlIEkKPiBkb24ndCBrbm93IHdoYXQgdmFsdWUgSSBj
b3VsZCB1c2UpIGFuZCBub3Qgc2V0Cj4gYFBjZE92bWZIb3N0QnJpZGdlUGNpRGV2SWQnIGF0IGFs
bCwgaXQgd291bGQgZGVmYXVsdCB0byAweDAuCgpUaGF0IHNob3VsZCB3b3JrLgoKPiBUaGVuLCBp
biBQbGF0Zm9ybUJvb3RNYW5hZ2VyTGliLCBzaW1wbHkgaWdub3JlIHRoZSBlcnJvciB3aGVuCj4g
bUhvc3RCcmlkZ2VEZXZJZCAob3IgUGNkT3ZtZkhvc3RCcmlkZ2VQY2lEZXZJZCkgaXNuJ3QgcmVj
b2duaXNlIGFuZCB3aGVuCj4gWGVuRGV0ZWN0ZWQoKSBpcyB0cnVlLgo+IAo+IFdvdWxkIHRoYXQg
YmUgZmluZT8KClllcywgc291bmRzIGdvb2QuCgo+IAo+IFRoZSBwYXRjaCB3b3VsZCBsb29rIHNv
bWV0aGluZyBsaWtlIHRoaXM6Cj4gCj4gQEAgLTEyMjIsNiArMTIyMiwxMiBAQCBQY2lBY3BpSW5p
dGlhbGl6YXRpb24gKAo+ICAgICAgICBQY2lXcml0ZTggKFBDSV9MSUJfQUREUkVTUyAoMCwgMHgx
ZiwgMCwgMHg2YiksIDB4MGIpOyAvLyBICj4gICAgICAgIGJyZWFrOwo+ICAgICAgZGVmYXVsdDoK
PiArICAgICAgaWYgKFhlbkRldGVjdGVkICgpKSB7Cj4gKyAgICAgICAgLy8KPiArICAgICAgICAv
LyBUaGVyZSBpcyBubyBQQ0kgYnVzIGluIHRoaXMgY2FzZS4KPiArICAgICAgICAvLwo+ICsgICAg
ICAgIHJldHVybjsKPiArICAgICAgfQo+ICAgICAgICBERUJVRyAoKEVGSV9EX0VSUk9SLCAiJWE6
IFVua25vd24gSG9zdCBCcmlkZ2UgRGV2aWNlIElEOiAweCUwNHhcbiIsCj4gCj4gCgpMb29rcyBP
SyEKClRoYW5rcyEKTGFzemxvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
