From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] Input: xen-kbdfront - allow better run-time
 configuration
Date: Tue, 24 Apr 2018 08:55:19 +0300
Message-ID: <8ef84389-4659-d4bb-271f-53155062b7b6__31168.1626634256$1524549245$gmane$org@gmail.com>
References: <20180418150445.9805-1-andr2000@gmail.com>
 <ccb7a33b-7862-9803-fb24-67861d5ecab9@suse.com>
 <2bff035e-303e-d644-5f51-5e64150c097c@gmail.com>
 <20180423185325.GB66646@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yktx=hn=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fAqvD-0004bm-Bn
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 05:55:23 +0000
Received: by mail-lf0-x235.google.com with SMTP id m18-v6so1092187lfb.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Apr 2018 22:55:22 -0700 (PDT)
In-Reply-To: <20180423185325.GB66646@dtor-ws>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, lyan@suse.com, andrii_chepurnyi@epam.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMjMvMjAxOCAwOTo1MyBQTSwgRG1pdHJ5IFRvcm9raG92IHdyb3RlOgo+IE9uIFRodSwg
QXByIDE5LCAyMDE4IGF0IDAyOjQ0OjE5UE0gKzAzMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IHdyb3RlOgo+PiBPbiAwNC8xOS8yMDE4IDAyOjI1IFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+
Pj4gT24gMTgvMDQvMTggMTc6MDQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+Pj4+
IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0Bl
cGFtLmNvbT4KPj4+Pgo+Pj4+IEl0IGlzIG5vdyBvbmx5IHBvc3NpYmxlIHRvIGNvbnRyb2wgaWYg
bXVsdGktdG91Y2ggdmlydHVhbCBkZXZpY2UKPj4+PiBpcyBjcmVhdGVkIG9yIG5vdCAodmlhIHRo
ZSBjb3JyZXNwb25kaW5nIFhlblN0b3JlIGVudHJpZXMpLAo+Pj4+IGJ1dCBrZXlib2FyZCBhbmQg
cG9pbnRlciBkZXZpY2VzIGFyZSBhbHdheXMgY3JlYXRlZC4KPj4+IFdoeSBkb24ndCB5b3Ugd2Fu
dCB0byBnbyB0aGF0IHJvdXRlIGZvciBrZXlib2FyZCBhbmQgbW91c2UsIHRvbz8KPj4+IE9yIGRv
ZXMgdGhpcyByZWFsbHkgbWFrZSBubyBzZW5zZT8KPj4gV2VsbCwgSSB3b3VsZCBwcmVmZXIgbm90
IHRvIHRvdWNoIGFueXRoaW5nIG91dHNpZGUgTGludXggYW5kCj4+IHRoaXMgZHJpdmVyLiBBbmQg
dGhlc2Ugc2V0dGluZ3Mgc2VlbSB0byBiZSBpbXBsZW1lbnRhdGlvbiBzcGVjaWZpYy4KPj4gU28s
IHRoaXMgaXMgd2h5IGludHJvZHVjZSBMaW51eCBtb2R1bGUgcGFyYW1ldGVycyBhbmQgZG9uJ3Qg
ZXh0ZW5kCj4+IHRoZSBrYmRpZiBwcm90b2NvbC4KPiBXaHkgZG8geW91IGNvbnNpZGVyIHRoaXMg
aW1wbGVtZW50YXRpb24gc3BlY2lmaWM/IEhvdyBvdGhlciBndWVzdHMKPiBkZWNpZGUgdG8gZm9y
ZWdvIGNyZWF0aW9uIG9mIHJlbGF0aXZlIHBvaW50ZXIgZGV2aWNlIG9yIGtleWJvYXJkLWxpa2UK
PiBkZXZpY2U/Cj4KPiBZb3UgYWxyZWFkeSBoYXZlICJmZWF0dXJlcyIgZm9yIGFic29sdXRlIHBv
aW50aW5nIGRldmljZSBhbmQgbXVsdGl0b3VjaCwKPiBzbyBwbGVhc2UgZXh0ZW5kIHRoZSBwcm90
b2NvbCBwcm9wZXJseSBzbyB5b3UgaW5kZWVkIGRvIG5vdCBjb2RlCj4gc29tZXRoaW5nIGltcGxl
bWVudGF0aW9uLXNwZWNpZmljIChpLmUuIG1vZHVsZSBwYXJhbWV0ZXJzKS4KT2ssIGJ1dCBpbiBv
cmRlciB0byBwcmVzZXJ2ZSB0aGUgZGVmYXVsdCBiZWhhdmlvciwgZS5nLgpwb2ludGVyIGFuZCBr
ZXlib2FyZCBkZXZpY2VzIGFyZSBhbHdheXMgY3JlYXRlZCBub3csIEknbGwgaGF2ZQp0byBoYXZl
IHJldmVyc2UgZmVhdHVyZXMgaW4gdGhlIHByb3RvY29sOgogwqAtIGZlYXR1cmUtbm8tcG9pbnRl
cgogwqAtIGZlYXR1cmUtbm8ta2V5Ym9hcmQKVGhlIGFib3ZlIG1heSBiZSBzZXQgYXMgYSBwYXJ0
IG9mIGZyb250ZW5kJ3MgY29uZmlndXJhdGlvbiBhbmQKaWYgbWlzc2VkIGFyZSBjb25zaWRlcmVk
IHRvIGJlIHNldCB0byBmYWxzZS4KCj4KPiBUaGFua3MuCj4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
