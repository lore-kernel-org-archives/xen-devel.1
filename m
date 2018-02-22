From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 3/9] drm/xen-front: Read driver
 configuration from Xen store
Date: Thu, 22 Feb 2018 18:20:18 -0500
Message-ID: <74f01442-2e9e-5de7-3a8d-f5c12d9e8667@oracle.com>
References: <1519200222-20623-1-git-send-email-andr2000@gmail.com>
 <1519200222-20623-4-git-send-email-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qayk=fq=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ep09e-0005VW-BT
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 23:19:58 +0000
In-Reply-To: <1519200222-20623-4-git-send-email-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, airlied@linux.ie, daniel.vetter@intel.com, seanpaul@chromium.org, gustavo@padovan.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjEvMjAxOCAwMzowMyBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
Kwo+ICtzdGF0aWMgaW50IGNmZ19jb25uZWN0b3Ioc3RydWN0IHhlbl9kcm1fZnJvbnRfaW5mbyAq
ZnJvbnRfaW5mbywKPiArCQlzdHJ1Y3QgeGVuX2RybV9mcm9udF9jZmdfY29ubmVjdG9yICpjb25u
ZWN0b3IsCj4gKwkJY29uc3QgY2hhciAqcGF0aCwgaW50IGluZGV4KQo+ICt7Cj4gKwljaGFyICpj
b25uZWN0b3JfcGF0aDsKPiArCj4gKwljb25uZWN0b3JfcGF0aCA9IGRldm1fa2FzcHJpbnRmKCZm
cm9udF9pbmZvLT54Yl9kZXYtPmRldiwKPiArCQkJR0ZQX0tFUk5FTCwgIiVzLyVkIiwgcGF0aCwg
aW5kZXgpOwo+ICsJaWYgKCFjb25uZWN0b3JfcGF0aCkKPiArCQlyZXR1cm4gLUVOT01FTTsKPiAr
Cj4gKwljb25uZWN0b3ItPnhlbnN0b3JlX3BhdGggPSBjb25uZWN0b3JfcGF0aDsKPiArCWlmICh4
ZW5idXNfc2NhbmYoWEJUX05JTCwgY29ubmVjdG9yX3BhdGgsIFhFTkRJU1BMX0ZJRUxEX1JFU09M
VVRJT04sCj4gKwkJCSIlZCIgWEVORElTUExfUkVTT0xVVElPTl9TRVBBUkFUT1IgIiVkIiwKPiAr
CQkJJmNvbm5lY3Rvci0+d2lkdGgsICZjb25uZWN0b3ItPmhlaWdodCkgPCAwKSB7Cj4gKwkJLyog
ZWl0aGVyIG5vIGVudHJ5IGNvbmZpZ3VyZWQgb3Igd3JvbmcgcmVzb2x1dGlvbiBzZXQgKi8KPiAr
CQljb25uZWN0b3ItPndpZHRoID0gMDsKPiArCQljb25uZWN0b3ItPmhlaWdodCA9IDA7CgpEbyB5
b3UgYWxzbyBuZWVkIHRvIHNldCBjb25uZWN0b3ItPnhlbnN0b3JlX3BhdGggdG8gTlVMTD8gT3Ig
bWF5YmUganVzdApzZXQgaXQgYWZ0ZXIgeGVuYnVzX3NjYW5mKCkgY2FsbC4KCi1ib3JpcwoKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
