From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 0/2] tools: fix gcc 8.1 build
Date: Thu, 26 Jul 2018 15:58:52 +0100
Message-ID: <20180726145854.10978-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xz6m=kk=citrix.com=prvs=738467b65=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fihjH-0007XL-G8
 for xen-devel@lists.xenproject.org; Thu, 26 Jul 2018 14:58:59 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSAoMik6CiAgdG9vbHM6IHVwZGF0ZSBpcHhlIGNoYW5nZXNldAogIHhlbnBtZDogbWFr
ZSAzMiBiaXQgZ2NjIDguMSBub24tZGVidWcgYnVpbGQgd29yawoKIHRvb2xzL2Zpcm13YXJlL2V0
aGVyYm9vdC9NYWtlZmlsZSB8ICAyICstCiB0b29scy94ZW5wbWQveGVucG1kLmMgICAgICAgICAg
ICAgfCAxMiArKysrKystLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
