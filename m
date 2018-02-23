From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RFC 00/10] x86 passthrough code cleanup
Date: Fri, 23 Feb 2018 16:08:00 +0000
Message-ID: <20180223160759.xumjq33f4owkgp5x@citrix.com>
References: <20180221214701.1646-1-wei.liu2@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1910153C5@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=se9o=fr=citrix.com=prvs=5854c8178=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1epFtD-0007aZ-Qc
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 16:08:03 +0000
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D1910153C5@SHSMSX101.ccr.corp.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMjMsIDIwMTggYXQgMDU6MTI6MDVBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiBGcm9tOiBXZWkgTGl1Cj4gPiBTZW50OiBUaHVyc2RheSwgRmVicnVhcnkgMjIsIDIw
MTggNTo0NyBBTQo+ID4gCj4gPiBIaSBhbGwKPiA+IAo+ID4gQXQgc29tZSBwb2ludCBJIHdvdWxk
IGxpa2UgdG8gbWFrZSBDT05GSUdfSFZNIGFuZCBDT05GSUdfUFYgd29yay4KPiA+IFRoZQo+ID4g
cGFzc3Rocm91Z2ggY29kZSBpcyBvbmUgb2YgdGhlIHJvYWQgYmxvY2tzIGZvciB0aGF0IHdvcmsu
Cj4gCj4gQ2FuIHlvdSBlbGFib3JhdGUgdGhlIG1vdGl2YXRpb24gb2YgdGhpcyBjaGFuZ2U/IHdo
eSBkb2VzIHNvbWVvbmUKPiB3YW50IHRvIGRpc2FibGUgSFZNIG9yIFBWIGxvZ2ljIGNvbXBsZXRl
bHkgZnJvbSBoeXBlcnZpc29yPwo+IAoKQXQgc29tZSBwb2ludCBpbiB0aGUgZnV0dXJlLCB3ZSB3
b3VsZCBsaWtlIHRvIHV0aWxpc2UgYXMgbWFueSBoYXJkd2FyZQpmZWF0dXJlcyBhcyBwb3NzaWJs
ZSBhbmQgaGF2ZSBhbiBIVk0gLyBQVkggb25seSBzZXR1cC4gQXQgdGhhdCBwb2ludCBQVgpjb2Rl
IHdpbGwgYmUgbmVjZXNzYXJpbHkgYW5kIHNob3VsZCBiZSBwcmVmZXJhYmx5IGNvbXBpbGVkIG91
dCB0byByZWR1Y2UKY29kZSBzaXplIGFuZCBhdHRhY2sgc3VyZmFjZS4KCkhhdmluZyBQViBjb21w
aWxlZCBvdXQgYWxzbyBlbmFibGUgWGVuIHRvIHJlY2xhaW0gc29tZSBhZGRyZXNzIHNwYWNlCmZy
b20gdGhlIFBWIEFCSS4KCkJ1dCwgd2UgdW5kZXJzdGFuZCB0aGF0IFBWIGlzIGhlcmUgdG8gc3Rh
eSBmb3IgYXQgbGVhc3QgYSB3aGlsZSBhbmQKY291bGQgYmUgdXNlZnVsIGZvciBzb21lIG90aGVy
IG5pY2hlIHVzZSBjYXNlcywgc28gdXBzdHJlYW0gaGF2ZQpkZXZlbG9wZWQgYSBQVi1pbi1QVkgg
c2hpbSB0byBjb250aW51ZSB0byBzdXBwb3J0IFBWIGd1ZXN0cy4gVGhlIHNoaW0gaXMKYWN0dWFs
bHkgeWV0IGFub3RoZXIgY29uZmlndXJhdGlvbiBvZiBYZW4gcnVubmluZyBhcyBhIFBWSCBndWVz
dCBidXQKZXhwb3NlcyBQViBBQkkgdG8gUFYgZ3Vlc3RzLiBXZSB3YW50IHRvIGRpc2FibGUgSFZN
IGNvZGUgaW4gdGhhdCBjYXNlLAphZ2FpbiwgdG8gcmVkdWNlIGNvZGUgc2l6ZSBhbmQgYXR0YWNo
IHN1cmZhY2UuCgpUaGVyZSBpcyBhbHNvIHRoZSBsb25nIHRlcm0gYmVuZWZpdCB0byBtYWtlIFhl
biBtb3JlIG1haW50YWluYWJsZSBhbmQKYXBwcm9hY2hhYmxlIGluIHRoZSBmdXR1cmUuCgpTZWUK
aHR0cHM6Ly93d3cuc2xpZGVzaGFyZS5uZXQveGVuX2NvbV9tZ3IveHBkZHMxNy1rZXlub3RlLXRv
d2FyZHMtYS1jb25maWd1cmFibGUtYW5kLXNsaW1tZXIteDg2LWh5cGVydmlzb3Itd2VpLWxpdS1j
aXRyaXgKCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
