From: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [RFC 0/2] To introduce xenwatch multithreading (xen
 mtwatch)
Date: Tue, 24 Apr 2018 13:52:48 +0800
Message-ID: <9a91b19a-5556-f1ea-92d5-29f2baa0ccd5__21073.5151697465$1524548986$gmane$org@oracle.com>
References: <1523100355-27647-1-git-send-email-dongli.zhang@oracle.com>
 <20180423140911.bihiwfwtlneobgzd@citrix.com>
 <6c379249-886d-76ee-db9c-942967b23d80@oracle.com>
 <db08fec6-5648-4d87-4ace-2f42d1d04479@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/+ts=hn=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1fAqqy-0004Rd-UQ
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 05:51:01 +0000
In-Reply-To: <db08fec6-5648-4d87-4ace-2f42d1d04479@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, ian.jackson@eu.citrix.com, linux-kernel@vger.kernel.org, srinivas.eeda@oracle.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, Joao Martins <joao.m.martins@oracle.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSnVlcmdlbiwKCk9uIDA0LzI0LzIwMTggMDE6MjIgUE0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6
Cj4gT24gMjQvMDQvMTggMDE6NTUsIERvbmdsaSBaaGFuZyB3cm90ZToKPj4gSGkgV2VpLAo+Pgo+
PiBPbiAwNC8yMy8yMDE4IDEwOjA5IFBNLCBXZWkgTGl1IHdyb3RlOgo+Pj4gT24gU2F0LCBBcHIg
MDcsIDIwMTggYXQgMDc6MjU6NTNQTSArMDgwMCwgRG9uZ2xpIFpoYW5nIHdyb3RlOgo+Pj4+IEFi
b3V0IHBlci1kb21VIHhlbndhdGNoIHRocmVhZCBjcmVhdGUvZGVzdHJveSwgYSBuZXcgdHlwZSBv
ZiB4ZW5zdG9yZSBub2RlIGlzCj4+Pj4gaW50cm9kdWNlZDogJy9sb2NhbC9kb21haW4vMC9tdHdh
dGNoLzxkb21pZD4nLgo+Pj4+Cj4+Pj4gU3VwcG9zZSB0aGUgbmV3IGRvbWlkIGlkIDcuIER1cmlu
ZyB0aGUgZG9tVSAoZG9taWQ9NykgY3JlYXRpb24sIHRoZSB4ZW4KPj4+PiB0b29sc3RhY2sgd3Jp
dGVzICcvbG9jYWwvZG9tYWluLzAvbXR3YXRjaC83JyB0byB4ZW5zdG9yZSBiZWZvcmUgdGhlIGlu
c2VydGlvbgo+Pj4+IG9mICcvbG9jYWwvZG9tYWluLzcnLiBXaGVuIHRoZSBkb21pZD03IGlzIGRl
c3Ryb3llZCwgdGhlIGxhc3QgeGVuc3RvcmUKPj4+PiBvcGVyYXRpb24gYnkgeGVuIHRvb2xzdGFj
ayBpcyB0byByZW1vdmUgJy9sb2NhbC9kb21haW4vMC9tdHdhdGNoLzcnLgo+Pj4+Cj4+Pj4gVGhl
IGRvbTAga2VybmVsIHN1YnNjcmliZXMgYSB3YXRjaCBhdCBub2RlICcvbG9jYWwvZG9tYWluLzAv
bXR3YXRjaCcuICBLZXJuZWwKPj4+PiB0aHJlYWQgW3hlbi1tdHdhdGNoLTddIGlzIGNyZWF0ZWQg
d2hlbiAnL2xvY2FsL2RvbWFpbi8wL210d2F0Y2gvNycgaXMgaW5zZXJ0ZWQsCj4+Pj4gd2hpbGUg
dGhpcyBrZXJuZWwgdGhyZWFkIGlzIGRlc3Ryb3llZCB3aGVuIHRoZSBjb3JyZXNwb25kaW5nIHhl
bnN0b3JlIG5vZGUgaXMKPj4+PiByZW1vdmVkLgo+Pj4KPj4+IEluc3RlYWQgb2YgaW52ZW50aW5n
IHlldCBhbm90aGVyIG5vZGUsIGNhbiB5b3Ugbm90IHdhdGNoIC9sb2NhbC9kb21haW4KPj4+IGRp
cmVjdGx5Pwo+Pgo+PiBXb3VsZCB5b3UgbGlrZSB0byB3YXRjaCBhdCAvbG9jYWwvZG9tYWluIGRp
cmVjdGx5PyBPciBpcyB5b3VyIHF1ZXN0aW9uICJpcyB0aGVyZQo+PiBhbnkgb3RoZXIgd2F5IHRv
IG5vdCB3YXRjaCBhdCAvbG9jYWwvZG9tYWluLCB3aGlsZSBubyBleHRyYSB4ZW5zdG9yZSBub2Rl
IHdpbGwKPj4gYmUgaW50cm9kdWNlZCI/Cj4+Cj4+IEFjdHVhbGx5LCB0aGUgZmlyc3QgcHJvdG90
eXBlIG9mIHRoaXMgaWRlYSB3YXMgdG8gd2F0Y2ggYXQgL2xvY2FsL2RvbWFpbgo+PiBkaXJlY3Rs
eSB0byBnZXQgYXdhcmUgb2YgdGhlIGRvbVUgY3JlYXRlL2Rlc3Ryb3ksIHNvIHRoYXQgeGVuIHRv
b2xzdGFjayB3aWxsIG5vdAo+PiBnZXQgaW52b2x2ZWQuIEpvYW8gTWFydGlucyAoQ0NlZCkgaGFk
IGEgY29uY2VybiBvbiB0aGUgcGVyZm9ybWFuY2UgYXMgd2F0Y2hpbmcKPj4gYXQgL2xvY2FsL2Rv
bWFpbiB3b3VsZCBsZWFkIHRvIGxhcmdlIGFtb3VudCBvZiB4ZW53YXRjaCBldmVudHMuCj4gCj4g
VGhhdCdzIHdoYXQgdGhlIHNwZWNpYWwgd2F0Y2hlcyAiQGludHJvZHVjZURvbWFpbiIgYW5kICJA
cmVsZWFzZURvbWFpbiIKPiBhcmUgbWVhbnQgZm9yLgoKSSB1c2VkIHRvIGNvbnNpZGVyIHRvIHdh
dGNoIGF0ICJAaW50cm9kdWNlRG9tYWluIi4gSG93ZXZlciwgdGhlcmUgaXMgbm8gZG9tYWluCmlu
Zm9ybWF0aW9uIGFwcGVuZGVkIHdpdGggIkBpbnRyb2R1Y2VEb21haW4iIGFuZCBpdCBpcyBzdGls
bCByZXF1aXJlZCBmb3IgZG9tMAprZXJuZWwgdG8gcHJvYWN0aXZlbHkgY29uZmlybSB3aG8gaXMg
Y3JlYXRlZC4KCkRvbmdsaSBaaGFuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
