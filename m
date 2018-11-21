From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] makedumpfile: exclude pages that are
 logically offline
Date: Wed, 21 Nov 2018 16:35:31 +0100
Message-ID: <e5ac1f79-cd69-2b8e-41ee-873fea48afdd__48944.4945160814$1542814467$gmane$org@redhat.com>
References: <20181119101616.8901-1-david@redhat.com>
 <20181119101835.9140-1-david@redhat.com>
 <4AE2DC15AC0B8543882A74EA0D43DBEC03561222@BPXM09GP.gisp.nec.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmdf=OA=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gPUXT-0002d1-03
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 15:35:39 +0000
In-Reply-To: <4AE2DC15AC0B8543882A74EA0D43DBEC03561222@BPXM09GP.gisp.nec.co.jp>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Kazuhito Hagio <k-hagio@ab.jp.nec.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "pv-drivers@vmware.com" <pv-drivers@vmware.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, kexec-ml <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "devel@linuxdriverproject.org" <devel@linuxdriverproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjEuMTEuMTggMTU6NTgsIEthenVoaXRvIEhhZ2lvIHdyb3RlOgo+IEhpIERhdmlkLAo+IAo+
PiBMaW51eCBtYXJrcyBwYWdlcyB0aGF0IGFyZSBsb2dpY2FsbHkgb2ZmbGluZSB2aWEgYSBwYWdl
IGZsYWcgKG1hcCBjb3VudCkuCj4+IFN1Y2ggcGFnZXMgZS5nLiBpbmNsdWRlIHBhZ2VzIGluZmF0
ZWQgYXMgcGFydCBvZiBhIGJhbGxvb24gZHJpdmVyIG9yCj4+IHBhZ2VzIHRoYXQgd2VyZSBub3Qg
YWN0dWFsbHkgb25saW5lZCB3aGVuIG9ubGluaW5nIHRoZSB3aG9sZSBzZWN0aW9uLgo+Pgo+PiBX
aGlsZSB0aGUgaHlwZXJ2aXNvciB1c3VhbGx5IGFsbG93cyB0byByZWFkIHN1Y2ggaW5mbGF0ZWQg
bWVtb3J5LCB3ZQo+PiBiYXNpY2FsbHkgcmVhZCBhbmQgZHVtcCBkYXRhIHRoYXQgaXMgY29tcGxl
dGVseSBpcnJlbGV2YW50LiBBbHNvLCB0aGlzCj4+IG1pZ2h0IHJlc3VsdCBpbiBxdWl0ZSBzb21l
IG92ZXJoZWFkIGluIHRoZSBoeXBlcnZpc29yLiBJbiBhZGRpdGlvbiwKPj4gd2Ugc2F3IHNvbWUg
cHJvYmxlbXMgdW5kZXIgSHlwZXItViwgd2hlcmVieSB3ZSBjYW4gY3Jhc2ggdGhlIGtlcm5lbCBi
eQo+PiBkdW1waW5nLCB3aGVuIHJlYWRpbmcgbWVtb3J5IG9mIGEgcGFydGlhbGx5IG9ubGluZWQg
bWVtb3J5IHNlZ21lbnQKPj4gKGZvciBtZW1vcnkgYWRkZWQgYnkgdGhlIEh5cGVyLVYgYmFsbG9v
biBkcml2ZXIpLgo+Pgo+PiBUaGVyZWZvcmUsIGRvbid0IHJlYWQgYW5kIGR1bXAgcGFnZXMgdGhh
dCBhcmUgbWFya2VkIGFzIGJlaW5nIGxvZ2ljYWxseQo+PiBvZmZsaW5lLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPj4gLS0tCj4+ICBt
YWtlZHVtcGZpbGUuYyB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KPj4g
IG1ha2VkdW1wZmlsZS5oIHwgIDEgKwo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvbWFrZWR1bXBmaWxlLmMgYi9t
YWtlZHVtcGZpbGUuYwo+PiBpbmRleCA4OTIzNTM4Li5iOGJmZDRjIDEwMDY0NAo+PiAtLS0gYS9t
YWtlZHVtcGZpbGUuYwo+PiArKysgYi9tYWtlZHVtcGZpbGUuYwo+PiBAQCAtODgsNiArODgsNyBA
QCBtZGZfcGZuX3QgcGZuX2NhY2hlX3ByaXZhdGU7Cj4+ICBtZGZfcGZuX3QgcGZuX3VzZXI7Cj4+
ICBtZGZfcGZuX3QgcGZuX2ZyZWU7Cj4+ICBtZGZfcGZuX3QgcGZuX2h3cG9pc29uOwo+PiArbWRm
X3Bmbl90IHBmbl9vZmZsaW5lOwo+Pgo+PiAgbWRmX3Bmbl90IG51bV9kdW1wZWQ7Cj4+Cj4+IEBA
IC0yNDksNiArMjUwLDIxIEBAIGlzSHVnZXRsYih1bnNpZ25lZCBsb25nIGR0b3IpCj4+ICAgICAg
ICAgICAgICAgICAgICAgICYmIChTWU1CT0woZnJlZV9odWdlX3BhZ2UpID09IGR0b3IpKTsKPj4g
IH0KPj4KPj4gK3N0YXRpYyBpbnQKPj4gK2lzT2ZmbGluZSh1bnNpZ25lZCBsb25nIGZsYWdzLCB1
bnNpZ25lZCBpbnQgX21hcGNvdW50KQo+PiArewo+PiArCWlmIChOVU1CRVIoUEFHRV9CVUREWV9N
QVBDT1VOVF9WQUxVRSkgPT0gTk9UX0ZPVU5EX05VTUJFUikKPj4gKwkJcmV0dXJuIEZBTFNFOwo+
IAo+IFRoaXMgaXMgTlVNQkVSKFBBR0VfT0ZGTElORV9NQVBDT1VOVF9WQUxVRSksIGlzbid0IGl0
Pwo+IElmIHNvLCBJIHdpbGwgY29ycmVjdCBpdCB3aGVuIG1lcmdpbmcuCj4gCj4gT3RoZXJ3aXNl
LCBsb29rcyBnb29kIHRvIG1lLgo+IAo+IFRoYW5rcyEKPiBLYXp1CgpJbmRlZWQsCgpJIHdpbGwg
bW9zdCBwcm9iYWJseSByZXNlbmQgZWl0aGVyIHdheSBhbG9uZyB3aXRoIGEgbmV3IG1tIHNlcmll
cyEKClRoYW5rcyBhIGxvdCEKCgotLSAKClRoYW5rcywKCkRhdmlkIC8gZGhpbGRlbmIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
