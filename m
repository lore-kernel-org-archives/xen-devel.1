From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen/arm: Allow cleaning the directory even
 when CONFIG_EARLY_PRINTK is set
Date: Thu, 23 May 2019 10:10:22 +0100
Message-ID: <e2566da4-fa4e-d228-3ee3-7beb80fbab3e@arm.com>
References: <20190422164106.20331-1-julien.grall@arm.com>
 <alpine.DEB.2.10.1904231709250.24598@sstabellini-ThinkPad-X260>
 <d664ac40-a4aa-9967-8534-ea722f8e0724@arm.com>
 <5CE6597D0200007800231998@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SD5s=TX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hTjk3-0006Yt-RX
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 09:10:27 +0000
In-Reply-To: <5CE6597D0200007800231998@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKVGhhbmsgeW91IGZvciB0aGUgZmVlZGJhY2suCgpPbiA1LzIzLzE5IDk6MjcgQU0s
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI0LjA0LjE5IGF0IDEyOjQ3LCA8anVsaWVuLmdy
YWxsQGFybS5jb20+IHdyb3RlOgo+PiBPbiAyNC8wNC8yMDE5IDAxOjIwLCBTdGVmYW5vIFN0YWJl
bGxpbmkgd3JvdGU6Cj4+PiBPbiBNb24sIDIyIEFwciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6
Cj4+Pj4gVGhpcyBjb2RlIGlzIHByZXR0eSBuYXN0eSwgYnV0IEkgaGF2ZW4ndCBmb3VuZCBhIGJl
dHRlciB3YXkgZm9yIGF2b2lkaW5nCj4+Pj4gdG8gY2hlY2sgaWYgQ09ORklHX0RFQlVHIGlzIGVu
YWJsZWQgd2hlbiB0aGUgdGFyZ2V0IGNsZWFuIGlzIGNhbGxlZC4KPj4+Pgo+Pj4+IElkZWFsbHkg
d2Ugd2lsbCB3YW50IHRvIG1vdmUgQ09ORklHX0VBUkxZX1BSSU5USyBpbiBLY29uZmlnLiBJIGhh
dmVuJ3QKPj4+PiBoYWQgdGltZSB5ZXQgdG8gbG9vayBhdCBpdCBwcm9wZXJseSBzbyBmYXIuCj4g
Cj4gVGhpcywgdG8gbWUsIHdvdWxkIHNlZW0gdG8gYmUgdGhlIG11Y2ggYmV0dGVyIGFwcHJvYWNo
LCBhcyBpdCB3b3VsZAo+IGF2b2lkIHJlcGxhY2luZyBvbmUgbmFzdHkgY29uc3RydWN0IGJ5IGFu
b3RoZXIuIEFyZSB0aGVyZSBhbnkKPiBjb21wbGljYXRpb25zPwoKTGFzdCB0aW1lIEkgbG9va2Vk
IGF0IG1vdmluZyBlYXJseXByaW50ayB0byBLY29uZmlnIEkgd2FzIHN0cnVnZ2xpbmcgdG8gCmZp
bmQgYSBnb29kIHdheSBkZXNjcmliaW5nIHRoZW0uCgpJIGd1ZXNzIEkgY2FuIGhhdmUgYW5vdGhl
ciBsb29rIGlmIEkgY2FuIG1hbmFnZSB0byBkbyBpdCBpbiBhIGNvdXBsZSBvZiAKaG91cnMuCgpU
aGlzIHBhdGNoIGlzIG1vcmUgYSB3YXkgdG8gcGFwZXIgdGhlIHByb2JsZW0gYmVmb3JlIGNhdXNp
bmcgbW9yZSAKdHJvdWJsZSB3aGVuIGJ1aWxkaW5nIHVzaW5nIFlvY3RvLgoKQ2hlZXJzLAoKPj4+
IENhbiB3ZSBpbmNsdWRlIC5jb25maWcgaW4gdGhlIGNsZWFuIHRhcmdldD8KPj4gSSBkaWQgb25s
eSBtZW50aW9uIHRoZSBjbGVhbiB0YXJnZXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGJ1dCB0aGUg
aXNzdWUgaXMgdGhlCj4+IHNhbWUgZm9yIGFueSB0YXJnZXQgbm90IGluY2x1ZGUgLmNvbmZpZy4g
Rm9yIGluc3RhbmNlLCBhIGRpc3RjbGVhbiByZXN1bHRzIHRvCj4+IHRoZSBzYW1lIGVycm9yLgo+
Pgo+PiBJdCBhbHNvIGZlZWxzIHF1aXRlIHdyb25nIHRvIGV4cGVjdCB0aGUgLmNvbmZpZyB0byBi
ZSBpbiBwbGFjZSBmb3IgYW55IHRhcmdldAo+PiBvdGhlciB0aGFuIGJ1aWxkLgo+IAo+IEkgYWdy
ZWUuCj4gCj4gSmFuCj4gCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
