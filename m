From: Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH 0/2] xen: sched/Credit2: small and trivial
 improvements
Date: Sat, 20 Apr 2019 17:24:32 +0200
Message-ID: <155577364571.25746.11988517450711182732.stgit@wayrath>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lFeN=SW=gmail.com=raistlin.df@srs-us1.protection.inumbo.net>)
 id 1hHrr3-00048q-Qf
 for xen-devel@lists.xenproject.org; Sat, 20 Apr 2019 15:24:37 +0000
Received: by mail-wr1-f45.google.com with SMTP id f14so9806577wrj.5
 for <xen-devel@lists.xenproject.org>; Sat, 20 Apr 2019 08:24:36 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau =?utf-8?b?TW9ubsOp?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

TmFtZWx5OgoxLiBnZXQgcmlkIG9mIGNwdW1hc2tfd2VpZ2h0KCkgaW4gaG90IHBhdGhzLCBpbiBD
cmVkaXQyOwoyLiBjaGVja2luZyB3aGV0aGVyIHByZXY9PW5leHQgaW4gY29udGV4dF9zd2l0Y2go
KSBpcyBwb2ludGxlc3MuCgpSZWdhcmRzLApEYXJpbwotLS0KRGFyaW8gRmFnZ2lvbGkgKDIpOgog
ICAgICB4ZW46IGNyZWRpdDI6IGF2b2lkIHVzaW5nIGNwdW1hc2tfd2VpZ2h0KCkgaW4gaG90LXBh
dGhzCiAgICAgIHhlbjogc2NoZWQ6IHdlIG5ldmVyIGdldCBpbnRvIGNvbnRleHRfc3dpdGNoKCkg
d2l0aCBwcmV2PT1uZXh0CgogeGVuL2FyY2gvYXJtL2RvbWFpbi5jICAgICAgfCAgICAzICstLQog
eGVuL2FyY2gveDg2L2RvbWFpbi5jICAgICAgfCAgIDIyICsrKysrKysrLS0tLS0tLS0tLS0tLS0K
IHhlbi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jIHwgICAyMSArKysrKysrKysrKysrKysrLS0tLS0K
IDMgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgotLQpE
YXJpbyBGYWdnaW9saSwgUGguRApodHRwOi8vYWJvdXQubWUvZGFyaW8uZmFnZ2lvbGkKVmlydHVh
bGl6YXRpb24gU29mdHdhcmUgRW5naW5lZXIKU1VTRSBMYWJzLCBTVVNFIGh0dHBzOi8vd3d3LnN1
c2UuY29tLwotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCjw8VGhpcyBoYXBwZW5zIGJlY2F1c2UgX0lfIGNob29zZSBpdCB0
byBoYXBwZW4hPj4gKFJhaXN0bGluIE1hamVyZSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
