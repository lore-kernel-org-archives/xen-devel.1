From: "Woods, Brian" <Brian.Woods@amd.com>
Subject: Re: [PATCH v2 0/3] mwait support for AMD processors
Date: Thu, 30 May 2019 19:27:56 +0000
Message-ID: <20190530192753.GA16199@amd.com>
References: <20190328150426.7295-1-brian.woods@amd.com>
 <20190509220003.GA17484@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190509220003.GA17484@amd.com>
Content-Language: en-US
Content-ID: <5A9F120C7D021C4EB3C7E6BB8C4C60CF@namprd12.prod.outlook.com>
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

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMDU6MDA6MDdQTSAtMDUwMCwgQnJpYW4gV29vZHMgd3Jv
dGU6Cj4gT24gVGh1LCBNYXIgMjgsIDIwMTkgYXQgMDM6MDQ6MzJQTSArMDAwMCwgQnJpYW4gV29v
ZHMgd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhZGQgc3VwcG9ydCBhbmQgZW5hYmxlbWVu
dCBmb3IgbXdhaXQgb24gQU1EIE5hcGxlcwo+ID4gYW5kIFJvbWUgcHJvY2Vzc29ycy4gIE5ld2Vy
IEFNRCBwcm9jZXNzb3JzIHN1cHBvcnQgbXdhaXQsIGJ1dCBvbmx5IGZvcgo+ID4gYzEsIGFuZCBm
b3IgYzIgaGFsdCBpcyB1c2VkLiAgVGhlIG13YWl0LWlkbGUgZHJpdmVyIGlzIG1vZGlmaWVkIHRv
IGJlCj4gPiBhYmxlIHRvIHVzZSBib3RoIG13YWl0IGFuZCBoYWx0IGZvciBpZGxpbmcuCj4gPiAK
PiA+IEJyaWFuIFdvb2RzICgzKToKPiA+ICAgbXdhaXQtaWRsZTogYWRkIHN1cHBvcnQgZm9yIHVz
aW5nIGhhbHQKPiA+ICAgbXdhaXQtaWRsZTogYWRkIHN1cHBvcnQgZm9yIEFNRCBwcm9jZXNzb3Jz
Cj4gPiAgIG13YWl0LWlkbGU6IGFkZCBlbmFibGVtZW50IGZvciBBTUQgTmFwbGVzIGFuZCBSb21l
Cj4gPiAKPiA+ICB4ZW4vYXJjaC94ODYvYWNwaS9jcHVfaWRsZS5jICB8ICAyICstCj4gPiAgeGVu
L2FyY2gveDg2L2NwdS9td2FpdC1pZGxlLmMgfCA2MiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tCj4gPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9jcHVpZGxlLmggfCAg
MSArCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQo+ID4gCj4gPiAtLSAKPiA+IDIuMTEuMAo+ID4gCj4gPiAKPiA+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKPiAKPiBQaW5nIGZvciBBbmR5
Lgo+IAo+IC0tIAo+IEJyaWFuIFdvb2RzCgpQaW5nIGluIGdlbmVyYWwuLi4KCi0tIApCcmlhbiBX
b29kcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
