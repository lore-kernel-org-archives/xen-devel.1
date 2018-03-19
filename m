From: Alexey G <x1917x@gmail.com>
Subject: Re: [RFC PATCH 01/12] libacpi: new DSDT ACPI table for
 Q35
Date: Mon, 19 Mar 2018 23:57:41 +1000
Message-ID: <20180319235741.000055fc@gmail.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <6034032fd5b70667515f9ae4f988b024f0015344.1520867740.git.x1917x@gmail.com>
 <20180319124305.f6v5khq6cuweylr5@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zqd6=gj=gmail.com=x1917x@srs-us1.protection.inumbo.net>)
 id 1exvIO-0004SX-G9
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 13:57:52 +0000
Received: by mail-lf0-x235.google.com with SMTP id h127-v6so25552910lfg.12
 for <xen-devel@lists.xenproject.org>; Mon, 19 Mar 2018 06:57:50 -0700 (PDT)
In-Reply-To: <20180319124305.f6v5khq6cuweylr5@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?UTF-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxOSBNYXIgMjAxOCAxMjo0MzowNSArMDAwMApSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cgo+T24gVHVlLCBNYXIgMTMsIDIwMTggYXQgMDQ6MzM6
NDZBTSArMTAwMCwgQWxleGV5IEdlcmFzaW1lbmtvIHdyb3RlOgo+PiBUaGlzIHBhdGNoIGFkZHMg
dGhlIERTRFQgdGFibGUgZm9yIFEzNSAobmV3Cj4+IHRvb2xzL2xpYmFjcGkvZHNkdF9xMzUuYXNs
IGZpbGUpLiBUaGVyZSBhcmUgbm90IG1hbnkgZGlmZmVyZW5jZXMKPj4gd2l0aCBkc2R0LmFzbCAo
Zm9yIGk0NDApIGF0IHRoZSBtb21lbnQsIG5hbWVseToKPj4gCj4+IC0gQkRGIGxvY2F0aW9uIG9m
IExQQyBDb250cm9sbGVyCj4+IC0gTWlub3IgY2hhbmdlcyByZWxhdGVkIHRvIEZEQyBkZXRlY3Rp
b24KPj4gLSBBZGRpdGlvbiBvZiBfT1NDIG1ldGhvZCB0byBpbmZvcm0gT1NQTSBhYm91dCBQQ0ll
IGZlYXR1cmVzCj4+IHN1cHBvcnRlZAo+PiAKPj4gQXMgd2UgYXJlIHN0aWxsIHVzaW5nIDQgUENJ
IHJvdXRlciBsaW5rcyBhbmQgdGhlaXIgY29ycmVzcG9uZGluZwo+PiBkZXZpY2UvcmVnaXN0ZXIg
YWRkcmVzc2VzIGFyZSBzYW1lIChvZmZzZXQgMHg2MCksIG5vIG5lZWQgdG8gY2hhbmdlCj4+IFBD
SSByb3V0aW5nIGRlc2NyaXB0aW9ucy4KPj4gCj4+IEFsc28sIEFDUEkgaG90cGx1ZyBpcyBzdGls
bCB1c2VkIHRvIGNvbnRyb2wgcGFzc2VkIHRocm91Z2ggZGV2aWNlIGhvdAo+PiAodW4pcGx1ZyAo
YXMgaXQgd2FzIGZvciBpNDQwKS4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhleSBHZXJhc2lt
ZW5rbyA8eDE5MTd4QGdtYWlsLmNvbT4KPj4gLS0tCj4+ICB0b29scy9saWJhY3BpL2RzZHRfcTM1
LmFzbCB8IDU1MQo+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysgIAo+Cj5TbyB0aGlzIGlzIGJhc2ljYWxseSBhIG1vZGlmaWVkIGR1cGUgb2YgdGhlIGN1cnJl
bnQgZHNkdC5hc2w/IEFGQUlDVAo+dGhlcmUgYXJlIGEgYnVuY2ggb2YgY29tbW9uIGJpdHMsIHdo
aWNoIGlkZWFsbHkgd2Ugd2FudCB0byBoYXZlCj5kZWZpbmVkIGluIGEgc2luZ2xlIHBsYWNlLgo+
Cj5DYW4ndCB5b3UgZmFjdG9yIG91dCB0aGUgY29tbW9uIHBhcnRzIG9mIHRoZSBkc2R0LmFzbCBp
bnRvIHNtYWxsZXIKPnBhcnRzIGFuIGluY2x1ZGUgdGhlbSBmb3IgYm90aCBkc2R0LmFzbCBhbmQg
ZHNkdF9xMzUuYXNsPwo+Cj5JIHdvdWxkIGZpcnN0IGhhdmUgYSBwYXRjaCB0aGF0IGV4dHJhY3Qg
dGhlIGNvbW1vbiBwYXJ0cyBvZiB0aGUKPmRzZHQgaW50byBmaWxlKHMpLCBhbmQgdGhlbiBhIHNl
Y29uZCBwYXRjaCB3aGljaCBjcmVhdGVzIGEKPmRzZHRfcTM1LmFzbCBiYXNlZCBvbiB0aG9zZSBj
b21tb24gYml0cyBwbHVzIHRoZSBzcGVjaWZpYyBxMzUgY29kZS4KClllcywgaXQncyBhIGdvb2Qg
dGhpbmcgdGhhdCBtYW55IHJlZ2lzdGVycyBoYXZlIHNhbWUgYWRkcmVzc2VzIG9uCmk0NDAgYW5k
IFEzNS4gU29tZSBlbmNvdW50ZXJlZCBjb21tb24gdGhpbmdzIHdlcmUgdW5leHBlY3RlZCB0aG91
Z2ggLS0KQUZBSVIgX1M1IFNMUF9UWVAgdmFsdWUgZG8gbm90IGNvcnJlc3BvbmQgdG8gdGhlIElD
SDkgZGF0YXNoZWV0LAphIGRpZmZlcmVudCB2YWx1ZSB1c2VkIGluc3RlYWQgdG8gdHJpZ2dlciBB
Q1BJIFNvZnQtT2ZmIGVtdWxhdGlvbi4KClJlZ2FyZGluZyBkc2R0LmFzbC9kc2R0X3EzNS5hc2wg
LS0gT0ssIEknbGwgc3BsaXQgdGhlc2UgZmlsZXMgaW50bwpjb21tb24vc3BlY2lmaWMgcGFydHMu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
