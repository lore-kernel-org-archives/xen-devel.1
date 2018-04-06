From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH for-4.11 0/2] x86: two small cleanup patches
Date: Fri, 6 Apr 2018 10:36:43 +0100
Message-ID: <20180406093645.6444-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v2h2=g3=citrix.com=prvs=627d9795c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f4Nne-0002gL-Dr
 for xen-devel@lists.xenproject.org; Fri, 06 Apr 2018 09:36:50 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSAoMik6CiAgeDg2L2NwdTogZ2V0IG1vcmUgaW5mb3JtYXRpb24gb3V0IGZyb20gKl9p
bml0X2xldmVsbGluZwogIHg4NjogcmVtb3ZlIHVudXNlZCBwYXJhbWV0ZXIgZnJvbSBzbXBfcHJl
cGFyZV9jcHVzCgogeGVuL2FyY2gveDg2L2NwdS9hbWQuYyAgIHwgOSArKysrKy0tLS0KIHhlbi9h
cmNoL3g4Ni9jcHUvaW50ZWwuYyB8IDkgKysrKystLS0tCiB4ZW4vYXJjaC94ODYvc2V0dXAuYyAg
ICAgfCAyICstCiB4ZW4vYXJjaC94ODYvc21wYm9vdC5jICAgfCAyICstCiB4ZW4vaW5jbHVkZS94
ZW4vc21wLmggICAgfCAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEx
IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
