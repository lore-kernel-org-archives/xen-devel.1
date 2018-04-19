From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 01/16] checkpatch: Add xendevicemodel_handle to
 the list of types
Date: Thu, 19 Apr 2018 17:45:04 +0100
Message-ID: <1524156319-11465-2-git-send-email-ian.jackson@eu.citrix.com>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jxfj=hi=citrix.com=prvs=6403088e3=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f9Cgv-0004FK-2D
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 16:45:49 +0000
In-Reply-To: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Berrange" <berrange@redhat.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBhdm9pZHMgY2hlY2twYXRjaCBtaXNwYXJzaW5nIChhcyBzdGF0ZW1lbnRzKSBsb25nIGZ1
bmN0aW9uCmRlZmluaXRpb25zIG9yIGRlY2xhcmF0aW9ucywgd2hpY2ggc29tZXRpbWVzIHN0YXJ0
IHdpdGggY29uc3RydWN0cwpsaWtlIHRoaXM6CgogIHN0YXRpYyBpbmxpbmUgaW50IHhlbmRldmlj
ZW1vZGVsX3JlbG9jYXRlX21lbW9yeSgKICAgICAgeGVuZGV2aWNlbW9kZWxfaGFuZGxlICpkbW9k
LCBkb21pZF90IGRvbWlkLCAuLi4KClRoZSB0eXBlIHhlbmRldmljZW1vZGVsX2hhbmRsZSBkb2Vz
IG5vdCBjb25mb3JtIHRvIFFlbXUgQ09ESU5HX1NUWUxFLAp3aGljaCB3b3VsZCBzdWdnZXN0IENh
bWVsQ2FzZS4gIEhvd2V2ZXIsIGl0IGlzIGEgdHlwZSBkZWZpbmVkIGJ5IHRoZQpYZW4gUHJvamVj
dCBpbiB4ZW4uZ2l0LiAgSXQgd291bGQgYmUgcG9zc2libGUgdG8gaW50cm9kdWNlIGEgdHlwZWRl
Zgp0byBhbGxvdyB0aGUgcWVtdSBjb2RlIHRvIHJlZmVyIHRvIGl0IGJ5IGEgZGlmZmVyZW50bHkt
c3BlbGxlZCBuYW1lLApidXQgdGhhdCB3b3VsZCBvYmZ1c2NhdGUgbW9yZSB0aGFuIGl0IHdvdWxk
IGNsYXJpZnkuCgpDQzogRXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+CkNDOiBQYW9sbyBC
b256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpDQzogRGFuaWVsIFAuIEJlcnJhbmdlIDxiZXJy
YW5nZUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25A
ZXUuY2l0cml4LmNvbT4KLS0tCnY3OiBBZGRlZCBjb21tZW50IHRvIGNvbW1pdCBtZXNzYWdlIGFi
b3V0IHdoeSB3ZSBhcmUgbm90IHJlbmFtaW5nCiAgICB0aGlzIHR5cGUgdG8gQ2FtZWxDYXNlLgp2
Ni4xOiBOZXcgcGF0Y2gKLS0tCiBzY3JpcHRzL2NoZWNrcGF0Y2gucGwgfCAxICsKIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvY2hlY2twYXRjaC5w
bCBiL3NjcmlwdHMvY2hlY2twYXRjaC5wbAppbmRleCBkNTIyMDdhLi41Yjg3MzVkIDEwMDc1NQot
LS0gYS9zY3JpcHRzL2NoZWNrcGF0Y2gucGwKKysrIGIvc2NyaXB0cy9jaGVja3BhdGNoLnBsCkBA
IC0yNjYsNiArMjY2LDcgQEAgb3VyIEB0eXBlTGlzdCA9ICgKIAlxcnt0YXJnZXRfKD86dSk/bG9u
Z30sCiAJcXJ7aHdhZGRyfSwKIAlxcnt4bWwke0lkZW50fX0sCisJcXJ7eGVuZGV2aWNlbW9kZWxf
aGFuZGxlfSwKICk7CiAKICMgVGhpcyBjYW4gYmUgbW9kaWZpZWQgYnkgc3ViIHBvc3NpYmxlLiAg
U2luY2UgaXQgY2FuIGJlIGVtcHR5LCBiZSBjYXJlZnVsCi0tIAoyLjEuNAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
