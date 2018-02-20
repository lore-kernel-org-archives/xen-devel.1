From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 3/5] x86/time: Rework pv_soft_rdtsc() to aid
 further cleanup
Date: Tue, 20 Feb 2018 15:32:15 +0000
Message-ID: <20180220153215.qmgkdjd2wpvaryku@citrix.com>
References: <1519127923-23539-1-git-send-email-andrew.cooper3@citrix.com>
 <1519127923-23539-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1519127923-23539-4-git-send-email-andrew.cooper3@citrix.com>
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

T24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMTE6NTg6NDFBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBIYXZpbmcgcHZfc29mdF9yZHRzYygpIGVtdWxhdGUgYWxsIHBhcnRzIG9mIGFuIHJk
dHNjcCBpcyBhd2t3YXJkLCBhbmQgZ2V0cyBpbgo+IHRoZSB3YXkgb2Ygc29tZSBpbnRlbmRlZCBj
bGVhbnVwLgo+IAo+ICAqIERyb3AgdGhlIHJkdHNjcCBwYXJhbWV0ZXIgYW5kIGFsd2F5cyBtYWtl
IHRoZSBjYWxsZXIgcmVzcG9uc2libGUgZm9yIGVjeAo+ICAgIHVwZGF0ZXMgd2hlbiBhcHByb3By
aWF0ZS4KPiAgKiBTd2l0Y2ggdGhlIGZ1bmN0aW9uIGZyb20gYmVpbmcgdm9pZCwgYW5kIHJldHVy
biB0aGUgbWFpbiB0aW1lc3RhbXAgaW4gdGhlCj4gICAgcmV0dXJuIHZhbHVlLgo+IAo+IFRoZSBy
ZWdzIHBhcmFtZXRlciBpcyBzdGlsbCBuZWVkZWQsIGJ1dCBvbmx5IGZvciB0aGUgc3RhdHMgY29s
bGVjdGlvbiwgb25jZQo+IGFnYWluIGJyaW5naW5nIGludG8gcXVlc3Rpb24gdGhlaXIgdXRpbGl0
eS4gIFRoZSBwYXJhbWV0ZXIgY2FuIGhvd2V2ZXIgc3dpdGNoCj4gdG8gYmVpbmcgY29uc3QuCj4g
Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
