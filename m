From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 01/12] checkpatch: Add xendevicemodel_handle
 to the list of types
Date: Tue, 13 Mar 2018 16:11:00 +0100
Message-ID: <e2f1cee4-8dad-d901-ae2f-51495a855b4e@redhat.com>
References: <1520535787-6223-1-git-send-email-ian.jackson@eu.citrix.com>
 <1520535787-6223-2-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=cefs=gd=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1evla2-000524-Em
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 15:11:10 +0000
In-Reply-To: <1520535787-6223-2-git-send-email-ian.jackson@eu.citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, qemu-devel@nongnu.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Berrange" <berrange@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDMvMjAxOCAyMDowMiwgSWFuIEphY2tzb24gd3JvdGU6Cj4gVGhpcyBhdm9pZHMgY2hl
Y2twYXRjaCBtaXNwYXJzaW5nIChhcyBzdGF0ZW1lbnRzKSBsb25nIGZ1bmN0aW9uCj4gZGVmaW5p
dGlvbnMgb3IgZGVjbGFyYXRpb25zLCB3aGljaCBzb21ldGltZXMgc3RhcnQgd2l0aCBjb25zdHJ1
Y3RzCj4gbGlrZSB0aGlzOgo+IAo+ICAgc3RhdGljIGlubGluZSBpbnQgeGVuZGV2aWNlbW9kZWxf
cmVsb2NhdGVfbWVtb3J5KAo+ICAgICAgIHhlbmRldmljZW1vZGVsX2hhbmRsZSAqZG1vZCwgZG9t
aWRfdCBkb21pZCwgLi4uCj4gCj4gQ0M6IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPgo+
IENDOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgo+IENDOiBEYW5pZWwgUC4g
QmVycmFuZ2UgPGJlcnJhbmdlQHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tz
b24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gLS0tCj4gdjYuMTogTmV3IHBhdGNoCj4g
LS0tCj4gIHNjcmlwdHMvY2hlY2twYXRjaC5wbCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jaGVja3BhdGNoLnBsIGIvc2Ny
aXB0cy9jaGVja3BhdGNoLnBsCj4gaW5kZXggZDFmZTc5Yi4uM2U0ODhmNyAxMDA3NTUKPiAtLS0g
YS9zY3JpcHRzL2NoZWNrcGF0Y2gucGwKPiArKysgYi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwKPiBA
QCAtMjY2LDYgKzI2Niw3IEBAIG91ciBAdHlwZUxpc3QgPSAoCj4gIAlxcnt0YXJnZXRfKD86dSk/
bG9uZ30sCj4gIAlxcntod2FkZHJ9LAo+ICAJcXJ7eG1sJHtJZGVudH19LAo+ICsJcXJ7eGVuZGV2
aWNlbW9kZWxfaGFuZGxlfSwKPiAgKTsKPiAgCj4gICMgVGhpcyBjYW4gYmUgbW9kaWZpZWQgYnkg
c3ViIHBvc3NpYmxlLiAgU2luY2UgaXQgY2FuIGJlIGVtcHR5LCBiZSBjYXJlZnVsCj4gLS0gCgpP
ciBqdXN0IHJlbmFtZSBpdCBzbyB0aGF0IGl0IGlzIENhbWVsQ2FzZS4gIFRoZW4gY2hlY2twYXRj
aCB3aWxsIGJlIGhhcHB5LgoKUGFvbG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
