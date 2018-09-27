From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/1] x86/boot: Allocate one extra module
 slot for Xen image placement
Date: Thu, 27 Sep 2018 11:06:24 +0100
Message-ID: <a06c4a79-beec-ec91-f940-d91693ca9121@citrix.com>
References: <1538042707-31855-1-git-send-email-daniel.kiper@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xlny=mj=citrix.com=prvs=8017a36a5=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g5TBj-00077E-W5
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 10:06:28 +0000
In-Reply-To: <1538042707-31855-1-git-send-email-daniel.kiper@oracle.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>, xen-devel@lists.xenproject.org
Cc: wei.liu2@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDkvMTggMTE6MDUsIERhbmllbCBLaXBlciB3cm90ZToKPiBDb21taXQgOTU4OTkyNyAo
eDg2L21iMjogYXZvaWQgWGVuIGltYWdlIHdoZW4gbG9va2luZyBmb3IKPiBtb2R1bGUvY3Jhc2hr
ZXJuZWwgcG9zaXRpb24pIGZpeGVkIHJlbG9jYXRpb24gaXNzdWVzIGZvcgo+IE11bHRpYm9vdDIg
cHJvdG9jb2wuIFVuZm9ydHVuYXRlbHkgaXQgbWlzc2VkIHRvIGFsbG9jYXRlCj4gbW9kdWxlIHNs
b3QgZm9yIFhlbiBpbWFnZSBwbGFjZW1lbnQgaW4gZWFybHkgYm9vdCBwYXRoLgo+IFNvLCBsZXQn
cyBmaXggaXQgcmlnaHQgbm93Lgo+Cj4gUmVwb3J0ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIEtpcGVyIDxkYW5pZWwua2lwZXJAb3Jh
Y2xlLmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
