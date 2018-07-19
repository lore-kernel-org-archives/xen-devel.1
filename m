From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] xen/spinlock: Don't use pvqspinlock if only
 1 vCPU
Date: Thu, 19 Jul 2018 15:59:12 -0400
Message-ID: <daaac924-0f78-d934-886c-a90628aee7bd__24992.7262113944$1532030283$gmane$org@redhat.com>
References: <1532008100-26922-1-git-send-email-longman@redhat.com>
 <22f2465a-128e-730f-bc51-5a55ef16a039@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fsdu=kd=redhat.com=longman@srs-us1.protection.inumbo.net>)
 id 1fgF52-0007yo-0F
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 19:59:16 +0000
In-Reply-To: <22f2465a-128e-730f-bc51-5a55ef16a039@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTkvMjAxOCAwMzoxOCBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDA3LzE5
LzIwMTggMDk6NDggQU0sIFdhaW1hbiBMb25nIHdyb3RlOgo+PiBPbiBhIFZNIHdpdGggb25seSAx
IHZDUFUsIHRoZSBsb2NraW5nIGZhc3QgcGF0aHMgd2lsbCBhbHdheXMgYmUKPj4gc3VjY2Vzc2Z1
bC4gSW4gdGhpcyBjYXNlLCB0aGVyZSBpcyBubyBuZWVkIHRvIHVzZSB0aGUgdGhlIFBWIHFzcGlu
bG9jawo+PiBjb2RlIHdoaWNoIGhhcyBoaWdoZXIgb3ZlcmhlYWQgb24gdGhlIHVubG9jayBzaWRl
IHRoYW4gdGhlIG5hdGl2ZQo+PiBxc3BpbmxvY2sgY29kZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
V2FpbWFuIExvbmcgPGxvbmdtYW5AcmVkaGF0LmNvbT4KPj4gLS0tCj4+ICBhcmNoL3g4Ni94ZW4v
c3BpbmxvY2suYyB8IDMgKystCj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vc3BpbmxvY2suYyBi
L2FyY2gveDg2L3hlbi9zcGlubG9jay5jCj4+IGluZGV4IGNkOTdhNjIuLjM4ZjQ3YWUgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gveDg2L3hlbi9zcGlubG9jay5jCj4+ICsrKyBiL2FyY2gveDg2L3hlbi9z
cGlubG9jay5jCj4+IEBAIC0xMzAsNyArMTMwLDggQEAgdm9pZCB4ZW5fdW5pbml0X2xvY2tfY3B1
KGludCBjcHUpCj4+ICB2b2lkIF9faW5pdCB4ZW5faW5pdF9zcGlubG9ja3Modm9pZCkKPj4gIHsK
Pj4gIAo+PiAtCWlmICgheGVuX3B2c3Bpbikgewo+PiArCS8qICBEb24ndCBuZWVkIHRvIHVzZSBw
dnFzcGlubG9jayBjb2RlIGlmIHRoZXJlIGlzIG9ubHkgMSB2Q1BVLiAqLwo+PiArCWlmICgheGVu
X3B2c3BpbiB8fCBudW1fcG9zc2libGVfY3B1cygpID09IDEpIHsKPj4gIAkJcHJpbnRrKEtFUk5f
REVCVUcgInhlbjogUFYgc3BpbmxvY2tzIGRpc2FibGVkXG4iKTsKPj4gIAkJcmV0dXJuOwo+PiAg
CX0KPgo+IEkgdGhpbmsgd2UgbmVlZCB0byBzZXQgeGVuX3B2c3BpbiB0byBmYWxzZSBmb3Igc3Vj
aCBjb25maWd1cmF0aW9ucy4KPiBOb3RpY2UgdGhhdCB4ZW5faW5pdF9sb2NrX2NwdSgpIHdpbGwg
dHJ5IHRvIHBlcmZvcm0gc29tZSBhZGRpdGlvbmFsCj4gcHZzcGlubG9jayBpbml0aWFsaXphdGlv
bnMuCj4KPgo+IC1ib3JpcwoKVGhlIG90aGVyIHB2cXNwaW5sb2NrIGluaXRpYWxpemF0aW9uIGhh
cyBubyBydW50aW1lIGltcGFjdCBvdGhlciB0aGFuCmFsbG9jYXRpbmcgYSBiaXQgb2YgZXh0cmEg
bWVtb3J5LiBBbnl3YXksIEkgd2lsbCByZXZpc2UgdGhlIHBhdGNoIHRvCmRpc2FibGUgeGVuX3B2
c3BpbiB1bmRlciBzdWNoIGNvbmRpdGlvbi4KCi1Mb25nbWFuCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
