From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 4/6] xen: don't free percpu areas during
 suspend
Date: Thu, 28 Mar 2019 09:35:39 +0100
Message-ID: <666152f4-ca03-a4cd-f221-cb00a8292836@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zgNs=R7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h9QVi-0005fo-UY
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 08:35:42 +0000
References: =?UTF-8?B?PDIwMTkwMzE4MTMxMTU1LjI5NDUw77+9Me+/vWpncm9zc0BzdXNl?=
 =?UTF-8?B?LmNvbT4gPDIwMTkwMzE4MTMxMTU1LjI5NDUw77+9Ne+/vWpncm9zc0BzdXNlLmNv?=
 =?UTF-8?Q?m=3e_=3c5C9C7BF1020000780022258F=40suse=2ecom=3e_=3c78816896-aa22?=
 =?UTF-8?Q?-0031-4d36-bc33bee78c83=40suse=2ecom=3e_=3c5C9C801002000078002225?=
 =?UTF-8?B?QUVAc3VzZS5jb20+?=
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDMvMjAxOSAwOTowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjguMDMuMTkg
YXQgMDg6NTMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAyOC8wMy8yMDE5IDA4OjQ2
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDE4LjAzLjE5IGF0IDE0OjExLCA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToKPj4+PiBJbnN0ZWFkIG9mIGZyZWVpbmcgcGVyY3B1IGFyZWFzIGR1
cmluZyBzdXNwZW5kIGFuZCBhbGxvY2F0aW5nIHRoZW0KPj4+PiBhZ2FpbiB3aGVuIHJlc3VtaW5n
IGtlZXAgdGhlbS4gT25seSBmcmVlIGFuIGFyZWEgaW4gY2FzZSBhIGNwdSBkaWRuJ3QKPj4+PiBj
b21lIHVwIGFnYWluIHdoZW4gcmVzdW1pbmcuCj4+Pgo+Pj4gVGhlcmUncyBhbm90aGVyIGFzcGVj
dCBoZXJlIHdoaWNoIG5lZWRzIGF0IGxlYXN0IG1lbnRpb25pbmc6Cj4+PiBSaWdodCBub3csIENQ
VXMgY29taW5nIGJhY2sgdXAgaGF2ZSB0aGVpciBwZXItQ1BVIGRhdGEKPj4+IGNsZWFyZWQuIE5v
dCBkb2luZyBzbyBtYXkgaW5kZWVkIGJlIGFuIGltcHJvdmVtZW50IGluCj4+PiBzb21lIGNhc2Vz
IChsaWtlIHN0YXRpc3RpY3MgY29sbGVjdGVkKSwgYnV0IG1heSBhbHNvIGdldCBpbiB0aGUKPj4+
IHdheSBpbiBvdGhlciBjYXNlcy4KPj4KPj4gSSBoYXZlIGNoZWNrZWQgdGhlIHJlc3BlY3RpdmUg
Y3B1IG5vdGlmaWVyIGhvb2tzIGFuZCBJIHRoaW5rIHRoaXMgaXMgbm8KPj4gcHJvYmxlbS4gSSBo
b3BlIEkgZGlkbid0IG92ZXJsb29rIHNvbWV0aGluZy4KPiAKPiBJcyBjaGVja2luZyB0aGUgaG9v
a3Mgc3VmZmljaWVudD8gSSdkIHJhdGhlciBleHBlY3Qgd2UgbmVlZCB0bwo+IGNoZWNrIGFsbCBw
ZXItQ1BVIGRhdGEgb2JqZWN0cy4KCldoeT8gVGhlIG1haW4gY29uY2VybiB3b3VsZCBiZSBhIGhv
b2sgbm90IGRvaW5nIGl0cyBqb2IgZHVlIHRvIHNvbWUKZGF0YSBub3QgYmVpbmcgemVyb2VkLgoK
SW4gY2FzZSB0aGVyZSBpcyBhIGRlcGVuZGVuY3kgc29tZXdoZXJlIGVsc2UgSSdkIHJhdGhlciBl
eHBlY3Qgc3VidGxlCm5lZ2F0aXZlIGVmZmVjdHMgd2l0aCB0b2RheSdzIHNvbHV0aW9uIGFzIHN1
ZGRlbmx5IHBlcmNwdSBkYXRhIHdpbGwKYmUgemVybyBhZnRlciBzdXNwZW5kL3Jlc3VtZSB3aXRo
b3V0IGEgY29tcG9uZW50IGhhdmluZyBiZWVuIGludm9sdmVkCndpdGggc3VzcGVuZGluZy4KClN1
cmUsIHRoZXJlIGNvdWxkIGJlIG5lZ2F0aXZlIGVmZmVjdHMgd2l0aCBteSBzZXJpZXMsIGJ1dCBJ
J2QgYXNzZXQgdGhlCmNoYW5jZXMgbG93ZXIgYXMgd2l0aG91dCBteSBzZXJpZXMuIFN1c3BlbmQv
cmVzdW1lIHRlbmRzIHRvIGJlIG5vdAp0ZXN0ZWQgdmVyeSBvZnRlbiwgaXQgc2VlbXMuIEkgZ3Vl
c3MgSSdtIHRoZSBvbmx5IG9uZSBoYXZpbmcgaXQgdHJpZWQKcmVjZW50bHkgKGl0IHdhcyBicm9r
ZW4gZm9yIDMgbW9udGhzIGF0IGxlYXN0IGJlZm9yZSBteSBwYXRjaCByZXBhaXJpbmcKYW4gaXNz
dWUgd2l0aCBJT01NVSkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
