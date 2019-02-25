From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] kexec: suppress bogus warning
Date: Mon, 25 Feb 2019 08:21:42 -0700
Message-ID: <5C7408060200007800219F47@prv1-mh.provo.novell.com>
References: <5C73D01C0200007800219C52@prv1-mh.provo.novell.com>
 <6f47b6e5-900e-e631-0bd8-c698a23e7ea1@citrix.com>
 <5C73DC330200007800219D12@prv1-mh.provo.novell.com>
 <8d51e7ce-fcbe-9fe1-6489-9e16af2d40e5@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gyI6d-0000AE-By
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 15:23:47 +0000
In-Reply-To: <8d51e7ce-fcbe-9fe1-6489-9e16af2d40e5@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjAyLjE5IGF0IDE0OjMzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjUvMDIvMjAxOSAxMjoxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI1
LjAyLjE5IGF0IDEyOjUyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBP
biAyNS8wMi8yMDE5IDExOjIzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBEb24ndCBlbWl0IHRo
ZSAiaWdub3JlZCIgd2FybmluZyB3aGVuIHRoZXJlJ3Mgbm8gcGxhY2VtZW50IHNwZWNpZmljYXRp
b24KPj4+PiBhbmQgdGhlIHRhaWwgb2YgdGhlIHNwZWNpZmllZCBvcHRpb24gaXMgYWN0dWFsbHkg
ZW1wdHkuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4+PiBXaGF0IGNvbW1hbmQgbGluZSB0cmlnZ2VycyB0aGlzPwo+PiBjcmFzaGtlcm5l
bD0xRy0xNkc6MU0KPj4KPj4gaXMgd2hhdCBJJ3ZlIHVzZWQgZm9yIHJlcHJvLWluZyB0aGUgb3Jp
Z2luYWwgcmVwb3J0Lgo+IAo+IExvb2sgbGlrZSB0aGF0IHlpZWxkczoKPiAKPiAoWEVOKSBjcmFz
aGtlcm5lbDogJycgaWdub3JlZAo+IChYRU4pIHBhcmFtZXRlciAiY3Jhc2hrZXJuZWwiIGhhcyBp
bnZhbGlkIHZhbHVlICIxRy0xNkc6MU0iLCByYz0tMjIhCj4gCj4gd2hpY2ggbG9va3MgbGlrZSBw
ZXJ0aW5lbnQgaW5mb3JtYXRpb24gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKSG1tLCBvZGQgLSB3
aGF0IGlzIGl0IHRoYXQgSSBkaWRuJ3Qgc2F5IHdpdGggIndoZW4gdGhlcmUncyBubyBwbGFjZW1l
bnQKc3BlY2lmaWNhdGlvbiIgcGx1cyB0aGUgbWVudGlvbiBvZiB0aGUgImlnbm9yZWQiIG1lc3Nh
Z2U/Cgo+IFNvIGxvbmcgYXMgc29tZXRoaW5nIGxpa2UgdGhhdCBnZXRzIGluY2x1ZGVkLCBSZXZp
ZXdlZC1ieTogQW5kcmV3IENvb3Blcgo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKTGV0
IG1lIGtub3cgd2hldGhlciB3aGF0J3MgdGhlcmUgaXMgcmVhbGx5IG5vdCBnb29kIGVub3VnaCwg
YW5kIGlmIHNvLAp3aGF0IGV4YWN0bHkgeW91ciBleHBlY3RhdGlvbiBpcy4gU28gZmFyIEkgd2Fz
bid0IHJlYWxseSBpbnRlbmRpbmcgdG8gZ2l2ZQphbiBleHBsaWNpdCBleGFtcGxlLCBhbmQgdGhl
IG9uZSBJJ3ZlIHVzZWQgZm9yIHRlc3RpbmcgaXMgcmF0aGVyIGNvbnRyaXZlZAphbnl3YXkuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
