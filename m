From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 5/8] xen/gntdev: Add initial support for
 dma-buf UAPI
Date: Wed, 30 May 2018 09:52:07 +0300
Message-ID: <f9dbd6fb-b190-f7cb-244d-9768086accba__25839.219618547$1527663057$gmane$org@gmail.com>
References: <20180525153331.31188-1-andr2000@gmail.com>
 <20180525153331.31188-6-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mt+2=ir=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fNuxv-0002Fz-VH
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 06:52:11 +0000
Received: by mail-lf0-x241.google.com with SMTP id u4-v6so2536668lff.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 May 2018 23:52:10 -0700 (PDT)
In-Reply-To: <20180525153331.31188-6-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMjUvMjAxOCAwNjozMyBQTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL0tjb25maWcgYi9kcml2ZXJzL3hlbi9LY29uZmlnCj4g
aW5kZXggMzQzMWZlMjEwNjI0Li5lYWY2M2EyYzdhZTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy94
ZW4vS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMveGVuL0tjb25maWcKPiBAQCAtMTUyLDYgKzE1Miwx
NiBAQCBjb25maWcgWEVOX0dOVERFVgo+ICAgCWhlbHAKPiAgIAkgIEFsbG93cyB1c2Vyc3BhY2Ug
cHJvY2Vzc2VzIHRvIHVzZSBncmFudHMuCj4gICAKPiArY29uZmlnIFhFTl9HTlRERVZfRE1BQlVG
Cj4gKwlib29sICJBZGQgc3VwcG9ydCBmb3IgZG1hLWJ1ZiBncmFudCBhY2Nlc3MgZGV2aWNlIGRy
aXZlciBleHRlbnNpb24iCj4gKwlkZXBlbmRzIG9uIFhFTl9HTlRERVYgJiYgWEVOX0dSQU5UX0RN
QV9BTExPQwpUaGlzIG11c3QgYmUgImRlcGVuZHMgb24gWEVOX0dOVERFViAmJiBYRU5fR1JBTlRf
RE1BX0FMTE9DICYmIAoqRE1BX1NIQVJFRF9CVUZGRVIqIgo+ICsJaGVscAo+ICsJICBBbGxvd3Mg
dXNlcnNwYWNlIHByb2Nlc3NlcyBhbmQga2VybmVsIG1vZHVsZXMgdG8gdXNlIFhlbiBiYWNrZWQK
PiArCSAgZG1hLWJ1ZiBpbXBsZW1lbnRhdGlvbi4gV2l0aCB0aGlzIGV4dGVuc2lvbiBncmFudCBy
ZWZlcmVuY2VzIHRvCj4gKwkgIHRoZSBwYWdlcyBvZiBhbiBpbXBvcnRlZCBkbWEtYnVmIGNhbiBi
ZSBleHBvcnRlZCBmb3Igb3RoZXIgZG9tYWluCj4gKwkgIHVzZSBhbmQgZ3JhbnQgcmVmZXJlbmNl
cyBjb21pbmcgZnJvbSBhIGZvcmVpZ24gZG9tYWluIGNhbiBiZQo+ICsJICBjb252ZXJ0ZWQgaW50
byBhIGxvY2FsIGRtYS1idWYgZm9yIGxvY2FsIGV4cG9ydC4KPiArCj4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
