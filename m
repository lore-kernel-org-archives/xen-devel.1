From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V6] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Wed, 31 Oct 2018 18:45:49 +0200
Message-ID: <8e9c0516-f9a6-03f9-3f06-76aef043cc6c@bitdefender.com>
References: <1538035134-10967-1-git-send-email-rcojocaru@bitdefender.com>
 <20181031163911.7pbw7rclfalmuu6m@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qum2=nl=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gHtcz-0004dS-IS
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 16:45:57 +0000
In-Reply-To: <20181031163911.7pbw7rclfalmuu6m@zion.uk.xensource.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: tamas@tklengyel.com, konrad.wilk@oracle.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, Adrian Pop <apop@bitdefender.com>, tim@xen.org, julien.grall@arm.com, sstabellini@kernel.org, jbeulich@suse.com, xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMzEvMTggNjozOSBQTSwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIFNlcCAyNywgMjAx
OCBhdCAxMDo1ODo1NEFNICswMzAwLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4+IEN1cnJlbnRs
eSB0aGVyZSBpcyBhIHN1Ym9wIGZvciBzZXR0aW5nIHRoZSBtZW1hY2Nlc3Mgb2YgYSBwYWdlLCBi
dXQgbm90Cj4+IGZvciBjb25zdWx0aW5nIGl0LiAgVGhlIG5ldyBIVk1PUF9hbHRwMm1fZ2V0X21l
bV9hY2Nlc3MgYWRkcyB0aGlzCj4+IGZ1bmN0aW9uYWxpdHkuCj4+Cj4+IEJvdGggYWx0cDJtIGdl
dC9zZXQgbWVtIGFjY2VzcyBmdW5jdGlvbnMgdXNlIHRoZSBzdHJ1Y3QKPj4geGVuX2h2bV9hbHRw
Mm1fbWVtX2FjY2VzcyB3aGljaCBoYXMgbm93IGRyb3BwZWQgdGhlIGBzZXQnIHBhcnQgYW5kIGhh
cwo+PiBiZWVuIHJlbmFtZWQgZnJvbSB4ZW5faHZtX2FsdHAybV9zZXRfbWVtX2FjY2Vzcy4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIFBvcCA8YXBvcEBiaXRkZWZlbmRlci5jb20+Cj4+IFNp
Z25lZC1vZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4K
PiAKPiBJJ20gbm90IHN1cmUgaWYgdGhpcyBwYXRjaCBoYXMgYmVlbiBhcHBsaWVkLiBJZiBub3Qg
SSB3aWxsIGRvIGl0IGR1cmluZwo+IG15IG5leHQgc3dlZXAuCgpIZWxsbyBXZWksCgpJdCdzIGJl
ZW4gYXBwbGllZDoKaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1j
b21taXQ7aD03NTU5YWI3ODMwYzNlMTU5NGNkNzNlZmQzZjFhY2JiMTcxMDM2NzI4CgoKVGhhbmtz
LApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
