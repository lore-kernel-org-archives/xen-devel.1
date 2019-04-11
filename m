Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E2CC10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 07:34:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BDB82064B
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 07:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BDB82064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEUDn-0006Ga-Kg; Thu, 11 Apr 2019 07:34:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=i8R2=SN=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hEUDn-0006GR-6Z
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 07:34:07 +0000
X-Inumbo-ID: 2f795c2d-5c2c-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2f795c2d-5c2c-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 07:34:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4E2B83086218;
 Thu, 11 Apr 2019 07:34:05 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-225.rdu2.redhat.com
 [10.10.120.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69DC2600D4;
 Thu, 11 Apr 2019 07:34:03 +0000 (UTC)
To: Jordan Justen <jordan.l.justen@intel.com>,
 Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-3-anthony.perard@citrix.com>
 <155488970861.20447.12525571872411959890@jljusten-skl>
 <a3e5b97c-6dc7-788f-99a8-769e37f3a8d5@redhat.com>
 <155492143006.23894.8253130602441997952@jljusten-skl>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <f3a359fa-df25-c1d0-95eb-5065ec134c29@redhat.com>
Date: Thu, 11 Apr 2019 09:34:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <155492143006.23894.8253130602441997952@jljusten-skl>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Thu, 11 Apr 2019 07:34:05 +0000 (UTC)
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
Message-ID: <20190411073402.LJTVnIDbH6a_0qJr1PO8LnyamVfASWPQYZfma8loDok@z>

T24gMDQvMTAvMTkgMjA6MzcsIEpvcmRhbiBKdXN0ZW4gd3JvdGU6Cj4gT24gMjAxOS0wNC0xMCAw
NzoyNzoxNSwgTGFzemxvIEVyc2VrIHdyb3RlOgo+PiBPbiAwNC8xMC8xOSAxMTo0OCwgSm9yZGFu
IEp1c3RlbiB3cm90ZToKPj4+IE9uIDIwMTktMDQtMDkgMDQ6MDg6MTUsIEFudGhvbnkgUEVSQVJE
IHdyb3RlOgo+Pj4+IFRoaXMgaXMgYSBjb3B5IG9mIE92bWZYNjQsIHJlbW92aW5nIFZpcnRJTyBh
bmQgc29tZSBTTU0uCj4+Pj4KPj4+PiBUaGlzIG5ldyBwbGF0Zm9ybSB3aWxsIGJlIGNoYW5nZWQg
dG8gbWFrZSBpdCB3b3JrcyBvbiB0d28gdHlwZXMgb2YgWGVuCj4+Pj4gZ3Vlc3Q6IEhWTSBhbmQg
UFZILgo+Pj4+Cj4+Pj4gQ29tcGFyZSB0byBPdm1mWDY0LCB0aGlzIHBhdGNoOgo+Pj4+Cj4+Pj4g
LSBjaGFuZ2VkOiBQTEFURk9STV9HVUlELCBPVVRQVVRfRElSRUNUT1JZLCBGTEFTSF9ERUZJTklU
SU9OCj4+Pj4gLSByZW1vdmVkOiBWaXJ0aW9MaWIgY2xhc3MgcmVzb2x1dGlvbgo+Pj4+IC0gcmVt
b3ZlZDogYWxsIFVFRklfRFJJVkVSIG1vZHVsZXMgZm9yIHZpcnRpbyBkZXZpY2VzCj4+Pj4gLSBy
ZW1vdmVkOiBEWEVfU01NX0RSSVZFUiBhbmQgU01NX0NPUkUgbGliIGNsYXNzIHJlc29sdXRpb25z
Cj4+Pj4gLSByZW1vdmVkOiBEWEVfU01NX0RSSVZFUiBhbmQgU01NX0NPUkUgRkRGIHJ1bGVzCj4+
Pj4gLSByZW1vdmVkOiBFdmVyeXRoaW5nIHJlbGF0ZWQgdG8gU01NX1JFUVVJUkU9PXRydWUKPj4+
PiAtIHJlbW92ZWQ6IEV2ZXJ5dGhpbmcgcmVsYXRlZCB0byBTRUNVUkVfQk9PVF9FTkFCTEU9PXRy
dWUKPj4+PiAtIHJlbW92ZWQ6IEV2ZXJ5dGhpbmcgcmVsYXRlZCB0byBUUE0yX0VOQUJMRT09dHJ1
ZQo+Pj4+IC0gY2hhbmdlZDogUGNkUGNpRGlzYWJsZUJ1c0VudW1lcmF0aW9uIGR5bmFtaWMgZGVm
YXVsdCBmbGlwcGVkIHRvIFRSVUUKPj4+PiAtIGNoYW5nZWQ6IGRlZmF1bHQgRkRfU0laRV9JTl9L
QiB0byAyTS4KPj4+Pgo+Pj4+IENvbnRyaWJ1dGVkLXVuZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0
aW9uIEFncmVlbWVudCAxLjEKPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50
aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPj4+PiAtLS0KPj4+PiAgT3ZtZlBrZy97T3ZtZlBrZ1g2
NC5kc2MgPT4gWGVuT3ZtZi5kc2N9ICAgICB8IDIwMiArLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4K
Pj4+IEkgZ3Vlc3Mgd2UgYWxsIHdhbnQgb3VyIG5hbWUgdG8gYmUgZmlyc3QgOiksIGJ1dCBPdm1m
WGVuIHNlZW1zIG1vcmUKPj4+IGxpa2UgdGhlIHBhdHRlcm4gdGhhdCBlZGsyIHVzZXMgd2hlbiBt
YWtpbmcgc3ViLXBsYXRmb3Jtcy4KPiAKPiBGb3IgZXhhbXBsZTogQXJtVmlydFBrZy9Bcm1WaXJ0
WGVuLmRzYwoKUmlnaHQsIHdlIGFsbCBhZ3JlZSBvbiB0aGlzLgoKPiAKPj4+Cj4+PiBBbHNvLCBp
biBzb21lIGNhc2VzIHdlJ3ZlIHVzZWQgIWlmZGVmIHR5cGUgdGhpbmdzIHRvIGtlZXAgZHNjIGFu
ZCBmZGYKPj4+IGZpbGVzIGNvbW1vbi4gV291bGQgdGhhdCBub3QgYmUgd29ya2FibGUgaGVyZT8g
TWF5YmUgaXQgd291bGQgZ2V0IHRvbwo+Pj4gdWdseS4gOlwKPj4KPj4gSSd2ZSBiZWVuIGhhcHB5
IHdpdGggYSBzaW1pbGFyIFhlbjwtPlFFTVUgc3BsaXQgdW5kZXIgQXJtVmlydFBrZy4KPj4gRHVw
bGljYXRpb25zIGluIHVwZGF0ZXMgYXJlIHVzdWFsbHkgbm90IGEgaHVnZSBidXJkZW4sIGFuZCBr
ZWVwaW5nIHRoZQo+PiBmaWxlcyBzZXBhcmF0ZSBoYXMgcHJvdmVkIHZlcnkgaGVscGZ1bCBmb3Ig
ZGV0ZXJtaW5pbmcKPj4gbWFpbnRhaW5lci9yZXZpZXdlci90ZXN0ZXIgcmVzcG9uc2liaWxpdHku
Cj4+Cj4+PiBJdCBjb3VsZCBoZWxwIHRvIHByZXZlbnQgaGF2aW5nIHRvIHN5bmMgZHNjIGNoYW5n
ZXMgYWNyb3NzLCBhbmQKPj4+IHByZXZlbnQgY2hhbmdlcyBmcm9tIGJlaW5nIG9taXR0ZWQgZm9y
IFhlbiBvbiBhY2NpZGVudC4KPj4KPj4gVHJ1ZSwgYnV0IGluIG15IGV4cGVyaWVuY2UgdGhhdCdz
IGJlZW4gdGhlIHNtYWxsZXIgcHJvYmxlbS4gVGhlIGxhcmdlcgo+PiBwcm9ibGVtIGhhcyBiZWVu
IG1vZGlmeWluZyBYZW4gc3R1ZmYgaW4gdW5pbnRlbmRlZCB3YXlzICg9IHJlZ3Jlc3NpbmcKPj4g
WGVuKSwgYmVjYXVzZSB3ZSBjYW4ndCB0ZXN0IChvciBkb24ndCBldmVuIG5vdGljZSkgdGhlIFhl
bi1zaWRlCj4+IGltcGxpY2F0aW9ucyBvZiBjaGFuZ2VzIG1hZGUgdG8gY29tbW9uIHNvdXJjZS4K
PiAKPiBEb2VzIHRoYXQgbWVhbiB5b3UgYXZvaWQgY2hhbmdpbmcgQXJtVmlydFhlbi5kc2MgZW50
aXJlbHksIG9yIHlvdSB0cnkKPiB0byB1cGRhdGUgaXQgd2hlbiBpdCBzZWVtcyBsaWtlbHkgdG8g
bm90IGNhdXNlIHRyb3VibGU/IEkgY291bGQgc2VlCj4gdW5pbnRlbmRlZCBicmVha2FnZSBlaXRo
ZXIgd2F5LgoKVW5kZXIgQXJtVmlydFBrZywgd2UgaGF2ZSB0aHJlZSBwbGF0Zm9ybXM6IEFybVZp
cnRRZW11LApBcm1WaXJ0UWVtdUtlcm5lbCwgYW5kIEFybVZpcnRYZW4uIEFsbCBvZiB0aGVzZSBo
YXZlIHNlcGFyYXRlIERTQyBmaWxlcy4KQWxsIGluY2x1ZGUgQXJtVmlydC5kc2MuaW5jLgoKSW4g
YWRkaXRpb24sIGFsbCB0aHJlZSBoYXZlIEZERiBmaWxlcywgYnV0IEFybVZpcnRRZW11IGFuZApB
cm1WaXJ0UWVtdUtlcm5lbCBzaGFyZSAoaW5jbHVkZSkgQXJtVmlydFFlbXVGdk1haW4uZmRmLmlu
Yy4KCkFybVZpcnRRZW11IGFuZCBBcm1WaXJ0UWVtdUtlcm5lbCBkaWZmZXIgaW4gdGhhdCB0aGUg
bGF0dGVyIGlzIHN1cHBvc2VkCnRvIGJlIGxhdW5jaGVkIHdpdGggIi1rZXJuZWwiIG9uIFFFTVUs
IG5vdCB2aWEgcGZsYXNoLgoKSSBwcmltYXJpbHkgY2FyZSBhYm91dCBBcm1WaXJ0UWVtdS4gSSBh
bHdheXMgc3RhcnQgbW9kaWZpY2F0aW9ucyB0aGVyZS4KVGhlbiBJIGV2YWx1YXRlIHdoZXRoZXIg
dGhlIGNoYW5nZSBtYWtlcyBzZW5zZSBmb3IgQXJtVmlydFFlbXVLZXJuZWwsCmFuZCByZWx5IG9u
IEFyZCB0byBjb25maXJtIHRoYXQuIEFybVZpcnRYZW4gaXMgdGhlIGxhc3QgdGhvdWdodCBmb3Ig
bWUsCmFuZCBJIHRyeSB0byBtYWtlIGEgImJlc3QgZWZmb3J0IiB0byBmaWd1cmUgb3V0IHRoZSBp
bXBhY3QuCgpXaGVuIEknbSBzdG9uZ2x5IGluIGRvdWJ0IHJlOiBYZW4sIEkgYXZvaWQgbW9kaWZ5
aW5nIEFybVZpcnRYZW4uIFdoZW4gSQpzb3J0IG9mIHN1c3BlY3QgdGhhdCBtb2RpZnlpbmcgWGVu
IGlzIHZhbGlkL25lY2Vzc2FyeSwgdGhlbiBJIChhKSBlaXRoZXIKbW9kaWZ5IEFybVZpcnRYZW4g
ZXhwbGljaXRseSwgb3IgKGIpIG1vZGlmeSBBcm1WaXJ0LmRzYy5pbmMgKkFORCogdGFsawphYm91
dCBYZW4gZXhwbGljaXRseSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsIGFuZC9vciB0aGUgY292ZXIg
bGV0dGVyLgoKQ2FzZSAoYikgaXMgcXVpdGUgcmFyZS4gV2hlbiBpdCBoYXBwZW5zLCBpdCB1c3Vh
bGx5IGZvbGxvd3MgaW1tZWRpYXRlbHkKKGEpIC0tIEkgbWlnaHQgY2hhbmdlIEFybVZpcnRYZW4s
IGFuZCB0aGVuIHJlYWxpemUgc29tZXRoaW5nIGlzIG5vdwpzaGFyZWQgYmV0d2VlbiBYZW4gYW5k
IFFFTVUuIEl0J3MgdGhlbiBhIHNlcGFyYXRlIGRlY2lzaW9uIHdoZXRoZXIgSQphY3R1YWxseSB3
YW50IHRvIG1lcmdlIHRoYXQgdGhpbmcgaW50byBBcm1WaXJ0LmRzYy5pbmMgLS0gc29tZXRpbWVz
CnRoYXQncyBub3QgdGhlIGJlc3QgZGVjaXNpb24gKGV4YWN0bHkgYmVjYXVzZSBpdCBpbmNyZWFz
ZXMgc2hhcmVkIHJldmlldwpyZXNwb25zaWJpbGl0eSBmb3IgdGhlIGZ1dHVyZSkuCgpJbiBib3Ro
IGNhc2UgKGEpIGFuZCAoYiksIEkgQ0MgdGhlIFhlbiByZXZpZXdlcnMuIFRoZSBwb2ludCBpcyB0
aGF0CiJYZW4iIGlzIG1lbnRpb25lZCBzb21ld2hlcmUgZXhwbGljaXRseSAoZGlmZnN0YXQgb3Ig
Y29tbWl0IG1lc3NhZ2UpLgpUaGlzIGxldHMgdXMgZGVjaWRlIG1vcmUgY2xlYXJseSB3aGV0aGVy
IFhlbiByZXZpZXdlcnMgc2hvdWxkCnBhcnRpY2lwYXRlIC0tIHdoZW4gdGhleSBkb24ndCBoYXZl
IHRvLCB0aGF0IHNhdmVzIHVzIGFsbCB0aW1lLCBhbmQgc28Kd2hlbiB0aGV5ICpkbyogbmVlZCB0
bywgdGhlaXIgcmVzcG9uc2liaWxpdHkgaXMgYm90aCBiaWcgYW5kIGNsZWFyLgoKSWYsIGZvciBR
RU1VIGZlYXR1cmUgZGV2ZWxvcG1lbnQgb3IgYnVnZml4aW5nLCB3ZSBrZXB0IG1vZGlmeWluZyBm
aWxlcwp0aGF0IHdlcmUgYnkgZGVmYXVsdCBwcm9jZXNzZWQgaW4gWGVuIGJ1aWxkcyB0b28sIHRo
ZW4gWGVuIHBlb3BsZSB3b3VsZApiZSBib21iYXJkZWQgd2l0aCByZXZpZXcgcmVxdWVzdHMgdGhl
eSdkIHJhdGhlciBpZ25vcmUuIFRoZWlyIGF0dGVudGlvbgp3b3VsZCB3YW5lIGFuZCB0aGV5J2Qg
bWlzcyAob3IgZ3JlYXRseSBkZWxheSkgdGhlIHJldmlld3Mgd2hlbiB0aGV5CnNob3VsZCBpbmRl
ZWQgZm9sbG93IHVwIChhbmQgaG9wZWZ1bGx5IHF1aWNrbHkpLgoKSXQncyBub3QgYSAxMDAlICJz
Y2llbnRpZmljIiB3b3JrZmxvdywgYW5kIHlvdSBhcmUgcmlnaHQgdGhhdCBib3RoCmFwcHJvYWNo
ZXMgY2FuIGNhdXNlIGlzc3VlcyBieSBvbWlzc2lvbi4gSW4gbXkgZXhwZXJpZW5jZSB0aGUgc3Bs
aXQKdGVuZHMgdG8gYmUgc2FmZXIgKGFuZCBlYXNpZXIgb24gaHVtYW4gcmVzb3VyY2VzKSwgaW4g
cHJhY3RpY2UuCgo+IEFueXdheSwgaXQgc291bmRzIGxpa2UgaXQncyBnZW5lcmFsbHkgd29ya2lu
ZyBvdXQgb2theSB3aXRoCj4gQXJtVmlydFhlbiwgc28gaXQgc2VlbXMgb2theSB0byBmb2xsb3cg
dGhhdCB1bmRlciBPdm1mUGtnLgoKVGhhbmtzIQpMYXN6bG8KCj4gCj4gLUpvcmRhbgo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
