From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/4] tools/xen-hvmctx: drop bogus casts
Date: Tue, 02 Oct 2018 05:44:15 -0600
Message-ID: <5BB35A0F02000078001EDB39@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=0jmz=mo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g7J6E-0008G3-90
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 11:44:22 +0000
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Li4uIGFuZCB0cnkgdG8gaW1wcm92ZSByZWFkYWJpbGl0eSBvZiBzb21lIG9mIHRoZSBvdXRwdXQu
CgoxOiBkcm9wIGJvZ3VzIGNhc3RzIGZyb20gZHVtcF9jcHUoKQoyOiBkcm9wIGJvZ3VzIGNhc3Rz
IGZyb20gZHVtcF9sYXBpY19yZWdzKCkKMzogZHJvcCBib2d1cyBjYXN0cyBmcm9tIGR1bXBfaHBl
dCgpCjQ6IGRyb3AgYm9ndXMgY2FzdHMgZnJvbSBkdW1wX210cnIoKQoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
