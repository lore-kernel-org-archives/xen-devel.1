From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 14/21] tcl/JobDB-Executive: Do not
 squash "starved" status
Date: Thu, 18 Apr 2019 17:31:51 +0100
Message-ID: <20190418163158.11408-15-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xK-00021p-O7
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:10 +0000
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

dHMtaG9zdHMtYWxsb2NhdGUgaXMgZ29pbmcgdG8gc2V0IHRoZSBqb2Igc3RhdHVzIHRvIGBzdGFy
dmVkJwpzb21ldGltZXMsIGFuZCB0aGVuIGRpZS4gIGBzdGFydmVkJyBuZWVkcyB0byBiZSBhZGRl
ZCB0byB0aGUgbGlzdCBvZgpqb2Igc3RhdHVzZXMgdGhhdCBzZy1ydW4tam9iIGxlYXZlcyBhbG9u
ZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgotLS0KIHRjbC9Kb2JEQi1FeGVjdXRpdmUudGNsIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90Y2wvSm9iREItRXhlY3V0aXZlLnRjbCBiL3RjbC9K
b2JEQi1FeGVjdXRpdmUudGNsCmluZGV4IDU3ZGVkMDI1Li40ZjM0MDlhOSAxMDA2NDQKLS0tIGEv
dGNsL0pvYkRCLUV4ZWN1dGl2ZS50Y2wKKysrIGIvdGNsL0pvYkRCLUV4ZWN1dGl2ZS50Y2wKQEAg
LTU1LDYgKzU1LDcgQEAgcHJvYyBqb2Itc2V0LXN0YXR1cy11bmxvY2tlZCB7ZmxpZ2h0IGpvYiBz
dH0gewogCSAgICBVUERBVEUgam9icyBTRVQgc3RhdHVzPSckc3QnCiAJCVdIRVJFIGZsaWdodD0k
ZmxpZ2h0IEFORCBqb2I9JyRqb2InCiAJCSAgQU5EIHN0YXR1czw+J2Fib3J0ZWQnIEFORCBzdGF0
dXM8Pidicm9rZW4nCisgICAgICAgICAgICAgICAgICBBTkQgc3RhdHVzPD4nc3RhcnZlZCcKICAg
ICAiCiB9CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
