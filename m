From: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3] xen/acpi: upload _PSD info for non Dom0
 CPUs too
Date: Tue, 20 Mar 2018 11:07:51 +0000
Message-ID: <5549560b-44ba-8063-de11-2e74b99a3e20__28947.3390592777$1521544013$gmane$org@oracle.com>
References: <20180315142205.15839-1-joao.m.martins@oracle.com>
 <bbf536dc-3c3d-8a25-47e8-7fd52850835d@oracle.com>
 <d14d48ab-9ba1-c70c-4d46-cd9c7c862add@oracle.com>
 <CAJZ5v0ipVHsjEBJuj3Lz6iRSVasv8d2YY0qjz1SFaCK+zDP=Xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gfk1=gk=oracle.com=joao.m.martins@srs-us1.protection.inumbo.net>)
 id 1eyF7f-0004MF-44
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 11:08:07 +0000
In-Reply-To: <CAJZ5v0ipVHsjEBJuj3Lz6iRSVasv8d2YY0qjz1SFaCK+zDP=Xw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Robert Moore <robert.moore@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, devel@acpica.org, Erik Schmauss <erik.schmauss@intel.com>, Len Brown <lenb@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMjAvMjAxOCAwOTo0MSBBTSwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gT24gRnJp
LCBNYXIgMTYsIDIwMTggYXQgMjo1NyBQTSwgSm9hbyBNYXJ0aW5zIDxqb2FvLm0ubWFydGluc0Bv
cmFjbGUuY29tPiB3cm90ZToKPj4gT24gMDMvMTUvMjAxOCAwMzo0NSBQTSwgQm9yaXMgT3N0cm92
c2t5IHdyb3RlOgo+Pj4gT24gMDMvMTUvMjAxOCAxMDoyMiBBTSwgSm9hbyBNYXJ0aW5zIHdyb3Rl
Ogo+Pj4+IEFsbCB1cGxvYWRlZCBQTSBkYXRhIGZyb20gbm9uLWRvbTAgQ1BVcyB0YWtlcyB0aGUg
aW5mbyBmcm9tIHZDUFUgMCBhbmQKPj4+PiBjaGFuZ2luZyBvbmx5IHRoZSBhY3BpX2lkLiBGb3Ig
cHJvY2Vzc29ycyB3aGljaCBQLXN0YXRlIGNvb3JkaW5hdGlvbiB0eXBlCj4+Pj4gaXMgSFdfQUxM
ICgweEZEKSBpdCBpcyBPSyB0byB1cGxvYWQgYm9ndXMgUC1zdGF0ZSBkZXBlbmRlbmN5IGluZm9y
bWF0aW9uCj4+Pj4gKF9QU0QpLCBiZWNhdXNlIFhlbiB3aWxsIGlnbm9yZSBhbnkgY3B1ZnJlcSBk
b21haW5zIGNyZWF0ZWQgZm9yIHBhc3QgQ1BVcy4KPj4+Pgo+Pj4+IEFsYmVpdCBmb3IgcGxhdGZv
cm1zIHdoaWNoIGV4cG9zZSBjb29yZGluYXRpb24gdHlwZXMgYXMgU1dfQU5ZIG9yIFNXX0FMTCwK
Pj4+PiB0aGlzIHdpbGwgaGF2ZSBzb21lIHVuaW50ZW5kZWQgc2lkZSBlZmZlY3RzLiBFZmZlY3Rp
dmVseSwgaXQgd2lsbCBsb29rIGF0Cj4+Pj4gdGhlIFAtc3RhdGUgZG9tYWluIGV4aXN0ZW5jZSBh
bmQgKmlmIGl0IGFscmVhZHkgZXhpc3RzKiBpdCB3aWxsIHNraXAgdGhlCj4+Pj4gYWNwaS1jcHVm
cmVxIGluaXRpYWxpemF0aW9uIGFuZCB0aHVzIGluaGVyaXQgdGhlIHBvbGljeSBmcm9tIHRoZSBm
aXJzdCBDUFUKPj4+PiBpbiB0aGUgY3B1ZnJlcSBkb21haW4uIFRoaXMgd2lsbCBmaW5hbGx5IGxl
YWQgdG8gdGhlIG9yaWdpbmFsIGNwdSBub3QKPj4+PiBjaGFuZ2luZyB0YXJnZXQgZnJlcSB0byBQ
MCBvdGhlciB0aGFuIHRoZSBmaXJzdCBpbiB0aGUgZG9tYWluLiBXaGljaCB3aWxsCj4+Pj4gbWFr
ZSB0dXJibyBib29zdCBub3QgZ2V0dGluZyBlbmFibGVkIChlLmcuIGZvciAncGVyZm9ybWFuY2Un
IGdvdmVybm9yKSBmb3IKPj4+PiBhbGwgY3B1cy4KPj4+Pgo+Pj4+IFRoaXMgcGF0Y2ggZml4ZXMg
dGhhdCwgYnkgYWxzbyBldmFsdWF0aW5nIF9QU0Qgd2hlbiB3ZSBlbnVtZXJhdGUgYWxsIEFDUEkK
Pj4+PiBwcm9jZXNzb3JzIGFuZCB0aHVzIGFsd2F5cyB1cGxvYWRpbmcgdGhlIGNvcnJlY3QgaW5m
byB0byBYZW4uIFdlIGV4cG9ydAo+Pj4+IGFjcGlfcHJvY2Vzc29yX2dldF9wc2QoKSBmb3IgdGhh
dCB0aGlzIHB1cnBvc2UsIGJ1dCBjaGFuZ2Ugc2lnbmF0dXJlCj4+Pj4gdG8gbm90IGFzc3VtZSBh
biBleGlzdGVudCBvZiBhY3BpX3Byb2Nlc3NvciBnaXZlbiB0aGF0IEFDUEkgaXNuJ3QgY3JlYXRp
bmcKPj4+PiBhbiBhY3BpX3Byb2Nlc3NvciBmb3Igbm9uLWRvbTAgQ1BVcy4KPj4+Pgo+Pj4+IFNp
Z25lZC1vZmYtYnk6IEpvYW8gTWFydGlucyA8am9hby5tLm1hcnRpbnNAb3JhY2xlLmNvbT4KPj4+
Cj4+PiBSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xl
LmNvbT4KPj4+Cj4+IFRoYW5rcyEKPj4KPj4gSSBzdXBwb3NlIHdoYXQncyByZW1haW5pbmcgaXMg
cmV2aWV3IChvciBhY2spIGZyb20gQUNQSSBmb2xrcyBvbiB0aGUgaW50ZXJmYWNlCj4+IGNoYW5n
ZXMgbWFkZSB0byBhY3BpX3Byb2Nlc3Nvcl9nZXRfcHNkKCkuCj4gCj4gVGhlcmUgeW91IGdvOgo+
IAo+IEFja2VkLWJ5OiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsLmoud3lzb2NraUBpbnRlbC5j
b20+Cj4KVGhhbmsgeW91IQoKPiBEbyB5b3Ugd2FudCB0byByb3V0ZSB0aGlzIHZpYSBYZW4/Cj4g
Ckkgc3VwcG9zZSB0aGF0IG1ha2VzIHNlbnNlIGdpdmVuIHRoYXQgdGhlIG1ham9yaXR5IG9mIHRo
ZSBjaGFuZ2UgaXMgb24geGVuIGFjcGkKcHJvY2Vzc29yLiBCdXQgaXQncyB1bHRpbWF0ZWx5IEJv
cmlzL0p1ZXJnZW4gY2FsbC4KCglKb2FvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
