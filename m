From: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH] flask/policy: allow dom0 to use
 PHYSDEVOP_pci_mmcfg_reserved
Date: Fri,  2 Nov 2018 13:46:11 -0400
Message-ID: <20181102174611.1693-1-dgdegra@tycho.nsa.gov>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z7jb=nn=tycho.nsa.gov=dgdegra@srs-us1.protection.inumbo.net>)
 id 1gIdWW-0000U2-95
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 17:46:20 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

UmVwb3J0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClNp
Z25lZC1vZmYtYnk6IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292PgotLS0K
IHRvb2xzL2ZsYXNrL3BvbGljeS9tb2R1bGVzL2RvbTAudGUgfCAzICsrKwogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2ZsYXNrL3BvbGljeS9tb2R1
bGVzL2RvbTAudGUgYi90b29scy9mbGFzay9wb2xpY3kvbW9kdWxlcy9kb20wLnRlCmluZGV4IGRm
ZGNkY2QxMjguLmEwNTY2NjcxZDYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2ZsYXNrL3BvbGljeS9tb2R1
bGVzL2RvbTAudGUKKysrIGIvdG9vbHMvZmxhc2svcG9saWN5L21vZHVsZXMvZG9tMC50ZQpAQCAt
NjYsNiArNjYsOSBAQCBhbGxvdyBkb20wX3Qgc2VjdXJpdHlfdDpzZWN1cml0eSB7IGxvYWRfcG9s
aWN5IHNldGVuZm9yY2Ugc2V0Ym9vbCB9OwogIyBBdWRpdCBwb2xpY3kgY2hhbmdlIGV2ZW50cyBl
dmVuIHdoZW4gdGhleSBhcmUgYWxsb3dlZAogYXVkaXRhbGxvdyBkb20wX3Qgc2VjdXJpdHlfdDpz
ZWN1cml0eSB7IGxvYWRfcG9saWN5IHNldGVuZm9yY2Ugc2V0Ym9vbCB9OwogCisjIEFsbG93IGRv
bTAgdG8gcmVwb3J0IHBsYXRmb3JtIGNvbmZpZ3VyYXRpb24gY2hhbmdlcyBiYWNrIHRvIHRoZSBo
eXBlcnZpc29yCithbGxvdyBkb20wX3QgeGVuX3Q6cmVzb3VyY2Ugc2V0dXA7CisKIGFkbWluX2Rl
dmljZShkb20wX3QsIGRldmljZV90KQogYWRtaW5fZGV2aWNlKGRvbTBfdCwgaXJxX3QpCiBhZG1p
bl9kZXZpY2UoZG9tMF90LCBpb3BvcnRfdCkKLS0gCjIuMTQuNQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
