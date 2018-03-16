From: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3] xen/acpi: upload _PSD info for non Dom0
	CPUs too
Date: Fri, 16 Mar 2018 13:57:13 +0000
Message-ID: <d14d48ab-9ba1-c70c-4d46-cd9c7c862add__47044.6326573894$1521208589$gmane$org@oracle.com>
References: <20180315142205.15839-1-joao.m.martins@oracle.com>
 <bbf536dc-3c3d-8a25-47e8-7fd52850835d@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=+i3r=gg=oracle.com=joao.m.martins@srs-us1.protection.inumbo.net>)
 id 1ewprQ-0005SW-5Z
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 13:57:32 +0000
In-Reply-To: <bbf536dc-3c3d-8a25-47e8-7fd52850835d@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, devel@acpica.org, Erik Schmauss <erik.schmauss@intel.com>, Len Brown <lenb@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTUvMjAxOCAwMzo0NSBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDAzLzE1
LzIwMTggMTA6MjIgQU0sIEpvYW8gTWFydGlucyB3cm90ZToKPj4gQWxsIHVwbG9hZGVkIFBNIGRh
dGEgZnJvbSBub24tZG9tMCBDUFVzIHRha2VzIHRoZSBpbmZvIGZyb20gdkNQVSAwIGFuZAo+PiBj
aGFuZ2luZyBvbmx5IHRoZSBhY3BpX2lkLiBGb3IgcHJvY2Vzc29ycyB3aGljaCBQLXN0YXRlIGNv
b3JkaW5hdGlvbiB0eXBlCj4+IGlzIEhXX0FMTCAoMHhGRCkgaXQgaXMgT0sgdG8gdXBsb2FkIGJv
Z3VzIFAtc3RhdGUgZGVwZW5kZW5jeSBpbmZvcm1hdGlvbgo+PiAoX1BTRCksIGJlY2F1c2UgWGVu
IHdpbGwgaWdub3JlIGFueSBjcHVmcmVxIGRvbWFpbnMgY3JlYXRlZCBmb3IgcGFzdCBDUFVzLgo+
Pgo+PiBBbGJlaXQgZm9yIHBsYXRmb3JtcyB3aGljaCBleHBvc2UgY29vcmRpbmF0aW9uIHR5cGVz
IGFzIFNXX0FOWSBvciBTV19BTEwsCj4+IHRoaXMgd2lsbCBoYXZlIHNvbWUgdW5pbnRlbmRlZCBz
aWRlIGVmZmVjdHMuIEVmZmVjdGl2ZWx5LCBpdCB3aWxsIGxvb2sgYXQKPj4gdGhlIFAtc3RhdGUg
ZG9tYWluIGV4aXN0ZW5jZSBhbmQgKmlmIGl0IGFscmVhZHkgZXhpc3RzKiBpdCB3aWxsIHNraXAg
dGhlCj4+IGFjcGktY3B1ZnJlcSBpbml0aWFsaXphdGlvbiBhbmQgdGh1cyBpbmhlcml0IHRoZSBw
b2xpY3kgZnJvbSB0aGUgZmlyc3QgQ1BVCj4+IGluIHRoZSBjcHVmcmVxIGRvbWFpbi4gVGhpcyB3
aWxsIGZpbmFsbHkgbGVhZCB0byB0aGUgb3JpZ2luYWwgY3B1IG5vdAo+PiBjaGFuZ2luZyB0YXJn
ZXQgZnJlcSB0byBQMCBvdGhlciB0aGFuIHRoZSBmaXJzdCBpbiB0aGUgZG9tYWluLiBXaGljaCB3
aWxsCj4+IG1ha2UgdHVyYm8gYm9vc3Qgbm90IGdldHRpbmcgZW5hYmxlZCAoZS5nLiBmb3IgJ3Bl
cmZvcm1hbmNlJyBnb3Zlcm5vcikgZm9yCj4+IGFsbCBjcHVzLgo+Pgo+PiBUaGlzIHBhdGNoIGZp
eGVzIHRoYXQsIGJ5IGFsc28gZXZhbHVhdGluZyBfUFNEIHdoZW4gd2UgZW51bWVyYXRlIGFsbCBB
Q1BJCj4+IHByb2Nlc3NvcnMgYW5kIHRodXMgYWx3YXlzIHVwbG9hZGluZyB0aGUgY29ycmVjdCBp
bmZvIHRvIFhlbi4gV2UgZXhwb3J0Cj4+IGFjcGlfcHJvY2Vzc29yX2dldF9wc2QoKSBmb3IgdGhh
dCB0aGlzIHB1cnBvc2UsIGJ1dCBjaGFuZ2Ugc2lnbmF0dXJlCj4+IHRvIG5vdCBhc3N1bWUgYW4g
ZXhpc3RlbnQgb2YgYWNwaV9wcm9jZXNzb3IgZ2l2ZW4gdGhhdCBBQ1BJIGlzbid0IGNyZWF0aW5n
Cj4+IGFuIGFjcGlfcHJvY2Vzc29yIGZvciBub24tZG9tMCBDUFVzLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBKb2FvIE1hcnRpbnMgPGpvYW8ubS5tYXJ0aW5zQG9yYWNsZS5jb20+Cj4gCj4gUmV2aWV3
ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gClRo
YW5rcyEKCkkgc3VwcG9zZSB3aGF0J3MgcmVtYWluaW5nIGlzIHJldmlldyAob3IgYWNrKSBmcm9t
IEFDUEkgZm9sa3Mgb24gdGhlIGludGVyZmFjZQpjaGFuZ2VzIG1hZGUgdG8gYWNwaV9wcm9jZXNz
b3JfZ2V0X3BzZCgpLgoKCUpvYW8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
