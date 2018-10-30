From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 7/7] amd/pvh: enable ACPI C1E disable
 quirk on PVH Dom0
Date: Tue, 30 Oct 2018 16:28:46 +0000
Message-ID: <20181030162846.2h73idlb7n56fm6u@zion.uk.xensource.com>
References: <20181030154123.4218-1-roger.pau@citrix.com>
 <20181030154123.4218-8-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mwh5=nk=citrix.com=prvs=834ba7b9c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gHWss-0003m9-Ux
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 16:28:50 +0000
Content-Disposition: inline
In-Reply-To: <20181030154123.4218-8-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMzAsIDIwMTggYXQgMDQ6NDE6MjNQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFBWIERvbTAgaGFzIGEgcXVpcmsgZm9yIHNvbWUgQU1EIHByb2Nlc3NvcnMsIHdo
ZXJlIGVuYWJsaW5nIEFDUEkgY2FuCj4gYWxzbyBlbmFibGUgQzFFIG1vZGUuIEFwcGx5IHRoZSBz
YW1lIHdvcmthcm91bmQgYXMgZG9uZSBvbiBQViBmb3IgYQo+IFBWSCBEb20wLCB3aGljaCBjb25z
aXN0IG9uIHRyYXBwaW5nIGFjY2Vzc2VzIHRvIHRoZSBTTUkgY29tbWFuZCBJTwo+IHBvcnQgYW5k
IGRpc2FibGluZyBDMUUgaWYgQUNQSSBpcyBlbmFibGVkLgo+IAo+IFJlcG9ydGVkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxp
dTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
