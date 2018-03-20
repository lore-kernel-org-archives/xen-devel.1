From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3] xen/acpi: upload _PSD info for non Dom0
 CPUs too
Date: Tue, 20 Mar 2018 08:56:41 -0400
Message-ID: <5561dd0a-2483-7084-ad88-f277473bd93f__35822.8452540517$1521550458$gmane$org@oracle.com>
References: <20180315142205.15839-1-joao.m.martins@oracle.com>
 <bbf536dc-3c3d-8a25-47e8-7fd52850835d@oracle.com>
 <d14d48ab-9ba1-c70c-4d46-cd9c7c862add@oracle.com>
 <CAJZ5v0ipVHsjEBJuj3Lz6iRSVasv8d2YY0qjz1SFaCK+zDP=Xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2pyt=gk=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eyGnS-0005qJ-Ig
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 12:55:22 +0000
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
To: "Rafael J. Wysocki" <rafael@kernel.org>, Joao Martins <joao.m.martins@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Robert Moore <robert.moore@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, xen-devel@lists.xenproject.org, devel@acpica.org, Erik Schmauss <erik.schmauss@intel.com>, Len Brown <lenb@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMjAvMjAxOCAwNTo0MSBBTSwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gT24gRnJp
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
IFJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29t
Pgo+Pj4KPj4gVGhhbmtzIQo+Pgo+PiBJIHN1cHBvc2Ugd2hhdCdzIHJlbWFpbmluZyBpcyByZXZp
ZXcgKG9yIGFjaykgZnJvbSBBQ1BJIGZvbGtzIG9uIHRoZSBpbnRlcmZhY2UKPj4gY2hhbmdlcyBt
YWRlIHRvIGFjcGlfcHJvY2Vzc29yX2dldF9wc2QoKS4KPiBUaGVyZSB5b3UgZ286Cj4KPiBBY2tl
ZC1ieTogUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPgo+Cj4g
RG8geW91IHdhbnQgdG8gcm91dGUgdGhpcyB2aWEgWGVuPwoKClN1cmUsIEknbGwgcXVldWUgaXQg
Zm9yIDQuMTcKClRoYW5rcy4KLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
