From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/mm: Drop {HAP,SHADOW}_ERROR() wrappers
Date: Wed, 29 Aug 2018 09:09:34 +0100
Message-ID: <20180829080934.sd3i3ow6nyqxkzrp@citrix.com>
References: <1535479914-30520-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1535479914-30520-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjgsIDIwMTggYXQgMDc6MTE6NTRQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBVbmxpa2UgdGhlIFBSSU5USy9ERUJVRyB3cmFwcGVycywgdGhlc2UgZ28gc3RyYWln
aHQgb3V0IHRvIHRoZSBjb25zb2xlLCByYXRoZXIKPiB0aGFuIGVuZGluZyB1cCBpbiB0aGUgZGVi
dWd0cmFjZSBidWZmZXIuCj4gCj4gQSBudW1iZXIgb2YgdGhlc2UgdXNlcnMgYXJlIGZvbGxvd2Vk
IGJ5IGRvbWFpbl9jcmFzaCgpLCBhbmQgZnV0dXJlIGNoYW5nZXMKPiB3aWxsIHdhbnQgdG8gY29t
YmluZSB0aGUgcHJpbnRrKCkgaW50byB0aGUgZG9tYWluX2NyYXNoKCkgY2FsbC4gIEV4cGFuZCB0
aGVzZQo+IHdyYXBwZXJzIGluIHBsYWNlLCB1c2luZyBYRU5MT0dfRVJSIGJlZm9yZSBhIEJVRygp
LCBhbmQgWEVOTE9HX0dfRVJSIGJlZm9yZSBhCj4gZG9tYWluX2NyYXNoKCkuCj4gCj4gUGVyZm9t
IHNvbWUgJXB2L1BSSV9tZm4vZXRjIGNsZWFudXAgd2hpbGUgbW9kaWZ5aW5nIHRoZSBpbnZvY2F0
aW9ucywgYW5kCj4gZXhwbGljaXRseSBkcm9wIHNvbWUgY2FsbHMgd2hpY2ggYXJlIHVubmVjZXNz
YXJ5IChiYWQgc2hhZG93IG9wLCBhbmQgdGhlIGVtcHR5Cj4gc3R1YnMgZm9yIGluY29ycmVjdCBz
aF9tYXBfYW5kX3ZhbGlkYXRlX2dsP2UoKSBjYWxscykuCgpEbyB5b3Ugbm90IHdhbnQgdG8gcmV0
YWluIHRoZSByZXNwZWN0aXZlIHByZWZpeGVzIChoYXAgZXJyb3IgLyBzaAplcnJvcik/IEkgdGhp
bmsgdGhleSBhcmUgdXNlZnVsIHRvIGEgZGVncmVlLiBCdXQgdGhlbiB5b3UgY2FuIGFscmVhZHkK
dGVsbCB3aGljaCBzdWJzeXN0ZW0gZ29lcyB3cm9uZyBieSBncmVwcGluZyB0aGUgZXJyb3IgbWVz
c2FnZSBpbiBjb2RlLgoKSW4gYW55IGNhc2UsIGNvZGUtd2lzZToKClJldmlld2VkLWJ5OiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
