From: Maran Wilson <maran.wilson@oracle.com>
Subject: Re: [RFC PATCH v4 1/7] xen/pvh: Split CONFIG_XEN_PVH
 into CONFIG_PVH and CONFIG_XEN_PVH
Date: Thu, 1 Mar 2018 09:24:13 -0800
Message-ID: <e8bbb473-fb06-aa33-75e1-dbb80dc1c5a2__38287.0103967891$1519925035$gmane$org@oracle.com>
References: <1519842483-8887-1-git-send-email-maran.wilson@oracle.com>
 <1519842483-8887-2-git-send-email-maran.wilson@oracle.com>
 <5be04d96-aa10-a022-2597-f7f40138f8f8@oracle.com>
 <8cdb96db-0771-f062-e0ea-54b4171d6a98@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=twhr=fx=oracle.com=maran.wilson@srs-us1.protection.inumbo.net>)
 id 1erRx4-0006KO-0B
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 17:25:06 +0000
In-Reply-To: <8cdb96db-0771-f062-e0ea-54b4171d6a98@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, jgross@suse.com, roger.pau@citrix.com, andrew.cooper3@citrix.com, hch@infradead.org, JBeulich@suse.com, x86@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc: thomas.lendacky@amd.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, rkrcmar@redhat.com, gregkh@linuxfoundation.org, mchehab@kernel.org, hpa@zytor.com, mingo@redhat.com, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, davem@davemloft.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMy8xLzIwMTggNzoxNyBBTSwgUGFvbG8gQm9uemluaSB3cm90ZToKPiBPbiAwMS8wMy8yMDE4
IDE2OjAyLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IE9uIDAyLzI4LzIwMTggMDE6MjcgUE0s
IE1hcmFuIFdpbHNvbiB3cm90ZToKPj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9LY29uZmlnIGIv
YXJjaC94ODYvS2NvbmZpZwo+Pj4gaW5kZXggZWI3ZjQzZjIzNTIxLi5mYTdjZDAzMDUxMjUgMTAw
NjQ0Cj4+PiAtLS0gYS9hcmNoL3g4Ni9LY29uZmlnCj4+PiArKysgYi9hcmNoL3g4Ni9LY29uZmln
Cj4+PiBAQCAtNzkxLDYgKzc5MSwxNCBAQCBjb25maWcgS1ZNX0dVRVNUCj4+PiAgIAkgIHVuZGVy
bHlpbmcgZGV2aWNlIG1vZGVsLCB0aGUgaG9zdCBwcm92aWRlcyB0aGUgZ3Vlc3Qgd2l0aAo+Pj4g
ICAJICB0aW1pbmcgaW5mcmFzdHJ1Y3R1cmUgc3VjaCBhcyB0aW1lIG9mIGRheSwgYW5kIHN5c3Rl
bSB0aW1lCj4+PiAgIAo+Pj4gK2NvbmZpZyBQVkgKPj4+ICsJYm9vbCAiU3VwcG9ydCBmb3IgcnVu
bmluZyBQVkggZ3Vlc3RzIgo+Pj4gKwlkZXBlbmRzIG9uIEtWTV9HVUVTVCB8fCBYRU4KPj4KPj4g
Tm90IHN1cmUgYWJvdXQgWEVOIHBhcnQuIFBWSCBpcyBzZWxlY3RlZCBieSBYRU5fUFZIIGZvciBY
ZW4uCj4+Cj4+IFdoYXQgYWJvdXQgaW50cm9kdWNpbmcgS1ZNX0dVRVNUX1BWSCB0aGF0IHdpbGwg
c2VsZWN0IFBWSCBhbmQgdGhlbiBkcm9wCj4+IGRlcGVuZGVuY3kgaGVyZT8KPiBUaGF0IGlzLCAi
Y29uZmlnIEtWTV9HVUVTVF9QVkgiICJkZXBlbmRzIG9uIEtWTV9HVUVTVCIgInNlbGVjdCBQVkgi
Lgo+IFNvdW5kcyBnb29kIHRvIG1lLgoKT0ssIHdpbGwgZG8uCgpUaGFua3MsCi1NYXJhbgoKPiBQ
YW9sbwo+Cj4+IC1ib3Jpcwo+Pgo+Pj4gKwlkZWZfYm9vbCBuCj4+PiArCS0tLWhlbHAtLS0KPj4+
ICsJICBUaGlzIG9wdGlvbiBlbmFibGVzIHRoZSBQVkggZW50cnkgcG9pbnQgZm9yIGd1ZXN0IHZp
cnR1YWwgbWFjaGluZXMKPj4+ICsJICBhcyBzcGVjaWZpZWQgaW4gdGhlIHg4Ni9IVk0gZGlyZWN0
IGJvb3QgQUJJLgo+Pj4gKwo+Pj4gICAKPj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4v
S2NvbmZpZyBiL2FyY2gveDg2L3hlbi9LY29uZmlnCj4+PiBpbmRleCBmNjA1ODI1YTA0YWIuLjAy
MWM4NTkxYzNjMCAxMDA2NDQKPj4+IC0tLSBhL2FyY2gveDg2L3hlbi9LY29uZmlnCj4+PiArKysg
Yi9hcmNoL3g4Ni94ZW4vS2NvbmZpZwo+Pj4gQEAgLTc3LDggKzc3LDkgQEAgY29uZmlnIFhFTl9E
RUJVR19GUwo+Pj4gICAJICBFbmFibGluZyB0aGlzIG9wdGlvbiBtYXkgaW5jdXIgYSBzaWduaWZp
Y2FudCBwZXJmb3JtYW5jZSBvdmVyaGVhZC4KPj4+ICAgCj4+PiAgIGNvbmZpZyBYRU5fUFZICj4+
PiAtCWJvb2wgIlN1cHBvcnQgZm9yIHJ1bm5pbmcgYXMgYSBQVkggZ3Vlc3QiCj4+PiArCWJvb2wg
IlN1cHBvcnQgZm9yIHJ1bm5pbmcgYXMgYSBYZW4gUFZIIGd1ZXN0Igo+Pj4gICAJZGVwZW5kcyBv
biBYRU4gJiYgWEVOX1BWSFZNICYmIEFDUEkKPj4+ICAgCSMgUHJlLWJ1aWx0IHBhZ2UgdGFibGVz
IGFyZSBub3QgcmVhZHkgdG8gaGFuZGxlIDUtbGV2ZWwgcGFnaW5nLgo+Pj4gICAJZGVwZW5kcyBv
biAhWDg2XzVMRVZFTAo+Pj4gKwlzZWxlY3QgUFZICj4+PiAgIAlkZWZfYm9vbCBuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
