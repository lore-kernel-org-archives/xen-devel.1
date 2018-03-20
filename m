From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v3] xen/acpi: upload _PSD info for non Dom0
 CPUs too
Date: Tue, 20 Mar 2018 10:41:49 +0100
Message-ID: <CAJZ5v0ipVHsjEBJuj3Lz6iRSVasv8d2YY0qjz1SFaCK+zDP=Xw__44125.9815045216$1521538835$gmane$org@mail.gmail.com>
References: <20180315142205.15839-1-joao.m.martins@oracle.com>
 <bbf536dc-3c3d-8a25-47e8-7fd52850835d@oracle.com>
 <d14d48ab-9ba1-c70c-4d46-cd9c7c862add@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0crl=gk=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1eyDmB-0005mX-LG
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 09:41:51 +0000
Received: by mail-ot0-x244.google.com with SMTP id v23-v6so993658oth.9
 for <xen-devel@lists.xenproject.org>; Tue, 20 Mar 2018 02:41:50 -0700 (PDT)
In-Reply-To: <d14d48ab-9ba1-c70c-4d46-cd9c7c862add@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Robert Moore <robert.moore@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, devel@acpica.org, Erik Schmauss <erik.schmauss@intel.com>, Len Brown <lenb@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMTYsIDIwMTggYXQgMjo1NyBQTSwgSm9hbyBNYXJ0aW5zIDxqb2FvLm0ubWFy
dGluc0BvcmFjbGUuY29tPiB3cm90ZToKPiBPbiAwMy8xNS8yMDE4IDAzOjQ1IFBNLCBCb3JpcyBP
c3Ryb3Zza3kgd3JvdGU6Cj4+IE9uIDAzLzE1LzIwMTggMTA6MjIgQU0sIEpvYW8gTWFydGlucyB3
cm90ZToKPj4+IEFsbCB1cGxvYWRlZCBQTSBkYXRhIGZyb20gbm9uLWRvbTAgQ1BVcyB0YWtlcyB0
aGUgaW5mbyBmcm9tIHZDUFUgMCBhbmQKPj4+IGNoYW5naW5nIG9ubHkgdGhlIGFjcGlfaWQuIEZv
ciBwcm9jZXNzb3JzIHdoaWNoIFAtc3RhdGUgY29vcmRpbmF0aW9uIHR5cGUKPj4+IGlzIEhXX0FM
TCAoMHhGRCkgaXQgaXMgT0sgdG8gdXBsb2FkIGJvZ3VzIFAtc3RhdGUgZGVwZW5kZW5jeSBpbmZv
cm1hdGlvbgo+Pj4gKF9QU0QpLCBiZWNhdXNlIFhlbiB3aWxsIGlnbm9yZSBhbnkgY3B1ZnJlcSBk
b21haW5zIGNyZWF0ZWQgZm9yIHBhc3QgQ1BVcy4KPj4+Cj4+PiBBbGJlaXQgZm9yIHBsYXRmb3Jt
cyB3aGljaCBleHBvc2UgY29vcmRpbmF0aW9uIHR5cGVzIGFzIFNXX0FOWSBvciBTV19BTEwsCj4+
PiB0aGlzIHdpbGwgaGF2ZSBzb21lIHVuaW50ZW5kZWQgc2lkZSBlZmZlY3RzLiBFZmZlY3RpdmVs
eSwgaXQgd2lsbCBsb29rIGF0Cj4+PiB0aGUgUC1zdGF0ZSBkb21haW4gZXhpc3RlbmNlIGFuZCAq
aWYgaXQgYWxyZWFkeSBleGlzdHMqIGl0IHdpbGwgc2tpcCB0aGUKPj4+IGFjcGktY3B1ZnJlcSBp
bml0aWFsaXphdGlvbiBhbmQgdGh1cyBpbmhlcml0IHRoZSBwb2xpY3kgZnJvbSB0aGUgZmlyc3Qg
Q1BVCj4+PiBpbiB0aGUgY3B1ZnJlcSBkb21haW4uIFRoaXMgd2lsbCBmaW5hbGx5IGxlYWQgdG8g
dGhlIG9yaWdpbmFsIGNwdSBub3QKPj4+IGNoYW5naW5nIHRhcmdldCBmcmVxIHRvIFAwIG90aGVy
IHRoYW4gdGhlIGZpcnN0IGluIHRoZSBkb21haW4uIFdoaWNoIHdpbGwKPj4+IG1ha2UgdHVyYm8g
Ym9vc3Qgbm90IGdldHRpbmcgZW5hYmxlZCAoZS5nLiBmb3IgJ3BlcmZvcm1hbmNlJyBnb3Zlcm5v
cikgZm9yCj4+PiBhbGwgY3B1cy4KPj4+Cj4+PiBUaGlzIHBhdGNoIGZpeGVzIHRoYXQsIGJ5IGFs
c28gZXZhbHVhdGluZyBfUFNEIHdoZW4gd2UgZW51bWVyYXRlIGFsbCBBQ1BJCj4+PiBwcm9jZXNz
b3JzIGFuZCB0aHVzIGFsd2F5cyB1cGxvYWRpbmcgdGhlIGNvcnJlY3QgaW5mbyB0byBYZW4uIFdl
IGV4cG9ydAo+Pj4gYWNwaV9wcm9jZXNzb3JfZ2V0X3BzZCgpIGZvciB0aGF0IHRoaXMgcHVycG9z
ZSwgYnV0IGNoYW5nZSBzaWduYXR1cmUKPj4+IHRvIG5vdCBhc3N1bWUgYW4gZXhpc3RlbnQgb2Yg
YWNwaV9wcm9jZXNzb3IgZ2l2ZW4gdGhhdCBBQ1BJIGlzbid0IGNyZWF0aW5nCj4+PiBhbiBhY3Bp
X3Byb2Nlc3NvciBmb3Igbm9uLWRvbTAgQ1BVcy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKb2Fv
IE1hcnRpbnMgPGpvYW8ubS5tYXJ0aW5zQG9yYWNsZS5jb20+Cj4+Cj4+IFJldmlld2VkLWJ5OiBC
b3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+Pgo+IFRoYW5rcyEK
Pgo+IEkgc3VwcG9zZSB3aGF0J3MgcmVtYWluaW5nIGlzIHJldmlldyAob3IgYWNrKSBmcm9tIEFD
UEkgZm9sa3Mgb24gdGhlIGludGVyZmFjZQo+IGNoYW5nZXMgbWFkZSB0byBhY3BpX3Byb2Nlc3Nv
cl9nZXRfcHNkKCkuCgpUaGVyZSB5b3UgZ286CgpBY2tlZC1ieTogUmFmYWVsIEouIFd5c29ja2kg
PHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPgoKRG8geW91IHdhbnQgdG8gcm91dGUgdGhpcyB2
aWEgWGVuPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
