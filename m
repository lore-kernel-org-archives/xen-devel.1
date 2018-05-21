From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [RFC 1/3] xen/balloon: Allow allocating DMA buffers
Date: Mon, 21 May 2018 08:40:30 +0300
Message-ID: <9541926e-001a-e41e-317c-dbff6d687761__24672.2406046048$1526881185$gmane$org@gmail.com>
References: <20180517082604.14828-1-andr2000@gmail.com>
 <20180517082604.14828-2-andr2000@gmail.com>
 <6a108876-19b7-49d0-3de2-9e10f984736c@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hgtt=ii=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fKdYj-0006w9-KO
 for xen-devel@lists.xenproject.org; Mon, 21 May 2018 05:40:37 +0000
Received: by mail-lf0-x244.google.com with SMTP id b18-v6so22073515lfa.9
 for <xen-devel@lists.xenproject.org>; Sun, 20 May 2018 22:40:35 -0700 (PDT)
In-Reply-To: <6a108876-19b7-49d0-3de2-9e10f984736c@oracle.com>
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

T24gMDUvMTkvMjAxOCAwMTowNCBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDA1LzE3
LzIwMTggMDQ6MjYgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBGcm9tOiBP
bGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+
Cj4KPiBBIGNvbW1pdCBtZXNzYWdlIHdvdWxkIGJlIHVzZWZ1bC4KU3VyZSwgdjEgd2lsbCBoYXZl
IGl0Cj4KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5k
cl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+Pgo+PiAgIAlmb3IgKGkgPSAwOyBpIDwgbnJfcGFn
ZXM7IGkrKykgewo+PiAtCQlwYWdlID0gYWxsb2NfcGFnZShnZnApOwo+PiAtCQlpZiAocGFnZSA9
PSBOVUxMKSB7Cj4+IC0JCQlucl9wYWdlcyA9IGk7Cj4+IC0JCQlzdGF0ZSA9IEJQX0VBR0FJTjsK
Pj4gLQkJCWJyZWFrOwo+PiArCQlpZiAoZXh0X3BhZ2VzKSB7Cj4+ICsJCQlwYWdlID0gZXh0X3Bh
Z2VzW2ldOwo+PiArCQl9IGVsc2Ugewo+PiArCQkJcGFnZSA9IGFsbG9jX3BhZ2UoZ2ZwKTsKPj4g
KwkJCWlmIChwYWdlID09IE5VTEwpIHsKPj4gKwkJCQlucl9wYWdlcyA9IGk7Cj4+ICsJCQkJc3Rh
dGUgPSBCUF9FQUdBSU47Cj4+ICsJCQkJYnJlYWs7Cj4+ICsJCQl9Cj4+ICAgCQl9Cj4+ICAgCQlz
Y3J1Yl9wYWdlKHBhZ2UpOwo+PiAgIAkJbGlzdF9hZGQoJnBhZ2UtPmxydSwgJnBhZ2VzKTsKPj4g
QEAgLTUyOSw3ICs1NjUsNyBAQCBzdGF0aWMgZW51bSBicF9zdGF0ZSBkZWNyZWFzZV9yZXNlcnZh
dGlvbih1bnNpZ25lZCBsb25nIG5yX3BhZ2VzLCBnZnBfdCBnZnApCj4+ICAgCWkgPSAwOwo+PiAg
IAlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUocGFnZSwgdG1wLCAmcGFnZXMsIGxydSkgewo+PiAg
IAkJLyogWEVOTUVNX2RlY3JlYXNlX3Jlc2VydmF0aW9uIHJlcXVpcmVzIGEgR0ZOICovCj4+IC0J
CWZyYW1lX2xpc3RbaSsrXSA9IHhlbl9wYWdlX3RvX2dmbihwYWdlKTsKPj4gKwkJZnJhbWVzW2kr
K10gPSB4ZW5fcGFnZV90b19nZm4ocGFnZSk7Cj4+ICAgCj4+ICAgI2lmZGVmIENPTkZJR19YRU5f
SEFWRV9QVk1NVQo+PiAgIAkJLyoKPj4gQEAgLTU1MiwxOCArNTg4LDIyIEBAIHN0YXRpYyBlbnVt
IGJwX3N0YXRlIGRlY3JlYXNlX3Jlc2VydmF0aW9uKHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMsIGdm
cF90IGdmcCkKPj4gICAjZW5kaWYKPj4gICAJCWxpc3RfZGVsKCZwYWdlLT5scnUpOwo+PiAgIAo+
PiAtCQliYWxsb29uX2FwcGVuZChwYWdlKTsKPj4gKwkJaWYgKCFleHRfcGFnZXMpCj4+ICsJCQli
YWxsb29uX2FwcGVuZChwYWdlKTsKPgo+IFNvIHdoYXQgeW91IGFyZSBwcm9wb3NpbmcgaXMgbm90
IHJlYWxseSBiYWxsb29uaW5nLiBZb3UgYXJlIGp1c3QKPiBwaWdneWJhY2tpbmcgb24gZXhpc3Rp
bmcgaW50ZXJmYWNlcywgYXJlbid0IHlvdT8KU29ydCBvZi4gQmFzaWNhbGx5IEkgbmVlZCB0byB7
aW5jcmVhc2V8ZGVjcmVhc2V9X3Jlc2VydmF0aW9uLCBub3QgYWN0dWFsbHkKYWxsb2NhdGluZyBi
YWxsb29uZWQgcGFnZXMuCkRvIHlvdSB0aGluayBJIGNhbiBzaW1wbHkgRVhQT1JUX1NZTUJPTCBm
b3Ige2luY3JlYXNlfGRlY3JlYXNlfV9yZXNlcnZhdGlvbj8KQW55IG90aGVyIHN1Z2dlc3Rpb24/
Cj4gLWJvcmlzCj4KPgpUaGFuayB5b3UsCk9sZWtzYW5kcgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
