From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.12] x86/hvm: Fix
 hvm_cr4_guest_valid_bits() for PVH dom0
Date: Mon, 28 Jan 2019 15:29:48 +0000
Message-ID: <6d70b41a-ba37-5370-5270-b7eec8adfb31@citrix.com>
References: <1548683789-21610-1-git-send-email-andrew.cooper3@citrix.com>
 <20190128152209.5gugm3k3bkqxknzx@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190128152209.5gugm3k3bkqxknzx@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDEvMjAxOSAxNToyMiwgV2VpIExpdSB3cm90ZToKPiBPbiBNb24sIEphbiAyOCwgMjAx
OSBhdCAwMTo1NjoyOVBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBCZWZvcmUgdGhl
IGNwdWlkX3BvbGljeSBsb2dpYyBjYW1lIGFsb25nLCAlY3I0IGF1ZGl0aW5nIG9uIG1pZ3JhdGUt
aW4gd2FzCj4+IGNvbXBsaWNhdGVkLCBiZWNhdXNlIGF0IHRoYXQgcG9pbnQgbm8gQ1BVSUQgaW5m
b3JtYXRpb24gaGFkIGJlZW4gc2V0IGZvciB0aGUKPj4gZ3Vlc3QuICBBdWRpdGluZyBhZ2FpbnN0
IHRoZSBob3N0IENQVUlEIHdhcyBiZXR0ZXIgdGhhbiBub3RoaW5nLCBidXQgbm90Cj4+IGlkZWFs
Lgo+Pgo+PiBPcmRlciBvZiBpbmZvcm1hdGlvbiBpbiB0aGUgbWlncmF0aW9uIHN0cmVhbSBpcyBz
dGlsbCBhbiBpc3N1ZSAoaGVuY2Ugd2Ugc3RpbGwKPj4gbmVlZCB0byBrZWVwIHRoZSByZXN0b3Jl
IHBhcmFtZXRlciB0byBjb3BlIHdpdGggYSBuZXN0ZWQgdmlydCBjb3JuZXIgY2FzZSksCj4+IGJ1
dCBzaW5jZSBYZW4gNC45LCB0aGUgZG9tYWluIHN0YXJ0cyB3aXRoIHRoZSBhcHBsaWNhYmxlIG1h
eCBwb2xpY3ksIHdoaWNoIGlzCj4+IGEgbW9yZSBhcHByb3ByaWF0ZSB1cHBlciBib3VuZCB0aGFu
IHRoZSBob3N0IGNwdWlkIHBvbGljeS4KPj4KPj4gVGhpcyBhbHNvIG1ha2VzIHRoZSBmaXggZnJv
bSBjL3MgOWQyZWZiYWZiOCBvYnNvbGV0ZSwgYXMgbm90IGV2ZW4gZG9tMCBzdGFydHMKPj4gd2l0
aG91dCBhIHBvbGljeS4KPj4KPj4gRmluYWxseSwgcmVwb3NpdGlvbiB0aGUgVU1JUCBsb2dpYyBh
cyBpdCBpcyB0aGUgb25seSByb3cgb3V0IG9mIG9yZGVyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IEl0IGlzIGluZGVlZCB0
aGUgY2FzZSB0aGF0IGFsbCB4ODYgZG9tYWlucyB3aWxsIGdldCBhIGNwdWlkIHBvbGljeSwKPiBh
dWRpdGluZyBhZ2FpbnN0IHRoYXQgbWFrZXMgbW9yZSBzZW5zZS4gQnV0IHdoYXQgYWJvdXQgY29k
ZSBpbgo+IGh2bV9lZmVyX3ZhbGlkPyBXaHkgZGlkbid0IHlvdSBtYWtlIGl0IHdvcmsgd2l0aCBh
cmNoLmNwdWlkPwoKRnJhbmtseSwgYmVjYXVzZSBJIGhhZG4ndCBzcG90dGVkIGl0LgoKaHZtX2Vm
ZXJfdmFsaWQoKSBpcyByYXRoZXIgaGFyZGVyIHRvIHJlYXNvbiBhYm91dCB3aXRoIHRoZSBjcjBf
cGcKcGFyYW1ldGVyLCBhcyBpdCBkb3VibGVzIGFzIGEgcmVzdG9yZSBib29sZWFuLgoKfkFuZHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
