From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/6] x86/hvm: Handle viridian MSRs via the
 new guest_{rd, wr}msr() infrastructure
Date: Wed, 28 Feb 2018 18:32:58 +0000
Message-ID: <7b6ec804-665e-1e4e-f9ac-d7313d6bd21b@citrix.com>
References: <1519666519-16311-1-git-send-email-andrew.cooper3@citrix.com>
 <1519666519-16311-3-git-send-email-andrew.cooper3@citrix.com>
 <5A96E9A602000078001ACF6E@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A96E9A602000078001ACF6E@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDIvMTggMTY6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI2LjAyLjE4IGF0
IDE4OjM1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vdmlyaWRpYW4uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFu
LmMKPj4gQEAgLTU1NCwxMyArNTU0LDExIEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9yZWZlcmVuY2Vf
dHNjKHN0cnVjdCBkb21haW4gKmQsIGJvb2xfdCBpbml0aWFsaXplKQo+PiAgICAgIHB1dF9wYWdl
X2FuZF90eXBlKHBhZ2UpOwo+PiAgfQo+PiAgCj4+IC1pbnQgd3Jtc3JfdmlyaWRpYW5fcmVncyh1
aW50MzJfdCBpZHgsIHVpbnQ2NF90IHZhbCkKPj4gK2ludCBndWVzdF93cm1zcl92aXJpZGlhbihz
dHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QgaWR4LCB1aW50NjRfdCB2YWwpCj4gdW5zaWduZWQgaW50
IHdvdWxkIGRvIGluc3RlYWQgb2YgdWludDMyX3QgKHNhbWUgb24gdGhlIHJlYWQgc2lkZSkuCgpN
U1JzIGFyZSBhcmNoaXRlY3R1cmFsbHkgdWludDMyX3QsIGFuZCB5b3VyIHByb3Bvc2VkIGNvZGlu
ZyBzdHlsZQpzdWdnZXN0aW9ucyB3b3VsZCBoYXZlIHVpbnQzMl90IGhlcmUuwqAgQXQgdGhlIG1v
bWVudCwgdWludDMyX3QgaXMgdXNlZApjb25zaXN0ZW50bHkgdGhyb3VnaG91dCB0aGUgbmV3IE1T
UiBpbmZyYXN0cnVjdHVyZS4KCj4KPj4gQEAgLTE3MywxMSArMTc1LDI2IEBAIGludCBndWVzdF9y
ZG1zcihjb25zdCBzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QgbXNyLCAgdWludDY0X3QgKnZhbCkK
Pj4gICAgICAgICAgICAgICAgIF9NU1JfTUlTQ19GRUFUVVJFU19DUFVJRF9GQVVMVElORzsKPj4g
ICAgICAgICAgYnJlYWs7Cj4+ICAKPj4gKyAgICBjYXNlIDB4NDAwMDAwMDAgLi4uIDB4NDAwMDAx
ZmY6Cj4gQXMgd2FzIGFscmVhZHkgc3VnZ2VzdGVkLCB0aGVzZSB3YW50IHRvIGdhaW4gI2RlZmlu
ZS1zLgo+Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiB3
aXRoIGF0IGxlYXN0IHRoZSBsYXR0ZXIgdGFrZW4gY2FyZSBvZi4KCkp1c3QgbGlrZSBvbiB0aGUg
Q1BVSUQgc2lkZSwgdGhlIHJhbmdlIG9mIHZhbGlkIE1TUnMgZGVwZW5kIG9uIHRoZQpmYWxsdGhy
b3VnaCBwYXR0ZXJuLCBhbmQgd2hpY2ggaHlwZXJ2aXNvcihzKSB3ZSBhcmUgZW11bGF0aW5nIGZv
ci4KClRoaXMgaXMgY2xlYXJlciBieSB0aGUgZW5kIG9mIHRoZSBzdWJzZXF1ZW50IHBhdGNoLCBi
dXQgdGhlIGxvZ2ljIGlzIGZhcgplYXNpZXIgdG8gZm9sbG93IHdpdGhvdXQgdGhlc2UgbnVtYmVy
cyBiZWluZyBoaWRkZW4uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
