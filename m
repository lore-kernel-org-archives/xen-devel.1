From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] tools/xenstore: try to get minimum
 thread stack size for watch thread
Date: Tue, 6 Mar 2018 13:40:28 +0100
Message-ID: <a0110db4-6623-63ca-765a-b45c0ee4f7c4@suse.com>
References: <20180226084612.2844-1-jgross@suse.com>
 <ef2fdeb4-ebd3-9fff-aff9-b7a9d176cbd1@suse.com>
 <20180302122931.vulvnjyz2lwqck43@citrix.com>
 <20180302124024.ka6hdd4zrckuhqon@citrix.com>
 <20180306112407.GA12941@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=xqmt=f4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1etBtV-0007Rm-AY
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 12:40:37 +0000
In-Reply-To: <20180306112407.GA12941@aepfle.de>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>, Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jim Fehlig <jfehlig@suse.com>, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDMvMTggMTI6MjQsIE9sYWYgSGVyaW5nIHdyb3RlOgo+IE9uIEZyaSwgTWFyIDAyLCBX
ZWkgTGl1IHdyb3RlOgo+IAo+PiBCdXQgc3RpbGwsIEp1ZXJnZW4gbXVzdCBoYXZlIHRlc3RlZCB0
aGUgY2hhbmdlLCBzbyBJIHdvbmRlciB3aHkgaXQKPj4gZG9lc24ndCB3b3JrIGluIHlvdXIgc2V0
dXAuIFdoYXQgaXMgeW91ciBidWlsZCBlbnZpcm9ubWVudD8gR2NjIHZlcnNpb24/Cj4gCj4gVW5j
bGVhciB3aGF0IHRoZSBkaWZmZXJlbmNlIGlzIGJldHdlZW4gYnVpbGRpbmcgaW4gY2xlYW4gY2hy
b290IGFuZCBsb2NhbGx5Lgo+IFRoaXMgY2hhbmdlIGZpeGVzIGl0IGZvciBtZToKPiAKPiAtLS0g
YS90b29scy9SdWxlcy5tawo+ICsrKyBiL3Rvb2xzL1J1bGVzLm1rCj4gQEAgLTE0OCw2ICsxNDgs
OSBAQCBTSExJQl9saWJ4ZW5ndWVzdCAgPSAkKFNIREVQU19saWJ4ZW5ndWVzdCkgLVdsLC1ycGF0
aC1saW5rPSQoWEVOX0xJQlhDKQo+ICBDRkxBR1NfbGlieGVuc3RvcmUgPSAtSSQoWEVOX1hFTlNU
T1JFKS9pbmNsdWRlICQoQ0ZMQUdTX3hlbmluY2x1ZGUpCj4gIFNIREVQU19saWJ4ZW5zdG9yZSA9
ICQoU0hMSUJfbGlieGVudG9vbGNvcmUpCj4gIExETElCU19saWJ4ZW5zdG9yZSA9ICQoU0hERVBT
X2xpYnhlbnN0b3JlKSAkKFhFTl9YRU5TVE9SRSkvbGlieGVuc3RvcmUkKGxpYmV4dGVuc2lvbikK
PiAraWZlcSAoJChDT05GSUdfTGludXgpLHkpCj4gK0xETElCU19saWJ4ZW5zdG9yZSArPSAtbGRs
Cj4gK2VuZGlmCgpTbyB3ZSBuZWVkIHRvIGFkZCB0aGlzIHRvIHhlbnN0b3JlLnBjLCByaWdodD8K
Cj4gIFNITElCX2xpYnhlbnN0b3JlICA9ICQoU0hERVBTX2xpYnhlbnN0b3JlKSAtV2wsLXJwYXRo
LWxpbms9JChYRU5fWEVOU1RPUkUpCj4gIAo+ICBDRkxBR1NfbGlieGVuc3RhdCAgPSAtSSQoWEVO
X0xJQlhFTlNUQVQpCj4gLS0tIGEvdG9vbHMveGVuc3RvcmUvTWFrZWZpbGUKPiArKysgYi90b29s
cy94ZW5zdG9yZS9NYWtlZmlsZQo+IEBAIC0xMDMsNiArMTAzLDcgQEAgeHMub3BpYzogQ0ZMQUdT
ICs9IC1EVVNFX1BUSFJFQUQKPiAgaWZlcSAoJChDT05GSUdfTGludXgpLHkpCj4gIHhzLm9waWM6
IENGTEFHUyArPSAtRFVTRV9ETFNZTQo+ICBsaWJ4ZW5zdG9yZS5zby4kKE1BSk9SKS4kKE1JTk9S
KTogTERGTEFHUyArPSAtbGRsCj4gK0xETElCU194ZW5zdG9yZWQgKz0gLWxkbAoKV2h5IGlzIHRo
aXMgbmVlZGVkPyB4ZW5zdG9yZWQgZG9lc24ndCBuZWVkIGxpYnhlbnN0b3JlIGFuZCAoYXQgbGVh
c3Qgb24KbXkgc3lzdGVtKSBkb2Vzbid0IHRyeSB0byBsb2FkIGl0LiBUaGUgIi1sZGwiIGFkZGl0
aW9uIHNob3VsZCBvbmx5IGJlCm5lZWRlZCBmb3IgcHJvZ3JhbXMgbGlua2VkIGFnYWluc3QgbGli
eGVuc3RvcmUuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
