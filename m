From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 6/9] x86/HVM: relax shadow mode check in
 hvm_set_cr3()
Date: Thu, 02 May 2019 06:21:28 -0600
Message-ID: <5CCAE0C8020000780022B30D@prv1-mh.provo.novell.com>
References: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMAiR-0005KZ-VE
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 12:21:31 +0000
In-Reply-To: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUncyBubyBuZWVkIHRvIHJlLW9idGFpbiBhIHBhZ2UgcmVmZXJlbmNlIGlmIG9ubHkgYml0
cyBub3QgYWZmZWN0aW5nCnRoZSBhZGRyZXNzIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMK
KysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwpAQCAtMjMyMCw3ICsyMzIwLDcgQEAgaW50IGh2
bV9zZXRfY3IzKHVuc2lnbmVkIGxvbmcgdmFsdWUsIGJvbwogICAgIH0KIAogICAgIGlmICggaHZt
X3BhZ2luZ19lbmFibGVkKHYpICYmICFwYWdpbmdfbW9kZV9oYXAoY3VycmQpICYmCi0gICAgICAg
ICAodmFsdWUgIT0gdi0+YXJjaC5odm0uZ3Vlc3RfY3JbM10pICkKKyAgICAgICAgICgodmFsdWUg
XiB2LT5hcmNoLmh2bS5ndWVzdF9jclszXSkgPj4gUEFHRV9TSElGVCkgKQogICAgIHsKICAgICAg
ICAgLyogU2hhZG93LW1vZGUgQ1IzIGNoYW5nZS4gQ2hlY2sgUERCUiBhbmQgdXBkYXRlIHJlZmNv
dW50cy4gKi8KICAgICAgICAgSFZNX0RCR19MT0coREJHX0xFVkVMX1ZNTVUsICJDUjMgdmFsdWUg
PSAlbHgiLCB2YWx1ZSk7CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
