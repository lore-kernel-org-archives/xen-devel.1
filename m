From: Arun KS <arunks@codeaurora.org>
Subject: Re: [PATCH v5 1/2] memory_hotplug: Free pages as higher
 order
Date: Wed, 10 Oct 2018 16:21:16 +0530
Message-ID: <f18b87a0762c4379b78e9b5e09ff4840__9972.08729754693$1539168621$gmane$org@codeaurora.org>
References: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
 <20181010080724.GA20338@techadventures.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=upqh=mw=codeaurora.org=arunks@srs-us1.protection.inumbo.net>)
 id 1gAC5J-00045y-3B
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 10:51:21 +0000
In-Reply-To: <20181010080724.GA20338@techadventures.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oscar Salvador <osalvador@techadventures.net>
Cc: mhocko@suse.com, vatsa@codeaurora.org, linux-mm@kvack.org, getarunks@gmail.com, kys@microsoft.com, boris.ostrovsky@oracle.com, sthemmin@microsoft.com, xen-devel@lists.xenproject.org, haiyangz@microsoft.com, yasu.isimatu@gmail.com, dan.j.williams@intel.com, akpm@linux-foundation.org, vbabka@suse.cz, osalvador@suse.de, jgross@suse.com, aaron.lu@intel.com, malat@debian.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vinmenon@codeaurora.org, jrdr.linux@gmail.com, devel@linuxdriverproject.org, iamjoonsoo.kim@lge.com, mgorman@techsingularity.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC0xMC0xMCAxMzozNywgT3NjYXIgU2FsdmFkb3Igd3JvdGU6Cj4gT24gRnJpLCBPY3Qg
MDUsIDIwMTggYXQgMDE6NDA6MDVQTSArMDUzMCwgQXJ1biBLUyB3cm90ZToKPj4gV2hlbiBmcmVl
IHBhZ2VzIGFyZSBkb25lIHdpdGggaGlnaGVyIG9yZGVyLCB0aW1lIHNwZW5kIG9uCj4+IGNvYWxl
c2NpbmcgcGFnZXMgYnkgYnVkZHkgYWxsb2NhdG9yIGNhbiBiZSByZWR1Y2VkLiBXaXRoCj4+IHNl
Y3Rpb24gc2l6ZSBvZiAyNTZNQiwgaG90IGFkZCBsYXRlbmN5IG9mIGEgc2luZ2xlIHNlY3Rpb24K
Pj4gc2hvd3MgaW1wcm92ZW1lbnQgZnJvbSA1MC02MCBtcyB0byBsZXNzIHRoYW4gMSBtcywgaGVu
Y2UKPj4gaW1wcm92aW5nIHRoZSBob3QgYWRkIGxhdGVuY3kgYnkgNjAlLiBNb2RpZnkgZXh0ZXJu
YWwKPj4gcHJvdmlkZXJzIG9mIG9ubGluZSBjYWxsYmFjayB0byBhbGlnbiB3aXRoIHRoZSBjaGFu
Z2UuCj4gCj4gSGkgQXJ1biwgb3V0IG9mIGN1cmlvc2l0eToKPiAKPiBjb3VsZCB5b3UgcGxlYXNl
IGV4cGxhaW4gaG93IGV4YWN0bHkgZGlkIHlvdSBtZXN1cmUgdGhlIHNwZWVkCj4gaW1wcm92ZW1l
bnQ/CgpkaWZmIC0tZ2l0IGEvbW0vbWVtb3J5X2hvdHBsdWcuYyBiL21tL21lbW9yeV9ob3RwbHVn
LmMKaW5kZXggZTM3OWU4NS4uMjQxNjEzNiAxMDA2NDQKLS0tIGEvbW0vbWVtb3J5X2hvdHBsdWcu
YworKysgYi9tbS9tZW1vcnlfaG90cGx1Zy5jCkBAIC02OTAsOSArNjkwLDEzIEBAIHN0YXRpYyBp
bnQgb25saW5lX3BhZ2VzX3JhbmdlKHVuc2lnbmVkIGxvbmcgCnN0YXJ0X3BmbiwgdW5zaWduZWQg
bG9uZyBucl9wYWdlcywKICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmFyZykKICB7CiAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgb25saW5lZF9wYWdlcyA9ICoodW5zaWduZWQgbG9uZyAqKWFy
ZzsKKyAgICAgICB1NjQgdDEsIHQyOwoKKyAgICAgICB0MSA9IGxvY2FsX2Nsb2NrKCk7CiAgICAg
ICAgIGlmIChQYWdlUmVzZXJ2ZWQocGZuX3RvX3BhZ2Uoc3RhcnRfcGZuKSkpCiAgICAgICAgICAg
ICAgICAgb25saW5lZF9wYWdlcyA9IG9ubGluZV9wYWdlc19ibG9ja3Moc3RhcnRfcGZuLCAKbnJf
cGFnZXMpOworICAgICAgIHQyID0gbG9jYWxfY2xvY2soKTsKKyAgICAgICB0cmFjZV9wcmludGso
InRpbWUgc3BlbmQgPSAlbGx1IHVzXG4iLCAodDItdDEpLygxMDAwKSk7CgogICAgICAgICBvbmxp
bmVfbWVtX3NlY3Rpb25zKHN0YXJ0X3Bmbiwgc3RhcnRfcGZuICsgbnJfcGFnZXMpOwoKClJlZ2Fy
ZHMsCkFydW4KCj4gCj4gVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
