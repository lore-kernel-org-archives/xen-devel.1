From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 06/16] xen: destroy_hvm_domain: Move reason into
 a variable
Date: Thu, 19 Apr 2018 17:45:09 +0100
Message-ID: <1524156319-11465-7-git-send-email-ian.jackson@eu.citrix.com>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jxfj=hi=citrix.com=prvs=6403088e3=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f9Cgz-0004GG-KB
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 16:45:53 +0000
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

V2UgYXJlIGdvaW5nIHRvIHdhbnQgdG8gcmV1c2UgdGhpcy4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdl
LgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+
ClJldmlld2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4K
QWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KLS0t
CiBody9pMzg2L3hlbi94ZW4taHZtLmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L2kzODYveGVuL3hlbi1o
dm0uYyBiL2h3L2kzODYveGVuL3hlbi1odm0uYwppbmRleCA5YzNiNmIzLi4zNTkwZDk5IDEwMDY0
NAotLS0gYS9ody9pMzg2L3hlbi94ZW4taHZtLmMKKysrIGIvaHcvaTM4Ni94ZW4veGVuLWh2bS5j
CkBAIC0xMzg3LDEyICsxMzg3LDEzIEBAIHZvaWQgZGVzdHJveV9odm1fZG9tYWluKGJvb2wgcmVi
b290KQogICAgIHhjX2ludGVyZmFjZSAqeGNfaGFuZGxlOwogICAgIGludCBzdHM7CiAKKyAgICB1
bnNpZ25lZCBpbnQgcmVhc29uID0gcmVib290ID8gU0hVVERPV05fcmVib290IDogU0hVVERPV05f
cG93ZXJvZmY7CisKICAgICB4Y19oYW5kbGUgPSB4Y19pbnRlcmZhY2Vfb3BlbigwLCAwLCAwKTsK
ICAgICBpZiAoeGNfaGFuZGxlID09IE5VTEwpIHsKICAgICAgICAgZnByaW50ZihzdGRlcnIsICJD
YW5ub3QgYWNxdWlyZSB4ZW5jdHJsIGhhbmRsZVxuIik7CiAgICAgfSBlbHNlIHsKLSAgICAgICAg
c3RzID0geGNfZG9tYWluX3NodXRkb3duKHhjX2hhbmRsZSwgeGVuX2RvbWlkLAotICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmVib290ID8gU0hVVERPV05fcmVib290IDogU0hVVERP
V05fcG93ZXJvZmYpOworICAgICAgICBzdHMgPSB4Y19kb21haW5fc2h1dGRvd24oeGNfaGFuZGxl
LCB4ZW5fZG9taWQsIHJlYXNvbik7CiAgICAgICAgIGlmIChzdHMgIT0gMCkgewogICAgICAgICAg
ICAgZnByaW50ZihzdGRlcnIsICJ4Y19kb21haW5fc2h1dGRvd24gZmFpbGVkIHRvIGlzc3VlICVz
LCAiCiAgICAgICAgICAgICAgICAgICAgICJzdHMgJWQsICVzXG4iLCByZWJvb3QgPyAicmVib290
IiA6ICJwb3dlcm9mZiIsCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
