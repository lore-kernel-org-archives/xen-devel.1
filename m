From: "Woods, Brian" <Brian.Woods@amd.com>
Subject: Re: [PATCH v2 0/3] mwait support for AMD processors
Date: Thu, 9 May 2019 22:00:07 +0000
Message-ID: <20190509220003.GA17484@amd.com>
References: <20190328150426.7295-1-brian.woods@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190328150426.7295-1-brian.woods@amd.com>
Content-Language: en-US
Content-ID: <F761ADDDE7F1914699A7A8F7F0DB52A4@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Woods, Brian" <Brian.Woods@amd.com>, Jan Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMjgsIDIwMTkgYXQgMDM6MDQ6MzJQTSArMDAwMCwgQnJpYW4gV29vZHMgd3Jv
dGU6Cj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkIHN1cHBvcnQgYW5kIGVuYWJsZW1lbnQgZm9yIG13
YWl0IG9uIEFNRCBOYXBsZXMKPiBhbmQgUm9tZSBwcm9jZXNzb3JzLiAgTmV3ZXIgQU1EIHByb2Nl
c3NvcnMgc3VwcG9ydCBtd2FpdCwgYnV0IG9ubHkgZm9yCj4gYzEsIGFuZCBmb3IgYzIgaGFsdCBp
cyB1c2VkLiAgVGhlIG13YWl0LWlkbGUgZHJpdmVyIGlzIG1vZGlmaWVkIHRvIGJlCj4gYWJsZSB0
byB1c2UgYm90aCBtd2FpdCBhbmQgaGFsdCBmb3IgaWRsaW5nLgo+IAo+IEJyaWFuIFdvb2RzICgz
KToKPiAgIG13YWl0LWlkbGU6IGFkZCBzdXBwb3J0IGZvciB1c2luZyBoYWx0Cj4gICBtd2FpdC1p
ZGxlOiBhZGQgc3VwcG9ydCBmb3IgQU1EIHByb2Nlc3NvcnMKPiAgIG13YWl0LWlkbGU6IGFkZCBl
bmFibGVtZW50IGZvciBBTUQgTmFwbGVzIGFuZCBSb21lCj4gCj4gIHhlbi9hcmNoL3g4Ni9hY3Bp
L2NwdV9pZGxlLmMgIHwgIDIgKy0KPiAgeGVuL2FyY2gveDg2L2NwdS9td2FpdC1pZGxlLmMgfCA2
MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4gIHhlbi9pbmNs
dWRlL2FzbS14ODYvY3B1aWRsZS5oIHwgIDEgKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDU3IGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gLS0gCj4gMi4xMS4wCj4gCj4gCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKUGluZyBmb3IgQW5k
eS4KCi0tIApCcmlhbiBXb29kcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
