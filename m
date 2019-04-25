From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH 0/3] Xen PCI passthrough fixes
Date: Thu, 25 Apr 2019 21:23:55 +0100
Message-ID: <1556223838-5176-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tBju=S3=citrix.com=prvs=011b478a6=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hJkux-0001IU-LR
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 20:24:27 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: devel@edk2.groups.io
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, ard.biesheuvel@linaro.org, jordan.l.justen@intel.com, julien.grall@arm.com, anthony.perard@citrix.com, xen-devel@lists.xenproject.org, lersek@redhat.com
List-Id: xen-devel@lists.xenproject.org

SWdvciBEcnV6aGluaW4gKDMpOgogIE92bWZQa2cvWGVuU3VwcG9ydDogcmVtb3ZlIHVzYWdlIG9m
IHByZWZldGNoYWJsZSBQQ0kgaG9zdCBicmlkZ2UKICAgIGFwZXJ0dXJlCiAgT3ZtZlBrZy9YZW5T
dXBwb3J0OiB1c2UgYSBjb3JyZWN0IFBDSSBob3N0IGJyaWRnZSBhcGVydHVyZSBmb3IgQkFSNjQK
ICBPdm1mUGtnL1hlblN1cHBvcnQ6IHR1cm4gb2ZmIGFkZHJlc3MgZGVjb2RpbmcgYmVmb3JlIEJB
UiBzaXppbmcKCiBPdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMg
fCA1MyArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNl
cnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
