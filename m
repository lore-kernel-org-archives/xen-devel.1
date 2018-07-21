From: "M. Vefa Bicakci" <m.v.b@runbox.com>
Subject: Re: [PATCH 2/2] xen/pv: Call get_cpu_address_sizes to
 set x86_virt/phys_bits
Date: Sat, 21 Jul 2018 19:17:49 -0400
Message-ID: <d85c93da-4549-a7c1-af48-9c62cba8ae71__8359.46139782227$1532215040$gmane$org@runbox.com>
References: <20180721194909.23903-1-m.v.b@runbox.com>
 <20180721194909.23903-2-m.v.b@runbox.com>
 <90bc371d-a296-51b3-8b78-62106c9690de@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ktyp=kf=runbox.com=m.v.b@srs-us1.protection.inumbo.net>)
 id 1fh18j-0003pc-AP
 for xen-devel@lists.xenproject.org; Sat, 21 Jul 2018 23:18:17 +0000
In-Reply-To: <90bc371d-a296-51b3-8b78-62106c9690de@oracle.com>
Content-Language: en-CA
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, stable@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjEvMjAxOCAwNToyNSBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDA3LzIx
LzIwMTggMDM6NDkgUE0sIE0uIFZlZmEgQmljYWtjaSB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwo+
PiBpbmRleCA0MzlhOTRiZjg5YWQuLjg3YWZiMDAwMTQyYSAxMDA2NDQKPj4gLS0tIGEvYXJjaC94
ODYveGVuL2VubGlnaHRlbl9wdi5jCj4+ICsrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYu
Ywo+PiBAQCAtMTI1Nyw2ICsxMjU3LDcgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgdm9pZCBfX2lu
aXQgeGVuX3N0YXJ0X2tlcm5lbCh2b2lkKQo+PiAgIAo+PiAgIAkvKiBXb3JrIG91dCBpZiB3ZSBz
dXBwb3J0IE5YICovCj4+ICAgCWdldF9jcHVfY2FwKCZib290X2NwdV9kYXRhKTsKPj4gKwlnZXRf
Y3B1X2FkZHJlc3Nfc2l6ZXMoJmJvb3RfY3B1X2RhdGEpOwo+PiAgIAl4ODZfY29uZmlndXJlX254
KCk7Cj4gCj4gCj4gSGF2ZSB5b3Ugb2JzZXJ2ZWQgYW55IHByb2JsZW1zIHdpdGhvdXQgdGhpcyBj
YWxsPyBnZXRfY3B1X2NhcCgpIGlzIG9ubHkKPiBjYWxsZWQgaGVyZSB0byBzZXQgWDg2X0ZFQVRV
UkVfTlgsIGFuZCBpcyB0aGVuIGNhbGxlZCBhZ2FpbiwgdG9nZXRoZXIKPiB3aXRoIGdldF9jcHVf
YWRkcmVzc19zaXplcygpLCBmcm9tIGVhcmx5X2lkZW50aWZ5X2NwdSgpLgoKSGVsbG8gQm9yaXMs
CgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXdzISBXaXRob3V0IHRoZSBjYWxsIHRvIGdldF9jcHVf
YWRkcmVzc19zaXplcywKcGFyYXZpcnR1YWxpemVkIHZpcnR1YWwgbWFjaGluZXMgZG8gbm90IGJv
b3QgdXAga2VybmVscyB3aXRoIHZlcnNpb25zCjQuMTcgYW5kIHVwIGF0IGFsbDsgdGhpcyBpbmNs
dWRlcyBkb20wIGFuZCBkb21VLiBObyBkb21VIGxvZ3MgYXJlCmdlbmVyYXRlZCBpbiBkb20wJ3Mg
L3Zhci9sb2cveGVuL2NvbnNvbGUvIGRpcmVjdG9yeSBlaXRoZXIsIGRlc3BpdGUKaGF2aW5nIGVh
cmx5cHJpbnRrPXhlbiBvbiB0aGUga2VybmVsIGNvbW1hbmQgbGluZSBmb3IgbXkgdGVzdCBkb21V
LgoKKEZvciB0aGUgcmVjb3JkLCBJIGFtIHVzaW5nIHRoZSBwYXRjaGVkIHZlcnNpb24gb2YgWGVu
IDQuNi42IHByb3ZpZGVkCmJ5IFF1YmVzIE9TIFIzLjIuKQoKVGhhbmsgeW91LAoKVmVmYQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
