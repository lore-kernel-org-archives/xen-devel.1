From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC] VMX: fix vmx_handle_eoi()
Date: Thu, 25 Oct 2018 03:46:28 -0600
Message-ID: <5BD190F402000078001F48E2@prv1-mh.provo.novell.com>
References: <5BC06A4B02000078001F0EE0@prv1-mh.provo.novell.com>
 <20181019143010.GA24016@gao-cwp>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=29w0=nf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gFcEB-0007MK-Kl
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 09:46:55 +0000
In-Reply-To: <20181019143010.GA24016@gao-cwp>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjEwLjE4IGF0IDE2OjMwLCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBP
biBGcmksIE9jdCAxMiwgMjAxOCBhdCAwMzozMjo1OUFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPj5JbiBjb21taXQgMzAzMDY2ZmRiMWUgKCJWTVg6IGZpeCBpbnRlcmFjdGlvbiBvZiBBUElD
LVYgYW5kIFZpcmlkaWFuCj4+ZW11bGF0aW9uIikgSSBzY3Jld2VkIHVwIHF1aXRlIGhlYXZpbHk6
IEluc3RlYWQgb2YgY2xlYXJpbmcgU1ZJLCBSVkkgd2FzCj4+Y2xlYXJlZC4gRnVydGhlcm1vcmUs
IHVuY29uZGl0aW9uYWwgY2xlYXJpbmcgb2YgU1ZJIGlzIHdyb25nIHRvbyAtIG90aGVyCj4+SVNS
IGJpdHMgc2hvdWxkIGJlIHRha2VuIGludG8gYWNjb3VudC4KPj4KPj5JbnRyb2R1Y2UgYSBuZXcg
aGVscGVyIHNldF9zdmkoKSwgc3BsaXQgb3V0IG9mIHZteF9wcm9jZXNzX2lzcigpLCBhbmQKPj51
c2UgaXQgYWxzbyBmcm9tIHZteF9oYW5kbGVfZW9pKCkuCj4+Cj4+Rm9sbG93aW5nIHRoZSBwcm9i
bGVtcyBpbiB2bXhfaW50cl9hc3Npc3QoKSAoc2VlIHRoZSBzdGlsbCBwcmVzZW50IGJpZwo+PmJs
b2NrIG9mIGRlYnVnZ2luZyBjb2RlIHRoZXJlKSBhbHNvIHdhcm4gKG9uY2UpIGlmIEVPSSdkIHZl
Y3RvciBhbmQKPj5vcmlnaW5hbCBTVkkgZG9uJ3QgbWF0Y2guCj4+Cj4+U2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEFmdGVyIGNvcnJlY3RpbmcgdGhl
IGRlc2NyaXB0aW9uIGluIHRoZSBmaXJzdCBwYXJhZ3JhcGgKPiAKPiBSZXZpZXdlZC1ieTogQ2hh
byBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KCldpdGggdGhpcyAtIGFueSBjaGFuY2Ugb2YgZ2V0
dGluZyB0aGUgbmVjZXNzYXJ5IGFja3M/IE9yCmFtIEkgZXhwZWN0ZWQgdG8gcmUtc3VibWl0IHdp
dGggdGhlIChhbHJlYWR5KSBhZGp1c3RlZApkZXNjcmlwdGlvbj8KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
