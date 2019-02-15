From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/2] xen/gntdev: Do not destroy context
 while dma-bufs are in use
Date: Fri, 15 Feb 2019 10:28:31 -0500
Message-ID: <eddff494-8cc7-f796-156e-e2e9e3d2daae__10947.288018518$1550244590$gmane$org@oracle.com>
References: <20190214142321.1138-1-andr2000@gmail.com>
 <143411a8-385d-2cce-9211-22ba7db25a15@oracle.com>
 <1c8d1612-f1b9-b080-2d11-432d811b25d1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NTNL=QW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gufQD-000086-1i
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 15:29:01 +0000
In-Reply-To: <1c8d1612-f1b9-b080-2d11-432d811b25d1@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, jgross@suse.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xNS8xOSAxMDowNyBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4gT24g
Mi8xNS8xOSA1OjAzIFBNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IE9uIDIvMTQvMTkgOToy
MyBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+PiDCoCDCoCAvKiBETUEgYnVm
ZmVyIGV4cG9ydCBzdXBwb3J0LiAqLwo+Pj4gQEAgLTMxMSw2ICszMTcsNyBAQCBzdGF0aWMgdm9p
ZCBkbWFidWZfZXhwX3JlbGVhc2Uoc3RydWN0IGtyZWYgKmtyZWYpCj4+PiDCoCDCoMKgwqDCoMKg
IGRtYWJ1Zl9leHBfd2FpdF9vYmpfc2lnbmFsKGdudGRldl9kbWFidWYtPnByaXYsIGdudGRldl9k
bWFidWYpOwo+Pj4gwqDCoMKgwqDCoCBsaXN0X2RlbCgmZ250ZGV2X2RtYWJ1Zi0+bmV4dCk7Cj4+
PiArwqDCoMKgIGZwdXQoZ250ZGV2X2RtYWJ1Zi0+cHJpdi0+ZmlscCk7Cj4+PiDCoMKgwqDCoMKg
IGtmcmVlKGdudGRldl9kbWFidWYpOwo+Pj4gwqAgfQo+Pj4gwqAgQEAgLTQyMyw2ICs0MzAsNyBA
QCBzdGF0aWMgaW50IGRtYWJ1Zl9leHBfZnJvbV9wYWdlcyhzdHJ1Y3QKPj4+IGdudGRldl9kbWFi
dWZfZXhwb3J0X2FyZ3MgKmFyZ3MpCj4+PiDCoMKgwqDCoMKgIG11dGV4X2xvY2soJmFyZ3MtPmRt
YWJ1Zl9wcml2LT5sb2NrKTsKPj4+IMKgwqDCoMKgwqAgbGlzdF9hZGQoJmdudGRldl9kbWFidWYt
Pm5leHQsICZhcmdzLT5kbWFidWZfcHJpdi0+ZXhwX2xpc3QpOwo+Pj4gwqDCoMKgwqDCoCBtdXRl
eF91bmxvY2soJmFyZ3MtPmRtYWJ1Zl9wcml2LT5sb2NrKTsKPj4+ICvCoMKgwqAgZ2V0X2ZpbGUo
Z250ZGV2X2RtYWJ1Zi0+cHJpdi0+ZmlscCk7Cj4+IE5vdCBmZ2V0KCk/Cj4gZmdldCB3YW50cyBm
aWxlIGRlc2NyaXB0b3IgWzFdIGFuZCByZXR1cm5zIHN0cnVjdCBmaWxlICosCj4gYnV0IHdlIGFs
cmVhZHkgaGF2ZSBzdHJ1Y3QgZmlsZSosIHNvIEkgdXNlIGdldF9maWxlIFsyXQo+IHdoaWNoIGRv
ZXMgd2hhdCBJIG5lZWQgLSBpbmNyZW1lbnRzIHRoZSByZWZlcmVuY2UgY291bnRlcgo+IG9uIHRo
ZSBmaWxlCgoKUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9y
YWNsZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
