From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 01/16] checkpatch: Add xendevicemodel_handle
 to the list of types
Date: Thu, 26 Apr 2018 12:06:51 +0100
Message-ID: <23265.45771.760936.993507@mariner.uk.xensource.com>
References: <1524592709-6553-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524592709-6553-2-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pghr=hp=citrix.com=prvs=647a3a28a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fBejo-0008LN-V5
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 11:06:56 +0000
In-Reply-To: <1524592709-6553-2-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano  Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, Markus Armbruster <armbru@redhat.com>
List-Id: xen-devel@lists.xenproject.org

KGV4cGFuZGluZyB0aGUgQ0MgdG8gaW5jbHVkZSBldmVyeW9uZSB0aGF0IGdldF9tYWludGFpbmVy
IHN1Z2dlc3RzKQoKSWFuIEphY2tzb24gd3JpdGVzICgiW1BBVENIIDAxLzE2XSBjaGVja3BhdGNo
OiBBZGQgeGVuZGV2aWNlbW9kZWxfaGFuZGxlIHRvIHRoZSBsaXN0IG9mIHR5cGVzIik6Cj4gVGhp
cyBhdm9pZHMgY2hlY2twYXRjaCBtaXNwYXJzaW5nIChhcyBzdGF0ZW1lbnRzKSBsb25nIGZ1bmN0
aW9uCj4gZGVmaW5pdGlvbnMgb3IgZGVjbGFyYXRpb25zLCB3aGljaCBzb21ldGltZXMgc3RhcnQg
d2l0aCBjb25zdHJ1Y3RzCj4gbGlrZSB0aGlzOgo+IAo+ICAgc3RhdGljIGlubGluZSBpbnQgeGVu
ZGV2aWNlbW9kZWxfcmVsb2NhdGVfbWVtb3J5KAo+ICAgICAgIHhlbmRldmljZW1vZGVsX2hhbmRs
ZSAqZG1vZCwgZG9taWRfdCBkb21pZCwgLi4uCj4gCj4gVGhlIHR5cGUgeGVuZGV2aWNlbW9kZWxf
aGFuZGxlIGRvZXMgbm90IGNvbmZvcm0gdG8gUWVtdSBDT0RJTkdfU1RZTEUsCj4gd2hpY2ggd291
bGQgc3VnZ2VzdCBDYW1lbENhc2UuICBIb3dldmVyLCBpdCBpcyBhIHR5cGUgZGVmaW5lZCBieSB0
aGUKPiBYZW4gUHJvamVjdCBpbiB4ZW4uZ2l0LiAgSXQgd291bGQgYmUgcG9zc2libGUgdG8gaW50
cm9kdWNlIGEgdHlwZWRlZgo+IHRvIGFsbG93IHRoZSBxZW11IGNvZGUgdG8gcmVmZXIgdG8gaXQg
YnkgYSBkaWZmZXJlbnRseS1zcGVsbGVkIG5hbWUsCj4gYnV0IHRoYXQgd291bGQgb2JmdXNjYXRl
IG1vcmUgdGhhbiBpdCB3b3VsZCBjbGFyaWZ5LgoKVGhpcyBwYXRjaCBoYXMgYmVlbiBwb3N0ZWQg
aW4gc3Vic3RhbnRpYWxseSBzaW1pbGFyIGZvcm0gcXVpdGUgYSBmZXcKdGltZXMgbm93LiAgUGFv
bG8gQm9uemluaSB1bmRlcnN0YW5kYWJseSBzdWdnZXN0ZWQgdGhhdCByZW5hbWluZyB0aGUKdmFy
aWFibGUgd291bGQgYmUgYmV0dGVyIGJ1dCB0aGF0J3Mgbm90IHdpdGhpbiBxZW11J3MgYmFpbGl3
aWNrIGFzIEkKc2F5IGFib3ZlLgoKSSB0aGluayBldmVyeXRoaW5nIGVsc2UgaW4gdGhpcyBzZXJp
ZXMgaGFzIGEgcmV2aWV3IGFuZC9vciBhbiBhY2suClNvIEkgd291bGQgbGlrZSB0byBzZW5kIGEg
cHVsbCByZXF1ZXN0LgoKRG9lcyBzb21lb25lIHdhbnQgdG8gcmV2aWV3IHRoaXMgcGF0Y2ggPyAg
U2hvdWxkIEkgZHJvcCBpdCBhbmQganVzdApsZXQgY2hlY2twYXRjaCBjb21wbGFpbiA/ICBTaG9s
ZCBJIGluY2x1ZGUgaXQgaW4gbXkgcHVsbCByZXF1ZXN0CmFueXdheSA/CgpUaGFua3MsCklhbi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
