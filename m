From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v2 5/5] x86/msr: Blacklist various MSRs
 which guests definitely shouldn't be using
Date: Wed, 7 Mar 2018 16:01:22 -0500
Message-ID: <20180307210122.GI23411@char.us.oracle.com>
References: <1520449116-15443-1-git-send-email-andrew.cooper3@citrix.com>
 <1520449116-15443-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1520449116-15443-6-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMDcsIDIwMTggYXQgMDY6NTg6MzZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgbWFpbiBwdXJwb3NlIGlzIHRvIGJsYWNrbGlzdCB0aGUgSW50ZWwgUmVzb3Vy
Y2UgRGlyZWN0b3IgVGVjaG5vbG9neSBNU1JzLgo+IFdlIGRvIG5vdCB5ZXQgdmlydHVhbGlzZSBz
dXBwb3J0IGZvciBndWVzdHMsIGJ1dCBMaW51eCBoYXMgYmVlbiBvYnNlcnZlZCB0bwo+IHByb2Jl
IGZvciB0aGVzZSBNU1JzIHdpdGhvdXQgY2hlY2tpbmcgQ1BVSUQgZmlyc3QuCgpCYWQgYmFkIGd1
ZXN0Li4KPiAKPiBUaGUgYXJjaGl0ZWN0dXJhbGx5IGluYWNjZXNzYWJsZSByYW5nZXMgZG9uJ3Qg
bmVlZCB0byBmYWxsIGJhY2sgaW50byB0aGUKPiBsZWdhY3kgcmFuZ2VzLCBiZWNhdXNlIHRoZXkg
YXJlIG5vdCBnb2luZyB0byBldmVudHVhbGx5IGV2YWx1YXRlIGFzCj4gYWNjZXNzaWJsZS4KPiAK
PiBUaGUgU2lsaWNvbiBEZWJ1ZyBpbnRlcmZhY2Ugd2lsbCBwcm9iYWJseSBuZXZlciBiZSB2aXJ0
dWFsaXNlZCBmb3IgZ3Vlc3RzLCBidXQKPiBkb2Vzbid0IHdhbnQgdG8gbGVhayB0aHJvdWdoIGZy
b20gcmVhbCBoYXJkd2FyZS4gIFNHWCBpc24ndCB5ZXQgdmlydHVhbGlzZWQsCj4gYnV0IGxpa2Vs
eSB3aWxsIGJlIGluIHRoZSBmdXR1cmUuCgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpSZXZpZXdlZC1ieTogS29ucmFkIFJ6ZXN6
dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgoKVGhhbmsgeW91IQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
