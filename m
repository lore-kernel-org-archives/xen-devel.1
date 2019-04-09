From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] x86/smt: Support for enabling/disabling
 SMT at runtime
Date: Tue, 9 Apr 2019 13:36:09 +0100
Message-ID: <20190409123609.GG30543@zion.uk.xensource.com>
References: <1554742939-18688-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1554742939-18688-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMDY6MDI6MTlQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBDdXJyZW50bHksIGEgdXNlciBjYW4gaW4gY29tYmluZSB0aGUgb3V0cHV0IG9mIGB4
bCBpbmZvIC1uYCwgdGhlIEFQQ0kgdGFibGVzLAo+IGFuZCBzb21lIG1hbnVhbCBDUFVJRCBkYXRh
IHRvIGZpZ3VyZSBvdXQgd2hpY2ggQ1BVIG51bWJlcnMgdG8gZmVlZCBpbnRvCj4gYHhlbi1ocHRv
b2wgY3B1LW9mZmxpbmVgIHRvIGVmZmVjdGl2ZWx5IGRpc2FibGUgU01UIGF0IHJ1bnRpbWUuCj4g
Cj4gQSBtb3JlIGNvbnZlbmllbnQgb3B0aW9uIGlzIHRvIHRlYWNoIFhlbiBob3cgdG8gcGVyZm9y
bSB0aGlzIGFjdGlvbi4KPiAKPiBFeHRlbmQgWEVOX1NZU0NUTF9jcHVfaG90cGx1ZyB3aXRoIHR3
byBuZXcgb3BlcmF0aW9ucy4gIEludHJvZHVjZSBhIG5ldwo+IHNtdF91cF9kb3duX2hlbHBlcigp
IHdoaWNoIHdyYXAgdGhlIGNwdV97dXAsZG93bn1faGVscGVyKCkgaGVscGVycyB3aXRoIGxvZ2lj
Cj4gd2hpY2ggdW5kZXJzdGFuZHMgc2libGluZ3MgYmFzZWQgb24gdGhlaXIgQVBJQ19JRC4KPiAK
PiBBZGQgbGlieGMgc3R1YnMsIGFuZCBleHRlbmQgeGVuLWhwdG9vbCB3aXRoIHNtdC17ZW5hYmxl
LGRpc2FibGV9IG9wdGlvbnMuCj4gVGhlc2UgYXJlIGludGVuZGVkIHRvIGJlIHNob3J0aGFuZHMg
Zm9yIGEgbG9vcCBvdmVyIGNwdS17b25saW5lLG9mZmxpbmV9LiAgSXQKPiBpcyBpbnRlbmRlZCBm
b3IgdXNlIGluIHByb2R1Y3Rpb24gc2NlbmFyaW9zIHdoZXJlIGRlYnVnZ2luZyBvcHRpb25zIHN1
Y2ggYXMKPiBgbWF4Y3B1cz1gIG9yIG90aGVyIG1hbnVhbCBwbHVnL3VucGx1ZyBjb25maWd1cmF0
aW9uIGhhcyBub3QgYmVlbiB1c2VkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
