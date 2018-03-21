From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3] xen/acpi: upload _PSD info for non Dom0
 CPUs too
Date: Wed, 21 Mar 2018 17:15:06 -0400
Message-ID: <4b9b40ce-a19c-758f-9a0b-451fadecf347__12378.3357594677$1521666724$gmane$org@oracle.com>
References: <20180315142205.15839-1-joao.m.martins@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fvqy=gl=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eyl2t-00052d-Sj
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 21:13:19 +0000
In-Reply-To: <20180315142205.15839-1-joao.m.martins@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Joao Martins <joao.m.martins@oracle.com>, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, devel@acpica.org, Erik Schmauss <erik.schmauss@intel.com>, Len Brown <lenb@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTUvMjAxOCAxMDoyMiBBTSwgSm9hbyBNYXJ0aW5zIHdyb3RlOgo+IEFsbCB1cGxvYWRl
ZCBQTSBkYXRhIGZyb20gbm9uLWRvbTAgQ1BVcyB0YWtlcyB0aGUgaW5mbyBmcm9tIHZDUFUgMCBh
bmQKPiBjaGFuZ2luZyBvbmx5IHRoZSBhY3BpX2lkLiBGb3IgcHJvY2Vzc29ycyB3aGljaCBQLXN0
YXRlIGNvb3JkaW5hdGlvbiB0eXBlCj4gaXMgSFdfQUxMICgweEZEKSBpdCBpcyBPSyB0byB1cGxv
YWQgYm9ndXMgUC1zdGF0ZSBkZXBlbmRlbmN5IGluZm9ybWF0aW9uCj4gKF9QU0QpLCBiZWNhdXNl
IFhlbiB3aWxsIGlnbm9yZSBhbnkgY3B1ZnJlcSBkb21haW5zIGNyZWF0ZWQgZm9yIHBhc3QgQ1BV
cy4KPgo+IEFsYmVpdCBmb3IgcGxhdGZvcm1zIHdoaWNoIGV4cG9zZSBjb29yZGluYXRpb24gdHlw
ZXMgYXMgU1dfQU5ZIG9yIFNXX0FMTCwKPiB0aGlzIHdpbGwgaGF2ZSBzb21lIHVuaW50ZW5kZWQg
c2lkZSBlZmZlY3RzLiBFZmZlY3RpdmVseSwgaXQgd2lsbCBsb29rIGF0Cj4gdGhlIFAtc3RhdGUg
ZG9tYWluIGV4aXN0ZW5jZSBhbmQgKmlmIGl0IGFscmVhZHkgZXhpc3RzKiBpdCB3aWxsIHNraXAg
dGhlCj4gYWNwaS1jcHVmcmVxIGluaXRpYWxpemF0aW9uIGFuZCB0aHVzIGluaGVyaXQgdGhlIHBv
bGljeSBmcm9tIHRoZSBmaXJzdCBDUFUKPiBpbiB0aGUgY3B1ZnJlcSBkb21haW4uIFRoaXMgd2ls
bCBmaW5hbGx5IGxlYWQgdG8gdGhlIG9yaWdpbmFsIGNwdSBub3QKPiBjaGFuZ2luZyB0YXJnZXQg
ZnJlcSB0byBQMCBvdGhlciB0aGFuIHRoZSBmaXJzdCBpbiB0aGUgZG9tYWluLiBXaGljaCB3aWxs
Cj4gbWFrZSB0dXJibyBib29zdCBub3QgZ2V0dGluZyBlbmFibGVkIChlLmcuIGZvciAncGVyZm9y
bWFuY2UnIGdvdmVybm9yKSBmb3IKPiBhbGwgY3B1cy4KPgo+IFRoaXMgcGF0Y2ggZml4ZXMgdGhh
dCwgYnkgYWxzbyBldmFsdWF0aW5nIF9QU0Qgd2hlbiB3ZSBlbnVtZXJhdGUgYWxsIEFDUEkKPiBw
cm9jZXNzb3JzIGFuZCB0aHVzIGFsd2F5cyB1cGxvYWRpbmcgdGhlIGNvcnJlY3QgaW5mbyB0byBY
ZW4uIFdlIGV4cG9ydAo+IGFjcGlfcHJvY2Vzc29yX2dldF9wc2QoKSBmb3IgdGhhdCB0aGlzIHB1
cnBvc2UsIGJ1dCBjaGFuZ2Ugc2lnbmF0dXJlCj4gdG8gbm90IGFzc3VtZSBhbiBleGlzdGVudCBv
ZiBhY3BpX3Byb2Nlc3NvciBnaXZlbiB0aGF0IEFDUEkgaXNuJ3QgY3JlYXRpbmcKPiBhbiBhY3Bp
X3Byb2Nlc3NvciBmb3Igbm9uLWRvbTAgQ1BVcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEpvYW8gTWFy
dGlucyA8am9hby5tLm1hcnRpbnNAb3JhY2xlLmNvbT4KCgoKQXBwbGllZCB0byBmb3ItbGludXMt
NC4xNwoKCi1ib3JpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
