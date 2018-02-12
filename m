From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 5/7] x86/alt: Support for automatic padding
	calculations
Date: Mon, 12 Feb 2018 18:41:03 +0000
Message-ID: <20180212184103.sln22c6iflrud6wi@MacBook-Pro-de-Roger.local>
References: <1518434587-22827-1-git-send-email-andrew.cooper3@citrix.com>
 <1518434587-22827-6-git-send-email-andrew.cooper3@citrix.com>
 <20180212143953.cb6hvhersqk6ndew@citrix.com>
 <51f8d90b-7d0a-597b-91c6-88ede7faf20b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <51f8d90b-7d0a-597b-91c6-88ede7faf20b@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMTIsIDIwMTggYXQgMDM6MDQ6MjFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxMi8wMi8xOCAxNDozOSwgV2VpIExpdSB3cm90ZToKPiA+IE9uIE1vbiwgRmVi
IDEyLCAyMDE4IGF0IDExOjIzOjA1QU0gKzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gPj4g
IC5tYWNybyBBTFRFUk5BVElWRSBvbGRpbnN0ciwgbmV3aW5zdHIsIGZlYXR1cmUKPiA+PiAgLkxc
QF9vcmlnX3M6Cj4gPj4gICAgICBcb2xkaW5zdHIKPiA+PiAgLkxcQF9vcmlnX2U6Cj4gPj4gKyAg
ICAgLnNraXAgKC0oKHJlcGxfbGVuKDEpIC0gb3JpZ19sZW4pID4gMCkgKiAocmVwbF9sZW4oMSkg
LSBvcmlnX2xlbikpLCAweDkwCj4gPiBTZWVpbmcgdGhlIG5lZ2F0aW9uIGF0IHRoZSBiZWdpbm5p
bmcsIEkgc3VwcG9zZSB0aGlzIHNob3VsZCBhbHNvIGJlIGEKPiA+IGdhcyBzcGVjaWZpYyBtYWNy
bz8KPiAKPiBUaGUgYnVpbGQgZmFpbHVyZXMgYXJlIGJlY2F1c2UgY2xhbmcncyBpbnRlZ3JhdGVk
IGFzc2VtYmxlciBjYW4ndCBjb3BlCj4gd2l0aCBub24tYWJzb2x1dGUgcmVmZXJlbmNlcyB3aXRo
IC5za2lwLCBidXQgd2UgYWxyZWFkeSBrbm93IGFib3V0IHRoaXMKPiBhbmQgaGF2ZSBjb2RlIGlk
ZW50aWNhbCB0byB0aGlzIGluIHRyZWUuwqAgKEkgdGVtcG9yYXJpbHkgcmVtb3ZlZCBpdCBpbgo+
IHBhdGNoIDQpLgoKTmV3ZXIgY2xhbmcgKDYpIHN1cHBvcnRzIC5za2lwIHdpdGggbGFiZWxzLCBi
dXQgZG9lc24ndCBzdXBwb3J0IHRoZQooLSguLi4gQW5kIGl0J3MgaGF2aW5nIHNvbWUgaXNzdWVz
IHdpdGggdGhlIHJlc3Qgb2YgdGhlIGV4cHJlc3Npb24sCndpbGwgaGF2ZSB0byBjaGVjayBtb3Jl
IGNsb3NlbHkgdG9tb3Jyb3cuCgpJIHdvbmRlciwgd2hhdCdzIExpbnV4IGRvaW5nIGluIHRoaXMg
cmVnYXJkPyBJdCBzZWVtcyBsaWtlIGNsYW5nL2xsdm0KaXMgcXVpdGUgY29tbWl0dGVkIHRvIHN1
cHBvcnQgYnVpbGRpbmcgTGludXgsIHNvIGl0IG1pZ2h0IGJlIGdvb2QgdG8KZm9sbG93IHN1aXQg
aW4gdGhpcyBjYXNlLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
