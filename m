From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 08/62] ts-host-install: don't use the
 new nic naming scheme
Date: Wed, 10 Apr 2019 15:23:14 +0100
Message-ID: <20190410142408.22848-9-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEA9-0006BC-Pd
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:17 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KLS0tCiB0cy1ob3N0LWluc3RhbGwgfCA0ICsrKysKIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90cy1ob3N0LWluc3RhbGwgYi90
cy1ob3N0LWluc3RhbGwKaW5kZXggMjkyNzMzYmEuLjlhYjNkZTYyIDEwMDc1NQotLS0gYS90cy1o
b3N0LWluc3RhbGwKKysrIGIvdHMtaG9zdC1pbnN0YWxsCkBAIC0yNDQsNiArMjQ0LDEwIEBAIEVO
RAogICAgICMgd2h5IHRoaXMgaXMgcmVwZWF0ZWQuCiAgICAgcHVzaCBAaG9jbWRsaW5lLCAiY29u
c29sZT0kY29uc29sZSIgdW5sZXNzICRjb25zb2xlIGVxICJOT05FIjsKIAorICAgICMgRG9uJ3Qg
dXNlICJQcmVkaWN0YWJsZSBOZXR3b3JrIEludGVyZmFjZSBOYW1lcyIKKyAgICAjIGh0dHBzOi8v
d3d3LmZyZWVkZXNrdG9wLm9yZy93aWtpL1NvZnR3YXJlL3N5c3RlbWQvUHJlZGljdGFibGVOZXR3
b3JrSW50ZXJmYWNlTmFtZXMvCisgICAgcHVzaCBAaG9jbWRsaW5lLCAibmV0LmlmbmFtZXM9MCIg
aWYgJGhvLT57U3VpdGV9ID1+IG0vc3RyZXRjaC87CisKICAgICBwdXNoIEBob2NtZGxpbmUsCiAg
ICAgICAgIGdldF9ob3N0X3Byb3BlcnR5KCRobywgImxpbnV4LWJvb3QtYXBwZW5kICRoby0+e1N1
aXRlfSIsICcnKSwKICAgICAgICAgZ2V0X2hvc3RfcHJvcGVydHkoJGhvLCAibGludXgtYm9vdC1h
cHBlbmQgJGhvLT57U3VpdGV9ICRye2FyY2h9IiwgJycpOwotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
