From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 3/9] drm/xen-front: Read driver
 configuration from Xen store
Date: Fri, 23 Feb 2018 08:46:05 +0200
Message-ID: <864fe8f3-99f7-1f63-4169-fc9e37c46c3f__4058.93487991325$1519368293$gmane$org@gmail.com>
References: <1519200222-20623-1-git-send-email-andr2000@gmail.com>
 <1519200222-20623-4-git-send-email-andr2000@gmail.com>
 <74f01442-2e9e-5de7-3a8d-f5c12d9e8667@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vqf1=fr=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1ep77S-00021D-4N
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 06:46:10 +0000
Received: by mail-lf0-x244.google.com with SMTP id g72so10884707lfg.5
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2018 22:46:08 -0800 (PST)
In-Reply-To: <74f01442-2e9e-5de7-3a8d-f5c12d9e8667@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, airlied@linux.ie, daniel.vetter@intel.com, seanpaul@chromium.org, gustavo@padovan.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjMvMjAxOCAwMToyMCBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDAyLzIx
LzIwMTggMDM6MDMgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiArCj4+ICtz
dGF0aWMgaW50IGNmZ19jb25uZWN0b3Ioc3RydWN0IHhlbl9kcm1fZnJvbnRfaW5mbyAqZnJvbnRf
aW5mbywKPj4gKwkJc3RydWN0IHhlbl9kcm1fZnJvbnRfY2ZnX2Nvbm5lY3RvciAqY29ubmVjdG9y
LAo+PiArCQljb25zdCBjaGFyICpwYXRoLCBpbnQgaW5kZXgpCj4+ICt7Cj4+ICsJY2hhciAqY29u
bmVjdG9yX3BhdGg7Cj4+ICsKPj4gKwljb25uZWN0b3JfcGF0aCA9IGRldm1fa2FzcHJpbnRmKCZm
cm9udF9pbmZvLT54Yl9kZXYtPmRldiwKPj4gKwkJCUdGUF9LRVJORUwsICIlcy8lZCIsIHBhdGgs
IGluZGV4KTsKPj4gKwlpZiAoIWNvbm5lY3Rvcl9wYXRoKQo+PiArCQlyZXR1cm4gLUVOT01FTTsK
Pj4gKwo+PiArCWNvbm5lY3Rvci0+eGVuc3RvcmVfcGF0aCA9IGNvbm5lY3Rvcl9wYXRoOwo+PiAr
CWlmICh4ZW5idXNfc2NhbmYoWEJUX05JTCwgY29ubmVjdG9yX3BhdGgsIFhFTkRJU1BMX0ZJRUxE
X1JFU09MVVRJT04sCj4+ICsJCQkiJWQiIFhFTkRJU1BMX1JFU09MVVRJT05fU0VQQVJBVE9SICIl
ZCIsCj4+ICsJCQkmY29ubmVjdG9yLT53aWR0aCwgJmNvbm5lY3Rvci0+aGVpZ2h0KSA8IDApIHsK
Pj4gKwkJLyogZWl0aGVyIG5vIGVudHJ5IGNvbmZpZ3VyZWQgb3Igd3JvbmcgcmVzb2x1dGlvbiBz
ZXQgKi8KPj4gKwkJY29ubmVjdG9yLT53aWR0aCA9IDA7Cj4+ICsJCWNvbm5lY3Rvci0+aGVpZ2h0
ID0gMDsKPiBEbyB5b3UgYWxzbyBuZWVkIHRvIHNldCBjb25uZWN0b3ItPnhlbnN0b3JlX3BhdGgg
dG8gTlVMTD8gT3IgbWF5YmUganVzdAo+IHNldCBpdCBhZnRlciB4ZW5idXNfc2NhbmYoKSBjYWxs
LgpXaWxsIG1vdmUgaXQgZG93biB0aGUgY29kZSwgYWZ0ZXIgImlmIiwgdGhhbmsgeW91Cj4gLWJv
cmlzCj4KPgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
