From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v1 2/6] arm: add generic TEE mediator
 framework
Date: Mon, 27 Aug 2018 22:09:47 +0300
Message-ID: <6c84f255-6cac-e39b-c175-113432508ccd@epam.com>
References: <1534947094-9974-1-git-send-email-volodymyr_babchuk@epam.com>
 <1534947094-9974-3-git-send-email-volodymyr_babchuk@epam.com>
 <b77a37aa-ba27-7253-e34c-63d2c9b61f78@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b77a37aa-ba27-7253-e34c-63d2c9b61f78@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xen.org, Stefano Stabellini <sstabellini@kernel.org>
Cc: tee-dev@lists.linaro.org
List-Id: xen-devel@lists.xenproject.org

SGkgSnVsaWVuLAoKCk9uIDIyLjA4LjE4IDIwOjAzLCBKdWxpZW4gR3JhbGwgd3JvdGU6CgpbLi4u
XQoKPj4gwqDCoMKgwqDCoCBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihkKSAmJiAocmMgPSBkb21h
aW5fdnVhcnRfaW5pdChkKSkgKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBmYWlsOwo+PiAr
wqDCoMKgIC8qIE5vdGlmeSBURUUgdGhhdCBuZXcgZG9tYWluIHdhcyBjcmVhdGVkICovCj4+ICvC
oMKgwqAgdGVlX2RvbWFpbl9jcmVhdGUoZCk7Cj4gCj4gTXkgY29uY2VybiBhYm91dCBkb21haW4g
Y3JlYXRpb24gaXMgc3RpbGwgbm90IGFkZHJlc3NlZC4gSSB3b3VsZCBleHBlY3QgCj4gdGhlIHRv
b2xzdGFjayB0byBkZWNpZGUgd2hldGhlciBURUUgc2hvdWxkIGJlIGluaXRpYWxpemVkIGZvciBh
IGdpdmVuIAo+IGd1ZXN0IGFuZCBwb3RlbnRpYWxseSByZXR1cm4gYW4gZXJyb3Igb24gZmFpbHVy
ZSAoZS5nIG1heGltdW0gY2xpZW50IElEIAo+IGhhcyBiZWVuIHJlYWNoZWQpLgo+IAo+IEJ1dCB2
ZXJ5IGxpa2VseSwgeW91IGRvbid0IG5lZWQgdG8gaW5pdGlhbGl6ZSBURUUgdGhhdCBlYXJseS4g
VGhpcyBjb3VsZCAKPiBiZSBkb25lIGluIGEgc2VwYXJhdGUgRE9NQ1RMIGFzIHdlIGRpZCBmb3Ig
VlBMMDExLgoKWWVzLCBhcyB3ZSBkaXNjdXNzZWQgaW4gbGF0dGVyIHBhdGNoZXMsIEknbGwgYWRk
IERPTUNUTCBzdXBwb3J0LiBCdXQgCndoYXQgdG8gZG8gd2l0aCBkb20wIGNvbnN0cnVjdGlvbj8K
SSB0aGluaywgaXQgc2hvdWxkIGJlIGNvbmZpZ3VyYWJsZS4gQnV0IGhvdz8gV2l0aCBjb21tYW5k
bGluZSBvcHRpb24/CgpbLi4uXQoKPiB9Cj4gCj4+ICvCoMKgwqAgcHJpbnRrKFhFTkxPR19XQVJO
SU5HICJObyBURUUgbWVkaWF0b3IgZm91bmRcbiIpOwo+IAo+IE5vdCBoYXZpbmcgYSBURUUgaXMg
YSB2YWxpZCB1c2UgY2FzZS4gU28gcHJpbnRpbmcgYSB3YXJuaW5nIHNlZW1zIGEgYml0IAo+IHRv
byBtdWNoLgoKSSBjYW4gY2hhbmdlIHRoaXMgdG8gSU5GTy4gT3IgaXQgaXMgYmV0dGVyIHRvIHJl
bW92ZSB0aGlzIHByaW50IGF0IGFsbD8KCgpUaGFuayB5b3UgZm9yIHJldmlldywgQlRXLgoKLS0g
ClZvbG9keW15ciBCYWJjaHVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
