From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH] xen/pt: use address_space_memory object for
 memory region hooks
Date: Tue, 17 Apr 2018 15:29:42 +0100
Message-ID: <c7d408cb-454c-2322-3812-a7cacecdbe5f@citrix.com>
References: <1523049683-11782-1-git-send-email-igor.druzhinin@citrix.com>
 <20180417141518.GM2208@perard>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pwjg=hg=citrix.com=prvs=63820fd2d=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1f8RcB-0002gG-4J
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 14:29:47 +0000
In-Reply-To: <20180417141518.GM2208@perard>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, qemu-devel@nongnu.org, ross.lagerwall@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDQvMTggMTU6MTUsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE9uIEZyaSwgQXByIDA2
LCAyMDE4IGF0IDEwOjIxOjIzUE0gKzAxMDAsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+PiBDb21t
aXQgOTk2MDUxNzVjICh4ZW4tcHQ6IEZpeCBQQ0kgZGV2aWNlcyByZS1hdHRhY2ggZmFpbGVkKSBp
bnRyb2R1Y2VkCj4+IGEgc3VidGxlIGJ1Zy4gQXMgc29vbiBhcyB0aGUgZ3Vlc3Qgc3dpdGNoZXMg
b2ZmIEJ1cyBNYXN0ZXJpbmcgb24gdGhlCj4+IGRldmljZSBpdCBpbW1lZGlhdGVseSBjYXVzZXMg
YWxsIHRoZSBCQVJzIGJlIHVubWFwcGVkIGR1ZSB0byB0aGUgRE1BCj4+IGFkZHJlc3Mgc3BhY2Ug
b2YgdGhlIGRldmljZSBiZWluZyBjaGFuZ2VkLiBUaGlzIGlzIHVuZGVzaXJlZCBiZWhhdmlvcgo+
PiBiZWNhdXNlIHRoZSBndWVzdCBtYXkgdHJ5IHRvIGNvbW11bmljYXRlIHdpdGggdGhlIGRldmlj
ZSBhZnRlciB0aGF0Cj4+IHdoaWNoIHRyaWdnZXJzIHRoZSBmb2xsb3dpbmcgZXJyb3JzIGluIHRo
ZSBsb2dzOgo+Pgo+PiBbMDA6MDUuMF0geGVuX3B0X2Jhcl9yZWFkOiBFcnJvcjogU2hvdWxkIG5v
dCByZWFkIEJBUiB0aHJvdWdoIFFFTVUuIEAweDAwMDAwMDAwMDAwMDAyMDAKPj4gWzAwOjA1LjBd
IHhlbl9wdF9iYXJfd3JpdGU6IEVycm9yOiBTaG91bGQgbm90IHdyaXRlIEJBUiB0aHJvdWdoIFFF
TVUuIEAweDAwMDAwMDAwMDAwMDAyMDAKPj4KPj4gVGhlIGlzc3VlIHRoYXQgdGhlIG9yaWdpbmFs
IHBhdGNoIHRyaWVkIHRvIHdvcmthcm91bmQgKHVuZXZlbiBudW1iZXIgb2YKPj4gcmVnaW9uX2Fk
ZC9kZWwgY2FsbHMgb24gZGV2aWNlIGF0dGFjaC9kZXRhY2gpIHdhcyBmaXhlZCBpbiBsYXRlciBR
RU1VCj4+IHZlcnNpb25zLgo+IAo+IERvIHlvdSBrbm93IHdoZW4gdGhlIGlzc3VlIHdhcyBmaXhl
ZD8KPiAKCkkgdGhpbmsgaXQncyB0aGlzIGNvbW1pdDoKCmNvbW1pdCBkMjU4MzZjYWZkNzUwODA5
MGQyMTFlOTdhY2ZjMGFiYzVhZTg4ZGFhCkF1dGhvcjogUGV0ZXIgWHUgPHBldGVyeEByZWRoYXQu
Y29tPgpEYXRlOiAgIE1vbiBKYW4gMjIgMTQ6MDI6NDQgMjAxOCArMDgwMAoKICAgIG1lbW9yeTog
ZG8gZXhwbGljaXQgY2xlYW51cCB3aGVuIHJlbW92ZSBsaXN0ZW5lcnMKCklnb3IKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
