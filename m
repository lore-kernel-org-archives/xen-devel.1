From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3] xen/acpi: upload _PSD info for non Dom0
	CPUs too
Date: Thu, 15 Mar 2018 11:45:01 -0400
Message-ID: <bbf536dc-3c3d-8a25-47e8-7fd52850835d__3007.49520906738$1521128550$gmane$org@oracle.com>
References: <20180315142205.15839-1-joao.m.martins@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=45wj=gf=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ewV2e-00053v-FG
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 15:43:44 +0000
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
dGlucyA8am9hby5tLm1hcnRpbnNAb3JhY2xlLmNvbT4KClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ry
b3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
