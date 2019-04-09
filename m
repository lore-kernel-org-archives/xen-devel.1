From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH v2 0/3] Xen PCI passthrough fixes
Date: Tue, 9 Apr 2019 04:12:37 +0100
Message-ID: <1554779560-26204-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nMgv=SL=citrix.com=prvs=995126bee=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hDhBw-0006l1-R1
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 03:12:56 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: edk2-devel@lists.01.org
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, ard.biesheuvel@linaro.org, jordan.l.justen@intel.com, julien.grall@arm.com, anthony.perard@citrix.com, xen-devel@lists.xenproject.org, lersek@redhat.com
List-Id: xen-devel@lists.xenproject.org

SWdvciBEcnV6aGluaW4gKDMpOgogIE92bWZQa2cvWGVuU3VwcG9ydDogcmVtb3ZlIHVzYWdlIG9m
IHByZWZldGNoYWJsZSBQQ0kgaG9zdCBicmlkZ2UKICAgIGFwZXJ0dXJlCiAgT3ZtZlBrZy9YZW5T
dXBwb3J0OiB1c2UgYSBjb3JyZWN0IFBDSSBob3N0IGJyaWRnZSBhcGVydHVyZSBmb3IgQkFSNjQK
ICBPdm1mUGtnL1hlblN1cHBvcnQ6IHR1cm4gb2ZmIGFkZHJlc3MgZGVjb2RpbmcgYmVmb3JlIEJB
UiBzaXppbmcKCiBPdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMg
fCA0NCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
