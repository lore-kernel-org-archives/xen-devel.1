Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B9FC10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 11:47:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E8B92133D
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 11:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E8B92133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEYB0-0002UQ-UD; Thu, 11 Apr 2019 11:47:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=i8R2=SN=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hEYAz-0002Ta-E9
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 11:47:29 +0000
X-Inumbo-ID: 94a34ded-5c4f-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 94a34ded-5c4f-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 11:47:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8571C307D966;
 Thu, 11 Apr 2019 11:47:27 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-225.rdu2.redhat.com
 [10.10.120.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E450960BF7;
 Thu, 11 Apr 2019 11:47:25 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-11-anthony.perard@citrix.com>
 <10573b3b-dfb8-c9e3-fb0c-6ea6f07586de@redhat.com>
Message-ID: <f696ad92-f16f-3265-57d0-97f0ea4e6ffc@redhat.com>
Date: Thu, 11 Apr 2019 13:47:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <10573b3b-dfb8-c9e3-fb0c-6ea6f07586de@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 11 Apr 2019 11:47:27 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 10/31]
 OvmfPkg/XenPlatformPei: Detect OVMF_INFO from hvmloader
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411114725.1DzKLug9U2U1-zuPVNLxQBAGFPZuOrZUhA7fCNKiEiU@z>

T24gMDQvMTEvMTkgMTM6NDcsIExhc3psbyBFcnNlayB3cm90ZToKPiBPbiAwNC8wOS8xOSAxMzow
OCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+IFRoaXMgc3RydWN0IGlzIG9ubHkgdXNlZnVsIHRv
IHJldHJpZXZlIHRoZSBFODIwIHRhYmxlLiBUaGUKPiAKPiAoMSkgcGxlYXNlIHJlcGxhY2UgInRo
aXMgc3RydWN0IiB3aXRoIHRoZSBuYW1lIG9mIHRoZSBzdHJ1Y3QuCj4gCj4+IG1YZW5Idm1sb2Fk
ZXJJbmZvIGlzbid0IHVzZWQgeWV0LCBidXQgd2lsbCBiZSB1c2UgaW4gYSBmdXJ0aGVyIHBhdGNo
IHRvCj4+IHJldHJpZXZlIHRoZSBFODIwIHRhYmxlLgo+Pgo+PiBBbHNvIHJlbW92ZSB0aGUgdW51
c2VkIHBvaW50ZXIgZnJvbSB0aGUgWGVuSW5mbyBIT0IgYXMgdGhhdCBpbmZvcm1hdGlvbgo+PiBp
cyBvbmx5IHVzZWZ1bCBpbiB0aGUgWGVuUGxhdGZvcm1QZWkuCj4+Cj4+IENvbnRyaWJ1dGVkLXVu
ZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0aW9uIEFncmVlbWVudCAxLjEKPj4gU2lnbmVkLW9mZi1i
eTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4+IC0tLQo+PiAg
T3ZtZlBrZy9JbmNsdWRlL0d1aWQvWGVuSW5mby5oIHwgIDQgLS0tLQo+PiAgT3ZtZlBrZy9QbGF0
Zm9ybVBlaS9YZW4uYyAgICAgIHwgIDMgLS0tCj4+ICBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hl
bi5jICAgfCAyMyArKysrKysrKysrKysrKysrKystLQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCAyMSBp
bnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9J
bmNsdWRlL0d1aWQvWGVuSW5mby5oIGIvT3ZtZlBrZy9JbmNsdWRlL0d1aWQvWGVuSW5mby5oCj4+
IGluZGV4IGQ1MTJiMGI2M2YuLjVkNDU3OWYyNDQgMTAwNjQ0Cj4+IC0tLSBhL092bWZQa2cvSW5j
bHVkZS9HdWlkL1hlbkluZm8uaAo+PiArKysgYi9Pdm1mUGtnL0luY2x1ZGUvR3VpZC9YZW5JbmZv
LmgKPj4gQEAgLTI0LDEwICsyNCw2IEBAIHR5cGVkZWYgc3RydWN0IHsKPj4gICAgLy8vCj4+ICAg
IFZPSUQgKkh5cGVyUGFnZXM7Cj4+ICAgIC8vLwo+PiAtICAvLy8gTG9jYXRpb24gb2YgdGhlIGh2
bV9pbmZvIHBhZ2UuCj4+IC0gIC8vLwo+PiAtICBWT0lEICpIdm1JbmZvOwo+PiAtICAvLy8KPj4g
ICAgLy8vIEh5cGVydmlzb3IgbWFqb3IgdmVyc2lvbi4KPj4gICAgLy8vCj4+ICAgIFVJTlQxNiBW
ZXJzaW9uTWFqb3I7Cj4+IGRpZmYgLS1naXQgYS9Pdm1mUGtnL1BsYXRmb3JtUGVpL1hlbi5jIGIv
T3ZtZlBrZy9QbGF0Zm9ybVBlaS9YZW4uYwo+PiBpbmRleCBhYjM4Zjk3YTY3Li43NTE4MWJlMmZk
IDEwMDY0NAo+PiAtLS0gYS9Pdm1mUGtnL1BsYXRmb3JtUGVpL1hlbi5jCj4+ICsrKyBiL092bWZQ
a2cvUGxhdGZvcm1QZWkvWGVuLmMKPj4gQEAgLTEwNCw5ICsxMDQsNiBAQCBYZW5Db25uZWN0ICgK
Pj4gICAgbVhlbkluZm8uVmVyc2lvbk1ham9yID0gKFVJTlQxNikoWGVuVmVyc2lvbiA+PiAxNik7
Cj4+ICAgIG1YZW5JbmZvLlZlcnNpb25NaW5vciA9IChVSU5UMTYpKFhlblZlcnNpb24gJiAweEZG
RkYpOwo+PiAgCj4+IC0gIC8qIFRCRDogTG9jYXRlIGh2bV9pbmZvIGFuZCByZXNlcnZlIGl0IGF3
YXkuICovCj4+IC0gIG1YZW5JbmZvLkh2bUluZm8gPSBOVUxMOwo+PiAtCj4+ICAgIEJ1aWxkR3Vp
ZERhdGFIb2IgKAo+PiAgICAgICZnRWZpWGVuSW5mb0d1aWQsCj4+ICAgICAgJm1YZW5JbmZvLAo+
PiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyBiL092bWZQa2cvWGVu
UGxhdGZvcm1QZWkvWGVuLmMKPj4gaW5kZXggN2M4MmU1YjY5Yi4uYTg2NjY0MWI2NyAxMDA2NDQK
Pj4gLS0tIGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+PiArKysgYi9Pdm1mUGtnL1hl
blBsYXRmb3JtUGVpL1hlbi5jCj4+IEBAIC0zOSw2ICszOSwxMiBAQCBTVEFUSUMgVUlOVDMyIG1Y
ZW5MZWFmID0gMDsKPj4gIAo+PiAgRUZJX1hFTl9JTkZPIG1YZW5JbmZvOwo+PiAgCj4+ICsvLwo+
PiArLy8gTG9jYXRpb24gb2YgdGhlIGZpcm13YXJlIGluZm8gc3RydWN0IHNldHVwIGJ5IGh2bWxv
YWRlci4KPj4gKy8vIE9ubHkgdGhlIEU4MjAgdGFibGUgaXMgdXNlZCBieSBPVk1GLgo+PiArLy8K
Pj4gK0VGSV9YRU5fT1ZNRl9JTkZPICptWGVuSHZtbG9hZGVySW5mbzsKPj4gKwo+PiAgLyoqCj4+
ICAgIFJldHVybnMgRTgyMCBtYXAgcHJvdmlkZWQgYnkgWGVuCj4+ICAKPj4gQEAgLTg0LDYgKzkw
LDggQEAgWGVuQ29ubmVjdCAoCj4+ICAgIFVJTlQzMiBUcmFuc2ZlclJlZzsKPj4gICAgVUlOVDMy
IFRyYW5zZmVyUGFnZXM7Cj4+ICAgIFVJTlQzMiBYZW5WZXJzaW9uOwo+PiArICBFRklfWEVOX09W
TUZfSU5GTyAqSW5mbzsKPj4gKyAgQ0hBUjggU2lnW3NpemVvZiAoSW5mby0+U2lnbmF0dXJlKSAr
IDFdOwo+PiAgCj4+ICAgIEFzbUNwdWlkIChYZW5MZWFmICsgMiwgJlRyYW5zZmVyUGFnZXMsICZU
cmFuc2ZlclJlZywgTlVMTCwgTlVMTCk7Cj4+ICAgIG1YZW5JbmZvLkh5cGVyUGFnZXMgPSBBbGxv
Y2F0ZVBhZ2VzIChUcmFuc2ZlclBhZ2VzKTsKPj4gQEAgLTEwMyw4ICsxMTEsMTkgQEAgWGVuQ29u
bmVjdCAoCj4+ICAgIG1YZW5JbmZvLlZlcnNpb25NYWpvciA9IChVSU5UMTYpKFhlblZlcnNpb24g
Pj4gMTYpOwo+PiAgICBtWGVuSW5mby5WZXJzaW9uTWlub3IgPSAoVUlOVDE2KShYZW5WZXJzaW9u
ICYgMHhGRkZGKTsKPj4gIAo+PiAtICAvKiBUQkQ6IExvY2F0ZSBodm1faW5mbyBhbmQgcmVzZXJ2
ZSBpdCBhd2F5LiAqLwo+PiAtICBtWGVuSW5mby5Idm1JbmZvID0gTlVMTDsKPj4gKyAgLy8KPj4g
KyAgLy8gQ2hlY2sgaWYgdGhlcmUgYXJlIGluZm9ybWF0aW9uIGxlZnQgYnkgaHZtbG9hZGVyCj4+
ICsgIC8vCj4+ICsKPj4gKyAgSW5mbyA9IChFRklfWEVOX09WTUZfSU5GTyAqKShVSU5UTikgT1ZN
Rl9JTkZPX1BIWVNJQ0FMX0FERFJFU1M7Cj4+ICsgIC8vIENvcHkgdGhlIHNpZ25hdHVyZSwgYW5k
IG1ha2UgaXQgbnVsbC10ZXJtaW5hdGVkLgo+IAo+ICgyKSBQbGVhc2UgdXNlIHRoZSBmb2xsb3dp
bmcgc3R5bGU6Cj4gCj4gICAvLwo+ICAgLy8gQ29weSB0aGUgc2lnbmF0dXJlLCBhbmQgbWFrZSBp
dCBudWxsLXRlcm1pbmF0ZWQuCj4gICAvLwo+IAo+PiArICBBc2NpaVN0cm5DcHlTKFNpZywgc2l6
ZW9mIChTaWcpLAo+PiArICAgICAgICAgICAgICAgIChDSEFSOCAqKSAmSW5mby0+U2lnbmF0dXJl
LCBzaXplb2YgKEluZm8tPlNpZ25hdHVyZSkpOwo+IAo+ICgzKSBUaGlzIHNob3VsZCBiZSBpbmRl
bnRlZCBhczoKPiAKPiAgIEFzY2lpU3RybkNweVMgKAo+ICAgICBTaWcsCj4gICAgIHNpemVvZiAo
U2lnKSwKPiAgICAgKENIQVI4ICopICZJbmZvLT5TaWduYXR1cmUsCj4gICAgIHNpemVvZiAoSW5m
by0+U2lnbmF0dXJlKQo+ICAgICApOwo+IAo+IG9yOgo+IAo+ICAgQXNjaWlTdHJuQ3B5UyAoU2ln
LCBzaXplb2YgKFNpZyksIChDSEFSOCAqKSAmSW5mby0+U2lnbmF0dXJlLAo+ICAgICBzaXplb2Yg
KEluZm8tPlNpZ25hdHVyZSkpOwo+IAo+IChub3RlIHRoZSB3aGl0ZXNwYWNlIGJlZm9yZSB0aGUg
b3BlbmluZyBwYXJlbiwgYWZ0ZXIgdGhlIGZ1bmN0aW9uCj4gZGVzaWduYXRvcikKPiAKPiAKPiBJ
J20gbm90IGNoZWNraW5nIHRoZSBjb3JyZWN0bmVzcyBvZiB0aGUgcGFyYW1ldGVycywgZm9yIG5v
dy4KPiAKPiBXaXRoICgxKSBhbmQgKDMpIGFkZHJlc3NlZDoKCnNpZ2gsIEkgbWVhbnQgIigxKSB0
aHJvdWdoICgzKSIuCgo+IEFja2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29t
Pgo+IAo+IElmIHlvdSBjYW4sIHBsZWFzZSB2ZXJpZnkgdGhlIGNvbW1lbnQgc3R5bGUgYW5kIHRo
ZSBpbmRlbnRhdGlvbiBzdHlsZSBpbgo+IHRoZSBvdGhlciBwYXRjaGVzIHRvby4KPiAKPiBUaGFu
a3MKPiBMYXN6bG8KPiAKPj4gKyAgaWYgKEFzY2lpU3RyQ21wIChTaWcsICJYZW5IVk1PVk1GIikg
PT0gMCkgewo+PiArICAgIG1YZW5Idm1sb2FkZXJJbmZvID0gSW5mbzsKPj4gKyAgfSBlbHNlIHsK
Pj4gKyAgICBtWGVuSHZtbG9hZGVySW5mbyA9IE5VTEw7Cj4+ICsgIH0KPj4gIAo+PiAgICBCdWls
ZEd1aWREYXRhSG9iICgKPj4gICAgICAmZ0VmaVhlbkluZm9HdWlkLAo+Pgo+IAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
