From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/5] x86: more power-efficient CPU parking
Date: Wed, 01 Aug 2018 08:22:10 -0600
Message-ID: <5B61C21202000078001D9F2D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qz6i=kq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fks10-000596-UB
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 14:22:14 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBwdXR0aW5nIENQVXMgdG8gc2xlZXAgcGVybWFuZW50bHksIHdlIHNob3VsZCB0cnkgdG8g
cHV0IHRoZW0gaW50bwp0aGUgbW9zdCBwb3dlciBjb25zZXJ2aW5nIHN0YXRlIHBvc3NpYmxlLiBG
b3Igbm93IGl0IGlzIHVuY2xlYXIgd2hldGhlciwKZXNwZWNpYWxseSBpbiBhIGRlZXAgQy1zdGF0
ZSwgdGhlIFAtc3RhdGUgYWxzbyBtYXR0ZXJzLCBzbyB0aGlzIHNlcmllcyBvbmx5CmFycmFuZ2Vz
IGZvciB0aGUgQy1zdGF0ZSBzaWRlIG9mIHRoaW5ncyAocGx1cyBzb21lIGNsZWFudXApLgoKMTog
eDg2L2NwdWlkbGU6IHJlcGxhY2UgYSBwb2ludGxlc3MgTlVMTCBjaGVjawoyOiB4ODYvaWRsZTog
cmUtYXJyYW5nZSBkZWFkLWlkbGUgaGFuZGxpbmcKMzogeDg2L2NwdWlkbGU6IHB1c2ggcGFya2Vk
IENQVXMgaW50byBkZWVwZXIgc2xlZXAgc3RhdGVzIHdoZW4gcG9zc2libGUKNDogeDg2L2NwdWlk
bGU6IGNsZWFuIHVwIEN4IGR1bXBpbmcKNTogeDg2OiBwbGFjZSBub24tcGFya2VkIENQVXMgaW50
byB3YWl0LWZvci1TSVBJIHN0YXRlIGFmdGVyIG9mZmxpbmluZwoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
