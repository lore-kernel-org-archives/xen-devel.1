From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 08/10] xen/arm: optee: add support for
 RPC commands
Date: Wed, 20 Mar 2019 16:47:52 +0000
Message-ID: <87mulp8pc8.fsf@epam.com>
References: <20190307210404.12346-1-volodymyr_babchuk@epam.com>
 <20190307210404.12346-9-volodymyr_babchuk@epam.com>
 <3a9ffca5-5139-a607-8647-af9397a2f264@arm.com> <87sgvh8snx.fsf@epam.com>
 <75554d22-9cfd-a5ef-38d7-09fc689f03bf@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jssr=RX=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1h6eNg-0008O0-Vs
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2019 16:47:57 +0000
In-Reply-To: <75554d22-9cfd-a5ef-38d7-09fc689f03bf@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <vlad.babchuk@gmail.com>
List-Id: xen-devel@lists.xenproject.org

Ckp1bGllbiBHcmFsbCB3cml0ZXM6CgpbLi4uXQoKPj4+PiArICAgICAgICAvKgo+Pj4+ICsgICAg
ICAgICAqIFRPRE86IFdpdGggY3VycmVudCBpbXBsZW1lbnRhdGlvbiwgT1AtVEVFIHdpbGwgbm90
IGlzc3VlCj4+Pj4gKyAgICAgICAgICogUlBDIHRvIGZyZWUgdGhpcyBidWZmZXIuIEd1ZXN0IGFu
ZCBPUC1URUUgd2lsbCBiZSBvdXQgb2YKPj4+PiArICAgICAgICAgKiBzeW5jOiBndWVzdCBiZWxp
ZXZlcyB0aGF0IGl0IHByb3ZpZGVkIGJ1ZmZlciB0byBPUC1URUUsCj4+Pj4gKyAgICAgICAgICog
d2hpbGUgT1AtVEVFIHRoaW5rcyBvZiBvcHBvc2l0ZS4gSWRlYWxseSwgd2UgbmVlZCB0bwo+Pj4+
ICsgICAgICAgICAqIGVtdWxhdGUgUlBDIHdpdGggT1BURUVfTVNHX1JQQ19DTURfU0hNX0ZSRUUg
Y29tbWFuZC4KPj4+PiArICAgICAgICAgKi8KPj4+IENhbiB0aGlzIGNvbmRpdGlvbiBoYXBwZW4g
aWYgWGVuIHJ1bnMgb3V0IG9mIG1lbW9yeT8KPj4KPj4gWWVzLCB0aGlzIGlzIG9uZSBvZiByZWFz
b25zIHdoeSB0cmFuc2xhdGVfbm9uY29udGlnKCkgbWlnaHQgZmFpbC4gSXQKPj4gdXNlcyBib3Ro
IHhlbmhlYXAgdG8gYWxsb2NhdGUgZGF0YSBzdHJ1Y3R1cmUgYW5kIGRvbWhlYXAgdG8gYWxsb2Nh
dGUKPj4gcGFnZWxpc3RzIGJ1ZmZlcnMuIEFueSBvZiB0aG9zZSBjYW4gZmFpbCwgcmVzdWx0aW5n
IGluIGluY29uc2lzdGVuY3kuCj4KPiBUaGF0J3Mgbm90IHZlcnkgaWRlYWwuIFRoaXMgbWVhbiBh
IHdlbGwtYmVoYXZpbmcgZ3Vlc3QgY2FuIGdldCBvdXQgb2YKPiBzeW5jIGJlY2F1c2Ugb2YgbWVt
b3J5IHByZXNzdXJlIChjb3VsZCBiZSBjYXVzZSBieSBhIG1pc2JlaGF2aW5nIGd1ZXN0Cj4gb24g
dGhlIHBsYXRmb3JtKS4gV2hhdCB3aWxsIGJlIHRoZSBjb25zZXF1ZW5jZSBmb3IgdGhlIGd1ZXN0
PyBDYW4gaXQKPiBjb250aW51ZSBzYWZlbHk/ClRoZXJlIHdpbGwgYmUgbWVtb3J5IGxlYWsgYXQg
Z3Vlc3Qgc2lkZS4gSXQgd2lsbCBub3QgYnJlYWsgdGhpbmdzIHJpZ2h0CmF3YXksIHN1YnNlcXVl
bnQgY2FsbHMgd291bGQgd29yayBhcyBleHBlY3RlZC4gQnV0LCBhbnl3YXlzLCBpdCBpcwpub3Qg
Z29vZC4gSSdsbCBzZWUgaG93IGhhcmQgdG8gZW11bGF0ZSBSUEMgcmVxdWVzdCBmcm9tIHRoZSBY
ZW4gdG8KcHJvcGVybHkgZml4IHRoaXMgaXNzdWUuCgo+IFRoaXMgZmVhdHVyZSBpcyB1bmRlciBF
WFBFUlQgbW9kZSBzbyBJIHdvdWxkIGJlIG9rIHRvIGdldCBhcyB0aGlzIGluCj4gWGVuLiBBbHRo
b3VnaCwgSSB3b3VsZCBsaWtlIHRvIGhlYXIgU3RlZmFubydzIG9waW5pb24gaGVyZS4KPgo+IElu
IGFueSBjYXNlLCB0aGlzIHNob3VsZCBiZSBmaXhlZCBiZWNhdXNlIHdlIGNvbnNpZGVyIHJlbW92
aW5nIEVYUEVSVAo+IG1vZGUgYW5kIHNlY3VyaXR5IHN1cHBvcnQgaXQuCj4KPj4KPj4gWW91IGdh
dmUgbWUgaWRlYSB0byBwdXQgZ2RwcmludGsoKSB3aXRoIGJpZyBmYXQgd2FybmluZyB0aGVyZS4K
Pgo+IFlvdSBjbGVhcmx5IHdhbnQgdG8gZ3ByaW50ayBoZXJlIGJlY2F1c2UgaWYgdGhpcyBoYXBw
ZW4gaW4gbm9uLWRlYnVnCj4gYnVpbGQgeW91IHdhbnQgdG8ga25vdyB0aGF0IHNvbWV0aGluZyBo
YXMgZ29uZSByZWFsbHkgd3JvbmcgYXMgc29vbiBhcwo+IHBvc3NpYmxlLgpZZXMsIHJpZ2h0LiBU
aGFuayB5b3UuCgotLSAKQmVzdCByZWdhcmRzLFZvbG9keW15ciBCYWJjaHVrCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
