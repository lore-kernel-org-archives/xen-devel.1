From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 1/2] xen/gntdev: Do not destroy context
 while dma-bufs are in use
Date: Fri, 15 Feb 2019 17:35:35 +0200
Message-ID: <6e9f502c-3d60-32fb-d737-b016cfa5a7f1__2092.25891610316$1550245001$gmane$org@gmail.com>
References: <20190214142321.1138-1-andr2000@gmail.com>
 <143411a8-385d-2cce-9211-22ba7db25a15@oracle.com>
 <1c8d1612-f1b9-b080-2d11-432d811b25d1@gmail.com>
 <eddff494-8cc7-f796-156e-e2e9e3d2daae@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zdu+=QW=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gufWd-00014A-F8
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 15:35:39 +0000
Received: by mail-lf1-x143.google.com with SMTP id v7so7509828lfd.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Feb 2019 07:35:38 -0800 (PST)
In-Reply-To: <eddff494-8cc7-f796-156e-e2e9e3d2daae@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, jgross@suse.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xNS8xOSA1OjI4IFBNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4gT24gMi8xNS8xOSAx
MDowNyBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+IE9uIDIvMTUvMTkgNTow
MyBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Pj4gT24gMi8xNC8xOSA5OjIzIEFNLCBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+PiAgwqAgwqAgLyogRE1BIGJ1ZmZlciBleHBv
cnQgc3VwcG9ydC4gKi8KPj4+PiBAQCAtMzExLDYgKzMxNyw3IEBAIHN0YXRpYyB2b2lkIGRtYWJ1
Zl9leHBfcmVsZWFzZShzdHJ1Y3Qga3JlZiAqa3JlZikKPj4+PiAgwqAgwqDCoMKgwqDCoCBkbWFi
dWZfZXhwX3dhaXRfb2JqX3NpZ25hbChnbnRkZXZfZG1hYnVmLT5wcml2LCBnbnRkZXZfZG1hYnVm
KTsKPj4+PiAgwqDCoMKgwqDCoCBsaXN0X2RlbCgmZ250ZGV2X2RtYWJ1Zi0+bmV4dCk7Cj4+Pj4g
K8KgwqDCoCBmcHV0KGdudGRldl9kbWFidWYtPnByaXYtPmZpbHApOwo+Pj4+ICDCoMKgwqDCoMKg
IGtmcmVlKGdudGRldl9kbWFidWYpOwo+Pj4+ICDCoCB9Cj4+Pj4gIMKgIEBAIC00MjMsNiArNDMw
LDcgQEAgc3RhdGljIGludCBkbWFidWZfZXhwX2Zyb21fcGFnZXMoc3RydWN0Cj4+Pj4gZ250ZGV2
X2RtYWJ1Zl9leHBvcnRfYXJncyAqYXJncykKPj4+PiAgwqDCoMKgwqDCoCBtdXRleF9sb2NrKCZh
cmdzLT5kbWFidWZfcHJpdi0+bG9jayk7Cj4+Pj4gIMKgwqDCoMKgwqAgbGlzdF9hZGQoJmdudGRl
dl9kbWFidWYtPm5leHQsICZhcmdzLT5kbWFidWZfcHJpdi0+ZXhwX2xpc3QpOwo+Pj4+ICDCoMKg
wqDCoMKgIG11dGV4X3VubG9jaygmYXJncy0+ZG1hYnVmX3ByaXYtPmxvY2spOwo+Pj4+ICvCoMKg
wqAgZ2V0X2ZpbGUoZ250ZGV2X2RtYWJ1Zi0+cHJpdi0+ZmlscCk7Cj4+PiBOb3QgZmdldCgpPwo+
PiBmZ2V0IHdhbnRzIGZpbGUgZGVzY3JpcHRvciBbMV0gYW5kIHJldHVybnMgc3RydWN0IGZpbGUg
KiwKPj4gYnV0IHdlIGFscmVhZHkgaGF2ZSBzdHJ1Y3QgZmlsZSosIHNvIEkgdXNlIGdldF9maWxl
IFsyXQo+PiB3aGljaCBkb2VzIHdoYXQgSSBuZWVkIC0gaW5jcmVtZW50cyB0aGUgcmVmZXJlbmNl
IGNvdW50ZXIKPj4gb24gdGhlIGZpbGUKPgo+IFJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kg
PGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgpUaGFuayB5b3UsCmFueSBjaGFuY2Ugd2UgY2Fu
IGdldCB0aGlzIGZvciA1LjE/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
