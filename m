From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 1/9] drm/xen-front: Introduce Xen
 para-virtualized frontend driver
Date: Fri, 23 Feb 2018 16:51:03 +0200
Message-ID: <e910c309-9711-99f9-4d21-5bd77ffe70b8__10705.0082217485$1519397390$gmane$org@gmail.com>
References: <1519200222-20623-1-git-send-email-andr2000@gmail.com>
 <1519200222-20623-2-git-send-email-andr2000@gmail.com>
 <e4501c0b-0504-e306-19ab-2c6023ad2ccf@oracle.com>
 <1c569896-e60c-bed3-fda8-c72b8d0a349d@gmail.com>
 <3740a458-35d7-b51d-5cd0-be3bebd87574@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vqf1=fr=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1epEgl-0008Ni-Bl
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 14:51:07 +0000
Received: by mail-lf0-x242.google.com with SMTP id t204so12724097lff.9
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2018 06:51:06 -0800 (PST)
In-Reply-To: <3740a458-35d7-b51d-5cd0-be3bebd87574@oracle.com>
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

T24gMDIvMjMvMjAxOCAwNDozOSBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDAyLzIz
LzIwMTggMDE6MzcgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBPbiAwMi8y
My8yMDE4IDEyOjIzIEFNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+PiBPbiAwMi8yMS8yMDE4
IDAzOjAzIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+PiArc3RhdGljIHN0
cnVjdCB4ZW5idXNfZHJpdmVyIHhlbl9kcml2ZXIgPSB7Cj4+Pj4gKyAgICAuaWRzID0geGVuX2Ry
dl9pZHMsCj4+Pj4gKyAgICAucHJvYmUgPSB4ZW5fZHJ2X3Byb2JlLAo+Pj4+ICsgICAgLnJlbW92
ZSA9IHhlbl9kcnZfcmVtb3ZlLAo+Pj4+ICsgICAgLm90aGVyZW5kX2NoYW5nZWQgPSBiYWNrZW5k
X29uX2NoYW5nZWQsCj4+PiBXaGF0IGRvZXMgIl9vbl8iIHN0YW5kIGZvcj8KPj4gV2VsbCwgaXQg
aXMgc29tZXdoYXQgbGlrZSBhIGhpbnQgdGhhdCB0aGlzIGlzIGNhbGxlZCAib24iIGV2ZW50LAo+
PiBlLmcuIGV2ZW50IHdoZW4gdGhlIG90aGVyIGVuZCBzdGF0ZSBoYXMgY2hhbmdlZCwgYmFja2Vu
ZCBpbiB0aGlzCj4+IGNhc2UuIEl0IGNvdWxkIGJlIHNvbWV0aGluZyBsaWtlICJiYWNrZW5kX29u
X3N0YXRlX2NoYW5nZWQiCj4gSWYgeW91IGxvb2sgYXQgb3RoZXIgeGVuYnVzX2RyaXZlcnMgbm9u
ZSBvZiB0aGUgdXNlcyB0aGlzIHNvIEkgdGhpbmsgd2UKPiBzaG91bGQgc3RpY2sgdG8gY29udmVu
dGlvbmFsIG5hbWluZy4gKGFuZCB0aGUgc2FtZSBhcHBsaWVzIHRvIG90aGVyCj4gYmFja2VuZF9v
bl8qIHJvdXRpbmVzKS4Kb2ssIG5vIHByb2JsZW0uIHdpbGwgcmVuYW1lIHRvIGJlIGFsaWduZWQg
d2l0aCBvdGhlciBmcm9udGVuZHMKPgo+IC1ib3JpcwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
