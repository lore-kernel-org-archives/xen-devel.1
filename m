From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 5/8] xen/gntdev: Add initial support for
 dma-buf UAPI
Date: Wed, 30 May 2018 09:52:55 +0300
Message-ID: <25a0adae-6488-1d24-0c0a-514b24dcb1df__46796.9588622966$1527663101$gmane$org@gmail.com>
References: <20180525153331.31188-1-andr2000@gmail.com>
 <20180525153331.31188-6-andr2000@gmail.com>
 <232459a8-695f-56bf-e39b-693a2d2b27e3@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mt+2=ir=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fNuyh-0002Jk-Up
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 06:53:00 +0000
Received: by mail-lf0-x241.google.com with SMTP id y20-v6so2533756lfy.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 May 2018 23:52:59 -0700 (PDT)
In-Reply-To: <232459a8-695f-56bf-e39b-693a2d2b27e3@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMzAvMjAxOCAwMTozNCBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDA1LzI1
LzIwMTggMTE6MzMgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+Cj4+ICAgCj4+
ICsvKgo+PiArICogQ3JlYXRlIGEgZG1hLWJ1ZiBbMV0gZnJvbSBncmFudCByZWZlcmVuY2VzIEBy
ZWZzIG9mIGNvdW50IEBjb3VudCBwcm92aWRlZAo+PiArICogYnkgdGhlIGZvcmVpZ24gZG9tYWlu
IEBkb21pZCB3aXRoIGZsYWdzIEBmbGFncy4KPj4gKyAqCj4+ICsgKiBCeSBkZWZhdWx0IGRtYS1i
dWYgaXMgYmFja2VkIGJ5IHN5c3RlbSBtZW1vcnkgcGFnZXMsIGJ1dCBieSBwcm92aWRpbmcKPj4g
KyAqIG9uZSBvZiB0aGUgR05UREVWX0RNQV9GTEFHX1hYWCBmbGFncyBpdCBjYW4gYWxzbyBiZSBj
cmVhdGVkIGFzCj4+ICsgKiBhIERNQSB3cml0ZS1jb21iaW5lIG9yIGNvaGVyZW50IGJ1ZmZlciwg
ZS5nLiBhbGxvY2F0ZWQgd2l0aCBkbWFfYWxsb2Nfd2MvCj4+ICsgKiBkbWFfYWxsb2NfY29oZXJl
bnQuCj4+ICsgKgo+PiArICogUmV0dXJucyAwIGlmIGRtYS1idWYgd2FzIHN1Y2Nlc3NmdWxseSBj
cmVhdGVkIGFuZCB0aGUgY29ycmVzcG9uZGluZwo+PiArICogZG1hLWJ1ZidzIGZpbGUgZGVzY3Jp
cHRvciBpcyByZXR1cm5lZCBpbiBAZmQuCj4+ICsgKgo+PiArICogWzFdIGh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBp
L2RtYS1idWYucnN0Cj4KPiBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvZG1hLWJ1Zi5yc3QuCj4K
SW5kZWVkIDspCj4gLWJvcmlzClRoYW5rIHlvdSwKT2xla3NhbmRyCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
