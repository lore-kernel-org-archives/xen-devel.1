From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 09/17] x86/amd: put setting
 pv_post_outb_hook under CONFIG_PV
Date: Mon, 29 Oct 2018 12:41:56 +0100
Message-ID: <20181029114156.tsz7c2oqes7huaym@mac.bytemobile.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
 <f1fafccc6ba352431e3ba72e834fd37e37b9eb9e.1538667753.git-series.wei.liu2@citrix.com>
 <5BC0AC4C02000078001F1097@prv1-mh.provo.novell.com>
 <20181015111924.lkjcwk7oodihz5z4@mac.bytemobile.com>
 <5BD18B4902000078001F4897@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1jzp=nj=citrix.com=prvs=833c16dc3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gH5vs-00080b-09
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 11:42:08 +0000
Content-Disposition: inline
In-Reply-To: <5BD18B4902000078001F4897@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBPY3QgMjUsIDIwMTggYXQgMDM6MjI6MTdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE1LjEwLjE4IGF0IDEzOjE5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gRnJpLCBPY3QgMTIsIDIwMTggYXQgMDg6MTQ6MzZBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDA0LjEwLjE4IGF0IDE3OjQzLCA8d2VpLmxpdTJAY2l0
cml4LmNvbT4gd3JvdGU6Cj4gPj4gPiBJdCBpcyB1c2VkIGJ5IFBWIGNvZGUgb25seS4KPiA+PiAK
PiA+PiBBbmQgd3JvbmdseSBzbyAtIHRoZSBzYW1lIGlzIG5lZWRlZCBmb3IgYSBQVkggRG9tMCBh
ZmFpY3QuCj4gPiAKPiA+IFllcywgbG9va2luZyBhdCB0aGUgbW9kZWxzIGFmZmVjdGVkIGJ5IHRo
aXMgaXNzdWUgYWNjb3JkaW5nIHRvCj4gPiBpbml0X2FtZCBpdCBzZWVtcyB0byBjb3ZlciB0aGUg
ZnVsbCBBTUQgbGluZSAoZnJvbSBmYW1pbHkgMHhmIHRvCj4gPiAweDE3KS4gSSBkb24ndCBzZWVt
IHRvIGZpbmQgYSByZWZlcmVuY2UgaW4gdGhlIGNvZGUgdG8gdGhlIEVycmF0YSwgZG8KPiA+IHlv
dSBrbm93IGlmIHRoZXJlJ3Mgc29tZSBmb3JtYWwgZGVzY3JpcHRpb24gb2YgaXQ/Cj4gCj4gSSBk
b24ndCByZWNhbGwgdGhpcyBoYXZpbmcgYmVlbiBjb25zaWRlcmVkIGFuIGVycmF0dW0uCj4gCj4g
Q2hlY2tpbmcganVzdCB0aGUgRmFtMTAgYW5kIEZhbTE1IEJLREdzLCBJJ20gZ2V0dGluZyB0aGUK
PiBpbXByZXNzaW9uIHRoYXQgRmFtMTUgZG9lcyBub3QgaGF2ZSB0aGUgaXNzdWUgd29ya2VkIGFy
b3VuZAo+IGhlcmUuIEl0IG1pZ2h0IGZ1cnRoZXIgYmUgdGhhdCBub3QgZXZlbiBhbGwgRmFtMTAg
c3RlcHBpbmdzIGFyZQo+IGFmZmVjdGVkLiBCcmlhbiAtIGFueSBjaGFuY2UgeW91IGNvdWxkIGNs
YXJpZnkgdGhpcyBmb3IgdXM/Cj4gCj4gSW5kZXBlbmRlbnQgb2YgdGhlIHJhbmdlIG9mIHN5c3Rl
bXMgYWZmZWN0ZWQgSSBzdGlsbCB0aGluayB0aGF0Cj4gUFZIIERvbTAgYmVoYXZpb3IgaGVyZSBv
dWdodCB0byBiZSB0aGUgc2FtZSBhcyBQViBEb20wJ3MuCgpQb3N0ZWQgYSBzZXJpZXMgYmVmb3Jl
IGdvaW5nIG9uIFBUTyB0aGF0IGNvbnRhaW5zIGEgcGF0Y2ggdG8gYWRkIHRoaXMKYmVoYXZpb3Ig
dG8gUFZIIERvbTA6CgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwv
eGVuLWRldmVsLzIwMTgtMTAvbXNnMDE1NTguaHRtbAoKUmVnYXJkbGVzcyBvZiB0aGUgY2xhcmlm
aWNhdGlvbiBvbiB0aGUgYWZmZWN0ZWQgbW9kZWxzIHRoZSBwYXRjaApzaGFyZXMgdGhlIGRldGVj
dGlvbiBsb2dpYyBiZXR3ZWVuIFBWIGFuZCBQVkgsIHNvIGl0IGNhbiBiZSBlYXNpbHkKbW9kaWZp
ZWQgYWZ0ZXJ3YXJkcyB0byBuYXJyb3cgdGhlIHNjb3BlIG9mIHRoZSB3b3JrYXJvdW5kIGlmIHJl
cXVpcmVkLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
