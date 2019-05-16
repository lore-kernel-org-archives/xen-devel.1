From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC V2 37/45] x86: optimize loading of GDT
 at context switch
Date: Thu, 16 May 2019 15:10:13 +0200
Message-ID: <d7eadbab-3671-f1df-af07-dac5f8b47f98@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-38-jgross@suse.com> <5CDD5AC2020000780022FA6A@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xQgL=TQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hRG9J-0004nZ-14
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:10:17 +0000
In-Reply-To: <5CDD5AC2020000780022FA6A@suse.com>
Content-Language: de-DE
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

T24gMTYvMDUvMjAxOSAxNDo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDYuMDUuMTkg
YXQgMDg6NTYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBJbnN0ZWFkIG9mIGR5bmFtaWNh
bGx5IGRlY2lkZSB3aGV0aGVyIHRoZSBwcmV2aW91cyB2Y3B1IHdhcyB1c2luZyBmdWxsCj4+IG9y
IGRlZmF1bHQgR0RUIGp1c3QgYWRkIGEgcGVyY3B1IHZhcmlhYmxlIGZvciB0aGF0IHB1cnBvc2Uu
IFRoaXMgYXQKPj4gb25jZSByZW1vdmVzIHRoZSBuZWVkIGZvciB0ZXN0aW5nIHZjcHVfaWRzIHRv
IGRpZmZlciB0d2ljZS4KPj4KPj4gQ2FjaGUgdGhlIG5lZWRfZnVsbF9nZHQobmQpIHZhbHVlIGlu
IGEgbG9jYWwgdmFyaWFibGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KPiAKPiBUbyBiZSBob25lc3QgSSdtIG5vdCBlbnRpcmVseSBjb252aW5j
ZWQgdGhpcyBpcyBhIGdvb2QgbW92ZS4gQnV0Cj4gc2luY2UgeW91J3ZlIGRvbmUgdGhlIHdvcmss
IGFuZCBzaW5jZSB0aGUgbGFyZ2VyIHNvdXJjZSBzaXplIGlzCj4gaG9wZWZ1bGx5IG91dHdlaWdo
ZWQgYnkgc2xpZ2h0bHkgc21hbGxlciBiaW5hcnkgc2l6ZSAocGVyLUNQVQo+IGRhdGEgYWNjZXNz
ZXMgYXJlbid0IGVudGlyZWx5IGNoZWFwIGVpdGhlciksIEknbSBub3QgZ29pbmcgdG8KPiBvYmpl
Y3QuCj4gCj4+IEBAIC0xNjU4LDYgKzE2NjQsNyBAQCBzdGF0aWMgdm9pZCBfX2NvbnRleHRfc3dp
dGNoKHZvaWQpCj4+ICAgICAgc3RydWN0IHZjcHUgICAgICAgICAgKm4gPSBjdXJyZW50Owo+PiAg
ICAgIHN0cnVjdCBkb21haW4gICAgICAgICpwZCA9IHAtPmRvbWFpbiwgKm5kID0gbi0+ZG9tYWlu
Owo+PiAgICAgIHNlZ19kZXNjX3QgICAgICAgICAgICpnZHQ7Cj4+ICsgICAgYm9vbCAgICAgICAg
ICAgICAgICAgIG5lZWRfZnVsbF9nZHRfbjsKPiAKPiBUaGlzIHZhcmlhYmxlIGlzIHRvbyBsb25n
LCBvciBtb3JlIHByZWNpc2VseSBoYXMgdG9vIG1hbnkgdW5kZXJzY29yZXMKPiBmb3IgbXkgdGFz
dGUuIFNlZWluZyB0aGF0IG9ubHkgYSBzaW5nbGUgaW52b2NhdGlvbiBvZiBuZWVkX2Z1bGxfZ2R0
KCkKPiByZW1haW5zLCBJIGRvbid0IHRoaW5rIGp1c3QgImZ1bGxfZ2R0IiB3b3VsZCBiZSBhbWJp
Z3VvdXMgaW4gYW55IHdheS4KCkZpbmUgd2l0aCBtZS4KCj4gQXQgd2hpY2ggcG9pbnQKPiBSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKVGhhbmtzLAoKCkp1ZXJn
ZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
