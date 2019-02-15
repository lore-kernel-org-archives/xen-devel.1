From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 1/2] xen/gntdev: Do not destroy context
 while dma-bufs are in use
Date: Fri, 15 Feb 2019 17:07:42 +0200
Message-ID: <1c8d1612-f1b9-b080-2d11-432d811b25d1__38610.4931401619$1550243315$gmane$org@gmail.com>
References: <20190214142321.1138-1-andr2000@gmail.com>
 <143411a8-385d-2cce-9211-22ba7db25a15@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zdu+=QW=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1guf5f-0006dX-HN
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 15:07:47 +0000
Received: by mail-lf1-x142.google.com with SMTP id t14so7426565lfk.7
 for <xen-devel@lists.xenproject.org>; Fri, 15 Feb 2019 07:07:46 -0800 (PST)
In-Reply-To: <143411a8-385d-2cce-9211-22ba7db25a15@oracle.com>
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

T24gMi8xNS8xOSA1OjAzIFBNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4gT24gMi8xNC8xOSA5
OjIzIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4gICAKPj4gICAvKiBETUEg
YnVmZmVyIGV4cG9ydCBzdXBwb3J0LiAqLwo+PiBAQCAtMzExLDYgKzMxNyw3IEBAIHN0YXRpYyB2
b2lkIGRtYWJ1Zl9leHBfcmVsZWFzZShzdHJ1Y3Qga3JlZiAqa3JlZikKPj4gICAKPj4gICAJZG1h
YnVmX2V4cF93YWl0X29ial9zaWduYWwoZ250ZGV2X2RtYWJ1Zi0+cHJpdiwgZ250ZGV2X2RtYWJ1
Zik7Cj4+ICAgCWxpc3RfZGVsKCZnbnRkZXZfZG1hYnVmLT5uZXh0KTsKPj4gKwlmcHV0KGdudGRl
dl9kbWFidWYtPnByaXYtPmZpbHApOwo+PiAgIAlrZnJlZShnbnRkZXZfZG1hYnVmKTsKPj4gICB9
Cj4+ICAgCj4+IEBAIC00MjMsNiArNDMwLDcgQEAgc3RhdGljIGludCBkbWFidWZfZXhwX2Zyb21f
cGFnZXMoc3RydWN0IGdudGRldl9kbWFidWZfZXhwb3J0X2FyZ3MgKmFyZ3MpCj4+ICAgCW11dGV4
X2xvY2soJmFyZ3MtPmRtYWJ1Zl9wcml2LT5sb2NrKTsKPj4gICAJbGlzdF9hZGQoJmdudGRldl9k
bWFidWYtPm5leHQsICZhcmdzLT5kbWFidWZfcHJpdi0+ZXhwX2xpc3QpOwo+PiAgIAltdXRleF91
bmxvY2soJmFyZ3MtPmRtYWJ1Zl9wcml2LT5sb2NrKTsKPj4gKwlnZXRfZmlsZShnbnRkZXZfZG1h
YnVmLT5wcml2LT5maWxwKTsKPiBOb3QgZmdldCgpPwpmZ2V0IHdhbnRzIGZpbGUgZGVzY3JpcHRv
ciBbMV0gYW5kIHJldHVybnMgc3RydWN0IGZpbGUgKiwKYnV0IHdlIGFscmVhZHkgaGF2ZSBzdHJ1
Y3QgZmlsZSosIHNvIEkgdXNlIGdldF9maWxlIFsyXQp3aGljaCBkb2VzIHdoYXQgSSBuZWVkIC0g
aW5jcmVtZW50cyB0aGUgcmVmZXJlbmNlIGNvdW50ZXIKb24gdGhlIGZpbGUKPgo+IC1ib3Jpcwo+
Cj4KWzFdIApodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4wLXJjNi9zb3VyY2Uv
aW5jbHVkZS9saW51eC9maWxlLmgjTDQ2ClsyXSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9s
aW51eC92NS4wLXJjNi9zb3VyY2UvaW5jbHVkZS9saW51eC9mcy5oI0w5NDkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
