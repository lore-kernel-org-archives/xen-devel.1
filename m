From: Kevin Wolf <kwolf@redhat.com>
Subject: xen_disk qdevification (was: [PATCH 0/3] Performance
 improvements for xen_disk v2)
Date: Fri, 2 Nov 2018 12:04:12 +0100
Message-ID: <20181102110412.GD7521__31861.2361945727$1541156582$gmane$org@dhcp-200-186.str.redhat.com>
References: <154115285434.11300.8459925605672823399.stgit@dhcp-3-135.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=8rrq=nn=redhat.com=kwolf@srs-us1.protection.inumbo.net>)
 id 1gIXFR-0000jE-DG
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 11:04:17 +0000
Content-Disposition: inline
In-Reply-To: <154115285434.11300.8459925605672823399.stgit@dhcp-3-135.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tim Smith <tim.smith@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Paul Durrant <Paul.Durrant@citrix.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

QW0gMDIuMTEuMjAxOCB1bSAxMTowMCBoYXQgVGltIFNtaXRoIGdlc2NocmllYmVuOgo+IEEgc2Vy
aWVzIG9mIHBlcmZvcm1hbmNlIGltcHJvdmVtZW50cyBmb3IgZGlza3MgdXNpbmcgdGhlIFhlbiBQ
ViByaW5nLgo+IAo+IFRoZXNlIGhhdmUgaGFkIGZhaXJseSBleHRlbnNpdmUgdGVzdGluZy4KPiAK
PiBUaGUgYmF0Y2hpbmcgYW5kIGxhdGVuY3kgaW1wcm92ZW1lbnRzIHRvZ2V0aGVyIGJvb3N0IHRo
ZSB0aHJvdWdocHV0Cj4gb2Ygc21hbGwgcmVhZHMgYW5kIHdyaXRlcyBieSB0d28gdG8gc2l4IHBl
cmNlbnQgKG1lYXN1cmVkIHVzaW5nIGZpbwo+IGluIHRoZSBndWVzdCkKPiAKPiBBdm9pZGluZyBy
ZXBlYXRlZCBjYWxscyB0byBwb3NpeF9tZW1hbGlnbigpIHJlZHVjZWQgdGhlIGRpcnR5IGhlYXAK
PiBmcm9tIDI1TUIgdG8gNU1CIGluIHRoZSBjYXNlIG9mIGEgc2luZ2xlIGRhdGFwYXRoIHByb2Nl
c3Mgd2hpbGUgYWxzbwo+IGltcHJvdmluZyBwZXJmb3JtYW5jZS4KPiAKPiB2MiByZW1vdmVzIHNv
bWUgY2hlY2twYXRjaCBjb21wbGFpbnRzIGFuZCBmaXhlcyB0aGUgQ0NzCgpDb21wbGV0ZWx5IHVu
cmVsYXRlZCwgYnV0IHNpbmNlIHlvdSdyZSB0aGUgZmlyc3QgcGVyc29uIHRvdWNoaW5nCnhlbl9k
aXNrIGluIGEgd2hpbGUsIHlvdSdyZSBteSB2aWN0aW06CgpBdCBLVk0gRm9ydW0gd2UgZGlzY3Vz
c2VkIHNlbmRpbmcgYSBwYXRjaCB0byBkZXByZWNhdGUgeGVuX2Rpc2sgYmVjYXVzZQphZnRlciBh
bGwgdGhvc2UgeWVhcnMsIGl0IHN0aWxsIGhhc24ndCBiZWVuIGNvbnZlcnRlZCB0byBxZGV2LiBN
YXJrdXMgaXMKY3VycmVudGx5IGZpeGluZyBzb21lIG90aGVyIG5vdCB5ZXQgcWRldmlmaWVkIGJs
b2NrIGRldmljZSwgYnV0IGFmdGVyCnRoYXQgeGVuX2Rpc2sgd2lsbCBiZSB0aGUgb25seSBvbmUg
bGVmdC4KCkEgd2hpbGUgYWdvLCBhIGRvd25zdHJlYW0gcGF0Y2ggcmV2aWV3IGZvdW5kIG91dCB0
aGF0IHRoZXJlIGFyZSBzb21lIFFNUApjb21tYW5kcyB0aGF0IHdvdWxkIGltbWVkaWF0ZWx5IGNy
YXNoIGlmIGEgeGVuX2Rpc2sgZGV2aWNlIHdlcmUgcHJlc2VudApiZWNhdXNlIG9mIHRoZSBsYWNr
aW5nIHFkZXZpZmljYXRpb24uIFRoaXMgaXMgbm90IHRoZSBjb2RlIHF1YWxpdHkKc3RhbmRhcmQg
SSBlbnZpc2lvbiBmb3IgUUVNVS4gSXQncyB0aW1lIGZvciBub24tcWRldiBkZXZpY2VzIHRvIGdv
LgoKU28gaWYgeW91IGd1eXMgYXJlIHN0aWxsIGludGVyZXN0ZWQgaW4gdGhlIGRldmljZSwgY291
bGQgc29tZW9uZSBwbGVhc2UKZmluYWxseSBsb29rIGludG8gY29udmVydGluZyBpdD8KCktldmlu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
