From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: PLEASE REVERT URGENTLY: Re: [PATCH v5 2/3]
 x86/boot: add acpi rsdp address to setup_header
Date: Fri, 9 Nov 2018 23:16:02 -0800
Message-ID: <59ca1053-9176-f1db-6e6c-96b47aaaa09d__14532.2493779988$1541834107$gmane$org@zytor.com>
References: <20181010061456.22238-1-jgross@suse.com>
 <20181010061456.22238-3-jgross@suse.com>
 <f7c78ee7-b548-7f04-24da-7321b6c64c97@zytor.com>
 <bd2d17cd-072c-cad6-94ad-52373700a1c9@suse.com>
 <2934552c-d150-0afb-6fa9-9398cb94d86a@zytor.com>
 <5a2f5cb8-7332-f490-eabf-cfcbdcd1abc4@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lkqj=nv=zytor.com=hpa@srs-us1.protection.inumbo.net>)
 id 1gLNVC-0006qi-V7
 for xen-devel@lists.xenproject.org; Sat, 10 Nov 2018 07:16:18 +0000
In-Reply-To: <5a2f5cb8-7332-f490-eabf-cfcbdcd1abc4@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, linux-doc@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, boris.ostrovsky@oracle.com, corbet@lwn.net
List-Id: xen-devel@lists.xenproject.org

T24gMTEvOS8xOCAxMTowMiBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4KPj4gWWVzLiBXZSBr
bm93IHRoYXQgYW5kIGl0IGlzIHJlc29sdmVkIGJ5Ogo+Pgo+PiBhKSB0aGUgbGVuZ3RoIGZpZWxk
IGluIHNldHVwX2hlYWRlcjsKPj4gYikgdGhlICJzZW50aW5lbCIgZmllbGQgd2hpY2ggY2F0Y2hl
cyBsZWdhY3kgbm9uLWNvbXBsaWFudCBib290bG9hZGVycy4KPiAKPiBEb2Vzbid0IGhlbHAgZm9y
IGJvb3QgbG9hZGVycyByZWFkaW5nIHN0cnVjdCBzZXR1cF9oZWFkZXIgZnJvbSB0aGUKPiBrZXJu
ZWwgaW1hZ2UgYW5kIHRoZW4gd3JpdGluZyBlLmcuIDUxMiBieXRlcyBiYWNrIHRvIHRoZSBzZXR1
cF9oZWFkZXIKPiBsb2NhdGlvbi4gVGhlIHNlbnRpbmVsIGlzIGNsZWFyZWQgYW5kIHRoZSBsZW5n
dGggZmllbGQganVzdCBpc24ndAo+IHRha2VuIGludG8gYWNjb3VudC4gQW5kIHRoaXMgaXMgd2hh
dCBoYXBwZW5lZC4KPiAKClRoaXMgaXMgaW5zYW5lPyEgSG93IGRvIHRoZXkgbWFuYWdlIHRvIGRv
IHRoaXMuLi4gaXQncyBub3QgbGlrZSAgdGhpcyBpc24ndAp3cml0dGVuIG91dCBpbiBwbGFpbiBF
bmdsaXNoIHRvIGZvbGxvdy4gSSBhbSwgb25jZSBhZ2FpbiwgdXR0ZXJseSBhbmQKZ2VudWluZWx5
IGJhZmZsZWQgYWJvdXQgaG93IG1hbnkgd2F5cyBHcnViIGNhbiBkbyB0aGluZ3Mgd3JvbmcuCgpT
byB3ZSBzaG91bGQgcHJvYmFibHkgYWRkIGEgdGVybWluYWwgc2VudGluZWwgZmllbGQgYXQgb2Zm
c2V0IDB4MjgxLCB3aGljaCBpcwpvbmUgYnl0ZSBwYXN0IHRoZSBsb25nZXN0IHBvc3NpYmxlIHNl
dHVwX2hlYWRlciBzdHJ1Y3R1cmU7IGluIGZhY3QsIHdlIG1heQpqdXN0IHdhbnQgdG8gZXhwbGlj
aXRseSBwYWQgc2V0dXBfaGVhZGVyIHdpdGggemVyb2VzIHRvIGl0cyBmaW5hbCBzaXplLCBpZgpu
b3RoaW5nIGVsc2UgdG8gbWFrZSBpdCBleHBsaWNpdCBob3cgbGl0dGxlIHNwYWNlIGlzIGFjdHVh
bGx5IGxlZnQgaW4gdGhlcmUuCgpJdCB3b3VsZCBiZSBlbm9ybW91c2x5IGhlbHBmdWwgaWYgeW91
IGNvdWxkIGZpbmQgb3V0IGFueSBtb3JlIGRldGFpbHMgYWJvdXQKZXhhY3RseSB3aGF0IHRoZXkg
YXJlIGRvaW5nIHRvIGJyZWFrIHRoaW5ncy4KCk1hbnkgdGhhbmtzLAoKCS1ocGEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
