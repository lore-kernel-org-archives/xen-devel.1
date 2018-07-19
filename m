From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] xen/spinlock: Don't use pvqspinlock if
 only 1 vCPU
Date: Thu, 19 Jul 2018 18:35:46 -0400
Message-ID: <2814c5d2-3016-8e9b-a644-0711fd92b9c7__43194.7576617405$1532039665$gmane$org@oracle.com>
References: <1532036397-19449-1-git-send-email-longman@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ez6l=kd=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fgHWF-0004Zs-VG
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 22:35:31 +0000
In-Reply-To: <1532036397-19449-1-git-send-email-longman@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Waiman Long <longman@redhat.com>, Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTkvMjAxOCAwNTozOSBQTSwgV2FpbWFuIExvbmcgd3JvdGU6Cj4gT24gYSBWTSB3aXRo
IG9ubHkgMSB2Q1BVLCB0aGUgbG9ja2luZyBmYXN0IHBhdGhzIHdpbGwgYWx3YXlzIGJlCj4gc3Vj
Y2Vzc2Z1bC4gSW4gdGhpcyBjYXNlLCB0aGVyZSBpcyBubyBuZWVkIHRvIHVzZSB0aGUgdGhlIFBW
IHFzcGlubG9jawo+IGNvZGUgd2hpY2ggaGFzIGhpZ2hlciBvdmVyaGVhZCBvbiB0aGUgdW5sb2Nr
IHNpZGUgdGhhbiB0aGUgbmF0aXZlCj4gcXNwaW5sb2NrIGNvZGUuCj4KPiBUaGUgeGVuX3B2c3Bp
biB2ZXJpYWJsZSBpcyBhbHNvIHR1cm5lZCBvZmYgaW4gdGhpcyAxIHZDUFUgY2FzZSB0bwo+IGVs
aW1pbmF0ZSB1bm5lZWRlZCBwdnFzcGlubG9jayBpbml0aWFsaXphdGlvbiBpbiB4ZW5faW5pdF9s
b2NrX2NwdSgpCj4gd2hpY2ggaXMgcnVuIGFmdGVyIHhlbl9pbml0X3NwaW5sb2NrcygpLgo+Cj4g
U2lnbmVkLW9mZi1ieTogV2FpbWFuIExvbmcgPGxvbmdtYW5AcmVkaGF0LmNvbT4KClJldmlld2Vk
LWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKCgo+IC0t
LQo+ICBhcmNoL3g4Ni94ZW4vc3BpbmxvY2suYyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3NwaW5sb2NrLmMg
Yi9hcmNoL3g4Ni94ZW4vc3BpbmxvY2suYwo+IGluZGV4IGNkOTdhNjIuLjk3M2YxMGUgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC94ODYveGVuL3NwaW5sb2NrLmMKPiArKysgYi9hcmNoL3g4Ni94ZW4vc3Bp
bmxvY2suYwo+IEBAIC0xMzAsNiArMTMwLDEwIEBAIHZvaWQgeGVuX3VuaW5pdF9sb2NrX2NwdShp
bnQgY3B1KQo+ICB2b2lkIF9faW5pdCB4ZW5faW5pdF9zcGlubG9ja3Modm9pZCkKPiAgewo+ICAK
PiArCS8qICBEb24ndCBuZWVkIHRvIHVzZSBwdnFzcGlubG9jayBjb2RlIGlmIHRoZXJlIGlzIG9u
bHkgMSB2Q1BVLiAqLwo+ICsJaWYgKG51bV9wb3NzaWJsZV9jcHVzKCkgPT0gMSkKPiArCQl4ZW5f
cHZzcGluID0gZmFsc2U7Cj4gKwo+ICAJaWYgKCF4ZW5fcHZzcGluKSB7Cj4gIAkJcHJpbnRrKEtF
Uk5fREVCVUcgInhlbjogUFYgc3BpbmxvY2tzIGRpc2FibGVkXG4iKTsKPiAgCQlyZXR1cm47CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
