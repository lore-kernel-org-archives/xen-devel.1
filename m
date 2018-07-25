From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libgnttab: Add support for Linux dma-buf
Date: Wed, 25 Jul 2018 10:53:13 +0100
Message-ID: <20180725095313.iszfd4xyc6hgixhf@citrix.com>
References: <20180723122725.5476-1-andr2000@gmail.com>
 <20180725093921.22ncfttvjfiu4bkl@citrix.com>
 <17f7f750-caf2-8f6e-782a-a17cb21a2ad1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m8ai=kj=citrix.com=prvs=737e41906=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fiGTv-00051J-C5
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 09:53:19 +0000
Content-Disposition: inline
In-Reply-To: <17f7f750-caf2-8f6e-782a-a17cb21a2ad1@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: jgross@suse.com, Wei Liu <wei.liu2@citrix.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, ian.jackson@eu.citrix.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMTI6NDk6MjlQTSArMDMwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gT24gMDcvMjUvMjAxOCAxMjozOSBQTSwgV2VpIExpdSB3cm90ZToK
PiA+IE9uIE1vbiwgSnVsIDIzLCAyMDE4IGF0IDAzOjI3OjI1UE0gKzAzMDAsIE9sZWtzYW5kciBB
bmRydXNoY2hlbmtvIHdyb3RlOgo+ID4gPiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8
b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4gPiA+IAo+ID4gPiBBZGQgc3VwcG9y
dCBmb3IgTGludXggZ3JhbnQgZGV2aWNlIGRyaXZlciBleHRlbnNpb24gd2hpY2ggYWxsb3dzCj4g
PiA+IGNvbnZlcnRpbmcgZXhpc3RpbmcgZG1hLWJ1ZidzIGludG8gYW4gYXJyYXkgb2YgZ3JhbnQg
cmVmZXJlbmNlcwo+ID4gPiBhbmQgdmlzZSB2ZXJzYS4gVGhpcyBpcyBvbmx5IGltcGxlbWVudGVk
IGZvciBMaW51eCBhcyBvdGhlciBPU2VzCj4gPiA+IGhhdmUgbm8gTGludXggZG1hLWJ1ZiBzdXBw
b3J0Lgo+ID4gPiAKPiA+ID4gQnVtcCBnbnR0YWIgbGlicmFyeSBtaW5vciB2ZXJzaW9uIHRvIDMu
Cj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4gPiBIYXMgdGhlIExpbnV4IHNpZGUgYmVl
biBtZXJnZWQgeWV0Pwo+IEl0IGlzIGdvaW5nIHRvIGJlIG1lcmdlZCBpbnRvIEJvcmlzJyBzdGFn
aW5nIGZvciBub3cKPiBhbmQgdGhlbiBldmVudHVhbGx5IG1vdmUgaW50byBYZW4gdGlwJ3MgZm9y
LWxpbnVzIChCb3JpcyBjYW4KPiB0ZWxsIG1vcmUgb24gdGhhdDogTGludXggaXMgYWxyZWFkeSBh
dCByYzYsIHNvIEkgdGhpbmsgdGhpcwo+IGNhbiBoYXBwZW4gaW4gdGhlIG5lYXJlc3QgZnV0dXJl
KS4KPiAKCk9LLiBTbyB0aGUgaW50ZXJmYWNlcyBvbiBMaW51eCdzIHNpZGUgYXJlIGFncmVlZC4K
Cj4gR2l2ZW4gdGhhdCBYZW4gYW5kIExpbnV4IHBhcnRzIGFyZSBhY3R1YWxseSBpbmRlcGVuZGVu
dCwKPiBJIGRlY2lkZWQgdG8gc3RhcnQgdXBzdHJlYW1pbmcgbGliZ250dGFiIGNoYW5nZXMgbm93
LCBhbGxvd2luZwo+IG1lIHRvIG1hdHVyZSB0aGUgY29kZSBhbmQgYWRkcmVzcyBjb21tZW50cwoK
RnJvbSBteSBQb1YgdGhpcyBwYXRjaCBwcm92aWRlcyBhIGJ1bmNoIG9mIHdyYXBwZXJzIGFyb3Vu
ZCBMaW51eCBpb2N0bHMKc28gSSB3b3VsZCBsaWtlIHRvIGJlIHN1cmUgdGhlIHVuZGVybHlpbmcg
aW50ZXJmYWNlcyBhcmUgYWdyZWVkIGJlZm9yZQpyZXZpZXdpbmcuCgpXZWkuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
