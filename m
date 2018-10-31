From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH V6] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Wed, 31 Oct 2018 16:52:01 +0000
Message-ID: <20181031165201.vitpvl44iw76lk4c@zion.uk.xensource.com>
References: <1538035134-10967-1-git-send-email-rcojocaru@bitdefender.com>
 <20181031163911.7pbw7rclfalmuu6m@zion.uk.xensource.com>
 <8e9c0516-f9a6-03f9-3f06-76aef043cc6c@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qv1o=nl=citrix.com=prvs=835e3026f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gHtix-0005Rf-Sq
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 16:52:07 +0000
Content-Disposition: inline
In-Reply-To: <8e9c0516-f9a6-03f9-3f06-76aef043cc6c@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: tamas@tklengyel.com, Wei Liu <wei.liu2@citrix.com>, konrad.wilk@oracle.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, Adrian Pop <apop@bitdefender.com>, tim@xen.org, julien.grall@arm.com, sstabellini@kernel.org, jbeulich@suse.com, xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBPY3QgMzEsIDIwMTggYXQgMDY6NDU6NDlQTSArMDIwMCwgUmF6dmFuIENvam9jYXJ1
IHdyb3RlOgo+IE9uIDEwLzMxLzE4IDY6MzkgUE0sIFdlaSBMaXUgd3JvdGU6Cj4gPiBPbiBUaHUs
IFNlcCAyNywgMjAxOCBhdCAxMDo1ODo1NEFNICswMzAwLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6
Cj4gPj4gQ3VycmVudGx5IHRoZXJlIGlzIGEgc3Vib3AgZm9yIHNldHRpbmcgdGhlIG1lbWFjY2Vz
cyBvZiBhIHBhZ2UsIGJ1dCBub3QKPiA+PiBmb3IgY29uc3VsdGluZyBpdC4gIFRoZSBuZXcgSFZN
T1BfYWx0cDJtX2dldF9tZW1fYWNjZXNzIGFkZHMgdGhpcwo+ID4+IGZ1bmN0aW9uYWxpdHkuCj4g
Pj4KPiA+PiBCb3RoIGFsdHAybSBnZXQvc2V0IG1lbSBhY2Nlc3MgZnVuY3Rpb25zIHVzZSB0aGUg
c3RydWN0Cj4gPj4geGVuX2h2bV9hbHRwMm1fbWVtX2FjY2VzcyB3aGljaCBoYXMgbm93IGRyb3Bw
ZWQgdGhlIGBzZXQnIHBhcnQgYW5kIGhhcwo+ID4+IGJlZW4gcmVuYW1lZCBmcm9tIHhlbl9odm1f
YWx0cDJtX3NldF9tZW1fYWNjZXNzLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIFBv
cCA8YXBvcEBiaXRkZWZlbmRlci5jb20+Cj4gPj4gU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9j
YXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+ID4gCj4gPiBJJ20gbm90IHN1cmUgaWYg
dGhpcyBwYXRjaCBoYXMgYmVlbiBhcHBsaWVkLiBJZiBub3QgSSB3aWxsIGRvIGl0IGR1cmluZwo+
ID4gbXkgbmV4dCBzd2VlcC4KPiAKPiBIZWxsbyBXZWksCj4gCj4gSXQncyBiZWVuIGFwcGxpZWQ6
Cj4gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1jb21taXQ7aD03
NTU5YWI3ODMwYzNlMTU5NGNkNzNlZmQzZjFhY2JiMTcxMDM2NzI4CgpUaGFua3MgZm9yIGxldHRp
bmcgbWUga25vdy4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
