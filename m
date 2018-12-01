From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 08/25] xen: define XEN_GUEST_HANDLE_NULL as null
 XEN_GUEST_HANDLE
Date: Fri, 30 Nov 2018 17:32:47 -0800
Message-ID: <1543627984-21394-9-git-send-email-christopher.w.clark@gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w5dn=ok=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gSuA9-0006dD-EW
 for xen-devel@lists.xenproject.org; Sat, 01 Dec 2018 01:33:41 +0000
Received: by mail-io1-xd44.google.com with SMTP id m19so6080402ioh.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Nov 2018 17:33:40 -0800 (PST)
In-Reply-To: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, James McKenzie <voreekf@madingley.org>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLmNsYXJrNkBiYWVz
eXN0ZW1zLmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmggfCAyICsrCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGlj
L3hlbi5oIGIveGVuL2luY2x1ZGUvcHVibGljL3hlbi5oCmluZGV4IDBhMjc1NDYuLjhkYzAzMmIg
MTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaAorKysgYi94ZW4vaW5jbHVkZS9w
dWJsaWMveGVuLmgKQEAgLTk4Miw2ICs5ODIsOCBAQCB0eXBlZGVmIHN0cnVjdCB7CiAjZGVmaW5l
IFhFTl9HVUVTVF9IQU5ETEVfNjQobmFtZSkgWEVOX0dVRVNUX0hBTkRMRShuYW1lKQogI2VuZGlm
CiAKKyNkZWZpbmUgWEVOX0dVRVNUX0hBTkRMRV9OVUxMKG5hbWUpIChYRU5fR1VFU1RfSEFORExF
KG5hbWUpKXsobmFtZSAqKTB9CisKICNpZm5kZWYgX19BU1NFTUJMWV9fCiBzdHJ1Y3QgeGVuY3Rs
X2JpdG1hcCB7CiAgICAgWEVOX0dVRVNUX0hBTkRMRV82NCh1aW50OCkgYml0bWFwOwotLSAKMi4x
LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
