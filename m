From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 1/5] libx86: Introduce a helper to
 serialise cpuid_policy objects
Date: Mon, 05 Nov 2018 08:26:11 -0700
Message-ID: <5BE0611302000078001F819A@prv1-mh.provo.novell.com>
References: <1541416600-30056-1-git-send-email-andrew.cooper3@citrix.com>
 <1541416600-30056-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1541416600-30056-2-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjExLjE4IGF0IDEyOjE2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlIHNlcmlhbGlzZWQgZm9ybSBpcyBtYWRlIHVwIG9mIHRoZSBsZWFmLCBzdWJsZWFm
IGFuZCBkYXRhIHR1cGxlLiAgQXMgdGhpcwo+IGlzIHRoZSBhcmNoaXRlY3R1cmFsIGZvcm0sIGl0
IGlzIGV4cGVjdGVkIG5vdCB0byBjaGFuZ2UgZ29pbmcgZm9yd2FyZHMuCj4gCj4gVGhlIHNlcmlh
bGlzYXRpb24gb2YgdGhlIFhlbi9WaXJpZGlhbiBsZWF2ZXMgaXNuJ3QgZnVsbHkgaW1wbGVtZW50
ZWQgeWV0LiAgCj4gSXQKPiBpcyBqdXN0IGVub3VnaCB0byBiZSBidWctY29tcGF0aWJsZSB3aXRo
IHRoZSBjdXJyZW50IERPTUNUTF9zZXRfY3B1aWQKPiBiZWhhdmlvdXIsIGJ1dCBuZWVkcyBmdXJ0
aGVyIGh5cGVydmlzb3Igd29yayBiZWZvcmUgdGhlIHRvb2xzdGFjayBjYW4gCj4gc2Vuc2libHkK
PiBjb250cm9sIHRoZXNlIHZhbHVlcy4KPiAKPiB4ODZfY3B1aWRfY29weV90b19idWZmZXIoKSBp
cyBpbXBsZW1lbnRlZCB1c2luZyBYZW4ncyByZWd1bGFyIGNvcHlfdG9fZ3Vlc3QKPiBwcmltaXRp
dmVzLCB3aXRoIGFuIEFQSS1jb21wYXRpYmxlIG1lbWNweSgpIGlzIHVzZWQgZm9yIHRoZSBsaWJ4
YyBoYWxmIG9mIAo+IHRoZQo+IGJ1aWxkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5
YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
