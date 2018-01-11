From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: sidecar (hvm shim) creation script
Date: Thu, 11 Jan 2018 10:50:24 +0000
Message-ID: <ac841702-d14d-401e-2527-a1bf15d4a0c3@citrix.com>
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <20180109194351.mmbmjzwhptlkr5as@citrix.com>
 <20180110083224.cmgr7flxewhx5enf@MacBook-Pro-de-Roger.local>
 <20180110122734.rgut34iw6ltqeipy@citrix.com>
 <23126.4117.777031.227394@mariner.uk.xensource.com>
 <20180110131049.rv6emm32efbczhl2@citrix.com>
 <23126.11606.582758.38945@mariner.uk.xensource.com>
 <23126.13224.18254.699605@mariner.uk.xensource.com>
 <d113d4ce-3ee9-95b2-8f4e-77d0beef5674@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xcah=eg=citrix.com=prvs=54239b149=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1eZaRN-000192-Uc
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2018 10:50:33 +0000
In-Reply-To: <d113d4ce-3ee9-95b2-8f4e-77d0beef5674@cardoe.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, committers@xenproject.org, security@xenproject.org, Jan Beulich <JBeulich@suse.com>, Dario Faggioli <raistlin@linux.it>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTAvMjAxOCAxMTowOCBQTSwgRG91ZyBHb2xkc3RlaW4gd3JvdGU6Cj4gT24gMS8xMC8x
OCA5OjM5IEFNLCBJYW4gSmFja3NvbiB3cm90ZToKPj4gSWFuIEphY2tzb24gd3JpdGVzICgiUmU6
IHNpZGVjYXIgKGh2bSBzaGltKSBjcmVhdGlvbiBzY3JpcHQiKToKPj4+IEhlcmUgaXMgdGhlIGNv
bnZlcnRlciBzY3JpcHQgd2hlcmUgSSBqdXN0IGdvdCBteSBndWVzdCB0byBib290IHdpdGgKPj4+
IHRoZSBWaXhlbiBzaGltLCBhcyBidWlsdCBhbmQgcHJvdmlkZWQgYnkgV2VpLgo+Pgo+PiBBbmQg
aGVyZSBpcyBvbmUgd2hpY2ggaGFuZGxlcyB0aGUgZ3Vlc3QgY29uc29sZSBjb3JyZWN0bHkuICBW
aXhlbgo+PiBzZW5kcyB0aGUgTDIgZ3Vlc3QgY29uc29sZSB0byB0aGUgZW11bGF0ZWQgc2VyaWFs
LCBhbG9uZyB3aXRoIHRoZQo+PiBzaGltJ3Mgb3duIG91dHB1dC4KPj4KPj4KPiAKPiBTbywgbm90
IHRoYXQgSSBkb24ndCBsaWtlIGV4ZWN1dGluZyBhbm90aGVyIGxhbmd1YWdlIGludGVycHJldGVy
IGZyb20KPiBhbm90aGVyIGxhbmd1YWdlIGludGVycHJldGVyIChpbnNlcnQgeW9kYXdnIG1lbWUg
aGVyZSksIGJ1dCBob3cgd291bGQKPiB5b3UgZmVlbCBhYm91dCBhIFB5dGhvbiB2ZXJzaW9uPyBU
aGUgc3lzdGVtIEknbSBjdXJyZW50bHkgZGVhbGluZyB3aXRoCj4gbmVlZHMgdG8gaW1wb3J0IHRo
aXMgY29kZSBhcyBhIFB5dGhvbiBtb2R1bGUgc28gSSBmaWd1cmVkIEknZCBzbGFwIGEKPiBtYWlu
KCkgYW5kIHNvbWUgYXJncGFyc2Ugb24gaXQgYW5kIGl0IHNob3VsZCBiZSBnb29kLgoKRnJvbSB3
aGF0IEkgdW5kZXJzdGFuZCwgSWFuJ3MgZGVjaXNpb24gdHJlZSBsb29rZWQgbGlrZSB0aGlzOgoK
MS4gRm9yIHBhcnNpbmcgeGwuY2ZnLCB0aGUgb3B0aW9ucyBhcmUgInVzZSBweXRob24iIG9yICJ3
cml0ZSBhIGJyYW5kCm5ldyBwYXJzZXIgZm9yIHRoZSBweXRob24tbGlrZSB4bC5jZmcgc3ludGF4
Ii4gIFRoYXQncyBwcmV0dHkgbXVjaCBhCm5vLWJyYWluZXIuCgoyLiBHaXZlbiB0aGF0IHRoZSBh
aW0gb2YgdGhlIHNoaW0gaXMgdG8gaGFuZCB0byBwZW9wbGUgcnVubmluZyBzeXN0ZW1zCmFzIG9s
ZCBhcyBYZW4gMy40LCB0aGUgc2NyaXB0IG5lZWRzIHRvIHJ1biBpZGVudGljYWxseSwgd2l0aG91
dCBpc3N1ZSwKb24gYSB3aWRlIHJhbmdlIG9mIHN5c3RlbXMuICBJbiBoaXMgZXN0aW1hdGlvbiwg
aGlzIGFiaWxpdHkgdG8gd3JpdGUKc3VjaCAibG93ZXN0LWNvbW1vbi1kZW5vbWluYXRvciIgcGVy
bCB3YXMgbXVjaCBoaWdoZXIgdGhhbiBoaXMgYWJpbGl0eQp0byB3cml0ZSAibG93ZXN0LWNvbW1v
bi1kZW5vbWluYXRvciIgcHl0aG9uLgoKSWYgYW55b25lIHN0ZXBwZWQgdG8gd3JpdGUgYW5kIG1h
aW50YWluIGEgdmVyc2lvbiBvZiB0aGUgc2NyaXB0IHRoYXQgY2FuCnJ1biBhcyB3ZWxsIHVuZGVy
IFB5dGhvbiAyLjIgYXMgdW5kZXIgMi43LCBoZSdkIHByb2JhYmx5IGJlIGhhcHB5IHRvCmF2b2lk
IHVzaW5nIHRocmVlIGRpZmZlcmVudCBsYW5ndWFnZXMuCgogLUdlb3JnZQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
