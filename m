From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] tools/libxc: Fix error handling in
 get_cpuid_domain_info()
Date: Fri, 30 Nov 2018 13:13:37 +0000
Message-ID: <93b83a6c-6dd3-5c25-96c6-b29389fc0484@citrix.com>
References: <1543519202-14603-1-git-send-email-andrew.cooper3@citrix.com>
 <1543519202-14603-3-git-send-email-andrew.cooper3@citrix.com>
 <5C01019B02000078002017DE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C01019B02000078002017DE@prv1-mh.provo.novell.com>
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMTEvMjAxOCAwOToyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjkuMTEuMTgg
YXQgMjA6MjAsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gZ2V0X2NwdWlk
X2RvbWFpbl9pbmZvKCkgaGFzIHR3byBjb25mbGljdGluZyByZXR1cm4gc3R5bGVzIC0gZWl0aGVy
IC1lcnJvciBmb3IKPj4gbG9jYWwgZmFpbHVyZXMsIG9yIC0xL2Vycm5vIGZvciBoeXBlcmNhbGwg
ZmFpbHVyZXMuICBTd2l0Y2ggdG8gY29uc2lzdGVudGx5Cj4+IHVzZSAtZXJyb3IuCj4+Cj4+IFdo
aWxlIGZpeGluZyB0aGUgeGNfZ2V0X2NwdV9mZWF0dXJlc2V0KCksIHRha2UgdGhlIG9wcG9ydHVu
aXR5IHRvIHJlbW92ZSB0aGUKPj4gcmVkdW5kYW5jeSBhbmQgbW92ZSBpdCB0byBiZSBhZGphY2Vu
dCB0byB0aGUgb3RoZXIgZmVhdHVyZXNldCBoYW5kbGluZy4KPiBIYXZpbmcgbm90aWNlZCB0aGUg
cmVkdW5kYW5jeSBiZWZvcmUsIEkgd2FzIGFzc3VtaW5nIHRoaXMgd2FzIGRvbmUKPiB0byBwcmV2
ZW50IGFsdGVyaW5nIGhvc3RfbnJfZmVhdHVyZXMgZWFybHksIGp1c3QgaW4gY2FzZSBmdXR1cmUg
Y29kZQo+IGFkZGl0aW9ucyB3b3VsZCB3YW50IHRvIHVzZSBpdHMgb3JpZ2luYWwgdmFsdWUuIFRo
ZSB3YXkgaXQgaXMgbm93LCB0aGUKPiBjb2RlIGZvbGRpbmcgbG9va3MgY29ycmVjdC4KCkkgZG9u
J3QgcmVjYWxsIGEgZGVsaWJlcmF0ZSBpbnRlbnRpb24gdG8gZG8gdGhhdCwgYnV0IGl0IHdhcyBh
IGxvbmcgdGltZQphZ28gbm93LgoKPgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgpUaGFua3MuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
