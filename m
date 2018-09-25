From: Balbir Singh <bsingharora@gmail.com>
Subject: Re: [PATCH v2 5/6] powerpc/powernv: hold
 device_hotplug_lock when calling memtrace_offline_pages()
Date: Tue, 25 Sep 2018 22:15:04 +1000
Message-ID: <20180925121504.GH8537__25832.4284608991$1537877647$gmane$org@350D>
References: <20180925091457.28651-1-david@redhat.com>
 <20180925091457.28651-6-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2skl=mh=gmail.com=bsingharora@srs-us1.protection.inumbo.net>)
 id 1g4mFC-00077C-Vi
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 12:15:11 +0000
Received: by mail-pf1-x441.google.com with SMTP id x26-v6so1071714pfn.4
 for <xen-devel@lists.xenproject.org>; Tue, 25 Sep 2018 05:15:09 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20180925091457.28651-6-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Michael Neuling <mikey@neuling.org>, linux-acpi@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, devel@linuxdriverproject.org, xen-devel@lists.xenproject.org, Rashmica Gupta <rashmica.g@gmail.com>, linuxppc-dev@lists.ozlabs.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMjUsIDIwMTggYXQgMTE6MTQ6NTZBTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gTGV0J3MgcGVyZm9ybSBhbGwgY2hlY2tpbmcgKyBvZmZsaW5pbmcgKyByZW1v
dmluZyB1bmRlcgo+IGRldmljZV9ob3RwbHVnX2xvY2ssIHNvIG5vYm9keSBjYW4gbWVzcyB3aXRo
IHRoZXNlIGRldmljZXMgdmlhCj4gc3lzZnMgY29uY3VycmVudGx5Lgo+IAo+IENjOiBCZW5qYW1p
biBIZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+Cj4gQ2M6IFBhdWwgTWFj
a2VycmFzIDxwYXVsdXNAc2FtYmEub3JnPgo+IENjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxs
ZXJtYW4uaWQuYXU+Cj4gQ2M6IFJhc2htaWNhIEd1cHRhIDxyYXNobWljYS5nQGdtYWlsLmNvbT4K
PiBDYzogQmFsYmlyIFNpbmdoIDxic2luZ2hhcm9yYUBnbWFpbC5jb20+Cj4gQ2M6IE1pY2hhZWwg
TmV1bGluZyA8bWlrZXlAbmV1bGluZy5vcmc+Cj4gUmV2aWV3ZWQtYnk6IFBhdmVsIFRhdGFzaGlu
IDxwYXZlbC50YXRhc2hpbkBtaWNyb3NvZnQuY29tPgo+IFJldmlld2VkLWJ5OiBSYXNobWljYSBH
dXB0YSA8cmFzaG1pY2EuZ0BnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVu
YnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Cj4gLS0tCj4gIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMv
cG93ZXJudi9tZW10cmFjZS5jIHwgNCArKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy9wb3dlcm52L21lbXRyYWNlLmMgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYv
bWVtdHJhY2UuYwo+IGluZGV4IGZkZDQ4ZjFhMzlmNy4uZDg0ZDA5YzU2YWY5IDEwMDY0NAo+IC0t
LSBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJudi9tZW10cmFjZS5jCj4gKysrIGIvYXJj
aC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm52L21lbXRyYWNlLmMKPiBAQCAtNzAsNiArNzAsNyBA
QCBzdGF0aWMgaW50IGNoYW5nZV9tZW1ibG9ja19zdGF0ZShzdHJ1Y3QgbWVtb3J5X2Jsb2NrICpt
ZW0sIHZvaWQgKmFyZykKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+ICsvKiBjYWxsZWQgd2l0aCBk
ZXZpY2VfaG90cGx1Z19sb2NrIGhlbGQgKi8KPiAgc3RhdGljIGJvb2wgbWVtdHJhY2Vfb2ZmbGlu
ZV9wYWdlcyh1MzIgbmlkLCB1NjQgc3RhcnRfcGZuLCB1NjQgbnJfcGFnZXMpCj4gIHsKPiAgCXU2
NCBlbmRfcGZuID0gc3RhcnRfcGZuICsgbnJfcGFnZXMgLSAxOwo+IEBAIC0xMTEsNiArMTEyLDcg
QEAgc3RhdGljIHU2NCBtZW10cmFjZV9hbGxvY19ub2RlKHUzMiBuaWQsIHU2NCBzaXplKQo+ICAJ
ZW5kX3BmbiA9IHJvdW5kX2Rvd24oZW5kX3BmbiAtIG5yX3BhZ2VzLCBucl9wYWdlcyk7Cj4gIAo+
ICAJZm9yIChiYXNlX3BmbiA9IGVuZF9wZm47IGJhc2VfcGZuID4gc3RhcnRfcGZuOyBiYXNlX3Bm
biAtPSBucl9wYWdlcykgewo+ICsJCWxvY2tfZGV2aWNlX2hvdHBsdWcoKTsKCldoeSBub3QgZ3Jh
YiB0aGUgbG9jayBiZWZvcmUgdGhlIGZvciBsb29wPyBUaGF0IHdheSB3ZSBjYW4gYXZvaWQgYmFk
IGNhc2VzIGxpa2UgYQpsYXJnZSBub2RlIGJlaW5nIHNjYW5uZWQgZm9yIGEgc21hbGwgbnVtYmVy
IG9mIHBhZ2VzIChucl9wYWdlcykuIElkZWFsbHkgd2UgbmVlZAphIGNvbmRfcmVzY2hlZCgpIGlu
IHRoZSBsb29wLCBidXQgSSBndWVzcyBvZmZsaW5lX3BhZ2VzKCkgaGFzIG9uZS4KCkFja2VkLWJ5
OiBCYWxiaXIgU2luZ2ggPGJzaW5naGFyb3JhQGdtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
