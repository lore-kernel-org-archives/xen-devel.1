From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v3 03/15] argo: define argo_dprintk for
 subsystem debugging
Date: Sun,  6 Jan 2019 23:42:36 -0800
Message-ID: <1546846968-7372-4-git-send-email-christopher.w.clark@gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x9VP=PP=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1ggPZ1-0004cm-Gm
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 07:43:11 +0000
Received: by mail-pf1-x444.google.com with SMTP id z9so21433289pfi.2
 for <xen-devel@lists.xenproject.org>; Sun, 06 Jan 2019 23:43:10 -0800 (PST)
In-Reply-To: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QSBjb252ZW5pZW5jZSBmb3Igd29ya2luZyBvbiBkZXZlbG9wbWVudCBvZiB0aGUgYXJnbyBzdWJz
eXN0ZW06CnNldHRpbmcgYSAjZGVmaW5lIHZhcmlhYmxlIGVuYWJsZXMgYWRkaXRpb25hbCBkZWJ1
ZyBtZXNzYWdlcy4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhl
ci5jbGFyazZAYmFlc3lzdGVtcy5jb20+Ci0tLQp2MiAjMDMgZmVlZGJhY2ssIEphbjogZml4IGlm
ZGVmL2RlZmluZSBjb25mdXNpb24gZXJyb3IKdjEgIzA0IGZlZWRiYWNrLCBKYW46IGZpeCBkcHJp
bnRrIGltcGxlbWVudGF0aW9uCgogeGVuL2NvbW1vbi9hcmdvLmMgfCA5ICsrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vYXJn
by5jIGIveGVuL2NvbW1vbi9hcmdvLmMKaW5kZXggZDY5YWQ3Yy4uNmY3ODJmNyAxMDA2NDQKLS0t
IGEveGVuL2NvbW1vbi9hcmdvLmMKKysrIGIveGVuL2NvbW1vbi9hcmdvLmMKQEAgLTE5LDYgKzE5
LDE1IEBACiAjaW5jbHVkZSA8eGVuL2Vycm5vLmg+CiAjaW5jbHVkZSA8eGVuL2d1ZXN0X2FjY2Vz
cy5oPgogCisvKiBDaGFuZ2UgdGhpcyB0byAjZGVmaW5lIEFSR09fREVCVUcgaGVyZSB0byBlbmFi
bGUgbW9yZSBkZWJ1ZyBtZXNzYWdlcyAqLworI3VuZGVmIEFSR09fREVCVUcKKworI2lmZGVmIEFS
R09fREVCVUcKKyNkZWZpbmUgYXJnb19kcHJpbnRrKGZvcm1hdCwgYXJncy4uLikgcHJpbnRrKCJh
cmdvOiAiIGZvcm1hdCwgIyMgYXJncyApCisjZWxzZQorI2RlZmluZSBhcmdvX2RwcmludGsoZm9y
bWF0LCAuLi4gKSAoKHZvaWQpMCkKKyNlbmRpZgorCiBsb25nCiBkb19hcmdvX29wKHVuc2lnbmVk
IGludCBjbWQsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnMSwKICAgICAgICAgICAg
WEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcyLCB1bnNpZ25lZCBsb25nIGFyZzMsCi0t
IAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
