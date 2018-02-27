From: Amit Shah <aams@amazon.com>
Subject: [PATCH v2 0/2] xen: fix bugs in error conditions
Date: Tue, 27 Feb 2018 15:55:56 +0000
Message-ID: <1519746958-52077-1-git-send-email-aams__42074.4690731682$1519746904$gmane$org@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gitk=fv=amazon.de=prvs=58946e527=aams@srs-us1.protection.inumbo.net>)
 id 1eqhby-0000Nt-OJ
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 15:56:14 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Eduardo Valentin <eduval@amazon.com>, linux-kernel@vger.kernel.org, Liu Shuo <shuo.a.liu@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Amit Shah <aams@amazon.com>, Thomas Gleixner <tglx@linutronix.de>, Anoob Soman <anoob.soman@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGVzZSBidWdzIHdlcmUgZm91bmQgZHVyaW5nIGNvZGUgcmV2aWV3LiAgRGV0YWls
cyBpbiB0aGUgY29tbWl0cy4KClBsZWFzZSByZXZpZXcgYW5kIGFwcGx5LgoKdjI6CiAtIGZpeCB1
cCBwYXRjaCAyIHByb3Blcmx5IChSb2dlciBQYXUgTW9ubsOpKQoKQ0M6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDQzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ry
b3Zza3lAb3JhY2xlLmNvbT4KQ0M6IEVkdWFyZG8gVmFsZW50aW4gPGVkdXZhbEBhbWF6b24uY29t
PgpDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDQzogVGhvbWFzIEdsZWl4bmVy
IDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNDOiAiSy4gWS4gU3Jpbml2YXNhbiIgPGt5c0BtaWNyb3Nv
ZnQuY29tPgpDQzogTGl1IFNodW8gPHNodW8uYS5saXVAaW50ZWwuY29tPgpDQzogQW5vb2IgU29t
YW4gPGFub29iLnNvbWFuQGNpdHJpeC5jb20+CgpBbWl0IFNoYWggKDIpOgogIHhlbjogZml4IG91
dC1vZi1ib3VuZHMgaXJxIHVuYmluZCBmb3IgTVNJIG1lc3NhZ2UgZ3JvdXBzCiAgeGVuOiBldmVu
dHM6IGZyZWUgaXJxcyBpbiBlcnJvciBjb25kaXRpb24KCiBkcml2ZXJzL3hlbi9ldmVudHMvZXZl
bnRzX2Jhc2UuYyB8IDkgKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKLS0gCjIuNy4zLkFNWk4KCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50
ZXIgR2VybWFueSBHbWJICkJlcmxpbiAtIERyZXNkZW4gLSBBYWNoZW4KbWFpbiBvZmZpY2U6IEty
YXVzZW5zdHIuIDM4LCAxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IERyLiBSYWxmIEhl
cmJyaWNoLCBDaHJpc3RpYW4gU2NobGFlZ2VyClVzdC1JRDogREUyODkyMzc4NzkKRWluZ2V0cmFn
ZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBCCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
