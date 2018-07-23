From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] firmware/shim : filter output files during
 Xen tree setup
Date: Mon, 23 Jul 2018 10:26:10 +0100
Message-ID: <398ca3b0-6d16-0434-449d-c9bae7b0c4ea@citrix.com>
References: <1532121305-5253-1-git-send-email-christopher.w.clark@gmail.com>
 <20180723090940.jf6bysl5vtt7ehqx@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jmrf=kh=citrix.com=prvs=7357aa5aa=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fhX6c-0006YF-7z
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 09:26:14 +0000
In-Reply-To: <20180723090940.jf6bysl5vtt7ehqx@mac.bytemobile.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDcvMTggMTA6MDksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gRnJpLCBKdWwg
MjAsIDIwMTggYXQgMDI6MTU6MDVQTSAtMDcwMCwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6Cj4+
IEV4Y2x1ZGUgbmFtZWQgb3V0cHV0IGZpbGVzIGZyb20gdGhlIFhlbiB0cmVlIHNldHVwLgo+Pgo+
PiBUaGUgbGlua2Zhcm0uc3RhbXAgY29udGVudCB3aWxsIGRpZmZlciBiZXR3ZWVuIHRvcCBsZXZl
bCAibWFrZSIKPj4gYW5kICJtYWtlIGluc3RhbGwiIGludm9jYXRpb25zLCBkdWUgdG8gdGhlIGlu
dHJvZHVjdGlvbiBvZiB0aGVzZQo+PiBvdXRwdXQgZmlsZXMgdGhhdCBhcmUgcHJvZHVjZWQgZHVy
aW5nIHRoZSAibWFrZSIgYnVpbGQuCj4+Cj4+IEZpbHRlciB0aGVzZSBvdXQgdG8gcHJldmVudCBh
biB1bm5lY2Vzc2FyeSByZWJ1aWxkIG9mIHRoZSBzaGltIGR1cmluZwo+PiAibWFrZSBpbnN0YWxs
Ii4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLmNs
YXJrNkBiYWVzeXN0ZW1zLmNvbT4KPj4gLS0tCj4+ICB0b29scy9maXJtd2FyZS94ZW4tZGlyL01h
a2VmaWxlIHwgNiArKysrKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFr
ZWZpbGUgYi90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCj4+IGluZGV4IDg0NjQ4YzMu
LmU0OTBkY2EgMTAwNjQ0Cj4+IC0tLSBhL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUK
Pj4gKysrIGIvdG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtlZmlsZQo+PiBAQCAtMTEsNiArMTEs
OSBAQCBEPXhlbi1yb290Cj4+ICBMSU5LX0RJUlM9Y29uZmlnIHhlbgo+PiAgTElOS19GSUxFUz1D
b25maWcubWsKPj4gIAo+PiArIyBGaWxlcyB0byBleGNsdWRlIGZyb20gdGhlIGxpbmsgZmFybQo+
PiArRVhDTFVERV9GSUxFUz14ZW4geGVuLmd6IHhlbi1zeW1zIHhlbi1zeW1zLm1hcCBlZmkubGRz
IHhlbi5sZHMgbWtlbGYzMiBta3JlbG9jCj4gSSBkb24ndCByZWFsbHkgbGlrZSB0byBsaXN0IHRo
ZSBmaWxlcyBoZXJlLCBzaW5jZSBpdCdzIHZlcnkgZWFzeSBmb3IKPiB0aGVtIHRvIGdldCBvdXQg
b2Ygc3luYy4gVGhlIGFsdGVybmF0aXZlIEkgaGF2ZSBpcyBhbHNvIG5vdCB2ZXJ5IG5pY2UKPiBo
b3dldmVyLCBzaW5jZSBpdCByZWxpZXMgb24gLmdpdGlnbm9yZToKPgo+IEVYQ0xVREVfRklMRVM6
PSQocGF0c3Vic3QgeGVuLyUsJSwkKGZpbHRlciB4ZW4vJSwkKHNoZWxsIGNhdCAkKFhFTl9ST09U
KS8uZ2l0aWdub3JlKSkpCgpUaGUgY29ycmVjdCB3YXkgdG8gZml4IHRoaXMgaXMgdG8gcmlwIHRo
ZSBjdXJyZW50IGJ1aWxkIHN5c3RlbSB0bwpzaHJlZHMsIHN0YXJ0IGFnYWluLCBhbmQgZ2V0IGl0
IHRvIHN1cHBvcnQgb3V0LW9mLXRyZWUgYnVpbGRzLgoKVGhpcyBsaW5rZmFybSBsb2dpYyBleGlz
dHMgb25seSB0byB3b3JrIGFyb3VuZCBhIGhvbGUgd2hpY2ggd2UgY291bGRuJ3QKZml4IGF0IHRo
ZSB0aW1lLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
