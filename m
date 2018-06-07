From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v2 9/9] xen/gntdev: Expose gntdev's dma-buf
 API for in-kernel use
Date: Thu, 7 Jun 2018 10:33:41 +0300
Message-ID: <87d02b3a-3dd0-d3c5-3b2b-29fa1a27ba75__44838.7460703545$1528356772$gmane$org@gmail.com>
References: <20180601114132.22596-1-andr2000@gmail.com>
 <20180601114132.22596-10-andr2000@gmail.com>
 <86f5b340-856c-204f-4ba7-dd51f1e92639@oracle.com>
 <984bcf75-9bea-aceb-3d3a-62e3c65709c7@gmail.com>
 <398d53c9-9c47-d86a-89bd-b9941e638434@oracle.com>
 <20180606220521.GA7054@downor-Z87X-UD5H>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1i32=iz=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fQpQZ-0008Vw-Ad
 for xen-devel@lists.xenproject.org; Thu, 07 Jun 2018 07:33:47 +0000
Received: by mail-lf0-x243.google.com with SMTP id g21-v6so11087847lfb.4
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jun 2018 00:33:44 -0700 (PDT)
In-Reply-To: <20180606220521.GA7054@downor-Z87X-UD5H>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongwon Kim <dongwon.kim@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: jgross@suse.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org, daniel.vetter@intel.com, matthew.d.roper@intel.com, linux-media@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDcvMjAxOCAwMTowNSBBTSwgRG9uZ3dvbiBLaW0gd3JvdGU6Cj4gT24gV2VkLCBKdW4g
MDYsIDIwMTggYXQgMDU6NTE6MzhQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBP
biAwNi8wNi8yMDE4IDA4OjQ2IEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+
IE9uIDA2LzA1LzIwMTggMDE6MzYgQU0sIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4+PiBPbiAw
Ni8wMS8yMDE4IDA3OjQxIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+Pj4g
RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgo+Pj4+Pgo+Pj4+PiBBbGxvdyBjcmVhdGluZyBncmFudCBkZXZpY2UgY29udGV4dCBm
b3IgdXNlIGJ5IGtlcm5lbCBtb2R1bGVzIHdoaWNoCj4+Pj4+IHJlcXVpcmUgZnVuY3Rpb25hbGl0
eSwgcHJvdmlkZWQgYnkgZ250ZGV2LiBFeHBvcnQgc3ltYm9scyBmb3IgZG1hLWJ1Zgo+Pj4+PiBB
UEkgcHJvdmlkZWQgYnkgdGhlIG1vZHVsZS4KPj4+PiBDYW4geW91IGdpdmUgYW4gZXhhbXBsZSBv
ZiB3aG8nZCBiZSB1c2luZyB0aGVzZSBpbnRlcmZhY2VzPwo+Pj4gVGhlcmUgaXMgbm8gdXNlLWNh
c2UgYXQgdGhlIG1vbWVudCBJIGNhbiB0aGluayBvZiwgYnV0IGh5cGVyIGRtYS1idWYKPj4+IFsx
XSwgWzJdCj4+PiBJIGxldCBJbnRlbCBmb2xrcyAoQ0NlZCkgdG8gZGVmZW5kIHRoaXMgcGF0Y2gg
YXMgaXQgd2FzIGRvbmUgcHJpbWFyaWx5Cj4+PiBmb3IgdGhlbQo+Pj4gYW5kIEkgZG9uJ3QgdXNl
IGl0IGluIGFueSBvZiBteSB1c2UtY2FzZXMuIFNvLCBmcm9tIHRoaXMgUE9WIGl0IGNhbiBiZQo+
Pj4gZHJvcHBlZCwKPj4+IGF0IGxlYXN0IGZyb20gdGhpcyBzZXJpZXMuCj4+Cj4+IFllcywgbGV0
J3MgZHJvcCB0aGlzIHVudGlsIHNvbWVvbmUgYWN0dWFsbHkgbmVlZHMgaXQuCj4+Cj4+IC1ib3Jp
cwo+IEkgYWdyZWUuIFdlIGFyZSB3b3JraW5nIG9uIHJlLWFyY2hpdGVjdHVyaW5nIGh5cGVyX2Rt
YWJ1Zi4gV2Ugd291bGQgdXNlIHpjb3B5Cj4gYXBpcyBob3dldmVyLCBub3Qgc3VyZSBpZiB3ZSBh
cmUgZ29pbmcgdG8gZG8gaXQgZnJvbSBrZXJuZWwgb3IgZnJvbSB1c2Vyc3BhY2UuCj4gU28gcGxl
YXNlIGRvIG5vdCBleHBvc2UgdGhvc2UgZm9yIG5vdy4KT2ssIGFzIHdlIGFyZSBhbGwgb24gdGhl
IHNhbWUgcGFnZSBmb3IgdGhhdCB0aGVuIEknbGwgZHJvcCB0aGlzIHBhdGNoIApmb3Igbm93Cj4+
Cj4+Pj4gLWJvcmlzCj4+Pj4KPj4+IFsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvc2VyaWVzLzM4MjA3Lwo+Pj4gWzJdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9y
Zy9wYXRjaC8yMDQ0NDcvCj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+IFhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwo+Pj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
