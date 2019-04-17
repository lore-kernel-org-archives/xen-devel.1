From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 4/5] ts-debian-hvm-install: Disable
 net.ifnames for Debian HVM guests
Date: Wed, 17 Apr 2019 17:37:51 +0100
Message-ID: <20190417163752.994-5-ian.jackson@eu.citrix.com>
References: <20190417163752.994-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fEre=ST=citrix.com=prvs=0036fbe7a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hGnZS-0005Ax-0p
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 16:38:02 +0000
In-Reply-To: <20190417163752.994-1-ian.jackson@eu.citrix.com>
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

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogdHMtZGViaWFuLWh2bS1pbnN0YWxsIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3RzLWRlYmlhbi1odm0taW5zdGFsbCBiL3RzLWRl
Ymlhbi1odm0taW5zdGFsbAppbmRleCBhMDFjZmIyYi4uNGRlYjQ0M2UgMTAwNzU1Ci0tLSBhL3Rz
LWRlYmlhbi1odm0taW5zdGFsbAorKysgYi90cy1kZWJpYW4taHZtLWluc3RhbGwKQEAgLTEzNSw2
ICsxMzUsMTQgQEAgc3ViIGdjbWRsaW5lICg7JCkgewogCiAgICAgcHVzaCBAZGljbWRsaW5lLCAk
Z2NvbnNvbGU7CiAKKyAgICAjIGh0dHBzOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy93aWtpL1NvZnR3
YXJlL3N5c3RlbWQvUHJlZGljdGFibGVOZXR3b3JrSW50ZXJmYWNlTmFtZXMvCisgICAgIyBJbiBm
YWN0IHRoZXNlIGFyZSBhbnl0aGluZyBidXQgcHJlZGljdGFibGUuICBJbiBEZWJpYW4gaTM4Ngor
ICAgICMgc3RyZXRjaCwgd2UgZW5kIHVwIHVzaW5nIHRoZSBlbXVsYXRlZCBOSUMgaW4gdGhlIGlu
c3RhbGxlciBidXQKKyAgICAjIHRoZSBYZW4gUFYgVklGIGluIHRoZSBpbnN0YWxsZWQgc3lzdGVt
LiAgV2Ugd2FudCB0aGVzZSBib3RoIHRvCisgICAgIyBiZSBldGgwLCB3aGljaCBpcyB3aGF0IGhh
cHBlbnMgaWYgd2UgdHVybiBvZmYgdGhlIG5ldyBzY2hlbWUgYW5kCisgICAgIyB0YWtlIG5vIGZ1
cnRoZXIgc3BlY2lhbCBtZWFzdXJlcy4KKyAgICBwdXNoIEBkaWNtZGxpbmUsICduZXQuaWZuYW1l
cz0wJzsKKwogICAgIHJldHVybiBqb2luKCIgIiwgQGRpY21kbGluZSk7CiB9CiAKLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
