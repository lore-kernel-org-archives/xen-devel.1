From: Juergen Gross <jgross@suse.com>
Subject: Re: Scheduling and the periodic timer
Date: Fri, 1 Feb 2019 10:59:26 +0100
Message-ID: <5e3d5840-9b7f-973b-749b-999731a34f45@suse.com>
References: <2c71ac06-9d04-475b-30bc-9f87c906391a@suse.com>
 <5C5416700200007800213132@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ulZE=QI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gpVbd-0001ys-OJ
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 09:59:29 +0000
In-Reply-To: <5C5416700200007800213132@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDIvMjAxOSAxMDo1MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDEuMDIuMTkg
YXQgMDg6MjYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBXaGlsZSB3b3JraW5nIG9uIG15
IGNvcmUgc2NoZWR1bGluZyBzZXJpZXMgSSBzdHVtYmxlZCBvdmVyIHRoZSBwZXJpb2RpYwo+PiB0
aW1lci4gQ291bGQgaXQgYmUgdGhpcyB0aW1lciBuZXZlciB3b3JrZWQgY29ycmVjdGx5Pwo+Pgo+
PiBXaGVuIHRoZSB2Y3B1IHdpdGggYW4gYWN0aXZlIHBlcmlvZGljIHRpbWVyIGlzIHJ1bm5pbmcg
ZXZlcnl0aGluZyBzZWVtcwo+PiB0byBiZSBmaW5lLiBCdXQgd2hlbiBub3QgcnVubmluZyB0aGUg
dGltZXIgaXMgc3RvcHBlZCBpbiBzY2hlZHVsZSgpLiBTbwo+PiBhIHZjcHUgZ29pbmcgdG8gaWRs
ZSByZWx5aW5nIHRvIGJlIHdva2VuIHVwIGJ5IHRoZSBwZXJpb2RpYyB0aW1lciB3aWxsCj4+IHJl
bWFpbiBzbGVlcGluZyB1bnRpbCBhbm90aGVyIGV2ZW50IGlzIGhhcHBlbmluZy4gVGhlIHBlcmlv
ZGljIHRpbWVyCj4+IHdvbid0IGZpcmUgYXMgaXQgaXMgc3RvcHBlZC4KPj4KPj4gVGhlIHBlcmlv
ZGljIHRpbWVyIGlzIHVzZWQgdmlhIFZDUFVPUF9zZXRfcGVyaW9kaWNfdGltZXIgb25seSwgYW5k
Cj4+IHRvZGF5J3MgTGludXgga2VybmVsIGlzbid0IHVzaW5nIGl0IGF0IGFsbC4gU28gSSBndWVz
cyB0aGlzIHRpbWVyIG5vdAo+PiByZWFsbHkgd29ya2luZyBhcyBpdCBzaG91bGQgaXMgbm8gYmln
IGlzc3VlLgo+IAo+IEludGVyZXN0aW5nLiBPdXIga2VybmVscyBoYXZlIGJlZW4gdXNpbmcgaXQg
dW50aWwgU0xFMTEgU1AxLCBhcwo+IGRpZCB0aGUgb2xkIDIuNi4xOCBvbmUgdGhhdCBhbGwgb2Yg
b3VyIG9sZCBrZXJuZWxzIHdlcmUgZGVyaXZlZAo+IGZyb20uIFlldCB0aGUgc2FtZSBjb2RlIGlz
IHByZXNlbnQgYWxyZWFkeSBpbiAzLjIuMCdzIHNjaGVkdWxlKCkuCj4gQXJlIHlvdSBzdXJlIHRo
aXMgdGltZXIgaXMgbWVhbnQgdG8gd2FrZSB0aGUgdkNQVSBhdCB0aGUgc2V0Cj4gcmF0ZSwgcmF0
aGVyIHRoYW4ganVzdCBzdXJmYWNpbmcgZXZlbnRzIGlmIHRoZSB2Q1BVIGlzIHJ1bm5pbmc/Cj4g
TG9va2luZyBhdCB2Y3B1X3BlcmlvZGljX3RpbWVyX3dvcmsoKSdzIGNhbGN1bGF0aW9uIG9mIHRo
ZQo+IG5leHQgZXZlbnQgdGltZSBhbHNvIHN1Z2dlc3RzIHRvIG1lIHRoYXQgdGhlcmUncyBubyBn
dWFyYW50ZWUKPiB0aGF0IHRoZSBldmVudCB3aWxsIGluZGVlZCBzdXJmYWNlIGF0IHRoZSBzZXQg
cmF0ZS4KClRoYXQncyBjb3JyZWN0LiBUaGUgc2V0IHJhdGUganVzdCBpcyB0aGUgbWluaW11bSB0
aW1lIGJldHdlZW4gdHdvCmludGVycnVwdHMuCgpUaGUgdXNhYmlsaXR5IG9mIHN1Y2ggYSB0aW1l
ciBpcyBxdWVzdGlvbmFibGUgaW4gdGhlIGJlc3QgY2FzZSBJTU8uCgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
