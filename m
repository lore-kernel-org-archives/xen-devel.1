From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH] x86/mm: Drop {HAP,SHADOW}_ERROR() wrappers
Date: Thu, 30 Aug 2018 09:04:15 +0100
Message-ID: <20180830080415.GA7308@deinos.phlegethon.org>
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

QXQgMTk6MTEgKzAxMDAgb24gMjggQXVnICgxNTM1NDgzNTE0KSwgQW5kcmV3IENvb3BlciB3cm90
ZToKPiBVbmxpa2UgdGhlIFBSSU5USy9ERUJVRyB3cmFwcGVycywgdGhlc2UgZ28gc3RyYWlnaHQg
b3V0IHRvIHRoZSBjb25zb2xlLCByYXRoZXIKPiB0aGFuIGVuZGluZyB1cCBpbiB0aGUgZGVidWd0
cmFjZSBidWZmZXIuCj4gCj4gQSBudW1iZXIgb2YgdGhlc2UgdXNlcnMgYXJlIGZvbGxvd2VkIGJ5
IGRvbWFpbl9jcmFzaCgpLCBhbmQgZnV0dXJlIGNoYW5nZXMKPiB3aWxsIHdhbnQgdG8gY29tYmlu
ZSB0aGUgcHJpbnRrKCkgaW50byB0aGUgZG9tYWluX2NyYXNoKCkgY2FsbC4gIEV4cGFuZCB0aGVz
ZQo+IHdyYXBwZXJzIGluIHBsYWNlLCB1c2luZyBYRU5MT0dfRVJSIGJlZm9yZSBhIEJVRygpLCBh
bmQgWEVOTE9HX0dfRVJSIGJlZm9yZSBhCj4gZG9tYWluX2NyYXNoKCkuCj4gCj4gUGVyZm9tIHNv
bWUgJXB2L1BSSV9tZm4vZXRjIGNsZWFudXAgd2hpbGUgbW9kaWZ5aW5nIHRoZSBpbnZvY2F0aW9u
cywgYW5kCj4gZXhwbGljaXRseSBkcm9wIHNvbWUgY2FsbHMgd2hpY2ggYXJlIHVubmVjZXNzYXJ5
IChiYWQgc2hhZG93IG9wLCBhbmQgdGhlIGVtcHR5Cj4gc3R1YnMgZm9yIGluY29ycmVjdCBzaF9t
YXBfYW5kX3ZhbGlkYXRlX2dsP2UoKSBjYWxscykuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiAgVGltIERlZWdh
biA8dGltQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
