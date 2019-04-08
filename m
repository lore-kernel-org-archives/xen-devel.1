From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] xen/timers: Fix memory leak with cpu
 unplug/plug
Date: Mon, 8 Apr 2019 11:47:17 +0100
Message-ID: <ddb84ed5-b986-a9eb-be71-e3d0b5060cad@citrix.com>
References: <1554716396-3764-1-git-send-email-andrew.cooper3@citrix.com>
 <5394e8aa-bae4-8a27-327a-b0dcd0996477@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5394e8aa-bae4-8a27-327a-b0dcd0996477@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDQvMjAxOSAxMTozOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+Cj4gT24gNC84
LzE5IDEwOjM5IEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiArwqDCoMKgIGNhc2UgQ1BVX1JF
U1VNRV9GQUlMRUQ6Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoICFwYXJrX29mZmxpbmVfY3B1cyAm
JiBzeXN0ZW1fc3RhdGUgIT0gU1lTX1NUQVRFX3N1c3BlbmQgKQo+Cj4gVGhpcyBwYXRjaCBicmVh
a3MgY29tcGlsYXRpb24gb24gYXJtMzIvYXJtNjQgYmVjYXVzZSBwYXJrX29mZmxpbmVfY3B1cwo+
IGlzIG5vdCBkZWZpbmVkOgo+Cj4gdGltZXIuYzogSW4gZnVuY3Rpb24gJ2NwdV9jYWxsYmFjayc6
Cj4gdGltZXIuYzo2NTE6MTU6IGVycm9yOiAncGFya19vZmZsaW5lX2NwdXMnIHVuZGVjbGFyZWQg
KGZpcnN0IHVzZSBpbgo+IHRoaXMgZnVuY3Rpb24pCj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAoICFw
YXJrX29mZmxpbmVfY3B1cyAmJiBzeXN0ZW1fc3RhdGUgIT0gU1lTX1NUQVRFX3N1c3BlbmQgKQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+fn5+fn4KPgo+IFdoYXQg
aXMgdGhlIHB1cnBvc2Ugb2YgcGFya19vZmZsaW5lX2NwdXM/CgpTb3JyeS7CoCBJIHNob3VsZCBo
YXZlIHdhaXRlZCBmb3IgYSBmdWxsIGJ1aWxkIHRlc3QgZmlyc3QuCgpwYXJrX29mZmxpbmVfY3B1
cyBpcyBhIHdvcmthcm91bmQgZm9yIEludGVsJ3MgTUNFIGJlaGF2aW91ciwgd2hlcmUgdGhlCnN5
c3RlbSB3aWxsIHNodXQgZG93biByYXRoZXIgdGhhbiBkZWxpdmVyIGFuICNNQyBpZiBtYWNoaW5l
IGNoZWNraW5nCmlzbid0IGNvbmZpZ3VyZWQgb24gYWxsIENQVXMuCgpBcyBhIHJlc3VsdCwgd2Ug
aGF2ZSB0byBzdGFydCBhbGwgQ1BVcywgZXZlbiBiZXlvbmQgbWF4Y3B1cz0gYW5kIHNldCB1cApt
YWNoaW5lIGNoZWNrIGhhbmRsaW5nLCBhbmQgbmV2ZXIgZXZlciBmcmVlIHRoZWlyIHN0YWNrcywg
ZXZlbiBpZiB3ZSdkCnByZWZlciB0aGUgQ1BVcyB0byBiZSBvZmZsaW5lLgoKQXJlIHlvdSBoYXBw
eSB3aXRoIGEKCiNkZWZpbmUgcGFya19vZmZsaW5lX2NwdXMgZmFsc2UKCmluIEFSTT8KCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
