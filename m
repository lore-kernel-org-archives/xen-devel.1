From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/4] libx86: Introduce
 x86_cpuid_lookup_vendor()
Date: Wed, 27 Mar 2019 15:10:15 +0000
Message-ID: <7a9f67b7-11de-89c1-db82-2eae0ac8f55a@citrix.com>
References: <1553170866-23812-1-git-send-email-andrew.cooper3@citrix.com>
 <1553170866-23812-2-git-send-email-andrew.cooper3@citrix.com>
 <5C9A12690200007800221E05@prv1-mh.provo.novell.com>
 <c5d1df3d-038d-8c0a-97da-a71f8f3fd009@citrix.com>
 <5C9A320A0200007800221EFF@prv1-mh.provo.novell.com>
 <3a504ce9-9cad-f2a3-4ed5-bd42b114ee06@suse.com>
 <5C9A39B00200007800221F23@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C9A39B00200007800221F23@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDMvMjAxOSAxNDozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjYuMDMuMTkg
YXQgMTU6MjMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBJTU8gZXNwZWNpYWxseSBpbiB0
aGUgQ1BVSUQgY2FzZSBpdCBpcyBkZXNpcmFibGUgdG8gZXhwbGljaXRseSBzcGVjaWZ5Cj4+IHRo
ZSB3aWR0aCBvZiB0aGUgZGF0YS4gTG9va2luZyBhdCBub2RlcyAweDgwMDAwMDAyIGFuZCBmb2xs
b3dpbmcgdGhpcwo+PiBzaG91bGQgYmUgcmF0aGVyIGNsZWFyIChhbmQgSSBldmVuIHRoaW5rIGdl
dF9tb2RlbF9uYW1lKCkgc2hvdWxkIGJlCj4+IG1vZGlmaWVkIHRvIHVzZSBhIHBvaW50ZXIgdG8g
dWludDMyX3QgaW5zdGVhZCBvZiB1bnNpZ25lZCBpbnQpLiBVc2luZwo+PiBhIHR5cGUgd2l0aCBz
aXplID49IDQgZG9lc24ndCBmaXQgcmVhbGx5IHdlbGwuIFlvdSB3YW50IHNpemUgPT0gNC4KPiBX
aHk/IEZpeGVkIHdpZHRoIHR5cGVzIG9ubHkgaW50cm9kdWNlIHVubmVjZXNzYXJ5IHJlc3RyaWN0
aW9ucwo+IHdoZW4gd2FudGluZyB0byByZS11c2UgY29kZSBpbiBvdGhlciBlbnZpcm9ubWVudHMu
IEFuZCBJIGRvbid0Cj4gc2VlIHdoeSBDUFVJRCBub2RlcyAweDgwMDAwMDBbMjM0XSB3b3VsZCBi
ZSBhbnkgYmV0dGVyIChvcgo+IHdvcnNlKSBhcyBhbiBleGFtcGxlIGhlcmUuIElmIGFueXRoaW5n
IHRoZXkgdGVsbCB1cyB0aGF0IG5laXRoZXIKPiB1aW50MzJfdCBub3IgdW5zaWduZWQgaW50IGFy
ZSByaWdodCwgYW5kIGl0IHNob3VsZCBiZSBjaGFyWzRdIG9yCj4gdWludDhfdFs0XSBpbnN0ZWFk
IChkZXBlbmRpbmcgb24gd2hldGhlciB3ZSB3YW50IHRvIHRpZQo+IG91cnNlbHZlcyB0byBDSEFS
X0JJVCA9PSA4LCB3aGljaCBjbGVhcmx5IGlzIG1vcmUgcmVzdHJpY3RpdmUKPiB0aGFuIHNpemVv
ZihpbnQpID49IDQsIGJ1dCBvdG9oIGlzIGFsc28gbGVzcyBsaWtlbHkgdG8gZ2V0IGluIHRoZQo+
IHdheSkuCgpUaGUgQUJJIG9mIENQVUlEIHJlYWxseSBpcyAyeCB1aW50MzJfdCBpbnB1dCwgNHgg
dWludDMyX3Qgb3V0cHV0LgoKSXQgaXMgb25seSBieSBjdXJyZW50IGNvbnZlbnRpb24gdGhhdCB0
aGUgZGF0YSBpcyBhbHNvIHZhbGlkIEFTQ0lJLCBhbmQKdGhlcmUgaXMgYWJzb2x1dGVseSBub3Ro
aW5nIHdoaWNoIHByZXZlbnRzIGEgbmV3IHZlbmRvciBjaG9vc2luZyB0byBwdXQKbm9uLUFTQ0lJ
IGNvbnRlbnQgaW4gdGhlaXIgaWQgc3RyaW5nLsKgIEdpdmVuIHRoZSByZWNlbnQgZGV2ZWxvcG1l
bnRzCmZyb20gQ2hpbmEsIEknbSBzbGlnaHRseSBzdXJwcmlzZWQgdGhhdCB3ZSBoYXZlbid0IHNl
ZW4gYW55IFVURi04IChvcgpVVEYtMTYgZm9yIHRoYXQgbWF0dGVyKSB5ZXQuCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
