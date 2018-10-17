From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] Reservation of PCI device range
 0xc200-0xc2ff to XCP-ng Project
Date: Wed, 17 Oct 2018 17:33:45 +0100
Message-ID: <20181017163345.n3iitpa3nb4s56rm@zion.uk.xensource.com>
References: <0d7eee26-529d-a900-92d4-9414bfd43eb4@schulzalex.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aaoo=m5=citrix.com=prvs=821d74b27=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gCola-0000yj-G1
 for xen-devel@lists.xenproject.org; Wed, 17 Oct 2018 16:33:50 +0000
Content-Disposition: inline
In-Reply-To: <0d7eee26-529d-a900-92d4-9414bfd43eb4@schulzalex.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexander Schulz - XCP-ng Project Member <code@schulzalex.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMTYsIDIwMTggYXQgMTA6Mjg6MDRQTSArMDIwMCwgQWxleGFuZGVyIFNjaHVs
eiAtIFhDUC1uZyBQcm9qZWN0IE1lbWJlciB3cm90ZToKPiBXZSBhcmUgdGhlIFhDUC1uZyBwcm9q
ZWN0IChodHRwczovL3hjcC1uZy5vcmcpIGFuZCB3YW50IHRvIGRpc3RyaWJ1dGUgb3VyCj4gb3du
IFBWLVRvb2xzIChtYXliZSBhbHNvIHBlciB3aW5kb3dzIHVwZGF0ZXMpIHNvIHdlIG5lZWQgYW4g
ZXh0cmEgcmFuZ2UuCj4gCj4gV2UgYWxzbyByZWdpc3RlcmVkIGEgUENJLURldmljZToKPiAKPiAi
WENQLW5nIFByb2plY3QgUENJIERldmljZSBmb3IgV2luZG93cyBVcGRhdGUiIC0+Cj4gaHR0cHM6
Ly9wY2ktaWRzLnVjdy5jei9yZWFkL1BDLzU4NTMvYzIwMAo+IAo+IFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRlciBTY2h1bHogPGNvZGVAc2NodWx6YWxleC5kZT4KCkkgdGhpbmsgeW91ciBlbWFpbCBj
bGllbnQgLyBzZXJ2ZXIgaGFzIG1hbmdsZWQgdGhpcyBwYXRjaCBiYWRseS4gQXMgSWFuCm9ic2Vy
dmVkLCBpdCB3b3VsZG4ndCBhcHBseS4KCkFueXdheSwgaW4gdGhlIGludGVyZXN0IG9mIGF2b2lk
aW5nIGFub3RoZXIgcm91bmQgb2YgcG9zdGluZywgSSBoYXZlCmZpeGVkIHVwIHRoZSBwYXRjaCBh
bmQgY29tbWl0IGl0IGZvciB5b3UuCgpXZWkuCgo+IC0tLQo+ICBkb2NzL21hbi94ZW4tcGNpLWRl
dmljZS1yZXNlcnZhdGlvbnMucG9kLjcgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RvY3MvbWFuL3hlbi1wY2ktZGV2aWNlLXJlc2VydmF0
aW9ucy5wb2QuNwo+IGIvZG9jcy9tYW4veGVuLXBjaS1kZXZpY2UtcmVzZXJ2YXRpb25zLnBvZC43
Cj4gaW5kZXggMDQ5ZTQ3NDEwZi4uMWNkNWEzZTExNSAxMDA2NDQKPiAtLS0gYS9kb2NzL21hbi94
ZW4tcGNpLWRldmljZS1yZXNlcnZhdGlvbnMucG9kLjcKPiArKysgYi9kb2NzL21hbi94ZW4tcGNp
LWRldmljZS1yZXNlcnZhdGlvbnMucG9kLjcKPiBAQCAtNDEsNiArNDEsNyBAQCBtdWx0aXBsZSBY
ZW4gdmVuZG9ycyB1c2luZyBjb25mbGljdGluZyBJRHMuCj4gICAgICAweDAwMDIgICAgICAgIHwg
Q2l0cml4IFhlblNlcnZlciAoZ3JhbmRmYXRoZXJlZCBhbGxvY2F0aW9uIGZvcgo+IFhlblNlcnZl
ciA2LjEpCj4gICAgICAweGMwMDAtMHhjMGZmIHwgQ2l0cml4IFhlblNlcnZlcgo+ICAgICAgMHhj
MTAwLTB4YzFmZiB8IENpdHJpeCBYZW5DbGllbnQKPiArICAgICAweGMyMDAtMHhjMmZmIHwgWENQ
LW5nIFByb2plY3QgKGh0dHBzOi8veGNwLW5nLm9yZykKPiAgID1oZWFkMSBOb3Rlcwo+ICAtLSAy
LjE3LjEud2luZG93cy4yCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
