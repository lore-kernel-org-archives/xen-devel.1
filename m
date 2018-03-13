From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/3] SUPPORT.md: Specify support for various
 image formats
Date: Tue, 13 Mar 2018 03:30:46 -0600
Message-ID: <5AA7A85602000078001B0D3A@prv-mh.provo.novell.com>
References: <20180309180356.8067-1-george.dunlap@citrix.com>
 <20180309180356.8067-2-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=c4be=gd=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1evgGn-0002JS-Od
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 09:30:57 +0000
In-Reply-To: <20180309180356.8067-2-george.dunlap@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@citrix.com>, Roger PauMonne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjAzLjE4IGF0IDE5OjAzLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBRRU1VIHN1cHBvcnRzIHZhcmlvdXMgaW1hZ2UgZm9ybWF0cywgYnV0IHdlIG9ubHkgcHJv
dmlkZSBzZWN1cml0eQo+IHN1cHBvcnQgZm9yIHJhdywgcWNvdywgcWNvdzIsIGFuZCB2aGQgZm9y
bWF0cy4KPiAKPiBSYXRoZXIgdGhhbiBkdXBsaWNhdGUgdGhpcyBpbmZvcm1hdGlvbiB1bmRlciB0
aGUgIng4Ni9FbXVsYXRlZAo+IHN0b3JhZ2UiIHNlY3Rpb24sIGp1c3QgcmVmZXIgdG8gdGhlICJC
bGtiYWNrIiBzZWN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3Jn
ZS5kdW5sYXBAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cgo+IC0tLQo+IFRoaXMgaXMgYSBjYW5kaWRhdGUgZm9yIGJhY2twb3J0IHRvIDQuMTAu
Cj4gCj4gT3RoZXIgb3B0aW9uIEkgZXhwbG9yZWQgd2FzIGdpdmluZyBlYWNoIGZvcm1hdCBpdHMg
b3duIGVudHJ5LCBsaWtlCj4gdGhpczoKPiAKPiAjIyMjIEltYWdlIGZvcm1hdDogUmF3Cj4gCj4g
ICAgIFN0YXR1cywgTGludXggKHhlbi1ibGtiYWNrKTogU3VwcG9ydGVkCj4gICAgIFN0YXR1cywg
UUVNVSAoeGVuX2Rpc2spOiBTdXBwb3J0ZWQKPiAgICAgU3RhdHVzLCBGcmVlQlNEIChibGtiYWNr
KTogU3VwcG9ydGVkLCBTZWN1cml0eSBzdXBwb3J0IGV4dGVybmFsCj4gICAgIFN0YXR1cywgTmV0
QlNEICh4YmRiYWNrKTogU3VwcG9ydGVkLCBzZWN1cml0eSBzdXBwb3J0IGV4dGVybmFsCj4gICAg
IFN0YXR1cywgQmxrdGFwMjogRGVwcmVjYXRlZAo+IAo+IEJ1dCB0aGF0IGxlZCB0byBhIGxvdCBv
ZiBkdXBsaWNhdGlvbiAoRXZlcnl0aGluZyBpcyBsaXN0ZWQgYXMKPiAic3VwcG9ydGVkIiBvbmNl
IHVuZGVyICJCbGtiYWNrIiwgYW5kIG9uY2UgdW5kZXIgIkltYWdlIGZvcm1hdDogUmF3IikuCgpJ
IGFncmVlIC0gdGhlIHdheSB5b3UndmUgcHV0IGl0IGFsbCBuZWNlc3NhcnkgaW5mb3JtYXRpb24g
aXMgdGhlcmUKd2l0aG91dCBtdWNoIHJlZHVuZGFuY3kuCgpKYW4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
