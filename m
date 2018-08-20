From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] x86/xen: enable early use of set_fixmap in
 32-bit Xen PV guest
Date: Mon, 20 Aug 2018 15:18:06 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1808201514100.1551__46887.4015765779$1534771019$gmane$org@nanos.tec.linutronix.de>
References: <20180817134016.19957-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fvik=ld=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1frk4U-0002r7-10
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 13:18:14 +0000
In-Reply-To: <20180817134016.19957-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, pasha.tatashin@oracle.com, mingo@redhat.com, hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAxNyBBdWcgMjAxOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKCj4gQ29tbWl0IDdiMjVi
OWNiMGRhZDgzICgieDg2L3hlbi90aW1lOiBJbml0aWFsaXplIHB2IHhlbiB0aW1lIGluCj4gaW5p
dF9oeXBlcnZpc29yX3BsYXRmb3JtKCkiKSBtb3ZlZCB0aGUgbWFwcGluZyBvZiB0aGUgc2hhcmVk
IGluZm8gYXJlYQo+IGJlZm9yZSBwYWdldGFibGVfaW5pdCgpLiBUaGlzIGJyZWFrcyBib290aW5n
IGFzIDMyLWJpdCBQViBndWVzdCBhcyB0aGUKPiB1c2Ugb2Ygc2V0X2ZpeG1hcCBpc24ndCBwb3Nz
aWJsZSBhdCB0aGlzIHRpbWUgb24gMzItYml0Lgo+IAo+IFRoaXMgY2FuIGJlIHdvcmtlZCBhcm91
bmQgYnkgcG9wdWxhdGluZyB0aGUgbmVlZGVkIFBNRCBvbiAzMi1iaXQKPiBrZXJuZWwgZWFybGll
ci4KPiAKPiBJbiBvcmRlciBub3QgdG8gcmVpbXBsZW1lbnQgcG9wdWxhdGVfZXh0cmFfcHRlKCkg
dXNpbmcgZXh0ZW5kX2JyaygpCj4gZm9yIGFsbG9jYXRpbmcgbmV3IHBhZ2UgdGFibGVzIGV4dGVu
ZCBhbGxvY19sb3dfcGFnZXMoKSB0byBkbyB0aGF0IGluCj4gY2FzZSB0aGUgZWFybHkgcGFnZSB0
YWJsZSBwb29sIGlzIG5vdCB5ZXQgYXZhaWxhYmxlLgo+IAo+IEZpeGVzOiA3YjI1YjljYjBkYWQ4
MwoKICBeXl4gVGhhdCdzIG1pc3NpbmcgdGhlIHN1YmplY3QgdGV4dAoKT3RoZXIgdGhhbiB0aGF0
OgoKUmV2aWV3ZC1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
