From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] x86/entry/64: Remove %ebx handling from
 error_entry/exit
Date: Thu, 16 Aug 2018 17:19:46 +0200
Message-ID: <20180816151946.GH10648__29667.4958816313$1534432731$gmane$org@kroah.com>
References: <6A458833-F161-4C0A-8DFF-8757EDA36D5C@amacapital.net>
 <1533749748-25861-1-git-send-email-srn@prgmr.com>
 <1533818501.5775.4.camel@infradead.org>
 <1f15d219-46fd-fc21-84d5-877a7af4c87e@prgmr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i45+=k7=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1fqK43-0006ox-O5
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 15:19:55 +0000
Content-Disposition: inline
In-Reply-To: <1f15d219-46fd-fc21-84d5-877a7af4c87e@prgmr.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sarah Newman <srn@prgmr.com>
Cc: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Gerst <brgerst@gmail.com>, x86@kernel.org, stable@vger.kernel.org, "Durand Wesolowski,
 Jimmy" <jdw@amazon.de>, Borislav Petkov <bp@alien8.de>, Dominik Brodowski <linux@dominikbrodowski.net>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>, Ingo Molnar <mingo@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMTAsIDIwMTggYXQgMTI6MjM6NDVBTSAtMDcwMCwgU2FyYWggTmV3bWFuIHdy
b3RlOgo+IE9uIDA4LzA5LzIwMTggMDU6NDEgQU0sIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPiA+
IE9uIFdlZCwgMjAxOC0wOC0wOCBhdCAxMDozNSAtMDcwMCwgU2FyYWggTmV3bWFuIHdyb3RlOgo+
ID4+IGNvbW1pdCBiMzY4MWRkNTQ4ZDA2ZGViMmUxNTczODkwODI5ZGZmNGIxNWFiZjQ2IHVwc3Ry
ZWFtLgo+ID4+Cj4gPj4gVGhpcyB2ZXJzaW9uIGFwcGxpZXMgdG8gdjQuOS4KPiA+IAo+ID4gSSB0
aGluayB5b3UgY2FuIGtpbGwgdGhlICd4b3JsICVlYngsJWVieCcgZnJvbSBlcnJvcl9lbnRyeSB0
b28gYnV0IHllcywKPiA+IHRoaXMgZG9lcyB3YW50IHRvIGdvIHRvIDQuOSBhbmQgZWFybGllciBi
ZWNhdXNlIHRoZSAnRml4ZXM6JyB0YWcgaXMgYQo+ID4gYml0IG9mIGEgbGllIOKAlCB0aGUgcHJv
YmxlbSBleGlzdGVkIGJlZm9yZSB0aGF0LCBhdCBsZWFzdCBpbiB0aGVvcnkuCj4gCj4gVGhlIGNv
bW1pdCAyMTQwYTk5NDIgIng4Ni9lbnRyeS82NDogUmVsYXggcHZvcHMgc3R1YiBjbG9iYmVyCj4g
c3BlY2lmaWNhdGlvbnMiIHdhcyB3aGF0IHJlbW92ZWQgdGhlICJtb3ZsICVlYngsICVlYXgiIGxp
bmUgbGF0ZXIgb24KPiBvcmlnaW5hbGx5LCBidXQgaXQgd2FzIHRoZSBjb21taXQgM2FjNmQ4Yzc4
N2I4IHRoYXQgcmVtb3ZlZCB0aGUKPiAneG9ybCAlZWJ4LCVlYngnLiBTbyB0aGVzZSB3ZXJlbid0
IG1hdGNoZWQuCj4gCj4gSSBkb24ndCBrbm93IGlmIGl0J3MgYSBjb25jZXJuLCBidXQgaWYgc29t
ZW9uZSBoYWQgZ29uZSB0byB0aGUgZWZmb3J0IG9mCj4gYmFja3BvcnRpbmcgdGhlIG9yaWdpbmFs
IGNvbW1pdCAzYWM2ZDhjNzg3YjgzLCBhZGRpbmcgdGhlIHJlbW92YWwgb2YKPiAneG9ybCAlZWJ4
LCVlYngnIHRvIHRoaXMgcGF0Y2ggd291bGQgY3JlYXRlIG1lcmdlIGNvbmZsaWN0cy4KPiBGb3Ig
dGhhdCByZWFzb24gYW5kIGdpdmVuIHRoZSBsaW5lIGlzIGhhcm1sZXNzLCBzaG91bGQgaXQgYmUg
bGVmdCBpbj8KCkkgbmVlZCBzb21lIGtpbmQgb2YgYWdyZWVtZW50IGhlcmUgZm9yIG1lIHRvIGtu
b3cgd2hhdCB0byBkbyB3aXRoIHRoaXMKcGF0Y2guLi4gIHtoaW50fQoKdGhhbmtzLAoKZ3JlZyBr
LWgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
