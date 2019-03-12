From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH L1TF v9 7/7] common/grant_table: block
 speculative out-of-bound accesses
Date: Tue, 12 Mar 2019 11:36:25 +0100
Message-ID: <e25bd94e-8835-1b17-0eaf-115fae81fc5c@amazon.de>
References: <1551284020-7050-1-git-send-email-nmanthey@amazon.de>
 <1551284020-7050-8-git-send-email-nmanthey@amazon.de>
 <5C7EA60D020000780021BD0A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R+A5=RP=amazon.de=prvs=96726ceb4=nmanthey@srs-us1.protection.inumbo.net>)
 id 1h3em4-0004B8-Hy
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 10:36:44 +0000
In-Reply-To: <5C7EA60D020000780021BD0A@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMy81LzE5IDE3OjM4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyNy4wMi4xOSBhdCAx
NzoxMywgPG5tYW50aGV5QGFtYXpvbi5kZT4gd3JvdGU6Cj4+IFNwZWN1bGF0aXZlIGV4ZWN1dGlv
biBpcyBub3QgYmxvY2tlZCBpbiBjYXNlIG9uZSBvZiB0aGUgZm9sbG93aW5nCj4+IHByb3BlcnRp
ZXMgaXMgdHJ1ZToKPj4gIC0gcGF0aCBjYW5ub3QgYmUgdHJpZ2dlcmVkIGJ5IHRoZSBndWVzdAo+
PiAgLSBwYXRoIGRvZXMgbm90IHJldHVybiB0byB0aGUgZ3Vlc3QKPj4gIC0gcGF0aCBkb2VzIG5v
dCByZXN1bHQgaW4gYW4gb3V0LW9mLWJvdW5kIGFjY2Vzcwo+PiAgLSBwYXRoIGNhbm5vdCBiZSBl
eGVjdXRlZCByZXBlYXRlZGx5Cj4+IE9ubHkgdGhlIGNvbWJpbmF0aW9uIG9mIHRoZSBhYm92ZSBw
cm9wZXJ0aWVzIGFsbG93cyB0byBhY3R1YWxseSBsZWFrCj4+IGNvbnRpbnVvdXMgY2h1bmtzIG9m
IG1lbW9yeS4gVGhlcmVmb3JlLCB3ZSBvbmx5IGFkZCB0aGUgcGVuYWx0eSBvZgo+PiBwcm90ZWN0
aXZlIG1lY2hhbmlzbXMgaW4gY2FzZSBhIHBvdGVudGlhbCBzcGVjdWxhdGl2ZSBvdXQtb2YtYm91
bmQKPj4gYWNjZXNzIG1hdGNoZXMgYWxsIHRoZSBhYm92ZSBwcm9wZXJ0aWVzLgo+IFdoaWxlIHRo
aXMgaXMgYWxsIGZpbmUsIGhvdyBkbyBJIG1hdGNoIHdoaWNoIG9mIHRoZSByZWFzb25zIGFwcGxp
ZXMgdG8KPiB3aGljaCBvZiAoaW4gcGFydGljdWxhcikgdGhlIGd0X3ZlcnNpb24gY2hlY2tzIGxl
ZnQgYWxvbmU/IEFzIHNhaWQsIHRoZQo+IHJlYXNvbmluZyBoZXJlIHNob3VsZCBzcGVjaWZpY2Fs
bHkgYmUgZGV0YWlsZWQgc28gaXQgY2FuIGJlIHVzZWQgYXMgYQo+IGd1aWRpbmcgcmVmZXJlbmNl
IHdoZW4gYWRkaW5nIGZ1cnRoZXIgY29uZGl0aW9uYWxzIHRvIHRoZSBjb2RlIGRvd24KPiB0aGUg
cm9hZC4gQW5kIG9mIGNvdXJzZSByZXZpZXcgaXMgKG1vcmUpIGRpZmZpY3VsdCB0aGlzIHdheSBh
cyB3ZWxsLCBhcwo+IChqdWRnaW5nIGZyb20gcHJpb3IgY29udmVyc2F0aW9ucykgd2UgZG9uJ3Qg
c2VlbSB0byBuZWNlc3NhcmlseQo+IGFncmVlIGluIG91ciB2aWV3cyBpbiBhbGwgcGxhY2VzLCBh
bmQgaGVuY2UgdG8gZGlzY3VzcyBhIHBvc3NpYmx5Cj4gcXVlc3Rpb25hYmxlIGRlY2lzaW9uIG90
aGVycyBhbHNvIG5lZWQgdG8gdW5kZXJzdGFuZCB3aGljaCBvZiB0aGUKPiBjcml0ZXJpYSB5b3Ug
Y29uc2lkZXJlZCB0byBtYXRjaCBpbiB0aGUgc3BlY2lmaWMgY2FzZS4KCkkgbGlzdGVkIHRoZSBy
ZWFzb25zIHRvIHVzZSBhYm92ZSAoYW5kIGluIHRoZSBjb21taXQgbWVzc2FnZSkuIEkgd2lsbApl
eHRlbmQgdGhlIGNvbW1pdCBtZXNzYWdlIGFuZCBnaXZlIGEgcmVhc29uIGZvciBlYWNoIHZlcnNp
b24gY29tcGFyaXNvbiwKc2ltaWxhcmx5IHRvIGEgcHJpb3IgZW1haWwgSSBzZW50LgoKSW4gbXkg
b3BpbmlvbiwgdGhlIGNvbW1pdCBtZXNzYWdlIGZvciBmaXhpbmcgdGhlIHByb2JsZW1zIHdlIGZv
dW5kIGluCnRoYXQgZmlsZSBzaG91bGQgbm90IGJlIGEgdHV0b3JpYWwgb24gaG93IHRvIGlkZW50
aWZ5IGFuZCBmaXggcG90ZW50aWFsCnNwZWN1bGF0aXZlIG91dC1vZi1ib3VuZCBhY2Nlc3Nlcy4g
V2hpbGUgSSBhZ3JlZSB0aGF0IHRlYWNoaW5nIG1vcmUKcGVvcGxlIGhvdyB0byBqdWRnZSB3aGV0
aGVyIGEgY2VydGFpbiBwaWVjZSBvZiBjb2RlIG1pZ2h0IGxlYWQgdG8KaW5mb3JtYXRpb24gbGVh
ayB2aWEgc3BlY3VsYXRpdmUgZXhlY3V0aW9uLCBJIHdvdWxkIG5vdCB1c2UgYSBjb21taXQKbWVz
c2FnZSB0byBnZXQgdGhhdCBjb3ZlcmVkLgoKQmVzdCwKTm9yYmVydAoKPgo+IEphbgo+Cj4KCgoK
CkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEw
MTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBI
ZXJicmljaApVc3QtSUQ6IERFIDI4OSAyMzcgODc5CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0
IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
