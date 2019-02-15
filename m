From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] xen/gntdev: Do not destroy context
 while dma-bufs are in use
Date: Fri, 15 Feb 2019 17:29:20 +0100
Message-ID: <3e5d2671-f50c-8c5c-4b15-4ea7d9f08c59__45337.528006506$1550248215$gmane$org@suse.com>
References: <20190214142321.1138-1-andr2000@gmail.com>
 <143411a8-385d-2cce-9211-22ba7db25a15@oracle.com>
 <1c8d1612-f1b9-b080-2d11-432d811b25d1@gmail.com>
 <eddff494-8cc7-f796-156e-e2e9e3d2daae@oracle.com>
 <6e9f502c-3d60-32fb-d737-b016cfa5a7f1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LI7m=QW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gugMf-0006yc-Dk
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 16:29:25 +0000
In-Reply-To: <6e9f502c-3d60-32fb-d737-b016cfa5a7f1@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDIvMjAxOSAxNjozNSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4gT24g
Mi8xNS8xOSA1OjI4IFBNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IE9uIDIvMTUvMTkgMTA6
MDcgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+Pj4gT24gMi8xNS8xOSA1OjAz
IFBNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+Pj4gT24gMi8xNC8xOSA5OjIzIEFNLCBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+Pj4gwqDCoCDCoCAvKiBETUEgYnVmZmVyIGV4
cG9ydCBzdXBwb3J0LiAqLwo+Pj4+PiBAQCAtMzExLDYgKzMxNyw3IEBAIHN0YXRpYyB2b2lkIGRt
YWJ1Zl9leHBfcmVsZWFzZShzdHJ1Y3Qga3JlZiAqa3JlZikKPj4+Pj4gwqDCoCDCoMKgwqDCoMKg
IGRtYWJ1Zl9leHBfd2FpdF9vYmpfc2lnbmFsKGdudGRldl9kbWFidWYtPnByaXYsCj4+Pj4+IGdu
dGRldl9kbWFidWYpOwo+Pj4+PiDCoMKgwqDCoMKgwqAgbGlzdF9kZWwoJmdudGRldl9kbWFidWYt
Pm5leHQpOwo+Pj4+PiArwqDCoMKgIGZwdXQoZ250ZGV2X2RtYWJ1Zi0+cHJpdi0+ZmlscCk7Cj4+
Pj4+IMKgwqDCoMKgwqDCoCBrZnJlZShnbnRkZXZfZG1hYnVmKTsKPj4+Pj4gwqDCoCB9Cj4+Pj4+
IMKgwqAgQEAgLTQyMyw2ICs0MzAsNyBAQCBzdGF0aWMgaW50IGRtYWJ1Zl9leHBfZnJvbV9wYWdl
cyhzdHJ1Y3QKPj4+Pj4gZ250ZGV2X2RtYWJ1Zl9leHBvcnRfYXJncyAqYXJncykKPj4+Pj4gwqDC
oMKgwqDCoMKgIG11dGV4X2xvY2soJmFyZ3MtPmRtYWJ1Zl9wcml2LT5sb2NrKTsKPj4+Pj4gwqDC
oMKgwqDCoMKgIGxpc3RfYWRkKCZnbnRkZXZfZG1hYnVmLT5uZXh0LCAmYXJncy0+ZG1hYnVmX3By
aXYtPmV4cF9saXN0KTsKPj4+Pj4gwqDCoMKgwqDCoMKgIG11dGV4X3VubG9jaygmYXJncy0+ZG1h
YnVmX3ByaXYtPmxvY2spOwo+Pj4+PiArwqDCoMKgIGdldF9maWxlKGdudGRldl9kbWFidWYtPnBy
aXYtPmZpbHApOwo+Pj4+IE5vdCBmZ2V0KCk/Cj4+PiBmZ2V0IHdhbnRzIGZpbGUgZGVzY3JpcHRv
ciBbMV0gYW5kIHJldHVybnMgc3RydWN0IGZpbGUgKiwKPj4+IGJ1dCB3ZSBhbHJlYWR5IGhhdmUg
c3RydWN0IGZpbGUqLCBzbyBJIHVzZSBnZXRfZmlsZSBbMl0KPj4+IHdoaWNoIGRvZXMgd2hhdCBJ
IG5lZWQgLSBpbmNyZW1lbnRzIHRoZSByZWZlcmVuY2UgY291bnRlcgo+Pj4gb24gdGhlIGZpbGUK
Pj4KPj4gUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNs
ZS5jb20+Cj4gVGhhbmsgeW91LAo+IGFueSBjaGFuY2Ugd2UgY2FuIGdldCB0aGlzIGZvciA1LjE/
Cj4gCgpZZXMuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
